package com.groupware.dto;

public class ApprovalCooperation {
	private int approvalCooperation_No;
	private String id;
	private Employee employee;
	private int approval_No;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getApprovalCooperation_No() {
		return approvalCooperation_No;
	}

	public void setApprovalCooperation_No(int approvalCooperation_No) {
		this.approvalCooperation_No = approvalCooperation_No;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public int getApproval_No() {
		return approval_No;
	}

	public void setApproval_No(int approval_No) {
		this.approval_No = approval_No;
	}
}
