package com.groupware.mapper;

import java.util.HashMap;
import java.util.List;

import com.groupware.dto.Attendance;
import com.groupware.dto.Employee;

public interface ScheduleMapper {

	public abstract void insertSchedule(HashMap<String, Object> params);

}