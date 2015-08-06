package com.groupware.controller;

import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.UnknownHostException;
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
import com.groupware.dto.Log;
import com.groupware.dto.Position;
import com.groupware.ui.ThePager2;

@Controller
@RequestMapping(value="admin")
public class AdminController {
	private EmployeeDao employeeDao;
	
	@Autowired
	@Qualifier("employeeDao")
	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}
	
	@RequestMapping(value="adminmain.action", method = RequestMethod.GET)
	public ModelAndView adminMain(HttpServletRequest req) throws UnknownHostException {
		/*StringBuffer add = req.getRequestURL();
		System.out.println(add);*/
		int membercount = employeeDao.getEmployeeCount();
		int deletedmembercount = employeeDao.getDeletedEmployeeCount();
		Employee admin = employeeDao.AllAdminSearch();
		
		ModelAndView mav = new ModelAndView(); 
		mav.addObject("host", "http://192.168.13.18:8081/groupware/");
		mav.addObject("admin", admin);
		mav.addObject("membercount", membercount);
		mav.addObject("deletedmembercount", deletedmembercount);
		mav.setViewName("admin/adminmain");
		
		return mav;	
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
	public String register(HttpServletRequest req, Employee employee) throws UnsupportedEncodingException{			
		req.setCharacterEncoding("utf-8");

		if(employee.getSex().equalsIgnoreCase("male")){
			employee.setSex("남");
		} else {
			employee.setSex("여");
		}

		if(req.getParameter("homePhone1") != null) {
			employee.setHomeNumber(req.getParameter("homePhone1") + "-" + req.getParameter("homePhone2") + "-" + req.getParameter("homePhone3"));
		}
		if(req.getParameter("cellPhone1") != null) {
			employee.setPhoneNumber(req.getParameter("cellPhone1") + "-" + req.getParameter("cellPhone2") + "-" + req.getParameter("cellPhone3"));
		}

		if(employee.getMaritalStatus().equalsIgnoreCase("yes")){
			employee.setMaritalStatus("기혼");
		} else {
			employee.setMaritalStatus("미혼");
		}
		if (req.getParameter("postcode1") != null) {
			employee.setPostcode(req.getParameter("postcode1") + "-" + req.getParameter("postcode2"));
		}	
		if(req.getParameter("directLine1") != null) {
			employee.setDirectLine(req.getParameter("directLine1") + "-" + req.getParameter("directLine2") + "-" + req.getParameter("directLine3"));
		}
			
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
	public ModelAndView list(String lineup,Integer pageno, String sort) {
		
		//******* 페이징 관련 데이터 처리 ********* 
		int pageNo = 1; // 현재 페이지 번호
		int pageSize = 10; //한 페이지에 표시할 데이터 갯수
		int pagerSize = 10; //번호로 표시할 페이지 갯수
		int dataCount = 0; //전체 데이터 갯수 (pageSize와 dataCount를 알아야, 페이지가 얼마나? 있는지 알 수 있다.)
		String url = "employeelist.action"; // 페이징 관련 링크를 누르면, 페이지번호와 함께 요청할 경로
		//요청한 페이지 번호가 있다면, 읽어서 현재 페이지 번호로 설정 (없다면, 1페이지)
		if (pageno != null ) {
			pageNo =pageno;
		}
		if (sort == null ) {
			sort = "ASC";
		}
		if (lineup == null ) {
			lineup = "id";
		}
		
		//현재 페이지의 첫 번째 데이터의 순서번호를 계산하는 방법.
		int first = (pageNo - 1) * pageSize + 1; //1 page -> 1, 2 page -> 4, 3 page -> 7
		
		//1. 데이터 조회 (DAO객체 이용해서 처리)
		
		//내가 조건에 맞게 검색한 정보만, (type별로) 나오게 하는 작업.
		List<Employee> employees = null;
		
		employees= employeeDao.getEmployeeList2(first, first + pageSize, lineup, sort); // 페이징 처리로 해줬기 때문에 이런 처리를 해줘야한다.			
		
		
		//$$$$$$$$$$$$$$$$  페이지 개수 조정 (조건에 맞는 개수만큼만 페이징 조정) 작업.
		
		
		dataCount = employeeDao.getEmployeeCount(); //전체 게시물 갯수 조회
			
		ThePager2 pager = new ThePager2(dataCount, pageNo, pageSize, pagerSize, url);
		
		ModelAndView mav = new ModelAndView();

		/*List<Employee> employees = employeeDao.getEmployeeList(lineup);*/
		List<Dept> depts = employeeDao.getDeptList();
		List<Position> positions = employeeDao.getPositionList();
		
		mav.addObject("depts", depts);
		mav.addObject("positions", positions);
		mav.addObject("employees", employees);
		mav.addObject("pager", pager);
		mav.addObject("pageno", pageNo);
		mav.setViewName("admin/employeelist");
		
		return mav;
	}
	
	
	@RequestMapping(value="employeedeletelist.action")
	public ModelAndView list2(String lineup,Integer pageno, String sort) {
		
		//******* 페이징 관련 데이터 처리 ********* 
		int pageNo = 1; // 현재 페이지 번호
		int pageSize = 10; //한 페이지에 표시할 데이터 갯수
		int pagerSize = 10; //번호로 표시할 페이지 갯수
		int dataCount = 0; //전체 데이터 갯수 (pageSize와 dataCount를 알아야, 페이지가 얼마나? 있는지 알 수 있다.)
		String url = "employeedeletelist.action"; // 페이징 관련 링크를 누르면, 페이지번호와 함께 요청할 경로
		//요청한 페이지 번호가 있다면, 읽어서 현재 페이지 번호로 설정 (없다면, 1페이지)
		if (pageno != null ) {
			pageNo =pageno;
		}
		if (sort == null ) {
			sort = "ASC";
		}
		if (lineup == null ) {
			lineup = "id";
		}
		
		//현재 페이지의 첫 번째 데이터의 순서번호를 계산하는 방법.
		int first = (pageNo - 1) * pageSize + 1; //1 page -> 1, 2 page -> 4, 3 page -> 7
		
		//1. 데이터 조회 (DAO객체 이용해서 처리)
		
		//내가 조건에 맞게 검색한 정보만, (type별로) 나오게 하는 작업.
		List<Employee> employees = null;
		
		employees= employeeDao.getEmployeeDeleteList(first, first + pageSize, lineup, sort); // 페이징 처리로 해줬기 때문에 이런 처리를 해줘야한다.			
		
		
		//$$$$$$$$$$$$$$$$  페이지 개수 조정 (조건에 맞는 개수만큼만 페이징 조정) 작업.
		
		
		dataCount = employeeDao.getDeletedEmployeeCount(); //전체 게시물 갯수 조회
			
		ThePager2 pager = new ThePager2(dataCount, pageNo, pageSize, pagerSize, url);
		
		ModelAndView mav = new ModelAndView();

		/*List<Employee> employees = employeeDao.getEmployeeList(lineup);*/
		List<Dept> depts = employeeDao.getDeptList();
		List<Position> positions = employeeDao.getPositionList();
		
		mav.addObject("depts", depts);
		mav.addObject("positions", positions);
		mav.addObject("employees", employees);
		mav.addObject("pager", pager);
		mav.addObject("pageno", pageNo);
		mav.setViewName("admin/employeedeletelist");
		
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
		System.out.println(employee.getBirthDatetype());
		System.out.println(employee.getBirthDate());
		
		List<Dept> depts = employeeDao.getDeptList();
		List<Position> positions = employeeDao.getPositionList();

		mav.addObject("depts", depts);
		mav.addObject("positions", positions);
		mav.addObject("employee", employee);
		mav.setViewName("admin/employeeview2");
		
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
		
		if (id == null || id.length() == 0 ) {
			return "redirect:/admin/employeelist.action";
		}
		
		employeeDao.deleteEmployee(id);
		
		return "redirect:/admin/employeelist.action";
	}
	
	@RequestMapping(value="employeeshiftdelete.action")
	public String shiftdeleteEmployee(String id) {
		System.out.println(id);
		if (id == null || id.length() == 0 ) {
			return "redirect:/admin/employeelist.action";
		}
		
		employeeDao.shiftdeleteEmployee(id);
		
		return "redirect:/admin/employeedeletelist.action";
	}
	
	@RequestMapping(value="employeereturn.action", method = RequestMethod.GET)
	public String returnEmployee(String id) {
		
		if (id == null || id.length() == 0 ) {
			return "redirect:/admin/employeelist.action";
		}
		
		employeeDao.returnEmployee(id);
		
		return "redirect:/admin/employeedeletelist.action";
	}
	
	@RequestMapping(value="employeeupdate.action", method = RequestMethod.POST)
	public String updateEmployee(@ModelAttribute Employee employee) {
		if(employee.getSex().equalsIgnoreCase("male")){
			employee.setSex("남");
		} else {
			employee.setSex("여");
		}
		employeeDao.updateEmployee(employee);

		return "redirect:/admin/employeelist.action";
	}
	
	@RequestMapping(value="log.action", method = RequestMethod.GET)
	public ModelAndView log(Integer pageno) {
		
		//******* 페이징 관련 데이터 처리 ********* 
		int pageNo = 1; // 현재 페이지 번호
		int pageSize = 10; //한 페이지에 표시할 데이터 갯수
		int pagerSize = 10; //번호로 표시할 페이지 갯수
		int dataCount = 0; //전체 데이터 갯수 (pageSize와 dataCount를 알아야, 페이지가 얼마나? 있는지 알 수 있다.)
		String url = "log.action"; // 페이징 관련 링크를 누르면, 페이지번호와 함께 요청할 경로
		//요청한 페이지 번호가 있다면, 읽어서 현재 페이지 번호로 설정 (없다면, 1페이지)
		if (pageno != null ) {
			pageNo =pageno;
		}
		
		//현재 페이지의 첫 번째 데이터의 순서번호를 계산하는 방법.
		int first = (pageNo - 1) * pageSize + 1; //1 page -> 1, 2 page -> 4, 3 page -> 7
		
		//1. 데이터 조회 (DAO객체 이용해서 처리)
		
		//내가 조건에 맞게 검색한 정보만, (type별로) 나오게 하는 작업.
		List<Log> logs = null;

		logs= employeeDao.loglist(first, first + pageSize); // 페이징 처리로 해줬기 때문에 이런 처리를 해줘야한다.			

		
		//$$$$$$$$$$$$$$$$  페이지 개수 조정 (조건에 맞는 개수만큼만 페이징 조정) 작업.
		
		
		dataCount = employeeDao.getlogCount(); //전체 게시물 갯수 조회
			
		ThePager2 pager = new ThePager2(dataCount, pageNo, pageSize, pagerSize, url);
		
		ModelAndView mav = new ModelAndView();

		/*List<Employee> employees = employeeDao.getEmployeeList(lineup);*/
	
		mav.addObject("logs", logs);
		mav.addObject("pager", pager);
		mav.addObject("pageno", pageNo);
		mav.setViewName("admin/log");
		
		return mav;
	}
	
}
