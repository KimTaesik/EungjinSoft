package com.groupware.mapper;

import java.util.HashMap;
import java.util.List;

import com.groupware.dto.Dept;
import com.groupware.dto.Employee;
import com.groupware.dto.Position;

public interface EmployeeMapper {

	void insertEmployee(Employee employee);

	void insertDept(Dept dept);

	void insertPosition(Position position);

	String getDept();

	Employee getEmployeeInfomationList(String id);

	List<Employee> getemList();
	
	List<Employee> getEmployeeList(HashMap<String, String> params);

	List<Dept> getDeptList();

	List<Position> getPositionList();

	int getMemberCountById(String id);

	//Employee getEmployeeByIdAndPasswd(HashMap<String, Object> params);

	Employee getEmployeeById(String id);

	void updateEmployee(HashMap<String, Object> params);

	void deleteEmployee(String id);

	Employee getEmployeeByIdAndPasswd(HashMap<String, String> params);

	void deleteDept(String id);

	void deletePosition(String id);
	
	List<Employee> searchDeptAdmin(String id);
	
	List<Employee> searchAdmin();
	
	void registerApprovalAdmin(String id);

	List<Employee> getApprovalAdminList();

	void deleteApprovalAdmin(String id);
}