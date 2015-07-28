package com.groupware.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import sun.security.provider.MD2;

import com.groupware.dao.ApprovalDao;
import com.groupware.dao.EmployeeDao;
import com.groupware.dto.ApprovalForm;
import com.groupware.dto.Board;

@Service("approvalService")
public class MyApprovalService implements ApprovalService {
	
	private ApprovalDao approvalDao;
	
	@Autowired
	@Qualifier("approvalDao")
	public void setApprovalDao(ApprovalDao approvalDao) {
		this.approvalDao = approvalDao;
	}

	
	
	public ApprovalForm getApprovalForm(int form_No) {

		return approvalDao.getApprovalForm(form_No);
		
	}
	public ModelAndView getApprovalForm2() {
		
		ModelAndView mav= new ModelAndView();
		List<ApprovalForm> approvalforms=approvalDao.getApprovalForm2();
		
		mav.setViewName("approval/approvalwrite");
		mav.addObject("approvalforms", approvalforms);
		return mav;
	}
	

}
