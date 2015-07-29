package com.groupware.dto;

import java.util.Date;

public class Schedule {
	private String title;
	private String cont;
	private String stDate;
	private String edDate;
	private int classify;
	private int priority;
	private String category;
	private String makepublic;
	private String s_id;
	private String year;
	private String month;
	private String date;
	
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getStDate() {
		return stDate;
	}
	public void setStDate(String stDate) {
		this.stDate = stDate;
	}
	public String getEdDate() {
		return edDate;
	}
	public void setEdDate(String edDate) {
		this.edDate = edDate;
	}
	public int getClassify() {
		return classify;
	}
	public void setClassify(int classfiy) {
		this.classify = classfiy;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getMakepublic() {
		return makepublic;
	}
	public void setMakepublic(String makepublic) {
		this.makepublic = makepublic;
	}
	public String getS_id() {
		return s_id;
	}
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
	
	
}