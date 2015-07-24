package com.groupware.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.groupware.dto.Attendance;
import com.groupware.dto.Employee;

@Controller
@RequestMapping(value="schedule")
public class ScheduleController {
	
	@RequestMapping(value = "scheduleheader.action", method = RequestMethod.GET)
	public String management2() {
		return "schedule/scheduleheader";
	}
	
	@RequestMapping(value = "pschedule.action", method = RequestMethod.GET)
	public ModelAndView calendarcheck(String yyear, String mmonth, String chk, String out, HttpSession session,
			@RequestParam(value="year", defaultValue="0") int year, 
			@RequestParam(value="month", defaultValue="0") int month, 
			@RequestParam(value="day", defaultValue="0") int day, 
			@RequestParam(value="hours", defaultValue="0") int hours, 
			@RequestParam(value="minutes", defaultValue="0") int minutes, 
			@RequestParam(value="seconds", defaultValue="0") int seconds, 
			HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		int currentYear = 0;
		int currentMonth = 0;
		int currentDate = 0;
		int currentDay = 0;
		Date date;
		
		String[] dateString = new String[]{"sun", "mon", "tue", "wed", "thu", "fri", "sat"};
		int[] lastDate = new int[]{31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
		mav.addObject("dateString",dateString);
		mav.addObject("lastDate",lastDate);
		
		String selectday = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
		String[] se = selectday.split("-");
		
		if(yyear !=null || mmonth != null){
			int ryear = Integer.parseInt(yyear);
			int rmonth = Integer.parseInt(mmonth);
			se[0] = yyear;
			se[1] = mmonth;
			date = new Date(ryear, rmonth-1, 1);
			date.setDate(1);
			mav.addObject("rdate",date);
			mav.addObject("ryear", ryear);
			mav.addObject("rmonth", rmonth);
			mav.addObject("currentDay",date.getDay()-1);
			
		} else {
			date = new Date();
			mav.addObject("currentYear", date.getYear()+1900);
			mav.addObject("currentMonth", date.getMonth() + 1);
			mav.addObject("currentDate", date.getDate());
			mav.addObject("currentDay",date.getDay());
			mav.addObject("date", date);
		}
		
		
		
		return mav;
	}
	



}
