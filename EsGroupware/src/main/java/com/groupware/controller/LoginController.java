package com.groupware.controller;

import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.groupware.dao.EmployeeDao;
import com.groupware.dto.Dept;
import com.groupware.dto.Employee;
import com.groupware.dto.Log;
import com.groupware.dto.Menu;

@Controller
@RequestMapping(value="login")
public class LoginController {
	private EmployeeDao employeeDao;
	
	@Autowired
	@Qualifier("employeeDao")
	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}

	@RequestMapping(value="loginform.action", method = RequestMethod.GET)
	public String admin() {	
		return "account/loginform";	
	}
	
	@RequestMapping(value="login.action", method = RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request,HttpServletResponse response, String memberId,String passwd) throws UnsupportedEncodingException, UnknownHostException {	
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();

		Employee employee = employeeDao.getEmployeeByIdAndPasswd(memberId, passwd);
		List<Menu> menus = employeeDao.menulist();
		
		/////////////////log
		if (employee != null) {
			Log log = new Log();
			List<Dept> depts = employeeDao.getDeptList();
			for( Dept dept : depts) {
				if (employee.getDeptNo().equals(dept.getDeptNo()))
					log.setDept(dept.getPartName());
			}
			log.setIp(request.getRemoteAddr());
			log.setId(employee.getId());
			//log.setIp(InetAddress.getLocalHost().getHostAddress());
			log.setName(employee.getName());
			
			log.setLogdate(new Date());
			employeeDao.insertLog(log);
			/////////////////log
		}

		if (employee != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginuser", employee);//로그인 처리
			
			String returnUrl = request.getParameter("returnurl");
			if (returnUrl == null || returnUrl.length() == 0) {
				mav.addObject("menus", menus);
				mav.setViewName("index");
			}
			else {
				returnUrl = returnUrl.split("/groupware")[1];
				mav.setViewName("redirect:"+returnUrl);
			}
			
		} 
		else {
			mav.setViewName("account/loginform");
		}
		return mav;
	}
	
	@RequestMapping(value="logout.action", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.removeAttribute("loginuser");//지정된 데이터만 삭제
		//session.invalidate();//세션 자체를 리셋 (모든 데이터 삭제)
		return ("index");
	}

	
}
