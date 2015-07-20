package com.groupware.mapper;

import java.util.HashMap;
import java.util.List;

import com.groupware.dto.Attendance;
import com.groupware.dto.Employee;

public interface AttendanceMapper {

	public abstract void insertAttendance(HashMap<String, Object> params);

	public abstract List<Attendance> selectAttendance(HashMap<String, Object> params);

	public abstract List<Attendance> selectAllAtt(HashMap<String, Object> params);

	public abstract List<Employee> getSelectAll();

	public abstract List<Employee> getSelectCalendar(HashMap<String, Object> params);

	public abstract List<Employee> getSelectCalendarName(HashMap<String, Object> params);

	public abstract List<Employee> getSelectCalendarDept(HashMap<String, Object> params);

}