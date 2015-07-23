package com.groupware.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.groupware.dao.EmployeeDao;
import com.groupware.dto.Dept;
import com.groupware.dto.Employee;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "organization")
public class OrganizationController {

	private EmployeeDao employeeDao;

	@Autowired
	@Qualifier(value = "employeeDao")
	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}

	@RequestMapping(value = "organization.action", method = RequestMethod.GET)
	public ModelAndView organization2() {

		List<Dept> depts = employeeDao.getDeptList();
		List<Employee> employees = employeeDao.getemList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("depts", depts);
		mav.addObject("employees", employees);
		mav.setViewName("organization/organization");
		return mav;
	}

	@RequestMapping(value = "infomation.action", method = RequestMethod.GET)
	public ModelAndView info(String employeeid) {
		Employee info = employeeDao.getEmployeeInfomationList(employeeid);
		List<Dept> depts = employeeDao.getDeptList();
		List<Employee> employees = employeeDao.getemList();

		ModelAndView mav = new ModelAndView();
		mav.addObject("depts", depts);
		mav.addObject("employees", employees);
		mav.addObject("info", info);
		mav.setViewName("organization/organization");
		return mav;
	}

}
