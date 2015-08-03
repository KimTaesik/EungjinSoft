package com.groupware.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.groupware.dto.Approval;
import com.groupware.dto.ApprovalCooperation;
import com.groupware.dto.ApprovalForm;
import com.groupware.dto.ApprovalLine;
import com.groupware.mapper.ApprovalMapper;
@Repository(value = "approvalDao")
public class OracleApprovalDao implements ApprovalDao {
	
	private ApprovalMapper approvalMapper;
			
	@Autowired
	@Qualifier("ApprovalMapper")
	public void setApprovalMapper(ApprovalMapper approvalMapper){
		this.approvalMapper = approvalMapper;
	}
	

	public ApprovalForm getApprovalForm(String form_No) {
		
	
		return approvalMapper.getApprovalForm(form_No);
		
	}
	public List<ApprovalForm> getApprovalForm2(){
	
		return approvalMapper.getApprovalForm2();

	}


	@Override
	public ApprovalForm getApprovalForm3(String form_No) {
		// TODO Auto-generated method stub
		return approvalMapper.getApprovalForm3(form_No);
		
	}


	@Override
	public void insertApproval(Approval approval) {
		approvalMapper.insertApproval(approval);
	}


	@Override
	public void insertApprovalLine(ApprovalLine approvalLine) {
		approvalMapper.insertApprovalLine(approvalLine);
	}


	@Override
	public void insertApprovalCooperation(
			ApprovalCooperation approvalCooperation) {
		approvalMapper.insertApprovalCooperation(approvalCooperation);
	}


	@Override
	public List<Approval> getApprovalList() {
	
		return approvalMapper.getApprovalList();
	}
	

	@Override
	public List<Approval> getApprovalList2() {
	
		return approvalMapper.getApprovalList2();
	}


	@Override
	public Approval getApprovalByNo(int approval_No) {
		// TODO Auto-generated method stub
	return approvalMapper.getApprovalByNo(approval_No);
	}
	
	
}
