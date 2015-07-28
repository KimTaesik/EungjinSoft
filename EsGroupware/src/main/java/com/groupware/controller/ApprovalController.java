package com.groupware.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.groupware.dao.EmployeeDao;
import com.groupware.dto.ApprovalForm;
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
	public ApprovalForm approvalwrite2(int form_No) {	
		
		ApprovalForm approvalform=approvalService.getApprovalForm(form_No);
		return 	approvalform;
	}

	
	@RequestMapping(value="approvaling.action", method = RequestMethod.GET)
	public String approvaling() {	
		return "approval/documentbox";	
	}
	
	@RequestMapping(value="approvalform.action", method = RequestMethod.GET)
	public String approvalend() {	
		return "approval/approvalwriteform";	
	}
	
	
}
