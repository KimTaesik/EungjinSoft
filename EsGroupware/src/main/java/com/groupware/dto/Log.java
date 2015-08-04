package com.groupware.dto;

import java.io.Serializable;
import java.util.Date;

public class Log{

	private int logno;
	private String dept;
	private String name;
	private String ip;
	private Date logdate;
	private String id;

	
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Date getLogdate() {
		return logdate;
	}
	
	/*public String getLogdate() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);	
		return format.format(logdate);
	}*/
	
	public void setLogdate(Date logdate) {
		this.logdate = logdate;
	}
	public int getLogno() {
		return logno;
	}
	public void setLogno(int logno) {
		this.logno = logno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	
}
