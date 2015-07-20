package com.groupware.dao;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ConnectionHelper3 {
	
	//전달인자에 지정된 내용에 따라 연결객체를 만들고 반환하는 메서드
	public static Connection getConnection(String dsn) {
		
		Connection conn = null;
		
		if (dsn.equals("oracle")) {
			try {
				Context initContext = new InitialContext();
				Context envContext  = (Context)initContext.lookup("java:/comp/env");
				DataSource ds = (DataSource)envContext.lookup("jdbc/groupware");
				conn = ds.getConnection();
			} catch (Exception ex) {}
		} else if (dsn.equals("mysql")) {
			conn = null;
		} else {
			conn = null;
		}
		
		return conn;
	}
	
}
