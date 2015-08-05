package com.groupware.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.groupware.dao.ScheduleDao;
import com.groupware.dto.Employee;
import com.groupware.dto.ScRepeat;
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
	
	@RequestMapping(value = "addScheduleForm.action", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView addScheduleForm(String dayid, String year, String cate) {
		ModelAndView mav = new ModelAndView();
		System.out.println("애두폼액션!");
		String[] day = dayid.split("-");
		mav.addObject("cate",cate);
		mav.addObject("date", year+"-"+(Integer.parseInt(day[0])<10 ? "0"+day[0]:day[0])+"-"+(Integer.parseInt(day[1])<10 ? "0"+day[1]:day[1]));
		System.out.println(year+"-"+(Integer.parseInt(day[0])<10 ? "0"+day[0]:day[0])+"-"+(Integer.parseInt(day[1])<10 ? "0"+day[1]:day[1])+"cate:"+cate);
		mav.setViewName("schedule/addPersonalschedule");
		return mav;
	}
	
	@RequestMapping(value = "editScheduleForm.action", method = RequestMethod.POST)
	public ModelAndView editScheduleForm(int key, String cate) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		String[] sd;
		Schedule eSchedule = scheduleDao.editSelectSchedule(key);
		
		eSchedule.setStDate(sdf.format(sdf.parse(eSchedule.getStDate())));
		mav.addObject("cate",cate);
		mav.addObject("eSchedule", eSchedule);
		System.out.println(eSchedule.getTitle()+"cate:"+cate);
		
		mav.setViewName("schedule/editPersonalschedule");
		return mav;
	}
	
	@RequestMapping(value = "insertSchedule.action", method = RequestMethod.GET)
	public String insertSchedule(HttpSession session,
			String title, String cont, String stdate, int classify, int priority, String makepublic, String cate,
			@RequestParam(value="rclassify", defaultValue="0") int rclassify, 
			@RequestParam(value="freq", defaultValue="0") int freq, 
			@RequestParam(value="endyear", defaultValue="") String endyear, 
			@RequestParam(value="endmonth", defaultValue="") String endmonth, 
			@RequestParam(value="enddate", defaultValue="") String enddate, 
			int chk) throws ParseException {
		
		System.out.println("삽입="+title+"/"+cont+"/"+stdate+"/"+classify+"/"+priority+"/"+makepublic+"/");
		
		ModelAndView mav = new ModelAndView();
		Employee loginUser = new Employee();
		loginUser.setId(((Employee)session.getAttribute("loginuser")).getId());
		
//		loginUser.setId("admin");
		String logUser = loginUser.getId();
		String category;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		String[] spDate = stdate.split("-");
		Date cvDate = new Date(Integer.parseInt(spDate[0]),Integer.parseInt(spDate[1]),Integer.parseInt(spDate[2]));
		
		System.out.println("내용:"+cont);
		
		Schedule sc = new Schedule();

		sc.setRepeat(chk);
		
		sc.setTitle(title);
		sc.setCont(cont.replaceAll("<br>", "\r\n"));
		sc.setStDate(stdate);
		sc.setEdDate(stdate);
		sc.setClassify(classify);
		sc.setPriority(priority);
		sc.setMakepublic(makepublic);
		
		if(cate.equals("ps")){
			category="개인일정";
		}else if(cate.equals("pus")){
			category="공개일정";
		}else if(cate.equals("ts")){
			category="부서일정";
		}else{
			category="회사일정";
		}
		
		System.out.println("인서트:"+category);
		sc.setCategory(category);
		sc.setS_id(logUser);

		int key = scheduleDao.insertSchedule(sc);
		System.out.println("현재키"+key);
		ScRepeat scre = new ScRepeat();
		if(chk==1){
			scre.setKey(key);
			scre.setClassify(rclassify);
			scre.setFreq(freq);
			scre.setId(logUser);
			scre.setEndYear(endyear);
			scre.setEndMonth(endmonth);
			scre.setEndDate(enddate);
			scheduleDao.insertRepeat(scre);
		}
		
		return "redirect:scheduleheader.action";
	}
	
	@RequestMapping(value = "editSchedule.action", method = RequestMethod.GET)
	public String editSchedule(HttpSession session,
			String title, String cont, String stdate, int classify, int priority, String makepublic, int key, String cate) throws ParseException {
		System.out.println("edit="+title+"/"+cont+"/"+stdate+"/"+classify+"/"+priority+"/"+makepublic+"/"+key);	
		Employee loginUser = new Employee();
//		loginUser.setId(((Employee)session.getAttribute("loginuser")).getId());
		loginUser.setId("admin");
		String logUser = loginUser.getId();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		String[] spDate = stdate.split("-");
//		Date cvDate =  Date(Integer.parseInt(spDate[0]),Integer.parseInt(spDate[1]),Integer.parseInt(spDate[2]));
		Date cvDate = new Date(Integer.parseInt(spDate[0])-1900,Integer.parseInt(spDate[1])-1,Integer.parseInt(spDate[2]));
		Schedule sc = new Schedule();
		sc.setTitle(title);
		sc.setCont(cont.replaceAll("<br>", "\r\n"));

		Calendar cal = Calendar.getInstance();
		
		cal.setTime(cvDate);
		
		java.util.Date uDate = cal.getTime();
		java.sql.Date sDate = new java.sql.Date(uDate.getTime());
		sc.setEstDate(sDate);
		sc.setEedDate(sDate);
		sc.setClassify(classify);
		sc.setPriority(priority);
		sc.setMakepublic(makepublic);
		sc.setCategory("개인일정");
		sc.setS_id(logUser);
		sc.setKey(key);
		
		scheduleDao.editSchedule(sc);
		
		return "redirect:scheduleheader.action";
	}
	
	@RequestMapping(value = "deleteSchedule.action", method = RequestMethod.GET)
	public String deleteSchedule(int key, String cate){
		
		System.out.println("삭제");
		scheduleDao.deleteSchedule(key);
		
		return "redirect:scheduleheader.action";
	}
	
	@RequestMapping(value = "reSchedule.action", method = RequestMethod.GET)
	public String reSchedule(String cate) {
		System.out.println("리턴 완료!");
		
		return "redirect:scheduleheader.action";
	}
	
	
	
	
}