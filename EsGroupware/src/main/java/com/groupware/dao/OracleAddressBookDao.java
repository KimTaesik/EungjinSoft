package com.groupware.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.groupware.dto.AddressBook;
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
	
	// 페이징 처리 (목록조회)
	//전달인자 : 전체 목록에서 조회할 데이터의 시작위치 , 끝위치
	@Override
	public List<AddressBook> getAddressbookList(int first, int last ,String classify) {
	
	HashMap<String, Object> params = new HashMap<String, Object>();
	params.put("first", first);
	params.put("last", last);
	params.put("classify", classify);
	
	return	addressMapper.getAddressbookList(params);
}
	
	

}
