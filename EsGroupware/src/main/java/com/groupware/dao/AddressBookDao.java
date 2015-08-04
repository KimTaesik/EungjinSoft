package com.groupware.dao;

import java.util.List;

import com.groupware.dto.AddressBook;
import com.groupware.dto.Board;

public interface AddressBookDao {

	void insertAddressBook(AddressBook addressbook);
	
	//엑셀로 주소록 내보내기 할때 사용.
	List<AddressBook> getAddressbookList(String classify);
	
	//////////////////////////페이징 처리 (목록 조회)/////////////////////////////////////
	//전달인자 : 전체 목록에서 조회할 데이터의 시작위치 , 끝위치
	List<AddressBook> getAddressbookList2(int first, int last, String classify);
	
	//********** 페이징 처리 (목록 조회 - name(이름)으로 조회)
	List<AddressBook> getAddressbookListByName(int first, int last, String name, String classify);
	
	//********** 페이징 처리 (목록 조회 - email(이메일)으로 조회)
	List<AddressBook> getAddressbookListByEmail(int first, int last, String email, String classify);
	
	//********** 페이징 처리 (목록 조회 - phonenumber(핸드폰)으로 조회)
	List<AddressBook> getAddressbookListByPhoneNumber(int first, int last, String phoneNumber, String classify);
	
	//********* 주소록 전체 수  조회하는 작업***************
	int getAddressBookCount(String classify);
	
	int getAddressbookCountByName(String name, String classify);
	
	int getAddressbookCountByEmail(String email, String classify);
	
	int getAddressbookCountByPhoneNumber(String phoneNumber, String classify);
	
	//********** 주소록 삭제************
	void deleteAddress(String addressNo, String classify);
	
	//********** 주소록 수정************
	void editAddress(String addressNo,String classify, AddressBook addressbook);
	//++++++++++주소록 수정시, 기본 정보 가져오게 할려고..
	AddressBook selectAddress(String addressNo);
}
