package com.groupware.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.groupware.dao.EmployeeDao;
import com.groupware.dto.Dept;
import com.groupware.dto.Employee;
import com.groupware.dto.Position;

@Controller
@RequestMapping(value="admin")
public class AdminGrantController {
	private EmployeeDao employeeDao;
	
	@Autowired
	@Qualifier("employeeDao")
	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}
	
	@RequestMapping(value="admingrant.action", method = RequestMethod.GET)
	public ModelAndView admin(HttpServletRequest req) throws UnsupportedEncodingException {	
		
		req.setCharacterEncoding("utf-8");		
		ModelAndView mav = new ModelAndView();

		List<Dept> depts = employeeDao.getDeptList();
		List<Position> positions = employeeDao.getPositionList();
		List<Employee> approvalAdmins = employeeDao.getApprovalAdminList();
		
		mav.addObject("depts", depts);
		mav.addObject("positions", positions);
		mav.addObject("approvalAdmins", approvalAdmins);
		mav.setViewName("admin/admingrant");
		
		return mav;
		
	}
	
	@RequestMapping("searchDeptAdmin.action")
	@ResponseBody //별도의 뷰를 사용하지 말고 return 값을 응답본문으로 사용하세요
	public List<Employee> ajaxTest(String option) {
		System.out.println(option);
		List<Employee> employees;
		if(option != "") {
			employees = employeeDao.searchDeptAdmin(option);
		} else {
			employees = employeeDao.searchAdmin();
		}
			
		return employees;
	}
	
	@RequestMapping(value="registerApprovalAdmin.action", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody //별도의 뷰를 사용하지 말고 return 값을 응답본문으로 사용하세요
	public void registerApprovalAdmin(String id) {
		System.out.println(id);
		employeeDao.registerApprovalAdmin(id);
	}
	
	@RequestMapping(value="deleteApprovalAdmin.action", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody //별도의 뷰를 사용하지 말고 return 값을 응답본문으로 사용하세요
	public void deleteApprovalAdmin(String id) {
		System.out.println(id);
		//employeeDao.registerApprovalAdmin(id);
	}
		
}
