package com.groupware.dao;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.groupware.dto.ApprovalForm;

public interface ApprovalDao {

	 ApprovalForm getApprovalForm(String form_No) ;
	 List<ApprovalForm> getApprovalForm2();
	 ApprovalForm getApprovalForm3(String form_No) ;
}
