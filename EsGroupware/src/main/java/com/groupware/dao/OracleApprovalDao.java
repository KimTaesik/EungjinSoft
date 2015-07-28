package com.groupware.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.groupware.dto.ApprovalForm;
import com.groupware.mapper.ApprovalMapper;
@Repository(value = "approvalDao")
public class OracleApprovalDao implements ApprovalDao {
	
	private ApprovalMapper approvalMapper;
			
	@Autowired
	@Qualifier("ApprovalMapper")
	public void setApprovalMapper(ApprovalMapper approvalMapper){
		this.approvalMapper = approvalMapper;
	}
	

	public ApprovalForm getApprovalForm(int form_No) {
		
	
		return approvalMapper.getApprovalForm(form_No);
		
	}
	public List<ApprovalForm> getApprovalForm2(){
	
		return approvalMapper.getApprovalForm2();

	}
}
