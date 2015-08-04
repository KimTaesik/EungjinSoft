package com.groupware.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.groupware.dto.AddressBook;
import com.groupware.dto.Board;
import com.groupware.mapper.AddressBookMapper;


@Repository(value="AddressBookDao")
public class OracleAddressBookDao implements AddressBookDao {
	private AddressBookMapper addressMapper;
	
	@Autowired
	@Qualifier("AddressBookMapper")
	public void setAddressBookMapper(AddressBookMapper addressbookMapper) {
		this.addressMapper = addressbookMapper;
	}

	@Override
	public void insertAddressBook(AddressBook addressbook) {
	addressMapper.insertAddressBook(addressbook);
		
	}
	
	// **** 엑셀로 주소록 내보낼때, 사용.
	@Override
	public List<AddressBook> getAddressbookList(String classify) {
		
		return addressMapper.getAddressbookList(classify);
	}
	
	// ***** 페이징 처리 ((전체)-으로 목록조회)
	//전달인자 : 전체 목록에서 조회할 데이터의 시작위치 , 끝위치
	@Override
	public List<AddressBook> getAddressbookList2(int first, int last, String classify) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("first", first);
		params.put("last", last);
		params.put("classify", classify);
		
		return addressMapper.getAddressbookList2(params);

	}
	
	// ***** 페이징 처리 (name(이름) - 으로 목록조회)
	@Override
	public List<AddressBook> getAddressbookListByName(int first, int last, String name, String classify) {

	HashMap<String, Object> params = new HashMap<String, Object>();
	params.put("first", first);
	params.put("last", last);
	params.put("name", name);
	params.put("classify", classify);
	return addressMapper.getAddressbookListByName(params);
	}
	
	// ***** 페이징 처리 (email(이메일) - 으로 목록조회)
	@Override
	public List<AddressBook> getAddressbookListByEmail(int first, int last, String email, String classify) {

	HashMap<String, Object> params = new HashMap<String, Object>();
	params.put("first", first);
	params.put("last", last);
	params.put("email", email);
	params.put("classify", classify);
	return addressMapper.getAddressbookListByEmail(params);
	}
	
	// ***** 페이징 처리 (phonenumber(핸드폰) - 으로 목록조회)
	@Override
	public List<AddressBook> getAddressbookListByPhoneNumber(int first, int last, String phoneNumber, String classify) {

	HashMap<String, Object> params = new HashMap<String, Object>();
	params.put("first", first);
	params.put("last", last);
	params.put("phoneNumber", phoneNumber);
	params.put("classify", classify);
	return addressMapper.getAddressbookListByPhoneNumber(params);
	}
	
	// ***** 주소록 전체 주소록 수 조회하는 작업
	public int getAddressBookCount(String classify) {
		
		return addressMapper.getAddressBookCount(classify);
	}
	
	// ***** 주소록  주소록 수 (name)으로 조회하는 작업
	@Override
	public int getAddressbookCountByName(String name, String classify) {
	
	HashMap<String, Object> params = new HashMap<String, Object>();
	params.put("name", name);
	params.put("classify", classify);
	
	return addressMapper.getAddressbookCountByName(params);
	}
	
	// ***** 주소록 전체 주소록 수 (email)으로  조회하는 작업
	@Override
	public int getAddressbookCountByEmail(String email, String classify) {
	
	HashMap<String, Object> params = new HashMap<String, Object>();
	params.put("email", email);
	params.put("classify", classify);
	
	return addressMapper.getAddressbookCountByEmail(params);
	}
	
	// ***** 주소록 전체 주소록 수 (phoneNumber)으로  조회하는 작업
	@Override
	public int getAddressbookCountByPhoneNumber(String phoneNumber, String classify) {
	
	HashMap<String, Object> params = new HashMap<String, Object>();
	params.put("phoneNumber", phoneNumber);
	params.put("classify", classify);
	
	return addressMapper.getAddressbookCountByPhoneNumber(params);
	}
	
	// ***** 주소록 삭제
	public void deleteAddress(String addressNo, String classify) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("addressNo", addressNo);
		params.put("classify", classify);
		
		addressMapper.deleteAddress(params);
	}
	
	// ***** 주소록 수정
	@Override
	public void editAddress(String addressNo,String classify,AddressBook addressbook) {
		
		HashMap<String, Object> params =new HashMap<String, Object>();
		
		params.put("addressNo", addressNo);
		params.put("classify", classify);
		
		addressMapper.editAddress(params);
		  
	}
	// +++++ 주소 수정시, 기본 정보 가져오게 하는 것.
	@Override
	public AddressBook selectAddress(String addressNo) {
		
		AddressBook addressbook3 = addressMapper.selectAddress(addressNo);
		  
		return addressbook3;
	}
}
