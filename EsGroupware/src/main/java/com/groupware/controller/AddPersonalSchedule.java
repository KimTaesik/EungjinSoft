package com.groupware.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.groupware.dao.ScheduleDao;
import com.groupware.dto.Employee;
import com.groupware.dto.Schedule;

@Controller
@RequestMapping(value="schedule")
public class AddPersonalSchedule {
	
	private ScheduleDao scheduleDao;
	@Autowired
	@Qualifier("ScheduleDao")
	public void setAttendanceDao(ScheduleDao scheduleDao) {
		this.scheduleDao = scheduleDao;
	}
	
	@RequestMapping(value = "addScheduleForm.action", method = RequestMethod.GET)
	public ModelAndView addScheduleForm(String dayid, String year) {
		ModelAndView mav = new ModelAndView();
		
		String[] day = dayid.split("-");
		
		mav.addObject("date", year+"-"+(Integer.parseInt(day[0])<10 ? "0"+day[0]:day[0])+"-"+(Integer.parseInt(day[1])<10 ? "0"+day[1]:day[1]));
		System.out.println(year+"-"+(Integer.parseInt(day[0])<10 ? "0"+day[0]:day[0])+"-"+(Integer.parseInt(day[1])<10 ? "0"+day[1]:day[1]));
		mav.setViewName("schedule/addPersonalschedule");
		return mav;
	}
	
	@RequestMapping(value = "insertSchedule.action", method = RequestMethod.GET)
	public String insertSchedule(HttpSession session,
			String title, String cont, String stdate, int classify, int priority, String makepublic) {
		Employee loginUser = new Employee();
//		loginUser.setId(((Employee)session.getAttribute("loginuser")).getId());
		loginUser.setId("admin");
		String logUser = loginUser.getId();
		
		Schedule sc = new Schedule();
		sc.setTitle(title);
		sc.setCont(cont);
		sc.setStDate(stdate);
		sc.setEdDate(stdate);
		sc.setClassify(classify);
		sc.setPriority(priority);
		sc.setMakepublic(makepublic);
		sc.setCategory("개인일정");
		sc.setS_id(logUser);
		
		System.out.println(title+"/"+cont+"/"+stdate+"/"+classify+"/"+priority+"/"+makepublic+"/"+logUser);	
		scheduleDao.insertSchedule(sc);
		
		
		return "redirect:pschedule.action";
	}
	
	@RequestMapping(value = "reSchedule.action", method = RequestMethod.GET)
	public String reSchedule() {
		System.out.println("리턴 완료!");
		
		return "redirect:pschedule.action";
	}
	
	
	
	
}