package com.groupware.dto;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class Board implements Serializable{
	
	private int boardNo;
	private int board_No;
	private String title;
	private String writer;	
	
	public int getBoard_No() {
		return board_No;
	}

	public void setBoard_No(int board_No) {
		this.board_No = board_No;
	}
	private String content;
	private Date regDate;
	private int readCount;
	private boolean deleted;
	private int groupNo;
	private int step;
	private int depth;
	private String classify;
	
	public String getClassify() {
		return classify;
	}

	public void setClassify(String classify) {
		this.classify = classify;
	}
	// 데이터베이스의 Board 와 BoardComment 테이블 간의 1:M 관계를 구현한 필드 
	private List<BoardComment> comments;
	
	public Board() {}
	
	public List<BoardComment> getComments() {
		return comments;
	}

	public void setComments(List<BoardComment> comments) {
		this.comments = comments;
	}

	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public boolean isDeleted() {
		return deleted;
	}
	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}

	
	
	
	
	

}
