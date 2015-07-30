package com.groupware.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.log4j.net.SyslogAppender;

import com.groupware.dto.AddressBook;
import com.groupware.dto.Board;

public interface AddressBookMapper {

	void insertAddressBook(AddressBook addressbook);
	
	
	/////////////////////////////조회하기 (목록조회하기)////////////////////////////
	List<AddressBook> getAddressbookList(String classify);
//	List<AddressBook> getAddressbookList(HashMap<String, String> params);

	////////////////////////// 페이징 처리 (목록 조회)/////////////////////////////////////
	//전달인자 : 전체 목록에서 조회할 데이터의 시작위치 , 끝위치
	/*List<AddressBook> getAddressbookList(HashMap<String, Object> params);*/
	
}
