package com.groupware.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

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
	
	@RequestMapping(value = "editScheduleForm.action", method = RequestMethod.GET)
	public ModelAndView editScheduleForm(int key) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		String[] sd;
		Schedule eSchedule = scheduleDao.editSelectSchedule(key);
		eSchedule.setStDate(sdf.format(sdf.parse(eSchedule.getStDate())));
		
		mav.addObject("eSchedule", eSchedule);
		System.out.println(eSchedule.getTitle());
		mav.setViewName("schedule/editPersonalschedule");
		return mav;
	}
	
	@RequestMapping(value = "insertSchedule.action", method = RequestMethod.GET)
	public String insertSchedule(HttpSession session,
			String title, String cont, String stdate, int classify, int priority, String makepublic) throws ParseException {
		System.out.println("빠른일정="+title+"/"+cont+"/"+stdate+"/"+classify+"/"+priority+"/"+makepublic+"/");	
		Employee loginUser = new Employee();
//		loginUser.setId(((Employee)session.getAttribute("loginuser")).getId());
		loginUser.setId("admin");
		String logUser = loginUser.getId();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		String[] spDate = stdate.split("-");
		Date cvDate = new Date(Integer.parseInt(spDate[0]),Integer.parseInt(spDate[1]),Integer.parseInt(spDate[2]));
		
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
		
		scheduleDao.insertSchedule(sc);
		
		return "redirect:pschedule.action";
	}
	
	@RequestMapping(value = "editSchedule.action", method = RequestMethod.GET)
	public String editSchedule(HttpSession session,
			String title, String cont, String stdate, int classify, int priority, String makepublic, int key) throws ParseException {
		System.out.println("edit="+title+"/"+cont+"/"+stdate+"/"+classify+"/"+priority+"/"+makepublic+"/"+key);	
		Employee loginUser = new Employee();
//		loginUser.setId(((Employee)session.getAttribute("loginuser")).getId());
		loginUser.setId("admin");
		String logUser = loginUser.getId();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		String[] spDate = stdate.split("-");
//		Date cvDate =  Date(Integer.parseInt(spDate[0]),Integer.parseInt(spDate[1]),Integer.parseInt(spDate[2]));
		Date cvDate = new Date(Integer.parseInt(spDate[0]),Integer.parseInt(spDate[1]),Integer.parseInt(spDate[2]));
		Schedule sc = new Schedule();
		sc.setTitle(title);
		sc.setCont(cont);

		sc.setEstDate(cvDate);
		sc.setEedDate(cvDate);
		sc.setClassify(classify);
		sc.setPriority(priority);
		sc.setMakepublic(makepublic);
		sc.setCategory("개인일정");
		sc.setS_id(logUser);
		sc.setKey(key);
		scheduleDao.editSchedule(sc);
		
		return "redirect:pschedule.action";
	}
	@RequestMapping(value = "reSchedule.action", method = RequestMethod.GET)
	public String reSchedule() {
		System.out.println("리턴 완료!");
		
		return "redirect:pschedule.action";
	}
	
	
	
	
}