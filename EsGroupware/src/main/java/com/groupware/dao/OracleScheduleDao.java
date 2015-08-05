package com.groupware.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.groupware.dto.ScRepeat;
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
	
	public int insertSchedule(Schedule sc) {
		
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
		params.put("repeat",sc.getRepeat());
		params.put("key", "");
		scheduleMapper.insertSchedule(params);
		int key = (int)params.get("key");
		return key;
	}
	
	public List<Schedule> selectSchedule(Schedule sc) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("stDate", sc.getStDate());
		params.put("s_id", sc.getS_id());
		
		List<Schedule> schedule = scheduleMapper.selectSchedule(params);
		
		return schedule;
	}
	
	public void editSchedule(Schedule sc) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("title", sc.getTitle());
		params.put("cont", sc.getCont());
		params.put("stDate", sc.getEstDate());
		params.put("edDate", sc.getEedDate());
		params.put("classify", sc.getClassify());
		params.put("priority", sc.getPriority());
		params.put("category", sc.getCategory());
		params.put("makepublic", sc.getMakepublic());
		params.put("key", sc.getKey());
		
		scheduleMapper.editSchedule(params);

	}
	
	public Schedule editSelectSchedule(int key) {
		Schedule schedule = scheduleMapper.editSelectSchedule(key);

		return schedule;
	}
	public void deleteSchedule(int key){
		scheduleMapper.deleteSchedule(key);
	}
	@Override
	public void insertRepeat(ScRepeat scRepeat) {
		scheduleMapper.insertRepeat(scRepeat);
	}
	
	@Override
	public List<ScRepeat> selectRepeat(String id) {
		List<ScRepeat> sr = scheduleMapper.selectRepeat(id);
		return sr;
	}

}
