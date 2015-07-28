package com.groupware.dto;

public class ApprovalLine {

		private String approvalDay;
		private String approveCheck;
		private String priority;
		private ApprovalWriteForm  approvalwriteform;
		private Employee employee;
		public String getApprovalDay() {
			return approvalDay;
		}
		public void setApprovalDay(String approvalDay) {
			this.approvalDay = approvalDay;
		}
		public String getApproveCheck() {
			return approveCheck;
		}
		public void setApproveCheck(String approveCheck) {
			this.approveCheck = approveCheck;
		}
		public String getPriority() {
			return priority;
		}
		public void setPriority(String priority) {
			this.priority = priority;
		}
		public ApprovalWriteForm getApprovalwriteform() {
			return approvalwriteform;
		}
		public void setApprovalwriteform(ApprovalWriteForm approvalwriteform) {
			this.approvalwriteform = approvalwriteform;
		}
		public Employee getEmployee() {
			return employee;
		}
		public void setEmployee(Employee employee) {
			this.employee = employee;
		}
		
		
	
}
