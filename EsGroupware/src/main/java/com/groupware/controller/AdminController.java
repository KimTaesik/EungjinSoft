package com.groupware.controller;
//test2

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.groupware.dao.EmployeeDao;
import com.groupware.dao.OracleEmployeeDao;
import com.groupware.dto.Dept;
import com.groupware.dto.Employee;
import com.groupware.dto.Position;

@Controller
@RequestMapping(value="admin")
public class AdminController {
	private EmployeeDao employeeDao;
	
	@Autowired
	@Qualifier("employeeDao")
	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}

	@RequestMapping(value="admin.action", method = RequestMethod.GET)
	public String admin() {	
		return "admin/admin";	
	}
	
	@RequestMapping(value="registerform.action", method = RequestMethod.GET)
	public ModelAndView registerform(HttpServletRequest req) throws UnsupportedEncodingException {	
		
		req.setCharacterEncoding("utf-8");		
		ModelAndView mav = new ModelAndView();

		List<Dept> depts = employeeDao.getDeptList();
		List<Position> positions = employeeDao.getPositionList();
		

		mav.addObject("depts", depts);
		mav.addObject("positions", positions);
		mav.setViewName("admin/registerform");
		
		return mav;
	}
	@RequestMapping(value="registerform.action", method = RequestMethod.POST)
	public String register(HttpServletRequest req) throws UnsupportedEncodingException {	
		
		req.setCharacterEncoding("utf-8");
		
		String homenumber = null;
		String phonenumber = null;
		String directLine = null;
		String postcode = null;
		
		Employee employee = new Employee();
		employee.setId(req.getParameter("id"));
		employee.setPassword(req.getParameter("password"));
		employee.setName(req.getParameter("name"));
		String sex = null;
		String marital = null;
		if(req.getParameter("sex").equalsIgnoreCase("male")){
			sex = "남";
		} else {
			sex = "여";
		}
		employee.setSex(sex);
		if(req.getParameter("homePhone1") != null) {
			homenumber = req.getParameter("homePhone1") + "-" + req.getParameter("homePhone2") + "-" + req.getParameter("homePhone3");
		}
		employee.setHomeNumber(homenumber);
		if(req.getParameter("cellPhone1") != null) {
			phonenumber = req.getParameter("cellPhone1") + "-" + req.getParameter("cellPhone2") + "-" + req.getParameter("cellPhone3");
		}
		employee.setPhoneNumber(phonenumber);
		//String address = req.getParameter("address1") + " " + req.getParameter("address2");
		employee.setAddress(req.getParameter("roadAddress"));
		employee.setEmail(req.getParameter("email"));
		if(req.getParameter("marital").equalsIgnoreCase("yes")){
			marital = "기혼";
		} else {
			marital = "미혼";
		}
		employee.setMaritalStatus(marital);
		if (req.getParameter("postcode1") != null) {
			postcode =  req.getParameter("postcode1") + "-" + req.getParameter("postcode2");
		}
		employee.setPostcode(postcode);
		if(req.getParameter("directLine1") != null) {
			directLine = req.getParameter("directLine1") + "-" + req.getParameter("directLine2") + "-" + req.getParameter("directLine3");
		}
		employee.setDirectLine(directLine);
		
		employee.setBirthDate(req.getParameter("birthDate"));
		employee.setJoinDate(req.getParameter("joinDate"));
		
		employee.setDeptNo(req.getParameter("dept"));
		employee.setPositionNo(req.getParameter("position"));
		employee.setIpAdress(req.getParameter("ipaddress"));
		employee.setExtension(req.getParameter("extension"));	

		employeeDao.insertEmployee(employee);

		return "redirect:/admin/registerform.action";
	}
	
	@RequestMapping(value="idcheck.action", method = RequestMethod.GET)
	public ModelAndView idcheck(String id,Boolean valid,String memberid) {
		ModelAndView mav = new ModelAndView();
		if(memberid != null) {
			mav.addObject("id", memberid);
			mav.addObject("valid", valid);
			mav.addObject("getid", memberid);
		}else {
			mav.addObject("getid", id);
		}
		mav.setViewName("admin/idcheck");

		return mav;
	}
	
	@RequestMapping(value="idcheck.action", method = RequestMethod.POST)
	public ModelAndView idcheckfirm(String memberId) {
		ModelAndView mav = new ModelAndView();	
		String id = memberId;

		int count = employeeDao.getMemberCountById(id);

		mav.addObject("memberid", id);

		mav.addObject("valid", count == 0 ? true : false);
		mav.setViewName("admin/idcheck");
		mav.setViewName("redirect:/admin/idcheck.action");
		//mav.setView(new RedirectView("admin/incheck.action"));

		return mav;
	}
	
	@RequestMapping(value="employeelist.action")
	public ModelAndView list(String lineup) {
		ModelAndView mav = new ModelAndView();
		if(lineup == null || lineup.length() == 0)
			lineup = "position";
		List<Employee> employees = employeeDao.getEmployeeList(lineup);
		List<Dept> depts = employeeDao.getDeptList();
		List<Position> positions = employeeDao.getPositionList();
		
		mav.addObject("depts", depts);
		mav.addObject("positions", positions);
		mav.addObject("employees", employees);
		mav.setViewName("admin/employeelist");
		
		return mav;
	}
	
	@RequestMapping(value="deptlist.action")
	public ModelAndView deptlist() {
		ModelAndView mav = new ModelAndView();
		//List<Employee> employees = employeeDao.getEmployeeList();
		List<Dept> depts = employeeDao.getDeptList();
		//List<Position> positions = employeeDao.getPositionList();
		
		mav.addObject("depts", depts);
		//mav.addObject("positions", positions);
		//mav.addObject("employees", employees);
		mav.setViewName("admin/deptlist");
		
		return mav;
	}
	
	@RequestMapping(value="positionlist.action")
	public ModelAndView positionlist() {
		ModelAndView mav = new ModelAndView();
		//List<Employee> employees = employeeDao.getEmployeeList();
		//List<Dept> depts = employeeDao.getDeptList();
		List<Position> positions = employeeDao.getPositionList();
		
		//mav.addObject("depts", depts);
		mav.addObject("positions", positions);
		//mav.addObject("employees", employees);
		mav.setViewName("admin/positionlist");
		
		return mav;
	}
	
	@RequestMapping(value = "deptregister.action", method = RequestMethod.GET)
	public String deptRegisterForm(HttpServletRequest req) throws UnsupportedEncodingException {
		req.setCharacterEncoding("utf-8");
		
		return "admin/deptregister";

	}
	
	@RequestMapping(value = "deptregister.action", method = RequestMethod.POST)
	public String deptRegister(HttpServletRequest req, String partname) throws UnsupportedEncodingException {
		req.setCharacterEncoding("utf-8");
		
		Dept dept = new Dept();
		dept.setPartName(req.getParameter("partname"));
		employeeDao.insertDept(dept);
		
		return "redirect:/admin/deptlist.action";

	}

	@RequestMapping(value = "positionregister.action", method = RequestMethod.GET)
	public String positionRegisterForm(HttpServletRequest req) throws UnsupportedEncodingException {
		req.setCharacterEncoding("utf-8");
		
		return "admin/positionregister";

	}
	
	@RequestMapping(value = "positionregister.action", method = RequestMethod.POST)
	public String positionRegister(HttpServletRequest req, String partname) throws UnsupportedEncodingException {
		req.setCharacterEncoding("utf-8");
		
		Position position = new Position();
		position.setPositionName(req.getParameter("positionname"));
		employeeDao.insertPosition(position);
		
		return "redirect:/admin/positionlist.action";

	}
	
	@RequestMapping(value="employeeview.action", method = RequestMethod.GET)
	public ModelAndView view(String id) {
		ModelAndView mav = new ModelAndView();

		if (id == null || id.length() == 0) {//아이디가 없으면 	
			mav.setViewName("redirect:/admin/employeelist.action");
		}

		Employee employee = employeeDao.getEmployeeById(id);
		if (employee == null) {//조회된 결과가 없으면 (아이디가 잘못된 경우)
			mav.setViewName("redirect:/admin/employeelist.action");
		}
		
		List<Dept> depts = employeeDao.getDeptList();
		List<Position> positions = employeeDao.getPositionList();

		mav.addObject("depts", depts);
		mav.addObject("positions", positions);
		mav.addObject("employee", employee);
		mav.setViewName("admin/employeeview");
		
		return mav;
		
	}
	
	@RequestMapping(value="deletedept.action", method = RequestMethod.GET)
	public String deleteDapt(String id) {
		employeeDao.deleteDept(id);
		
		return "redirect:/admin/deptlist.action";
	}
	
	@RequestMapping(value="deleteposition.action", method = RequestMethod.GET)
	public String deletePosition(String id) {
		employeeDao.deletePosition(id);
		
		return "redirect:/admin/positionlist.action";
	}
	
	@RequestMapping(value="employeedelete.action", method = RequestMethod.GET)
	public String deleteEmployee(String id) {
		System.out.println(id);
		
		if (id == null || id.length() == 0 ) {
			return "redirect:/admin/employeelist.action";
		}
		
		employeeDao.deleteEmployee(id);
		
		return "redirect:/admin/employeelist.action";
	}
	
	@RequestMapping(value="employeeupdate.action", method = RequestMethod.POST)
	public String updateEmployee(@ModelAttribute Employee employee) {
		employeeDao.updateEmployee(employee);

		return "redirect:/admin/employeelist.action";
	}
	
}
