package com.groupware.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.groupware.dao.EmployeeDao;
import com.groupware.dto.Menu;

@Controller
@RequestMapping(value="admin")
public class AdminCompanyController {
	private EmployeeDao employeeDao;
	
	@Autowired
	@Qualifier("employeeDao")
	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}
	
	@RequestMapping(value="companylogo.action")
	public String logo() {	
		
		return "admin/companylogo";
		
	}
	
	@RequestMapping(value="companymenu.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView menu() {
		
		ModelAndView mav = new ModelAndView();
		List<Menu> menus = employeeDao.menulist();
		mav.addObject("menus", menus);
		mav.setViewName("admin/companymenu");
		return mav;
		
	}
	
	@RequestMapping(value="menuchange.action", method = RequestMethod.POST)
	@ResponseBody
	public String menu2(String checkbox) {
		System.out.println("asdddddddddddddddddd");
		System.out.println(checkbox);
		String[] checked = checkbox.split(",");
		
		for(int i = 1; i <= 7; i++)
			employeeDao.menudisable(String.valueOf(i));
		employeeDao.menuable("1");
		for (int i = 0; i < checked.length ; i ++){
			employeeDao.menuable(checked[i]);
		}
/*		System.out.println("length" + checked.length);
		for (int i = 0; i <= checked.length ; i ++){
			if (checked[i].equals(String.valueOf(i + 1))) {
				employeeDao.menuable(checked[i]);
				System.err.println("menuable : " + checked[i]);
			}		
			else if (!checked[i].equals(String.valueOf(i + 1))) {
				for (int j = i + 1 ; j < Integer.parseInt(checked[i]); j ++) {
					employeeDao.menudisable(String.valueOf(j));
					System.err.println("menudisable : " + String.valueOf(j));
					
					if( i == checked.length) {
						employeeDao.menudisable(String.valueOf(j));
					}
				}
				employeeDao.menuable(checked[i]);
				System.err.println("menudisable11111" + checked[i]);
			}
		}*/
		
		//return "admin/companymenu";
		
		return "/groupware/admin/companymenu.action";
	}
}
