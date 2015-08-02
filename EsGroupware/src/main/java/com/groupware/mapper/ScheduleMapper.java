package com.groupware.mapper;

import java.util.HashMap;
import java.util.List;

import com.groupware.dto.Attendance;
import com.groupware.dto.Employee;
import com.groupware.dto.Schedule;

public interface ScheduleMapper {

	public abstract void insertSchedule(HashMap<String, Object> params);
	public abstract List<Schedule> selectSchedule(HashMap<String, Object> params);
	public abstract void editSchedule(HashMap<String, Object> params);
	public abstract Schedule editSelectSchedule(int key);
	public abstract void deleteSchedule(int key);
}