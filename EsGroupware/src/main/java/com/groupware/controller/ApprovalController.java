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
	@RequestMapping(value="approvalheader.action", method = RequestMethod.GET)
	public String approvalheader() {	
		return "approval/approvalheader";	
	}
	
	@RequestMapping(value="approvalmain.action", method = RequestMethod.GET)
	public String approvalmain() {	
		return "approval/approvalmain";	
	}
	
	@RequestMapping(value="approvalwrite.action", method = RequestMethod.GET)
	public String approvalwrite() {	
		return "approval/approvalwrite";	
	}
	@RequestMapping(value="approvalwrite.action", method = RequestMethod.POST)
	public String approvalwrite2() {	
		return "approval/approvalwrite";	
	}
	@RequestMapping(value="approvaling.action", method = RequestMethod.GET)
	public String approvaling() {	
		return "approval/documentbox";	
	}
	@RequestMapping(value="approvalend.action", method = RequestMethod.GET)
	public String approvalend() {	
		return "approval/documentbox";	
	}
	
	
}
