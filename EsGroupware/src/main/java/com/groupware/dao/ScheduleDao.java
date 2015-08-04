package com.groupware.dao;

import java.util.List;

import com.groupware.dto.Schedule;

public interface ScheduleDao {

	public abstract void insertSchedule(Schedule sc);
	public abstract List<Schedule> selectSchedule(Schedule sc);
	public abstract Schedule editSelectSchedule(int key);
	public abstract void editSchedule(Schedule sc);
	public abstract void deleteSchedule(int key);
}