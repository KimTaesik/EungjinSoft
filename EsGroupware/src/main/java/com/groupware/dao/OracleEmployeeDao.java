package com.groupware.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.groupware.dto.Dept;
import com.groupware.dto.Employee;
import com.groupware.dto.Position;
import com.groupware.mapper.EmployeeMapper;

@Repository(value = "employeeDao")
public class OracleEmployeeDao implements EmployeeDao {
	private EmployeeMapper employeeMapper;
	
	@Autowired
	@Qualifier("employeeMapper")
	public void setEmployeeMapper(EmployeeMapper employeeMapper) {
		this.employeeMapper = employeeMapper;
	}	
	@Override
	public void insertEmployee(Employee employee) {
		
		employeeMapper.insertEmployee(employee);
	}
	
	/* (non-Javadoc)
	 * @see com.groupware.dao.EmployeeDao#insertDept(com.groupware.dto.Dept)
	 */
	@Override
	public void insertDept(Dept dept) {
		employeeMapper.insertDept(dept);

	}
	
	/* (non-Javadoc)
	 * @see com.groupware.dao.EmployeeDao#insertPosition(com.groupware.dto.Position)
	 */
	@Override
	public void insertPosition(Position position) {
		employeeMapper.insertPosition(position);

	}
	@Override
	public String getDept() {
		
	return employeeMapper.getDept();
	}
	@Override
	public Employee getEmployeeInfomationList(String id) {
		
		return employeeMapper.getEmployeeInfomationList(id);
	}
	@Override
	public List<Employee> getemList() {
		return employeeMapper.getemList();
	}
	
	@Override
	public List<Employee> getEmployeeList(String lineup) {
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("lineup", lineup);
		List<Employee> employees =
				employeeMapper.getEmployeeList(params);
		return employees;
	}
	
	@Override
	public List<Dept> getDeptList() {
		return employeeMapper.getDeptList();
	
	}
	@Override
	public List<Position> getPositionList() {
		return employeeMapper.getPositionList();
	}
	@Override
	public int getMemberCountById(String id) {
		return employeeMapper.getMemberCountById(id);
	}
	@Override
	public Employee getEmployeeByIdAndPasswd(String id, String passwd) {

		HashMap<String, String> params = new HashMap<String, String>();
		params.put("id", id);
		params.put("password", passwd);
		return employeeMapper.getEmployeeByIdAndPasswd(params);
	}
	@Override
	public Employee getEmployeeById(String id) {
	
		return employeeMapper.getEmployeeById(id);
	}
	@Override
	public void updateEmployee(Employee employee) {

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("deptNo", employee.getDeptNo());
		params.put("positionNo", employee.getPositionNo());
		params.put("id", employee.getId());
		
		employeeMapper.updateEmployee(params);
	}
	@Override
	public void deleteEmployee(String id) {
		employeeMapper.deleteEmployee(id);
	}
	
	@Override
	public void deleteDept(String id) {
		employeeMapper.deleteDept(id);
	}	
	@Override
	public void deletePosition(String id) {
		employeeMapper.deletePosition(id);
	}
	@Override
	public void registerApprovalAdmin(String id) {
		employeeMapper.registerApprovalAdmin(id);
	}
	
	
	@Override
	public List<Employee> searchDeptAdmin(String id) {
		List<Employee> employees = employeeMapper.searchDeptAdmin(id);
		return employees;
	}
	
	@Override
	public List<Employee> getApprovalAdminList() {
		List<Employee> employees = employeeMapper.getApprovalAdminList();
		return employees;
	}
	@Override
	public List<Employee> searchAdmin() {
		List<Employee> employees = employeeMapper.searchAdmin();
		return employees;
	}

}

