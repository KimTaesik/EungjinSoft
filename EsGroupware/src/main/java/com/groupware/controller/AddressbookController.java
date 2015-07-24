package com.groupware.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.groupware.dao.AddressBookDao;
import com.groupware.dto.AddressBook;

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
	public String addressadd(HttpServletRequest req) throws UnsupportedEncodingException{
		
		req.setCharacterEncoding("utf-8");
		
		String homenumber = null;
		String phonenumber = null;
		String fax = null;
		String nation = null;
		String directLine = null;
		String postcode = null;
		String postcode2 = null;
		
		AddressBook addressbook = new AddressBook();
		
		addressbook.setName(req.getParameter("name"));
		addressbook.setEmail(req.getParameter("email"));
		if(req.getParameter("cellPhone1") != null) {
			phonenumber = req.getParameter("cellPhone1") + "-" + req.getParameter("cellPhone2") + "-" + req.getParameter("cellPhone3");
		}
		addressbook.setPhoneNumber(phonenumber);
		
		if(req.getParameter("homePhone1") != null) {
			homenumber = req.getParameter("homePhone1") + "-" + req.getParameter("homePhone2") + "-" + req.getParameter("homePhone3");
		}
		addressbook.setHomeNumber(homenumber);
		
		if(req.getParameter("fax1") != null) {
			fax = req.getParameter("fax1") + "-" + req.getParameter("fax2") + "-" + req.getParameter("fax3");
		}
		addressbook.setFax(fax);
		
		addressbook.setNation(req.getParameter("nation"));
		
		if (req.getParameter("postcode1") != null) {
			postcode =  req.getParameter("postcode1") + "-" + req.getParameter("postcode2");
		}
		addressbook.setPostcode(postcode);
		
		addressbook.setAddress(req.getParameter("roadAddress"));
		addressbook.setCompanyName(req.getParameter("companyname"));
		addressbook.setPositionName(req.getParameter("position"));
		addressbook.setDeptName(req.getParameter("dept"));
		addressbook.setExtension(req.getParameter("extension"));
		if (req.getParameter("postcode3") != null) {
			postcode2 =  req.getParameter("postcode3") + "-" + req.getParameter("postcode4");
		}
		addressbook.setPostcode2(postcode2);
		addressbook.setCompanyAddress(req.getParameter("roadAddress2"));
		
		addressbook.setMemo(req.getParameter("memo"));
		
		
		return "redirect:/addressbook/addressbooklist.action";
	}
	
	//2. 주소 리스트 보기
	@RequestMapping(value="addressbooklist.action", method = RequestMethod.GET)
	public String addressListform(){
		
		return "addressbook/addressbooklist";
	}
	
}