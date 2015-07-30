package com.groupware.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.groupware.dao.EmployeeDao;
import com.groupware.dto.ApprovalForm;
import com.groupware.dto.Employee;
import com.groupware.service.ApprovalService;


@Controller
@RequestMapping(value="approval")
public class ApprovalController {
	
	private ApprovalService approvalService;
	
	@Autowired
	@Qualifier(value="approvalService")
	public void setApprovalService(ApprovalService approvalService) {
		this.approvalService = approvalService;
	}

	@RequestMapping(value="approvalheader.action", method = RequestMethod.GET)
	public String approvalheader() {	
		return "approval/approvalheader";	
	}
	
	@RequestMapping(value="approvalmain.action", method = RequestMethod.GET)
	public String approvalmain() {	
		return "approval/approvalmain";	
	}
	
	@RequestMapping(value="approvalwrite.action", method = RequestMethod.GET)
	public ModelAndView approvalwrite() {	
			
			ModelAndView mav=approvalService.getApprovalForm2();
		return  mav;
	}
	@ResponseBody
	@RequestMapping(value="approvalwrite.action", method = RequestMethod.POST)
	public ApprovalForm approvalwrite2(String form_No) {	
		
		ApprovalForm approvalform=approvalService.getApprovalForm(form_No);
		return 	approvalform;
	}

	
	@RequestMapping(value="approvaling.action", method = RequestMethod.GET)
	public String approvaling() {	
		return "approval/documentbox";	
	}
	
	@RequestMapping(value="approvalform.action", method = RequestMethod.POST)
	public ModelAndView approvalform(String form_No,HttpSession session) {
		
		
		ModelAndView mav=approvalService.getApprovalForm3(form_No,session);
		
		return mav;
	
	}
	@RequestMapping(value = "infomation.action", method = RequestMethod.GET)
	@ResponseBody
	public Employee info(String employeeid) {
		System.out.println(employeeid);
		Employee info =approvalService.getEmployeeInfomationList(employeeid);
//		List<Dept> depts = employeeDao.getDeptList();
//		List<Employee> employees = employeeDao.getemList();

//		ModelAndView mav = new ModelAndView();
//		mav.addObject("depts", depts);
//		mav.addObject("employees", employees);
//		mav.addObject("info", info);
		

	//	ArrayList<Object> list= new ArrayList<>();

		
		
	
		
		return info;
	}
}
