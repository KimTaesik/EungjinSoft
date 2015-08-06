package com.groupware.dto;

import java.io.Serializable;
import java.sql.Date;

public class BoardComment implements Serializable{
	
	private int commentNo;
	private int board_No;
	private String id;
	private String content;
	private Date regDate;
	
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	
	public int getBoard_No() {
		return board_No;
	}
	public void setBoard_No(int board_No) {
		this.board_No = board_No;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	

}
