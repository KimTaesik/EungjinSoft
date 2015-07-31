package com.groupware.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.groupware.dao.EmployeeDao;

@Controller
@RequestMapping(value="admin")
public class AdminCompanyController {
	private EmployeeDao employeeDao;
	
	@Autowired
	@Qualifier("employeeDao")
	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}
	
	@RequestMapping(value="companylogo.action")
	public String logo() {	
		
		return "admin/companylogo";
		
	}
	
	@RequestMapping(value="companymenu.action")
	public String logo2() {	
		
		return "admin/companymenu";
		
	}
}
