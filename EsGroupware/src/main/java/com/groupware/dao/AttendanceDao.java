package com.groupware.dao;

import java.util.List;

import com.groupware.dto.Attendance;
import com.groupware.dto.Employee;

public interface AttendanceDao {

	public abstract void insertAttendance(int year, int month, int day,
			int hours, int minutes, int seconds, String id, String classfiy);

	public abstract List<Attendance> selectAttendance(String id, int year,
			int month, int day);

	public abstract List<Attendance> selectAllAtt(String id, int year, int month);

	public abstract List<Employee> getSelectAll();

	public abstract List<Employee> getSelectCalendar(int stYear, int stMonth,
			int stDate, int edYear, int edMonth, int edDate);

	public abstract List<Employee> getSelectCalendarName(int stYear, int stMonth, 
			int stDate, int edYear, int edMonth, int edDate, String name);

	public abstract List<Employee> getSelectCalendarDept(int stYear,
			int stMonth, int stDate, int edYear, int edMonth, int edDate, String name);

}