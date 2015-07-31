package com.groupware.dao;

import java.util.List;

import com.groupware.dto.Board;
import com.groupware.dto.Dept;
import com.groupware.dto.Employee;
import com.groupware.dto.Menu;
import com.groupware.dto.Position;

public interface EmployeeDao {

	void insertEmployee(Employee employee);

	void insertDept(Dept dept);

	void insertPosition(Position position);

	String getDept();

	Employee getEmployeeInfomationList(String id);

	List<Employee> getemList();

	List<Dept> getDeptList();

	List<Position> getPositionList();

	int getMemberCountById(String id);

	Employee getEmployeeByIdAndPasswd(String id, String passwd);

	Employee getEmployeeById(String id);

	void updateEmployee(Employee employee);

	void deleteEmployee(String id);

	void deleteDept(String id);

	void deletePosition(String id);

	List<Employee> getEmployeeList(String lineup);

	List<Employee> searchDeptAdmin(String id);
	
	List<Employee> searchAdmin();
	
	//List<Employee> getApprovalAdminList();
	List<Employee> getAdminList(String radio);
	
	//void registerApprovalAdmin(String id);

	void deleteApprovalAdmin(String id);

	List<Employee> searchSelectAdmin(String radio);

	int getEmployeeCount();
	
	List<Employee> getEmployeeList2(int first, int last, String lineup);

	void registerAdmin(String id, String usertype);

	void registerApprovalAdmin(String id);
	
	List<Menu> menulist();
}