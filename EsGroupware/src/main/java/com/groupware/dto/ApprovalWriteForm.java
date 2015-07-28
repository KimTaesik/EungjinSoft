package com.groupware.dto;

public class ApprovalWriteForm {
	private int approval_No;
	private	String title;
	private	String content;
	private	String reportDate;
	private	String approvalDate;
	private	String deadlineDate;
	private	String releaseWhether;
	private	String receiveDepartment;
	private	int retention;
	private	String department;
	private	String referrers;
	private	String approvalCheck;
	private boolean approvalConfirm;
	
	private ApprovalForm approvalForm;
	private Employee drafter;
	public int getApproval_No() {
		return approval_No;
	}
	public void setApproval_No(int approval_No) {
		this.approval_No = approval_No;
	}
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
	public String getReportDate() {
		return reportDate;
	}
	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}
	public String getApprovalDate() {
		return approvalDate;
	}
	public void setApprovalDate(String approvalDate) {
		this.approvalDate = approvalDate;
	}
	public String getDeadlineDate() {
		return deadlineDate;
	}
	public void setDeadlineDate(String deadlineDate) {
		this.deadlineDate = deadlineDate;
	}
	public String getReleaseWhether() {
		return releaseWhether;
	}
	public void setReleaseWhether(String releaseWhether) {
		this.releaseWhether = releaseWhether;
	}
	public String getReceiveDepartment() {
		return receiveDepartment;
	}
	public void setReceiveDepartment(String receiveDepartment) {
		this.receiveDepartment = receiveDepartment;
	}
	public int getRetention() {
		return retention;
	}
	public void setRetention(int retention) {
		this.retention = retention;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getReferrers() {
		return referrers;
	}
	public void setReferrers(String referrers) {
		this.referrers = referrers;
	}
	public String getApprovalCheck() {
		return approvalCheck;
	}
	public void setApprovalCheck(String approvalCheck) {
		this.approvalCheck = approvalCheck;
	}
	public boolean isApprovalConfirm() {
		return approvalConfirm;
	}
	public void setApprovalConfirm(boolean approvalConfirm) {
		this.approvalConfirm = approvalConfirm;
	}
	public ApprovalForm getApprovalForm() {
		return approvalForm;
	}
	public void setApprovalForm(ApprovalForm approvalForm) {
		this.approvalForm = approvalForm;
	}
	public Employee getDrafter() {
		return drafter;
	}
	public void setDrafter(Employee drafter) {
		this.drafter = drafter;
	}
}
