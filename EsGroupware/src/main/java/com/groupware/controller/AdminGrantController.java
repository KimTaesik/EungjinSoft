package com.groupware.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.groupware.dao.EmployeeDao;
import com.groupware.dto.Dept;
import com.groupware.dto.Employee;
import com.groupware.dto.Position;

@Controller
@RequestMapping(value="admin")
public class AdminGrantController {

	@RequestMapping(value="admingrant.action", method = RequestMethod.GET)
	public String admin() {	
		return "admin/admingrant";	
	}
	
	
}
