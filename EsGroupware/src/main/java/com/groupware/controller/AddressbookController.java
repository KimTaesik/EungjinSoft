package com.groupware.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="addressbook")
public class AddressbookController {

//	@RequestMapping(value="list.action", method = RequestMethod.GET)
//	public String address(){
//		return "addressbook/addressbooklist";
//	}


	@RequestMapping(value="list.action", method = RequestMethod.GET)
	public String address1(){
		return "addressbook/addressbookedit";
	}
	
}