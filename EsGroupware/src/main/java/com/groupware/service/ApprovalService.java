package com.groupware.service;

import org.springframework.web.servlet.ModelAndView;

import com.groupware.dto.ApprovalForm;
import com.groupware.dto.Board;

public interface ApprovalService {
	 
	ApprovalForm getApprovalForm(int form_No) ;
	ModelAndView getApprovalForm2();

}
