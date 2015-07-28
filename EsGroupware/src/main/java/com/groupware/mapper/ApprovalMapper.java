package com.groupware.mapper;

import java.util.List;

import com.groupware.dto.ApprovalForm;

public interface ApprovalMapper {

	
	List<ApprovalForm> getApprovalForm2();
	ApprovalForm getApprovalForm(int form_No) ;
}
