package com.groupware.mapper;

import java.util.HashMap;
import java.util.List;

import com.groupware.dto.Attendance;
import com.groupware.dto.Employee;
import com.groupware.dto.ScRepeat;
import com.groupware.dto.Schedule;

public interface ScheduleMapper {

	public abstract int insertSchedule(HashMap<String, Object> params);
	public abstract List<Schedule> selectSchedule();
	public abstract void editSchedule(HashMap<String, Object> params);
	public abstract Schedule editSelectSchedule(int key);
	public abstract void deleteSchedule(int key);
	public abstract void insertRepeat(ScRepeat scRepeat);
	public abstract List<ScRepeat> selectRepeat();

}