package com.groupware.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="schedule")
public class AddPersonalschedule {
	
	@RequestMapping(value = "addschedule.action", method = RequestMethod.GET)
	public ModelAndView insertSchedule(String dayid, String year) {
		ModelAndView mav = new ModelAndView();
		
		String[] day = dayid.split("-");
		
		mav.addObject("date", year+"-"+(Integer.parseInt(day[0])<10 ? "0"+day[0]:day[0])+"-"+(Integer.parseInt(day[1])<10 ? "0"+day[1]:day[1]));
		System.out.println(year+"-"+(Integer.parseInt(day[0])<10 ? "0"+day[0]:day[0])+"-"+(Integer.parseInt(day[1])<10 ? "0"+day[1]:day[1]));
		mav.setViewName("schedule/addPersonalschedule");
		return mav;
	}
	
}