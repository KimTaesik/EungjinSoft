package com.groupware.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String addressadd(AddressBook book, @RequestParam String cellPhone1,String cellPhone2,String cellPhone3,
			String homePhone1, String homePhone2, String homePhone3, String fax1, String fax2, String fax3, String postcode1, String postcode2,
			String roadAddress, String roadAddress2, String postcode3, String postcode4) throws UnsupportedEncodingException{
		
		AddressBook addressbook = new AddressBook();
		addressbook = book;
		System.out.println("gyhghghghghgh");
		
		
		String homenumber = null;
		String phonenumber = null;
		String fax = null;
		String nation = null;
		String directLine = null;
		String homepostcode = null;
		String compostcode = null;
	
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
		addressbook.setCompanyAddress(roadAddress2);
		System.out.println(addressbook.getName());
		addressbookDao.insertAddressBook(addressbook);
		
		return "redirect:/addressbook/addressbooklist.action";
	}
	
	//2. 주소 리스트 보기
	@RequestMapping(value="addressbooklist.action", method = RequestMethod.GET)
	public String addressListform(){
		
		return "addressbook/addressbooklist";
	}
	
}