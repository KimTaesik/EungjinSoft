package com.groupware.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;
import javax.servlet.jsp.PageContext;

import org.apache.catalina.connector.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import sun.security.provider.MD2;

import com.groupware.dao.ApprovalDao;
import com.groupware.dao.EmployeeDao;
import com.groupware.dto.Approval;
import com.groupware.dto.ApprovalCooperation;
import com.groupware.dto.ApprovalForm;
import com.groupware.dto.ApprovalLine;
import com.groupware.dto.Board;
import com.groupware.dto.Dept;
import com.groupware.dto.Employee;
import com.sun.org.apache.bcel.internal.generic.GETSTATIC;

@Service("approvalService")
public class MyApprovalService implements ApprovalService {
	
	private ApprovalDao approvalDao;
	private EmployeeDao employeeDao;
	
	@Autowired
	@Qualifier("employeeDao")
	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}



	@Autowired
	@Qualifier("approvalDao")
	public void setApprovalDao(ApprovalDao approvalDao) {
		this.approvalDao = approvalDao;
	}

	
	
	public ApprovalForm getApprovalForm(String form_No) {

		return approvalDao.getApprovalForm(form_No);
		
	}
	public ModelAndView getApprovalForm3(String form_No,HttpSession session) {

		ModelAndView mav= new ModelAndView();
		Employee loginUser = new Employee();
		loginUser.setId(((Employee)session.getAttribute("loginuser")).getId());
//		loginUser.setId("admin");
		String id = loginUser.getId();
		
		Employee drafter = employeeDao.getEmployeeInfomationList(id);
		ApprovalForm approvalform=approvalDao.getApprovalForm3(form_No);
		List<ApprovalForm> approvalforms=approvalDao.getApprovalForm2();
		List<Dept> depts = employeeDao.getDeptList();
		List<Employee> employees = employeeDao.getemList();
		int a[]={1,2,3,4,5};
		
		mav.addObject("a", a);
		 mav.addObject("depts", depts);
		 mav.addObject("employees", employees);
		 mav.addObject("approvalform",approvalform);
		 mav.addObject("drafter", drafter);
		 mav.addObject("approvalforms", approvalforms);
		 mav.setViewName("approval/approvalwriteform");
		return mav;
		
	}
	public ModelAndView getApprovalForm2() {
		
		ModelAndView mav= new ModelAndView();
		List<ApprovalForm> approvalforms=approvalDao.getApprovalForm2();
		
		mav.setViewName("approval/approvalwrite");
		mav.addObject("approvalforms", approvalforms);
		return mav;
	}
	
	public Employee getEmployeeInfomationList(String employeeid){
		System.out.println(employeeid);
		Employee info = employeeDao.getEmployeeInfomationList(employeeid);

		return info;
	}



	@Override
	public void insertApproval(Approval approval) {
		
		approvalDao.insertApproval(approval);
	}



	@Override
	public void insertApprovalLine(ApprovalLine approvalLine) {
			
			
	
		approvalDao.insertApprovalLine(approvalLine);
	}



	@Override
	public void insertApprovalCooperation(
			ApprovalCooperation approvalCooperation) {
		approvalDao.insertApprovalCooperation(approvalCooperation);
	}



	@Override
	public List<Approval> getApprovalList() {
		
		
	 List<Approval> approvals=approvalDao.getApprovalList();
			
	 	return approvals;
		 
	}
	@Override
	public ModelAndView getApprovalList2() {
		
		
		ModelAndView mav= new ModelAndView();
		List<Approval> approvals=approvalDao.getApprovalList2();
		
		mav.addObject("approvals", approvals);
		mav.setViewName("approval/documentbox");
		return mav;
	}



	@Override
	public Approval getApprovalByNo(int approval_No) {
		// TODO Auto-generated method stub
		ModelAndView mav= new ModelAndView();
		
		Approval approval= approvalDao.getApprovalByNo(approval_No);
		return approval;
	}



	@Override
	public void updateApprovalLine(String approveCheck,String id,int approval_No) {
		
		approvalDao.updateApprovalLine(approveCheck, id, approval_No);
	}



	@Override
	public void updateApproval(String approvalConfirm,int approval_No) {
		
		approvalDao.updateApproval(approvalConfirm, approval_No);
	}



	@Override
	public int getApprovalListCount(int approval_No) {
		
		return approvalDao.getApprovalListCount(approval_No);
	}



	@Override
	public ApprovalLine getApprovalLineApprovalDay(String id, int approval_No) {
		
		return approvalDao.getApprovalLineApprovalDay(id, approval_No);
	}



	@Override
	public int getYesApprovalCount() {
		// TODO Auto-generated method stub
		return approvalDao.getYesApprovalCount();
	}



	@Override
	public int getNoApprovalCount() {
		// TODO Auto-generated method stub
		return approvalDao.getNoApprovalCount();
	}

	
	
}
