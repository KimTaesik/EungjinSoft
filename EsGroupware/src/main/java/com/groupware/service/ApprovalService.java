package com.groupware.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.groupware.dto.Approval;
import com.groupware.dto.ApprovalCooperation;
import com.groupware.dto.ApprovalForm;
import com.groupware.dto.ApprovalLine;
import com.groupware.dto.Board;
import com.groupware.dto.Employee;

public interface ApprovalService {

	ApprovalForm getApprovalForm(String form_No);

	ModelAndView getApprovalForm2();

	ModelAndView getApprovalForm3(String form_No, HttpSession session);

	Employee getEmployeeInfomationList(String employeeid);

	void insertApproval(Approval approval);

	void insertApprovalLine(ApprovalLine approvalLine);

	void insertApprovalCooperation(ApprovalCooperation approvalCooperation);
	
	ModelAndView getApprovalList();
	ModelAndView getApprovalList2();
	
	ModelAndView getApprovalByNo(int approval_No);
	
	void updateApprovalLine(String approveCheck,String id,int approval_No);
	void updateApproval(String Approvalconfirm,int approval_No);
	int getApprovalListCount(int approval_No);
}
