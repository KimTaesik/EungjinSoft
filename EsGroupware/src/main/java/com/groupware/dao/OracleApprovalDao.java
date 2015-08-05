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

	//문서명 클릭하면 뷰 뛰움
	@Override
	public Approval getApprovalByNo(int approval_No) {
		// TODO Auto-generated method stub
	return approvalMapper.getApprovalByNo(approval_No);
	}

	@Override
	public void updateApprovalLine(String approveCheck,String id,int approval_No) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("approveCheck", approveCheck);
		params.put("id", id);
		params.put("approval_No", approval_No);
		approvalMapper.updateApprovalLine(params);
		
	}


	@Override
	public void updateApproval(String approvalConfirm,int approval_No) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("approvalConfirm",approvalConfirm );
		params.put("approval_No", approval_No);
		approvalMapper.updateApproval(params);
	}


	@Override
	public int getApprovalListCount(int approval_No) {
		
		return approvalMapper.getApprovalListCount(approval_No);
	}


	@Override
	public ApprovalLine getApprovalLineApprovalDay(String id, int approval_No) {
		HashMap<String,Object> params = new HashMap<String,Object>();
		params.put("id", id);
		params.put("approval_No",approval_No);
		return approvalMapper.getApprovalLineApprovalDay(params);
	}


	@Override
	public int getYesApprovalCount() {
			return approvalMapper.getYesApprovalCount();
	}


	@Override
	public int getNoApprovalCount() {
		return approvalMapper.getNoApprovalCount();
	}
	
	
	
}
