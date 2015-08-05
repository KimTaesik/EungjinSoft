package com.groupware.dao;

import java.util.List;

import com.groupware.dto.ScRepeat;
import com.groupware.dto.Schedule;

public interface ScheduleDao {

	public abstract int insertSchedule(Schedule sc);
	public abstract List<Schedule> selectSchedule(Schedule sc);
	public abstract Schedule editSelectSchedule(int key);
	public abstract void editSchedule(Schedule sc);
	public abstract void deleteSchedule(int key);
	public abstract void insertRepeat(ScRepeat scRepeat);
	public abstract List<ScRepeat> selectRepeat();
}