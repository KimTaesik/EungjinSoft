package com.groupware.dao;

import java.util.List;

import com.groupware.dto.Schedule;

public interface ScheduleDao {

	public abstract void insertSchedule(Schedule sc);
	public abstract List<Schedule> selectSchedule(Schedule sc);
}