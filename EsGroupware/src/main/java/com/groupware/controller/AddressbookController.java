package com.groupware.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.groupware.dao.AddressBookDao;
import com.groupware.dto.AddressBook;
import com.groupware.dto.Employee;
import com.groupware.ui.ThePager;



//*****************  메일 보내기 관련 추가 사항.




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
	
	//2. 주소 리스트 보기[페이징 처리로]
/*	@RequestMapping(value="addressbooklist.action", method = RequestMethod.GET)
	public ModelAndView addressList(String classify, HttpServletRequest req, String type, String search ,Integer pageno){
		
		//******* 페이징 관련 데이터 처리 ********* 
		int pageNo = 1; // 현재 페이지 번호
		int pageSize = 10; //한 페이지에 표시할 데이터 갯수
		int pagerSize = 10; //번호로 표시할 페이지 갯수
		int dataCount = 0; //전체 데이터 갯수 (pageSize와 dataCount를 알아야, 페이지가 얼마나? 있는지 알 수 있다.)
		String url = "addressbooklist.action"; // 페이징 관련 링크를 누르면, 페이지번호와 함께 요청할 경로
		String queryString = "classify="+classify ;
		//요청한 페이지 번호가 있다면, 읽어서 현재 페이지 번호로 설정 (없다면, 1페이지)
		if (pageno != null ) {
			pageNo =pageno;
		}
		
		//현재 페이지의 첫 번째 데이터의 순서번호를 계산하는 방법.
		int first = (pageNo - 1) * pageSize + 1; //1 page -> 1, 2 page -> 4, 3 page -> 7		
				
		List<AddressBook> addressbook = null;
		//List<AddressBook> addressbook = addressbookDao.getAddressbookList(first, last, classify); //데이터 베이스에서 전화번호 가져오기
		
		ThePager pager = new ThePager(dataCount, pageNo, pageSize, pagerSize, url, queryString);
	
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("classify", classify);
		mav.addObject("pager", pager);
		mav.addObject("pageno", pageNo);
		mav.addObject("addressbook", addressbook);//위에서 DB에서 가져온 전화번호 리스트 
		mav.setViewName("include/addressheader"); //페이지 넘기는 위치 설정
		return mav;
	}*/
	
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
			mav.setViewName("addressbook/addressbooklist");
			}
		return mav;
		}
	
	
	@RequestMapping(value="addresslist.action", method = RequestMethod.GET)
	@ResponseBody
	public 	ModelAndView addresslist(AddressBook addressbook,  String classify, HttpServletRequest req, Integer pageno){
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
		
		//*********  페이지 개수 조정 (조건에 맞는 개수만큼만 페이징 조정) 작업.
		dataCount = addressbookDao.getAddressBookCount(classify);
		System.out.println(dataCount);
		
		ThePager pager = new ThePager(dataCount, pageNo, pageSize, pagerSize, url, queryString);
		
		ModelAndView mav = new ModelAndView();
		
		if(classify.equals("1")) {
			addressbook1 =  addressbookDao.getAddressbookList2(first, first + pageSize, classify);
			mav.addObject("addressbook1", addressbook1);
			mav.addObject("pager", pager);
			mav.addObject("pageno", pageNo);
			mav.addObject("classify", classify);
			mav.setViewName("addressbook/addressbooklist");
			
			}else if(classify.equals("2")) { 
			addressbook1 = addressbookDao.getAddressbookList2(first, first + pageSize, classify);
			mav.addObject("addressbook1", addressbook1);
			mav.addObject("pager", pager);
			mav.addObject("pageno", pageNo);
			mav.addObject("classify", classify);
			mav.setViewName("addressbook/addressbooklist");
		}
			return mav;
	}
	
	@RequestMapping(value="addressdelete.action", method = RequestMethod.GET)
	public String addressdelete(String addressNo,String classify){
		
		//System.out.println(addressNo + "::" + classify);
		addressbookDao.deleteAddress(addressNo, classify);
		
		//return "redirect:/include/addressheader.action?addressno=" + addressNo + "&classify=" + classify;
		return "redirect:/address/addressheader.action?classify="+ classify;
	}
	
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
	public String update(String addressNo,String classify, AddressBook addressbook) {
		
		addressbookDao.editAddress(addressNo, classify, addressbook);
		
		return "redirect:/address/addressheader.action?addressno="+addressNo+"&classify="+ classify;
	}
	
	
	//메일 보내기.
	

}
