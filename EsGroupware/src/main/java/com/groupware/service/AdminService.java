package com.groupware.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.groupware.dao.EmployeeDao;
import com.groupware.dto.Dept;
import com.groupware.dto.Position;

@Service
public class AdminService {
	private EmployeeDao employeeDao;
	
	@Autowired
	@Qualifier("employeeDao")
	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}
	
	public ModelAndView registerformGet(){
		
		List<Dept> depts = employeeDao.getDeptList();
		List<Position> positions = employeeDao.getPositionList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("depts", depts);
		mav.addObject("positions", positions);
		mav.setViewName("admin/registerform");
		
		return null;
		
	}

}
