package com.groupware.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.output.ByteArrayOutputStream;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.groupware.dao.AddressBookDao;
import com.groupware.dto.AddressBook;
import com.groupware.dto.Employee;
import com.groupware.dto.Log;
import com.groupware.ui.ThePager;





@Controller
@RequestMapping(value="address")
public class AddressbookController {

	private AddressBookDao addressbookDao;
	@Autowired
	@Qualifier("AddressBookDao")
	public void setAddressbookDao(AddressBookDao addressbookDao) {
		this.addressbookDao = addressbookDao;
	}

	//1. 주소 추가
	@RequestMapping(value="addressbookadd.action", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView addressAddform(String classify){
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("classify" , classify);
		mav.setViewName("addressbook/addressbookaddform");

		return mav;
	}
	@RequestMapping(value="addressbookadd.action", method = RequestMethod.POST)
	public ModelAndView addressadd(HttpSession session, AddressBook addressbook, 
			String cellPhone1,String cellPhone2,String cellPhone3,
			String homePhone1, String homePhone2, String homePhone3, String fax1, String fax2, String fax3,String nation,
			String postcode1, String postcode2, String roadAddress, String roadAddress2, String postcode3, 
			String postcode4, String directLine1,String directLine2, String directLine3, String extention){
		
		Employee loginUser = new Employee();
		loginUser.setId(((Employee)session.getAttribute("loginuser")).getId());
		addressbook.setId(loginUser.getId());
		
		String homenumber = null;
		String phonenumber = null;
		String fax = null;

		String directLine = null;
		String homepostcode = null;
		String compostcode = null;
		String extension = null;
		
		addressbook.setGroupNo(1);
		
		if(cellPhone1 != null) {
			phonenumber = cellPhone1 + "-" + cellPhone2 + "-" + cellPhone3;
		}
		addressbook.setPhoneNumber(phonenumber);
		
		if(homePhone1 != null) {
			homenumber = homePhone1 + "-" + homePhone2 + "-" +homePhone3;
		}
		addressbook.setHomeNumber(homenumber);
		
		if(fax1 != null) {
			fax = fax1+ "-" + fax2 + "-" + fax3 ;
		}
		addressbook.setFax(fax);
		
		
		if (postcode1 != null) {
			homepostcode = postcode1 + "-" + postcode2;
		}
		addressbook.setHomepostcode(homepostcode);
		
		if (postcode3 != null) {
			compostcode =  postcode3 + "-" + postcode4;
		}
		addressbook.setCompostcode(compostcode);
		
		if(directLine1 != null ) {
			directLine = directLine1 + "-"+ directLine2 + "-" + directLine3;
		}
		addressbook.setDirectLine(directLine);
		
		addressbook.setNation(nation);
		
		addressbook.setExtension(extension);
		
		addressbook.setAddress(roadAddress);
		addressbook.setCompanyAddress(roadAddress2);
	
		addressbookDao.insertAddressBook(addressbook);
		
		ModelAndView mav = new ModelAndView();
		List<AddressBook> addressbook1 =  addressbookDao.getAddressbookList(addressbook.getClassify());
		
		mav.addObject("addressbook1", addressbook1);
		mav.addObject("classify", addressbook.getClassify());
		mav.setViewName("include/addressheader");
		return mav;
	}
	

	@RequestMapping(value="addressheader.action", method = RequestMethod.GET)
	public ModelAndView addresshearder(String classify,HttpSession session){
		
		ModelAndView mav = new ModelAndView();
		
		//******* 페이징 관련 데이터 처리 ********* 
		int pageNo = 1; // 현재 페이지 번호
		int pageSize = 5; //한 페이지에 표시할 데이터 갯수
		int pagerSize = 10; //번호로 표시할 페이지 갯수
		int dataCount = 0; //전체 데이터 갯수 (pageSize와 dataCount를 알아야, 페이지가 얼마나? 있는지 알 수 있다.)
		String url = "addresslist.action"; // 페이징 관련 링크를 누르면, 페이지번호와 함께 요청할 경로
		String queryString = "classify="+classify ;
		//요청한 페이지 번호가 있다면, 읽어서 현재 페이지 번호로 설정 (없다면, 1페이지)
		//현재 페이지의 첫 번째 데이터의 순서번호를 계산하는 방법.
		int first = (pageNo - 1) * pageSize + 1;
		
		List<AddressBook> addressbook1 = null;
		
		//*********  페이지 개수 조정 (조건에 맞는 개수만큼만 페이징 조정) 작업.
		dataCount = addressbookDao.getAddressBookCount(classify);
		System.out.println(dataCount);
		
		ThePager pager = new ThePager(dataCount, pageNo, pageSize, pagerSize, url, queryString);

		addressbook1 =  addressbookDao.getAddressbookList2(first, first+pageSize, classify);
		
		/*String loginUser = ((Employee)session.getAttribute("loginuser")).getId();*/
		/*	mav.addObject("loginUser", loginUser);*/
		
		if(classify.equals("1")) {
		
			addressbookDao.getAddressbookList2(first, first+pageSize, classify);
			mav.addObject("addressbook1", addressbook1);
			mav.addObject("pager", pager);
			mav.addObject("pageno", pageNo);
			mav.addObject("classify", classify);
			mav.setViewName("include/addressheader");
		}else if(classify.equals("2")) {
			addressbookDao.getAddressbookList2(first, first + pageSize, classify);
			mav.addObject("addressbook1", addressbook1);
			mav.addObject("pager", pager);
			mav.addObject("pageno", pageNo);
			mav.addObject("classify", classify);
			mav.setViewName("include/addressheader");
			}
		return mav;
		}
	
	//2. 주소 리스트 보기[페이징 처리로]
	@RequestMapping(value="addresslist.action", method = RequestMethod.GET)
	@ResponseBody
	public 	ModelAndView addresslist(AddressBook addressbook, String classify, String type, String search, HttpServletRequest req, Integer pageno){
	System.out.println(classify);
		//******* 페이징 관련 데이터 처리 ********* 
		int pageNo = 1; // 현재 페이지 번호
		int pageSize = 5; //한 페이지에 표시할 데이터 갯수
		int pagerSize = 10; //번호로 표시할 페이지 갯수
		int dataCount = 0; //전체 데이터 갯수 (pageSize와 dataCount를 알아야, 페이지가 얼마나? 있는지 알 수 있다.)
		String url = "addresslist.action"; // 페이징 관련 링크를 누르면, 페이지번호와 함께 요청할 경로
		String queryString = "classify="+classify ;
		//요청한 페이지 번호가 있다면, 읽어서 현재 페이지 번호로 설정 (없다면, 1페이지)
		if (pageno != null ) {
			pageNo =pageno;
		}
		//현재 페이지의 첫 번째 데이터의 순서번호를 계산하는 방법.
		int first = (pageNo - 1) * pageSize + 1;
		
		List<AddressBook> addressbook1 = null;
		
		if(type == null || type.equals("1"))
			addressbook1 = addressbookDao.getAddressbookList2(first, first + pageSize, classify);

		//*********  페이지 개수 조정 (조건에 맞는 개수만큼만 페이징 조정) 작업.
		
		ModelAndView mav = new ModelAndView();
		
		if(classify.equals("1")) {
			if(type == null || type.equals("1")) {				
				addressbook1 =  addressbookDao.getAddressbookList2(first, first + pageSize, classify);
				dataCount = addressbookDao.getAddressBookCount(classify);
			} else {
				//검색 구분(2,3,4)와 검색어 (search)변수를 이용해서 조회하는 작업을 수행.
				if(type.equals("2")) {
					addressbook1 =	addressbookDao.getAddressbookListByName(first, first + pageSize, search, classify);
					dataCount = addressbookDao.getAddressbookCountByName(search, classify);
				}else if (type.equals("3")) {
					addressbook1 =	addressbookDao.getAddressbookListByEmail(first, first + pageSize, search, classify);
					dataCount = addressbookDao.getAddressbookCountByEmail(search, classify);
				}else if(type.equals("4")) {
					addressbook1 =	addressbookDao.getAddressbookListByPhoneNumber(first, first + pageSize, search, classify);
					dataCount = addressbookDao.getAddressbookCountByPhoneNumber(search, classify);
				}
			}
			
		} else if(classify.equals("2")) { 
			if(type == null || type.equals("1")) {				
				addressbook1 =  addressbookDao.getAddressbookList2(first, first + pageSize, classify);
				dataCount = addressbookDao.getAddressBookCount(classify);
			} else {
				if(type.equals("2")) {
					addressbook1 =	addressbookDao.getAddressbookListByName(first, first + pageSize, search, classify);
					dataCount = addressbookDao.getAddressbookCountByName(search, classify);
				}else if (type.equals("3")) {
					addressbook1 =	addressbookDao.getAddressbookListByEmail(first, first + pageSize, search, classify);
					dataCount = addressbookDao.getAddressbookCountByEmail(search, classify);
				}else if(type.equals("4")) {
					addressbook1 =	addressbookDao.getAddressbookListByPhoneNumber(first, first + pageSize, search, classify);
					dataCount = addressbookDao.getAddressbookCountByPhoneNumber(search, classify);
				}
			}
			
		}
		
		ThePager pager = new ThePager(dataCount, pageNo, pageSize, pagerSize, url, queryString);
		
		mav.addObject("addressbook1", addressbook1);
		mav.addObject("pager", pager);
		mav.addObject("pageno", pageNo);
		mav.addObject("classify", classify);
		mav.setViewName("include/addressheader");
		
	return mav;
	}
	
	//3. 주소 삭제
	@RequestMapping(value="addressdelete.action", method = RequestMethod.GET)
	public String addressdelete(String addressNo,String classify){
		
		//System.out.println(addressNo + "::" + classify);
		addressbookDao.deleteAddress(addressNo, classify);
		
		//return "redirect:/include/addressheader.action?addressno=" + addressNo + "&classify=" + classify;
		return "redirect:/address/addressheader.action?classify="+ classify;
	}
	
	//4. 주소 수정
	@RequestMapping(value = "addressedit.action", method = RequestMethod.GET)
	public ModelAndView editForm(String addressNo,String classify, AddressBook addressbook) {
		
		AddressBook add = addressbookDao.selectAddress(addressNo);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("addressbook", addressbook);
		mav.addObject("selectAddr", add);
		//++++++++++++++++++++++ addressbook3 그그그그ㅡ그그그 그 수정시, 기본값불러오는거
		mav.addObject("addressNo", addressNo);
		mav.addObject("classify", classify);
		mav.setViewName("addressbook/addressbookedit");
		
		return mav;
	}
	
	@RequestMapping(value="addressedit.action", method= RequestMethod.POST)
	public String update(String addressNo,String classify, String email, String cellPhone1,String cellPhone2,String cellPhone3) {
		
		AddressBook addressbook = new AddressBook();
		addressbook.setEmail(email);
		
		//String num = cellPhone1+cellPhone2+cellPhone3;
		//addressbook.setPhoneNumber(num);
		//System.out.println(num);
		addressbookDao.editAddress(addressNo, classify, addressbook);
		
		return "redirect:/address/addressheader.action?classify=1";
	}
	
	
	//5. 메일 보내기
	@RequestMapping(value="sendmailview.action", method= RequestMethod.GET)
	public ModelAndView sendMailView(HttpSession session, String name) {
		String email = ((Employee)session.getAttribute("loginuser")).getEmail();
		ModelAndView mav = new ModelAndView();
		
		//AddressBook emailadd = addressbookDao.selectEmail(name);
		//System.out.println(emailadd);
		
		mav.addObject("name", name);
		//mav.addObject("emailadd", emailadd);
		mav.setViewName("mail/sendmailform");
		return mav;
	}
	@RequestMapping(value="sendmail.action", method= RequestMethod.POST)
	public void sendMail(@RequestParam String to,String subject, String content) {
//		
//		String from = "webmaster@domain.com";
//			//((Member)(request.getSession().getAttribute("loginuser"))).getEmail();
//		String cc = "yeonji091@naver.com"; //참조하는 사람 메일
//		String bcc = "yeonji091@naver.com"; //숨은 참조하는 사람 메일
//		
//		//2. 메일 서버 연결 계정 설정 및 연결
//		Properties props = new Properties();
//		props.put("mail.smtp.host", "localhost");
//		Session session = Session.getDefaultInstance(props);
//		
//		//3. 메일 전송
//		try {
//			MimeMessage message = new MimeMessage(session);
//			message.setFrom(new InternetAddress(from));
//			message.setRecipients(MimeMessage.RecipientType.TO, to);
//			message.setRecipients(MimeMessage.RecipientType.CC, cc);
//			message.setRecipients(MimeMessage.RecipientType.BCC, bcc);
//			message.setSubject(subject);
//			message.setText(content, "utf-8");
//			
//			Transport.send(message);//전송
//		} catch (Exception ex) {
//			ex.printStackTrace();
//		}
//		//4. 메일보내기 페이지로 이동
//		response.sendRedirect("/demoweb/mail/sendmail.action");	
	}
	
	
	//6.*엑셀로 주소 내보내기
	@RequestMapping(value="addressexcel.action", method = RequestMethod.GET, produces="application/octet-stream")
	@ResponseBody
	public byte[] excel(HttpServletResponse resp,String classify) {
		Workbook xlsWb = new HSSFWorkbook(); // Excel 2007 이전 버전
        Workbook xlsxWb = new XSSFWorkbook(); // Excel 2007 이상
        // *** Sheet-------------------------------------------------
        // Sheet 생성
        List<AddressBook> addressbooks = addressbookDao.getAddressbookList(classify);
        Sheet sheet1 = xlsWb.createSheet("firstSheet");

        // 컬럼 너비 설정
        sheet1.setColumnWidth(0, 3000);
        sheet1.setColumnWidth(1, 4500);
        sheet1.setColumnWidth(2, 4500);
        sheet1.setColumnWidth(3, 4500);
        sheet1.setColumnWidth(4, 4500);

        // ----------------------------------------------------------
        // *** Style--------------------------------------------------
        // Cell 스타일 생성
        CellStyle cellStyle = xlsWb.createCellStyle();

        // 줄 바꿈
        cellStyle.setWrapText(true);

        // Cell 색깔, 무늬 채우기
        cellStyle.setFillForegroundColor(HSSFColor.LIME.index);
        cellStyle.setFillPattern(CellStyle.BIG_SPOTS);

        Row row = null;

        Cell cell = null;
        //----------------------------------------------------------

        // 첫 번째 줄
        row = sheet1.createRow(0);

        // 첫 번째 줄에 Cell 설정하기-------------
        cell = row.createCell(0);
        cell.setCellValue("이름");

        cell = row.createCell(1);
        cell.setCellValue("이메일");

        cell = row.createCell(2);
        cell.setCellValue("휴대폰");
        
        cell = row.createCell(3);
        cell.setCellValue("전화");
        
        cell = row.createCell(4);
        cell.setCellValue("팩스");
        //---------------------------------

        // 두 번째 줄
        int i = 1;
        for (AddressBook addressbook : addressbooks) {
        	row = sheet1.createRow(i);
        	
        	// 두 번째 줄에 Cell 설정하기-------------
            cell = row.createCell(0);
            cell.setCellValue(addressbook.getName());

            cell = row.createCell(1);
            cell.setCellValue(addressbook.getEmail());

            cell = row.createCell(2);
            cell.setCellValue(addressbook.getPhoneNumber());
            
            cell = row.createCell(3);
            cell.setCellValue(addressbook.getHomeNumber());
            
            cell = row.createCell(4);
            cell.setCellValue(addressbook.getFax());
            //cell.setCellStyle(cellStyle); // 셀 스타일 적용
            i++;
            //---------------------------------
        }

        // excel 파일 저장
        try {
        	ByteArrayOutputStream fileOut = new ByteArrayOutputStream();
            xlsWb.write(fileOut);
            xlsWb.close();
            fileOut.close(); 
            
            resp.addHeader("Content-Disposition", "attachment; filename=filename.xls");
            
            return fileOut.toByteArray();
        	
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
	
}
