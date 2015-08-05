package com.groupware.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.log4j.net.SyslogAppender;

import com.groupware.dto.AddressBook;
import com.groupware.dto.Board;

public interface AddressBookMapper {

	void insertAddressBook(AddressBook addressbook);
	
	
	//*************엑셀로 주소록 내보내기.
	List<AddressBook> getAddressbookList(String classify);
	
	/////////////////////////////조회하기 (목록조회하기)////////////////////////////
	//*************페이징 처리 (목록 조회)
	//전달인자 : 전체 목록에서 조회할 데이터의 시작위치 , 끝위치
	List<AddressBook> getAddressbookList2(HashMap<String, Object> params);
	
	//*************페이징 처리 (name(이름)으로 목록 조회)
	List<AddressBook> getAddressbookListByName(HashMap<String, Object> params);
	
	//*************페이징 처리 (email(이메일)으로 목록 조회)
	List<AddressBook> getAddressbookListByEmail(HashMap<String, Object> params);
	
	//*************페이징 처리 (phoneNumber(핸드폰)으로 목록 조회)
	List<AddressBook> getAddressbookListByPhoneNumber(HashMap<String, Object> params);
	
	//*************주소록 전체 목록 수 조회하는 작업.
	int getAddressBookCount(String classify);
	
	//*************주소록 (name) 으로 목록 수 조회하는 작업.
	int getAddressbookCountByName(HashMap<String, Object> params);
	
	//*************주소록 (email) 으로 목록 수 조회하는 작업.
	int getAddressbookCountByEmail(HashMap<String, Object> params);
	
	//*************주소록 (phonenumber) 으로 목록 수 조회하는 작업.
	int getAddressbookCountByPhoneNumber(HashMap<String, Object> params);
	
	//*************주소록 삭제
	void deleteAddress(HashMap<String, Object> params);
		
	//************ 주소록  수정
	void editAddress(HashMap<String, Object> params);
	
	//+++++++++++++주소 수정 시, 기본 값 가져오게 하는 부분.
	AddressBook selectAddress(String addressNo);
	
	//********* 이메일 보낼시, 기본 '받는이' 받아오게 할려고...
	AddressBook selectEmail(String name);
}
