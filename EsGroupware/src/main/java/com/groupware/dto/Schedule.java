package com.groupware.dto;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;


public class Schedule {
	private int key;
	private String title;
	private String cont;
	private String stDate;
	private String edDate;
	private int classify;
	private int priority;
	private String category;
	private String makepublic;
	private String s_id;
	private int repeat;
	
	private String position;
	private String dept;
	
	private String year;
	private String month;
	private String date;
	private Date estDate;
	private Date eedDate;	
	
//	private List<ScRepeat> sr;
	private List<String> scTemp = new ArrayList<String>();
	
	
	public List<String> getScTemp() {
		return scTemp;
	}
	public void setScTemp(List<String> scTemp) {
		this.scTemp = scTemp;
	}
//	public List<ScRepeat> getSr() {
//		return sr;
//	}
//	public void setSr(List<ScRepeat> sr) {
//		this.sr = sr;
//	}
	public int getRepeat() {
		return repeat;
	}
	public void setRepeat(int repeat) {
		this.repeat = repeat;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public Date getEstDate() {
		return estDate;
	}
	public void setEstDate(Date estDate) {
		this.estDate = estDate;
	}
	public Date getEedDate() {
		return eedDate;
	}
	public void setEedDate(Date eedDate) {
		this.eedDate = eedDate;
	}
	public int getKey() {
		return key;
	}
	public void setKey(int key) {
		this.key = key;
	}
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