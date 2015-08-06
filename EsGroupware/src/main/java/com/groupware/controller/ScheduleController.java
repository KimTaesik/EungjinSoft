package com.groupware.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.groupware.dao.ScheduleDao;
import com.groupware.dto.Employee;
import com.groupware.dto.ScRepeat;
import com.groupware.dto.Schedule;

@Controller
@RequestMapping(value="schedule")
public class ScheduleController {
	
	private ScheduleDao scheduleDao;
	@Autowired
	@Qualifier("ScheduleDao")
	public void setAttendanceDao(ScheduleDao scheduleDao) {
		this.scheduleDao = scheduleDao;
	}
	
	@RequestMapping(value = "scheduleheader.action", method = RequestMethod.GET)
	public String management2() {
		return "schedule/scheduleheader";
	}
	
	@RequestMapping(value = "pschedule.action", method = RequestMethod.GET)
	public ModelAndView calendarcheck(HttpSession session,String yyear, String mmonth, String cate) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String[] dateString = new String[]{"sun", "mon", "tue", "wed", "thu", "fri", "sat"};
		int[] lastDate = new int[]{31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
		Date date = new Date();
		
		Employee loginUser = new Employee();
		loginUser.setId(((Employee)session.getAttribute("loginuser")).getId());
		String logUser = loginUser.getId();
		
		
		Schedule sc = new Schedule();
		sc.setStDate((int)(date.getYear()+1900)+"-"+((int)(date.getMonth() + 1) <10 ? "0"+(int)(date.getMonth() + 1):(int)(date.getMonth() + 1) ));
//		sc.setStDate(new Date(date.getYear(),date.getMonth(),date.getDate()));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String[] sd;
		
		List<Schedule> scList = scheduleDao.selectSchedule();
		List<ScRepeat> scRep = scheduleDao.selectRepeat();
		
		Date scDate,coDate;
		Calendar calscDate = Calendar.getInstance();
		Calendar calCompare = Calendar.getInstance();
		
		if(scList.size() >0){
			for(int i=0;i<scList.size();i++){
				
				sd = sdf.format(sdf.parse(scList.get(i).getStDate())).split("-");
				scList.get(i).setYear(sd[0]);
				scList.get(i).setMonth(sd[1]);
				scList.get(i).setDate(sd[2]);	
				
				if(scList.get(i).getRepeat() == 1){
					ArrayList<ScRepeat> test = new ArrayList<ScRepeat>();
					scList.get(i).setSr(test);
					
					scDate = sdf.parse(scList.get(i).getStDate());
					calscDate.setTime(scDate);
					
					List<String> save = new ArrayList<String>();
					
					for(int j=0;j<scRep.size();j++){
						//save.clear();
						if(scList.get(i).getKey() == scRep.get(j).getKey()){
							test.add(scRep.get(j));
							
							coDate = new Date(Integer.parseInt(scRep.get(j).getEndYear())-1900,Integer.parseInt(scRep.get(j).getEndMonth())-1,Integer.parseInt(scRep.get(j).getEndDate()));
							calCompare.setTime(coDate);
							/*	1 일
								2 주
								3 월
								4 년*/
							while(true){
								if(scRep.get(j).getClassify()==1){
									calscDate.set(Calendar.DATE, calscDate.get(Calendar.DATE)+1+scRep.get(j).getFreq());
								}else if(scRep.get(j).getClassify()==2){
									calscDate.set(Calendar.DATE, calscDate.get(Calendar.DATE)+7*scRep.get(j).getFreq());
								}else if(scRep.get(j).getClassify()==3){
									calscDate.set(Calendar.MONTH, calscDate.get(Calendar.MONTH)+1*scRep.get(j).getFreq());
								}else if(scRep.get(j).getClassify()==4){
									calscDate.set(Calendar.YEAR, calscDate.get(Calendar.YEAR)+1*scRep.get(j).getFreq());
								}
								
								if(calscDate.compareTo(calCompare) != -1){
									scList.get(i).setScTemp(save);
									break;
								}else{
									save.add(sdf.format(calscDate.getTime()));
								}
							}
						}
					}
				}
			}
			mav.addObject("scList", scList);
		}
		
		mav.addObject("logUser",logUser);
		mav.addObject("dateString",dateString);
		mav.addObject("lastDate",lastDate);
		mav.addObject("cate",cate);
		mav.addObject("currentYear", date.getYear()+1900);
		mav.addObject("currentMonth", date.getMonth() + 1);
		mav.addObject("currentDate", date.getDate());
		
		Date ddate = new Date((int)(date.getYear()+1900),(int)(date.getMonth()),1);
		ddate.setDate(1);
		
		mav.addObject("currentDay", ddate.getDay()-1);
		mav.addObject("date", date);
		mav.setViewName("schedule/pschedule");
		System.out.println("시작?"+(int)(date.getYear()+1900)+"년"+(int)(date.getMonth() + 1)+"월"+date.getDate()+"일"+date.getDay()+"요일");
		
		return mav;
	}
	
