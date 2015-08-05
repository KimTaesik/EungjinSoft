package com.groupware.dto;

import java.util.Date;
import java.util.List;


public class Approval {
	private int approval_No;
	private	String title;
	private	String content;
	private	Date reportDate;
	private Date approvalDate;
	private	boolean opening;
	private	String receiveDept;
	private	int  storagePeriod;
	private String referrers;
	private String form_No;
	private String id;
	private ApprovalForm approvalForm;
	private Employee employee;
	private List<ApprovalLine> approvalLines;
	private List<ApprovalCooperation> cooperations;
	private String approvalConfirm;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public boolean isOpening() {
		return opening;
	}
	public void setOpening(boolean opening) {
		this.opening = opening;
	}
	public String getReceiveDept() {
		return receiveDept;
	}
	public void setReceiveDept(String receiveDept) {
		this.receiveDept = receiveDept;
	}
	public int getStoragePeriod() {
		return storagePeriod;
	}
	public void setStoragePeriod(int storagePeriod) {
		this.storagePeriod = storagePeriod;
	}
	public String getReferrers() {
		return referrers;
	}
	public void setReferrers(String referrers) {
		this.referrers = referrers;
	}
	public String getForm_No() {
		return form_No;
	}
	public void setForm_No(String form_No) {
		this.form_No = form_No;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	public Date getReportDate() {
		return reportDate;
	}
	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}
	public int getApproval_No() {
		return approval_No;
	}
	public void setApproval_No(int approval_No) {
		this.approval_No = approval_No;
	}
	public List<ApprovalLine> getApprovalLines() {
		return approvalLines;
	}
	public void setApprovalLines(List<ApprovalLine> approvalLines) {
		this.approvalLines = approvalLines;
	}
	public List<ApprovalCooperation> getCooperations() {
		return cooperations;
	}
	public void setCooperations(List<ApprovalCooperation> cooperations) {
		this.cooperations = cooperations;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public ApprovalForm getApprovalForm() {
		return approvalForm;
	}
	public void setApprovalForm(ApprovalForm approvalForm) {
		this.approvalForm = approvalForm;
	}
	public String getApprovalConfirm() {
		return approvalConfirm;
	}
	public void setApprovalConfirm(String approvalConfirm) {
		this.approvalConfirm = approvalConfirm;
	}
	public Date getApprovalDate() {
		return approvalDate;
	}
	public void setApprovalDate(Date approvalDate) {
		this.approvalDate = approvalDate;
	}
	

	
	
	
}
	