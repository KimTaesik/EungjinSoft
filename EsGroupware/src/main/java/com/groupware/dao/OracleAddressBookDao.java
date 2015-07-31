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
	
/*	// 페이징 처리 (목록조회)
	//전달인자 : 전체 목록에서 조회할 데이터의 시작위치 , 끝위치
	@Override
	public List<AddressBook> getAddressbookList(int first, int last, String classify) {
	
	HashMap<String, Object> params = new HashMap<String, Object>();
	params.put("first", first);
	params.put("last", last);
	params.put("classify", classify);
	
	return	addressMapper.getAddressbookList(params);
}*/
	
	@Override
	public List<AddressBook> getAddressbookList(String classify) {
		//HashMap<String, String> params = new HashMap<String, String>();
		//params.put("classify", classify);
		return addressMapper.getAddressbookList(classify);

	}
	
	//**********주소록 삭제************
	
	public void deleteAddress(String addressNo, String classify) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("addressNo", addressNo);
		params.put("classify", classify);
		
	
		addressMapper.deleteAddress(params);
	}
	
	//**********주소록 수정************
/*	@Override
	public void editAddress(AddressBook addressbook, String classify) {
		
		HashMap<String, Object> params =new HashMap<String, Object>();
		params.put("title",board.getTitle());
		params.put("content",board.getContent());
		params.put("boardno",board.getBoardNo());
		addressMapper.editAddress(params);
		  
	}*/
}
