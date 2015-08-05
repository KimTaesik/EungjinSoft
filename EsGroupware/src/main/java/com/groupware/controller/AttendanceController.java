package com.groupware.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.groupware.dao.AttendanceDao;
import com.groupware.dto.Attendance;
import com.groupware.dto.Employee;

/**
 * 어탠던수
 */
@Controller
@RequestMapping(value="attendance")
public class AttendanceController {
	
	//Test
	
	private AttendanceDao attendanceDao;
	@Autowired
	@Qualifier("AttendanceDao")
	public void setAttendanceDao(AttendanceDao attendanceDao) {
		this.attendanceDao = attendanceDao;
	}
	
	/**
	 * 근태관리 첫페이지.
	 * 달력출력과 등등
	 * 
	 * @return mav
	 */	
	@RequestMapping(value = "check.action", method = RequestMethod.GET)
	public ModelAndView recheck(String yyear, String mmonth, String chk, String out, HttpSession session,
			@RequestParam(value="year", defaultValue="0") int year, 
			@RequestParam(value="month", defaultValue="0") int month, 
			@RequestParam(value="day", defaultValue="0") int day, 
			@RequestParam(value="hours", defaultValue="0") int hours, 
			@RequestParam(value="minutes", defaultValue="0") int minutes, 
			@RequestParam(value="seconds", defaultValue="0") int seconds, 
			HttpServletRequest req) {
		//yyear, mmonth select로 달력 선택!

		ModelAndView mav = new ModelAndView();
		String aarrive="";
		
		int currentYear = 0;
		int currentMonth = 0;
		int currentDate = 0;
		int currentDay = 0;
		Date date;
		String arrive,home;
		
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
		
		Employee loginUser = new Employee();
		loginUser.setId(((Employee)session.getAttribute("loginuser")).getId());
//		loginUser.setId("admin");
		String logUser = loginUser.getId();
		
		List<Attendance> allAtt = attendanceDao.selectAllAtt(logUser,Integer.parseInt(se[0]), Integer.parseInt(se[1]));
		List<Attendance> att = attendanceDao.selectAttendance(logUser, Integer.parseInt(se[0]), Integer.parseInt(se[1]), Integer.parseInt(se[2]));
		
		if(att.size()<1){
			if(chk !=null){
				if(chk.equals("1")){
					if(out.equals("Y")){
						aarrive="외근";
					}
					arrive = year+"-"+month+"-"+day+" "+hours+":"+minutes+":"+seconds;
					attendanceDao.insertAttendance(year,month,day,hours,minutes,seconds,logUser,(hours>7 ? aarrive+"지각":aarrive+"출근"));
					mav.addObject("workdate", arrive);
				}
			}
		}else{
			arrive = att.get(0).getYears()+"-"+att.get(0).getMonths()+"-"+att.get(0).getDays()+" "+att.get(0).getHours()+":"+att.get(0).getMinutes()+":"+att.get(0).getSeconds();
			req.setAttribute("workdate", arrive);
			if(att.size()==1){
				if(chk !=null){
					if(chk.equals("2")){
						if(out.equals("Y")){
							aarrive="외근";
						}
						home = year+"-"+month+"-"+day+" "+hours+":"+minutes+":"+seconds;
						attendanceDao.insertAttendance(year,month,day,hours,minutes,seconds,logUser,(hours>18 ? aarrive+"야근":aarrive+"퇴근"));
						mav.addObject("homedate", home);
					}
				}
			}else{
				home = att.get(1).getYears()+"-"+att.get(1).getMonths()+"-"+att.get(1).getDays()+" "+att.get(1).getHours()+":"+att.get(1).getMinutes()+":"+att.get(1).getSeconds();
				mav.addObject("homedate", home);
			}
		}

		String userIp   = req.getRemoteAddr();
		mav.addObject("all",allAtt);
		mav.addObject("userIp", userIp);
		mav.setViewName("attendance/check");
		
		return mav;
	}	
	
