package com.groupware.dao;

import java.util.List;

import com.groupware.dto.AddressBook;
import com.groupware.dto.Board;

public interface AddressBookDao {

	void insertAddressBook(AddressBook addressbook);
	
	////////////////////////// 페이징 처리 (목록 조회)/////////////////////////////////////
	//전달인자 : 전체 목록에서 조회할 데이터의 시작위치 , 끝위치
	List<AddressBook> getAddressbookList(String classify);
	
	List<AddressBook> getAddressbookList2(int first, int last, String classify);
	
	int getAddressBookCount(String classify);
	//**********주소록 삭제************
	void deleteAddress(String addressNo, String classify);
	
	//**********주소록 수정************
	void editAddress(String addressNo,String classify, AddressBook addressbook);
	//++++++++++주소록 수정시, 기본 정보 가져오게 할려고..
	AddressBook selectAddress(String addressNo);
}
