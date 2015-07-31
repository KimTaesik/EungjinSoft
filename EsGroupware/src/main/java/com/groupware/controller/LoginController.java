package com.groupware.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

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
import com.groupware.dto.Employee;
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
	public ModelAndView login(HttpServletRequest request,HttpServletResponse response, String memberId,String passwd) throws UnsupportedEncodingException {	
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView();

		Employee employee = employeeDao.getEmployeeByIdAndPasswd(memberId, passwd);
		List<Menu> menu = employeeDao.menulist();
		
		if (employee != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginuser", employee);//로그인 처리
			
			String returnUrl = request.getParameter("returnurl");
			if (returnUrl == null || returnUrl.length() == 0) {
				mav.addObject("menu", menu);
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
