package com.groupware.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.groupware.dto.Attendance;
import com.groupware.dto.Employee;
import com.groupware.mapper.AttendanceMapper;

@Repository(value="AttendanceDao")
public class OracleAttendanceDao implements AttendanceDao {
	
	private AttendanceMapper attendanceMapper;
	@Autowired
	@Qualifier("AttendanceMapper")
	public void setAttendanceMapper(AttendanceMapper attendanceMapper) {
		this.attendanceMapper = attendanceMapper;
	}
	
	
	public void insertAttendance(int year, int month, int day, int hours,
			int minutes, int seconds, String id, String classfiy) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("year", year);
		params.put("month", month);
		params.put("day", day);
		params.put("hours", hours);
		params.put("minutes", minutes);
		params.put("seconds", seconds);
		params.put("id", id);
		params.put("classfiy", classfiy);
		
		attendanceMapper.insertAttendance(params);
		
		
	}

	public List<Attendance> selectAttendance(String id, int year, int month, int day) {

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("year", year);
		params.put("month", month);
		params.put("day", day);
		params.put("id", id);
		
		List<Attendance> attd = attendanceMapper.selectAttendance(params);

		
		return attd;
	}

	public List<Attendance> selectAllAtt(String id, int year, int month) {

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("year", year);
		params.put("month", month);
		
		List<Attendance> attd = attendanceMapper.selectAllAtt(params);

		return attd;
	}

	public List<Employee> getSelectAll() {
		
		List<Employee> aEmps = attendanceMapper.getSelectAll();
		return aEmps;
	}

	public List<Employee> getSelectCalendar(int stYear, int stMonth,
			int stDate, int edYear, int edMonth, int edDate) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("stDate", stYear*10000+stMonth*100+stDate);
		params.put("edDate", edYear*10000+edMonth*100+edDate);
		List<Employee> aEmps = attendanceMapper.getSelectCalendar(params);
	
		return aEmps;
	}

	public List<Employee> getSelectCalendarName(int stYear, int stMonth,
			int stDate, int edYear, int edMonth, int edDate, String name) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("stDate", stYear*10000+stMonth*100+stDate);
		params.put("edDate", edYear*10000+edMonth*100+edDate);
		params.put("name", name+"%");
		List<Employee> aEmps = attendanceMapper.getSelectCalendarName(params);


		return aEmps;
	}
	public List<Employee> getSelectCalendarDept(int stYear, int stMonth,
			int stDate, int edYear, int edMonth, int edDate, String name) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("stDate", stYear*10000+stMonth*100+stDate);
		params.put("edDate", edYear*10000+edMonth*100+edDate);
		params.put("name", name);
		
		List<Employee> aEmps = attendanceMapper.getSelectCalendarDept(params);

		return aEmps;
	}
}
