package com.groupware.service;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.groupware.dto.ApprovalForm;
import com.groupware.dto.Board;
import com.groupware.dto.Employee;

public interface ApprovalService {
	 
	ApprovalForm getApprovalForm(String form_No) ;
	ModelAndView getApprovalForm2();
	ModelAndView getApprovalForm3(String form_No,HttpSession session) ;
	Employee getEmployeeInfomationList(String employeeid);
}
