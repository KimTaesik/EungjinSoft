package com.groupware.controller;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="schedule")
public class ScheduleController {
	
	@RequestMapping(value = "scheduleheader.action", method = RequestMethod.GET)
	public String management2() {
		return "schedule/scheduleheader";
	}
	
	@RequestMapping(value = "pschedule.action", method = RequestMethod.GET)
	public ModelAndView calendarcheck(String yyear, String mmonth) {
		ModelAndView mav = new ModelAndView();
		
		String[] dateString = new String[]{"sun", "mon", "tue", "wed", "thu", "fri", "sat"};
		int[] lastDate = new int[]{31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
		mav.addObject("dateString",dateString);
		mav.addObject("lastDate",lastDate);
		
		Date date = new Date();
		mav.addObject("currentYear", date.getYear()+1900);
		mav.addObject("currentMonth", date.getMonth() + 1);
		mav.addObject("currentDate", date.getDate());
		mav.addObject("currentDay",date.getDay()+2);
		mav.addObject("date", date);
		mav.setViewName("schedule/pschedule");
		System.out.println("시작?"+(int)(date.getYear()+1900)+"년"+(int)(date.getMonth() + 1)+"월"+date.getDate()+"일"+date.getDay()+"요일");
		return mav;
	}
	
	@RequestMapping(value = "pschedule2.action", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView calendarcheck2(String yyear, String mmonth) {
		ModelAndView mav = new ModelAndView();
		
		String[] dateString = new String[]{"sun", "mon", "tue", "wed", "thu", "fri", "sat"};
		int[] lastDate = new int[]{31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
		mav.addObject("dateString",dateString);
		mav.addObject("lastDate",lastDate);

		int ryear = Integer.parseInt(yyear);
		int rmonth = Integer.parseInt(mmonth);
		Date date = new Date(ryear, rmonth-1, 1);
		date.setDate(1);
		System.out.println(ryear+"/"+rmonth);
		mav.addObject("rdate",date);
		mav.addObject("ryear", ryear);
		mav.addObject("rmonth", rmonth);
		mav.addObject("currentDay",date.getDay()-1);
		System.out.println("2액션이지롱");
		System.out.println("2///"+(int)(ryear)+"년"+(int)(rmonth)+"월"+date.getDate()+"일"+(int)(date.getDay()-1)+"요일");
		mav.setViewName("schedule/pscheduleCalendar");
		
		return mav;
	}
	
}
