<%@page import="javax.crypto.spec.PSource"%>
<%@page import="com.groupware.dto.Position"%>
<%@page import="com.groupware.dto.Dept"%>
<%@page import="com.groupware.dto.Employee"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>

<html>
<head>
	<meta charset='utf-8' />
	<title>직원관리</title>
	<link rel='Stylesheet' href='/groupware/resources/styles/default.css' />
	<link rel='Stylesheet' href='/groupware/resources/styles/input.css' />
	<style type="text/css">
		td {
			border-bottom: 1px solid #111111
		}
	</style>
</head>
<body>

	<div id='pageContainer'>
			
		<div id='content'>
 			<br /><br /><br />
<!-- 			<div style='text-align:center'>
			[ <a class="reg" href='registerform.action' style='text-decoration:none'>사용자 등록</a> ]			
			</div>  -->
			<h3 style="text-align: center;">사원 관리 목록</h3>
			<br /><br />
			
<%-- 			<% List<Employee> employees = (List<Employee>)request.getAttribute("employees"); %>
			<% List<Dept> depts = (List<Dept>)request.getAttribute("depts"); %>
			<% List<Position> positions = (List<Position>)request.getAttribute("positions"); %> --%>
			<c:choose>
				<c:when test="${ employees != null && employees.size() > 0 }">
					 <table id="listcss" style="width:600px; border-spacing: 0px;">
						<tr style="background-color:#D5D5D5; text-align:left; height: 30px;">
							<th>
							<a style='text-decoration:none;font-weight: bold' href='employeelist.action?lineup=id' >아이디</a>
							</th>
							<th>
							<a style='text-decoration:none;font-weight: bold' href='employeelist.action?lineup=name' >이름</a>
							</th>
							<th>
							성별
							</th>
							<th>
							<a style='text-decoration:none;font-weight: bold' href='employeelist.action?lineup=dept' >소속부서</a>
							</th>
							<th>
							<a style='text-decoration:none;font-weight: bold' href='employeelist.action?lineup=position' >직급</a>
							</th>
						</tr>
						<c:forEach var="employee" items="${ employees }">
							<tr style="height:30px;text-align:left;border-bottom: 2px #000000 solid;">
								<td>
									<a style='text-decoration:none;font-weight: bold' href='employeeview.action?id=${ employee.id }' >${ employee.id }</a>
								</td>
								<td>${ employee.name }</td>
								<td>${ employee.sex }</td>
								
								<c:forEach var="dept" items="${ depts }">
									<c:choose>
										<c:when test="${ employee.deptNo.equals(dept.deptNo) }">
											<td>${ dept.partName }</td>
										</c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
								</c:forEach>
								<c:forEach var="position" items="${ positions }">
									<c:choose>
										<c:when test="${ employee.positionNo.equals(position.positionNo) }">
											<td>${ position.positionName }</td>
										</c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
								</c:forEach>							
							</tr>
						</c:forEach>
						</table>					
				</c:when>
				<c:otherwise>
					<h3 style='text-align:center'>등록된 사용자가 없습니다.</h3>
				</c:otherwise>
			</c:choose>
			
			<%-- <% if (employees != null && employees.size() > 0) { %>			
			<!-- <table id="listcss" border='1' align='center' width='600' cellspacing="0"> -->
			<table id="listcss" border="2" bordercolor="#70a3f8" style="width:600px; border-spacing: 0px;" align="right">
				<tr style="background-color:#70a3f8; text-align:left; " height="30px">
					<th>
					<a style='text-decoration:none;font-weight: bold' href='employeelist.action?lineup=id' >아이디</a>
					</th>
					<th>
					<a style='text-decoration:none;font-weight: bold' href='employeelist.action?lineup=name' >이름</a>
					</th>
					<th>
					성별
					</th>
					<th>
					<a style='text-decoration:none;font-weight: bold' href='employeelist.action?lineup=dept' >소속부서</a>
					</th>
					<th>
					<a style='text-decoration:none;font-weight: bold' href='employeelist.action?lineup=position' >직급</a>
					</th>
				</tr>
				<% for (Employee employee : employees) { %>
					<tr style="height:30px;text-align:left;">
						<td>
							<a style='text-decoration:none;font-weight: bold' href='employeeview.action?id=<%= employee.getId() %>' ><%= employee.getId() %></a>
						</td>
						<td><%= employee.getName() %></td>
						<td><%= employee.getSex() %></td>
						
						<% for (Dept dept : depts) { %>
							<% if (employee.getDeptNo().equals(dept.getDeptNo())) {%>
								<td><%= dept.getPartName() %></td>
							<% }else { %>
							<% } %>
						<% } %>
						
 						<% for (Position position : positions) { %>
							<% if (employee.getPositionNo().equals(position.getPositionNo())) {%>
								<td><%= position.getPositionName() %></td>
							<% }else { %>
							<% } %>
						<% } %> 
						
					</tr>
				<% } %>
			</table>
			<% } else { %>
			<h3 style='text-align:center'>등록된 사용자가 없습니다.</h3>
			<% } %> --%>

		</div>
	</div>

</body>
</html>