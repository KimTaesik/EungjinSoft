package com.groupware.dao;

import java.util.List;

import com.groupware.dto.AddressBook;
import com.groupware.dto.Board;

public interface AddressBookDao {

	void insertAddressBook(AddressBook addressbook);
	
	////////////////////////// 페이징 처리 (목록 조회)/////////////////////////////////////
	//전달인자 : 전체 목록에서 조회할 데이터의 시작위치 , 끝위치
	List<AddressBook> getAddressbookList(int first, int last, String classify);
	
}
