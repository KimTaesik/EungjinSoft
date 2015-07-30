package com.groupware.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.groupware.dto.Schedule;
import com.groupware.mapper.ScheduleMapper;

@Repository(value="ScheduleDao")
public class OracleScheduleDao implements ScheduleDao {
	
	private ScheduleMapper scheduleMapper;
	@Autowired
	@Qualifier("ScheduleMapper")
	public void setAttendanceMapper(ScheduleMapper scheduleMapper) {
		this.scheduleMapper = scheduleMapper;
	}
	
	public void insertSchedule(Schedule sc) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("title", sc.getTitle());
		params.put("cont", sc.getCont());
		params.put("stDate", sc.getStDate());
		params.put("edDate", sc.getEdDate());
		params.put("classify", sc.getClassify());
		params.put("priority", sc.getPriority());
		params.put("category", sc.getCategory());
		params.put("makepublic", sc.getMakepublic());
		params.put("s_id", sc.getS_id());
		
		scheduleMapper.insertSchedule(params);
		
	}
	
	public List<Schedule> selectSchedule(Schedule sc) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("stDate", sc.getStDate());
		params.put("category", sc.getCategory());
		params.put("s_id", sc.getS_id());
		
		List<Schedule> schedule = scheduleMapper.selectSchedule(params);

		
		return schedule;
	}

}
