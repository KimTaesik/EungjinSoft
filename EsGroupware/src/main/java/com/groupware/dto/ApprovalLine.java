package com.groupware.dto;

public class ApprovalLine {
		private int approvalLine_No;
		private String approvalDay;
		private String approveCheck;
		private int priority;
		private String id;
		private Employee employee;
		private int approval_No;
		private int count;
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
		
		public int getPriority() {
			return priority;
		}
		public void setPriority(int priority) {
			this.priority = priority;
		}
		
		public int getApprovalLine_No() {
			return approvalLine_No;
		}
		public void setApprovalLine_No(int approvalLine_No) {
			this.approvalLine_No = approvalLine_No;
		}
		public Employee getEmployee() {
			return employee;
		}
		public void setEmployee(Employee employee) {
			this.employee = employee;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public int getApproval_No() {
			return approval_No;
		}
		public void setApproval_No(int approval_No) {
			this.approval_No = approval_No;
		}
		public int getCount() {
			return count;
		}
		public void setCount(int count) {
			this.count = count;
		}
		
		
		
	
}