	/**
	 * 처음 진입
	 * 일자별, 사원별, 부서별 인원의 통계
	 * @param startDate
	 * @param endDate
	 * @param searchTreeKey
	 * @param searchName
	 * @return Date information
	 */
	@RequestMapping(value = "statistic.action", method = RequestMethod.GET)
	public ModelAndView AttStatistic(){
		ModelAndView mav = new ModelAndView();

		List<Employee> allEmp;
		String[] startDay;
		String mmth,selectDay;

		allEmp = attendanceDao.getSelectAll(); //전체 목록 설정
		mav.addObject("emp", allEmp);
			
		selectDay = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
		startDay = selectDay.split("-");
		int mth = (Integer.parseInt(startDay[1])-1);
			
		if(mth<10){
			mmth = "0"+String.valueOf(mth);
		} else {
			mmth = String.valueOf(mth);
		}
		mav.addObject("start", startDay[0]+"-"+mmth+"-"+startDay[2]);
		mav.addObject("end",selectDay); //초기값을 start는 현재 달의 -1을 해줌

		mav.setViewName("attendance/statistic");
		return mav;
	}
	
	/**
	 * 다시 스태스틱 재진입
	 * @param startDate
	 * @param endDate
	 * @param searchTreeKey
	 * @param searchName
	 * @return
	 */
	@RequestMapping(value = "restatistic.action", method = RequestMethod.POST)
	public ModelAndView reAttStatistic(String startDate, String endDate, String searchTreeKey, String searchName){
		ModelAndView mav = new ModelAndView();

		List<Employee> allEmp,dateEmp;
		String[] startDa,endDa;
		System.out.println(searchName);
		String dep = searchTreeKey;
		
		startDa = startDate.split("-"); 
		endDa = endDate.split("-");
		if(Integer.parseInt(startDa[0])<=Integer.parseInt(endDa[0]) && Integer.parseInt(startDa[1])<=Integer.parseInt(endDa[1])){
			if(Integer.parseInt(startDa[1])==Integer.parseInt(endDa[1]) && Integer.parseInt(startDa[2])>Integer.parseInt(endDa[2])){
				allEmp = attendanceDao.getSelectAll();
				mav.addObject("emp", allEmp);
				mav.addObject("chk", "1");
				mav.addObject("start", startDate);
				mav.addObject("end",endDate);
			}else{
				String name = searchName;
				if(searchName.length()<1 && searchTreeKey.length()<1){
					dateEmp = attendanceDao.getSelectCalendar(Integer.parseInt(startDa[0]),Integer.parseInt(startDa[1]),Integer.parseInt(startDa[2]),Integer.parseInt(endDa[0]),Integer.parseInt(endDa[1]),Integer.parseInt(endDa[2]));
				}else if(searchName.length()>1){
					dateEmp = attendanceDao.getSelectCalendarName(Integer.parseInt(startDa[0]),Integer.parseInt(startDa[1]),Integer.parseInt(startDa[2]),Integer.parseInt(endDa[0]),Integer.parseInt(endDa[1]),Integer.parseInt(endDa[2]),name);
				}else{
					switch(dep){
						case "001": dep="경영지원팀"; break;
						case "002": dep="개발2팀"; break;
						case "003": dep="개발1팀"; break;
						case "004": dep="마케팅팀"; break;
						case "005": dep="임원"; break;
						case "006": dep="인사과"; break;
						
/*						case "001": dep="개발팀"; break;
						case "002": dep="개발2팀"; break;
						case "021": dep="인사팀"; break;
						case "022": dep="영업팀"; break;
						case "023": dep="마케팅팀"; break;*/

					}
					dateEmp = attendanceDao.getSelectCalendarDept(Integer.parseInt(startDa[0]),Integer.parseInt(startDa[1]),Integer.parseInt(startDa[2]),Integer.parseInt(endDa[0]),Integer.parseInt(endDa[1]),Integer.parseInt(endDa[2]),dep);
				}
				
				mav.addObject("emp", dateEmp);
				mav.addObject("start", startDate);
				mav.addObject("end",endDate);
			}
		}else{
			allEmp = attendanceDao.getSelectAll();
			mav.addObject("emp", allEmp);
			mav.addObject("chk", "1");
			mav.addObject("start", startDate);
			mav.addObject("end",endDate);
		}
		
		mav.setViewName("attendance/statistic");
		return mav;
	}

	/**
	 * 
	 * @return 아직안함
	 */
	@RequestMapping(value = "management.action", method = RequestMethod.GET)
	public String management() {
		return "attendance/management";
	}
	
}
