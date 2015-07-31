package com.groupware.dto;

import java.util.List;

public class AddressGroup {

	private String groupNo;
	private String groupName;
	private String groupMemo;
	
	private List<AddressBook> addressbooks;

	public String getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(String groupNo) {
		this.groupNo = groupNo;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getGroupMemo() {
		return groupMemo;
	}

	public void setGroupMemo(String groupMemo) {
		this.groupMemo = groupMemo;
	}

	public List<AddressBook> getAddressbooks() {
		return addressbooks;
	}

	public void setAddressbooks(List<AddressBook> addressbooks) {
		this.addressbooks = addressbooks;
	}
	
	
}
