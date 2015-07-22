package com.groupware.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="address")
public class AddressbookController {

	@RequestMapping(value="addressbook.action", method = RequestMethod.GET)
	public String address(){
		return "address/addressbooklist";
	}

		
	}