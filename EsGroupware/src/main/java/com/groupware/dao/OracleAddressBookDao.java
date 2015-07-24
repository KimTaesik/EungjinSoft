package com.groupware.dao;

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
	
	

}
