package com.groupware.dao;

import java.util.List;

import com.groupware.dto.ApprovalForm;

public interface ApprovalDao {

	 ApprovalForm getApprovalForm(int form_No) ;
	 List<ApprovalForm> getApprovalForm2();
}
