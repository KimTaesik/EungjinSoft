package com.groupware.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import sun.security.provider.MD2;

import com.groupware.dao.ApprovalDao;
import com.groupware.dao.EmployeeDao;
import com.groupware.dto.ApprovalForm;
import com.groupware.dto.Board;
import com.groupware.dto.Employee;

@Service("approvalService")
public class MyApprovalService implements ApprovalService {
	
	private ApprovalDao approvalDao;
	private EmployeeDao employeeDao;
	
	@Autowired
	@Qualifier("employeeDao")
	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}



	@Autowired
	@Qualifier("approvalDao")
	public void setApprovalDao(ApprovalDao approvalDao) {
		this.approvalDao = approvalDao;
	}

	
	
	public ApprovalForm getApprovalForm(String form_No) {

		return approvalDao.getApprovalForm(form_No);
		
	}
	public ModelAndView getApprovalForm3(String form_No,HttpSession session) {

		ModelAndView mav= new ModelAndView();
		Employee loginUser = new Employee();
		loginUser.setId(((Employee)session.getAttribute("loginuser")).getId());
//		loginUser.setId("admin");
		String id = loginUser.getId();
		
		Employee drafter = employeeDao.getEmployeeInfomationList(id);
		ApprovalForm approvalform=approvalDao.getApprovalForm3(form_No);
		List<ApprovalForm> approvalforms=approvalDao.getApprovalForm2();
		
		 mav.addObject("approvalform",approvalform);
		 mav.addObject("drafter", drafter);
		 mav.addObject("approvalforms", approvalforms);
		 mav.setViewName("approval/approvalwriteform");
		return mav;
		
	}
	public ModelAndView getApprovalForm2() {
		
		ModelAndView mav= new ModelAndView();
		List<ApprovalForm> approvalforms=approvalDao.getApprovalForm2();
		
		mav.setViewName("approval/approvalwrite");
		mav.addObject("approvalforms", approvalforms);
		return mav;
	}



	
	
}