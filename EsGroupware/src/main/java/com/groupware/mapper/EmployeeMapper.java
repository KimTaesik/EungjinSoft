package com.groupware.mapper;

import java.util.HashMap;
import java.util.List;

import com.groupware.dto.Dept;
import com.groupware.dto.Employee;
import com.groupware.dto.Log;
import com.groupware.dto.Menu;
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
	
	void shiftdeleteEmployee(String id);
	
	void returnEmployee(String id);

	Employee getEmployeeByIdAndPasswd(HashMap<String, String> params);

	void deleteDept(String id);

	void deletePosition(String id);
	
	List<Employee> searchDeptAdmin(String id);
	
	List<Employee> searchSelectAdmin(HashMap<String, String> params);
	
	void registerAdmin(HashMap<String, String> params);

	void registerApprovalAdmin(String id);
	
	//List<Employee> getApprovalAdminList();
	List<Employee> getAdminList(HashMap<String, String> params);
	
	void deleteApprovalAdmin(String id);

	List<Employee> searchAdmin();
	
	int getEmployeeCount();
	
	int getDeletedEmployeeCount();
	
	List<Employee> getEmployeeList(String lineup);
	
	List<Employee> getEmployeeList2(HashMap<String, Object> params);
	
	List<Employee> getEmployeeDeleteList(HashMap<String, Object> params);
	
	int insertUpload(HashMap<String, Object> params);

	void insertUploadFile(HashMap<String, Object> params);
	
	List<Menu> menulist();
	
	void menuable(String menuno);
	
	void menudisable(String menuno);
	
	int insertLog(HashMap<String, Object> params);
	
	List<Log> loglist(HashMap<String, Object> params);
	
	int getlogCount();
	
	int logAllcount(String id);
	
	int logMonthcount(HashMap<String, String> params);
	
	List<Log> logalllist();
	
	Employee AllAdminSearch();
}