	@RequestMapping(value = "pschedule2.action", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView calendarcheck2(HttpSession session,String yyear, String mmonth, String cate) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String[] sd;
		String[] dateString = new String[]{"sun", "mon", "tue", "wed", "thu", "fri", "sat"};
		int[] lastDate = new int[]{31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
		
		Employee loginUser = new Employee();
		loginUser.setId(((Employee)session.getAttribute("loginuser")).getId());
		String logUser = loginUser.getId();

		int ryear = Integer.parseInt(yyear);
		int rmonth = Integer.parseInt(mmonth);
		Date date = new Date(ryear, rmonth-1, 1);
		date.setDate(1);		
		Schedule sc = new Schedule();
		sc.setStDate(ryear+"-"+(rmonth <10 ? "0"+rmonth:rmonth));
//		sc.setStDate(new Date(date.getYear(),date.getMonth(),date.getDate()));
//		sc.setS_id(logUser);
		
//		System.out.println(((int)(date.getMonth() + 1) <10 ? "0"+(int)(date.getMonth() + 1):(int)(date.getMonth() + 1)));
//		Date ndate = new Date(date.getYear(),date.getMonth(),date.getDate());
//		System.out.println("셀렉트 날짜"+ndate);

		List<Schedule> scList = scheduleDao.selectSchedule();
		List<ScRepeat> scRep = scheduleDao.selectRepeat();
		
		
		Date scDate,coDate;
		Calendar calscDate = Calendar.getInstance();
		Calendar calCompare = Calendar.getInstance();
		
		if(scList.size() >0){
			for(int i=0;i<scList.size();i++){
				
				sd = sdf.format(sdf.parse(scList.get(i).getStDate())).split("-");
				scList.get(i).setYear(sd[0]);
				scList.get(i).setMonth(sd[1]);
				scList.get(i).setDate(sd[2]);	
				
				if(scList.get(i).getRepeat() == 1){
					ArrayList<ScRepeat> test = new ArrayList<ScRepeat>();
					scList.get(i).setSr(test);
					
					scDate = sdf.parse(scList.get(i).getStDate());
					calscDate.setTime(scDate);
					
					List<String> save = new ArrayList<String>();
					
					for(int j=0;j<scRep.size();j++){
						//save.clear();
						if(scList.get(i).getKey() == scRep.get(j).getKey()){
							test.add(scRep.get(j));
							
							coDate = new Date(Integer.parseInt(scRep.get(j).getEndYear())-1900,Integer.parseInt(scRep.get(j).getEndMonth())-1,Integer.parseInt(scRep.get(j).getEndDate()));
							calCompare.setTime(coDate);
							/*	1 일
								2 주
								3 월
								4 년*/
							while(true){
								if(scRep.get(j).getClassify()==1){
									calscDate.set(Calendar.DATE, calscDate.get(Calendar.DATE)+1+scRep.get(j).getFreq());
								}else if(scRep.get(j).getClassify()==2){
									calscDate.set(Calendar.DATE, calscDate.get(Calendar.DATE)+7*scRep.get(j).getFreq());
								}else if(scRep.get(j).getClassify()==3){
									calscDate.set(Calendar.MONTH, calscDate.get(Calendar.MONTH)+1*scRep.get(j).getFreq());
								}else if(scRep.get(j).getClassify()==4){
									calscDate.set(Calendar.YEAR, calscDate.get(Calendar.YEAR)+1*scRep.get(j).getFreq());
								}
								
								if(calscDate.compareTo(calCompare) != -1){
									scList.get(i).setScTemp(save);
									break;
								}else{
									save.add(sdf.format(calscDate.getTime()));
								}
							}
						}
					}
				}
			}
			mav.addObject("scList", scList);
		}
		
		mav.addObject("logUser",logUser);
		mav.addObject("dateString",dateString);
		mav.addObject("lastDate",lastDate);
		mav.addObject("cate",cate);
		mav.addObject("date",date);
		mav.addObject("currentYear", ryear);
		mav.addObject("currentMonth", rmonth);
		mav.addObject("currentDate", 1);
		mav.addObject("currentDay",date.getDay()-1);

		mav.setViewName("schedule/pscheduleCalendar");
		
		return mav;
	}
	
}
