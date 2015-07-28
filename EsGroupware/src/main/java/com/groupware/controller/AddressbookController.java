package com.groupware.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.groupware.dao.AddressBookDao;
import com.groupware.dao.EmployeeDao;
import com.groupware.dto.AddressBook;
import com.groupware.dto.Employee;
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
	public String addressAddform(){
		
		return "addressbook/addressbookaddform";
	}
	@RequestMapping(value="addressbookadd.action", method = RequestMethod.POST)
	public String addressadd(HttpSession session, AddressBook addressbook, String cellPhone1,String cellPhone2,String cellPhone3,
			String homePhone1, String homePhone2, String homePhone3, String fax1, String fax2, String fax3, String postcode1, String postcode2,
			String roadAddress, String roadAddress2, String postcode3, String postcode4, String directLine1,String directLine2, String directLine3) throws UnsupportedEncodingException{
		
		
		Employee loginUser = new Employee();
		loginUser.setId(((Employee)session.getAttribute("loginuser")).getId());
		addressbook.setId(loginUser.getId());
		
		
		
		String homenumber = null;
		String phonenumber = null;
		String fax = null;
		String nation = null;
		String directLine = null;
		String homepostcode = null;
		String compostcode = null;
		
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
		addressbook.setPostcode(homepostcode);
		
		if (postcode3 != null) {
			compostcode =  postcode3 + "-" + postcode4;
		}
		addressbook.setPostcode2(compostcode);
		
		if(directLine1 != null ) {
			directLine = directLine1 + "-"+ directLine2 + "-" + directLine3;
		}
		addressbook.setDirectLine(directLine);
		addressbook.setNation(addressbook.getNation());
		addressbook.setCompanyAddress(roadAddress2);
	
		addressbookDao.insertAddressBook(addressbook);
		
		return "addressbook/addressbooklist";
	}
	
	//2. 주소 리스트 보기[페이징 처리로]
	@RequestMapping(value="addressbooklist.action", method = RequestMethod.GET)
	public ModelAndView addressList(String classify, HttpServletRequest req, String type, String search ,Integer pageno){
		
		//******* 페이징 관련 데이터 처리 ********* 
		int pageNo = 1; // 현재 페이지 번호
		int pageSize = 10; //한 페이지에 표시할 데이터 갯수
		int pagerSize = 10; //번호로 표시할 페이지 갯수
		int dataCount = 0; //전체 데이터 갯수 (pageSize와 dataCount를 알아야, 페이지가 얼마나? 있는지 알 수 있다.)
		String url = "list.action"; // 페이징 관련 링크를 누르면, 페이지번호와 함께 요청할 경로
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
		mav.setViewName("addressbook/addressbooklist"); //페이지 넘기는 위치 설정
		return mav;
	}
	
}