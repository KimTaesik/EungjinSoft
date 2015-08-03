package com.groupware.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.lf5.AppenderFinalizer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.groupware.dao.EmployeeDao;
import com.groupware.dto.ApprovalCooperation;
import com.groupware.dto.ApprovalForm;
import com.groupware.dto.Approval;
import com.groupware.dto.ApprovalLine;
import com.groupware.dto.Employee;
import com.groupware.service.ApprovalService;

@Controller
@RequestMapping(value = "approval")
public class ApprovalController {

	private ApprovalService approvalService;

	@Autowired
	@Qualifier(value = "approvalService")
	public void setApprovalService(ApprovalService approvalService) {
		this.approvalService = approvalService;

	}

	@RequestMapping(value = "approvalheader.action", method = RequestMethod.GET)
	public String approvalheader() {

		return "approval/approvalheader";

	}

	@RequestMapping(value = "approvalmain.action", method = RequestMethod.GET)
	public String approvalmain() {
		return "approval/approvalmain";
	}



	@RequestMapping(value = "approvalwrite.action", method = RequestMethod.GET)
	public ModelAndView approvalwrite() {

		ModelAndView mav = approvalService.getApprovalForm2();
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "approvalwrite.action", method = RequestMethod.POST)
	public ApprovalForm approvalwrite2(String form_No) {

		ApprovalForm approvalform = approvalService.getApprovalForm(form_No);
		return approvalform;
	}

	@RequestMapping(value = "approvalwriteform.action", method = RequestMethod.POST)
	public String approvalwriteform(Approval approval, String lineId1,
			String lineId2, String lineId3, String lineId4, String lineId5,
			String lineId6, String lineId7, String lineId8, String lineId9,
			String lineId10) {
		ApprovalLine approvalLine = new ApprovalLine();
		ApprovalCooperation approvalCooperation = new ApprovalCooperation();
		String lineId[] = { "", lineId1, lineId2, lineId3, lineId4, lineId5, lineId6, lineId7, lineId8, lineId9, lineId10 };
		
		approvalService.insertApproval(approval);
		for (int i = 1; i < 6; i++) {
			if (lineId[i] != "") {
				approvalLine.setPriority(i);
				approvalLine.setId(lineId[i]);
				approvalService.insertApprovalLine(approvalLine);
			}
		}

		for (int i = 6; i < 11; i++) {
			if (lineId[i] != "") {
				approvalCooperation.setId(lineId[i]);
				approvalService.insertApprovalCooperation(approvalCooperation);
			}
		}

		return "approval/approvalheader";
	}

	@RequestMapping(value = "approvaling.action", method = RequestMethod.GET)
	public ModelAndView approvaling() {
		return approvalService.getApprovalList();
		 
	}
	
	@RequestMapping(value = "approvalend.action", method = RequestMethod.GET)
	public ModelAndView approvalend() {
		return approvalService.getApprovalList2();
	}
	
	@RequestMapping(value = "approvalform.action", method = RequestMethod.POST)
	public ModelAndView approvalform(String form_No, HttpSession session) {

		return approvalService.getApprovalForm3(form_No, session);

		

	}

	@RequestMapping(value = "infomation.action", method = RequestMethod.GET)
	@ResponseBody
	public Employee info(String employeeid) {

		Employee info = approvalService.getEmployeeInfomationList(employeeid);
		return info;
	}
	
	@RequestMapping(value = "approvalview.action", method = RequestMethod.GET)
	public ModelAndView approvalView(int approval_No) {


		return approvalService.getApprovalByNo(approval_No);
 

	}
}
