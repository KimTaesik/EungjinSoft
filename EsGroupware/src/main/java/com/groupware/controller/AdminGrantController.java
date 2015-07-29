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
		String radio="8";
		List<Employee> approvalAdmins = employeeDao.getAdminList(radio);
		radio="1";
		List<Employee> approvalAdmins2 = employeeDao.getAdminList(radio);
		
		mav.addObject("depts", depts);
		mav.addObject("positions", positions);
		mav.addObject("approvalAdmins", approvalAdmins);
		mav.addObject("approvalAdmins2", approvalAdmins2);
		mav.setViewName("admin/admingrant");
		
		return mav;
		
	}
	
	@RequestMapping("searchDeptAdmin.action")
	@ResponseBody //별도의 뷰를 사용하지 말고 return 값을 응답본문으로 사용하세요
	public List<Employee> ajaxTest(String option, String radio) {
		//System.out.println(option);
		List<Employee> employees = null;
		//System.out.println(radio);
		if(radio.equals("1")) {
			//employees = employeeDao.searchAdmin();
			employees = employeeDao.searchSelectAdmin(radio);
		}
		else if(radio.equals("3")) {
			employees = employeeDao.searchDeptAdmin(option);
		} 
		else if(radio.equals("8")) {
			employees = employeeDao.searchSelectAdmin(radio);
		} 
			
		return employees;
	}
	
	@RequestMapping(value="registerAdmin.action", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody //별도의 뷰를 사용하지 말고 return 값을 응답본문으로 사용하세요
	public ModelAndView registerApprovalAdmin(String id, String radio) {
		//System.out.println(id);
		if(radio.equals("1")) {
			employeeDao.registerAdmin(id, radio);
		}
		if(radio.equals("8")) {
			employeeDao.registerAdmin(id, radio);
		}
		//employeeDao.registerApprovalAdmin(id);
		//System.out.println(radio);

		ModelAndView mav = new ModelAndView();

		//List<Employee> approvalAdmins = employeeDao.getApprovalAdminList();
		List<Employee> approvalAdmins = employeeDao.getAdminList(radio);
		System.out.println(approvalAdmins);
		List<Position> positions = employeeDao.getPositionList();
		
		if(radio.equals("1")) {
			mav.addObject("positions", positions);
			mav.addObject("approvalAdmins2", approvalAdmins);
			mav.setViewName("admin/admingrant3");
		}
		if(radio.equals("8")) {
			mav.addObject("positions", positions);
			mav.addObject("approvalAdmins", approvalAdmins);
			mav.setViewName("admin/admingrant2");
		}
/*		mav.addObject("positions", positions);
		mav.addObject("approvalAdmins", approvalAdmins);
		mav.setViewName("admin/admingrant2");*/
		
		return mav;
	}
	
	@RequestMapping(value="deleteApprovalAdmin.action", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody //별도의 뷰를 사용하지 말고 return 값을 응답본문으로 사용하세요
	public String deleteApprovalAdmin(String id) {
		//System.out.println(id);
		employeeDao.deleteApprovalAdmin(id);
		
	
		return "success";
	}	
		
}
