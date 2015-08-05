package com.groupware.dao;

import java.util.HashMap;
import java.util.List;

import com.groupware.dto.Approval;
import com.groupware.dto.ApprovalCooperation;
import com.groupware.dto.ApprovalForm;
import com.groupware.dto.ApprovalLine;

public interface ApprovalDao {

	ApprovalForm getApprovalForm(String form_No);

	List<ApprovalForm> getApprovalForm2();

	ApprovalForm getApprovalForm3(String form_No);

	void insertApproval(Approval approval);

	void insertApprovalLine(ApprovalLine approvalLine);

	void insertApprovalCooperation(ApprovalCooperation approvalCooperation);
	
	List<Approval> getApprovalList();
	List<Approval> getApprovalList2();
	
	Approval getApprovalByNo(int approval_No);
	
	void updateApprovalLine(String approveCheck,String id,int approval_No);
	void updateApproval(String approvalConfirm,int approval_No);
	int getApprovalListCount(int approval_No);
	ApprovalLine getApprovalLineApprovalDay(String id , int approval_No);
	
	int getYesApprovalCount();

	int getNoApprovalCount();
}
