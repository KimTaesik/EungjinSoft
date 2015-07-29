package com.groupware.service;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.groupware.dto.ApprovalForm;
import com.groupware.dto.Board;

public interface ApprovalService {
	 
	ApprovalForm getApprovalForm(String form_No) ;
	ModelAndView getApprovalForm2();
	ModelAndView getApprovalForm3(String form_No,HttpSession session) ;
}
