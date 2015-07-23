package com.groupware.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.groupware.dao.EmployeeDao;


@Controller
@RequestMapping(value="approval")
public class ApprovalController {
	private EmployeeDao employeeDao;
	
//	@Autowired
//	@Qualifier("approvalDao")
//	public void setEmployeeDao(EmployeeDao employeeDao) {
//		this.employeeDao = employeeDao;
//	}
//
	@RequestMapping(value="approval.action", method = RequestMethod.GET)
	public String admin() {	
		return "approval/approvalmain";	
	}
}
