<%@page import="javax.crypto.spec.PSource"%>
<%@page import="com.groupware.dto.Position"%>
<%@page import="com.groupware.dto.Dept"%>
<%@page import="com.groupware.dto.Employee"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>

<html>
<head>
	<meta charset='utf-8' />
	<title>직원관리</title>
	<link rel='Stylesheet' href='/groupware/resources/styles/default.css' />
	<link rel='Stylesheet' href='/groupware/resources/styles/input.css' />
</head>
<body>

	<div id='pageContainer'>
			
		<div id='content'>
 			<br /><br /><br />
 			<div style='text-align:center;font-size: 15pt'>
			[ <a class="reg" href='deptregister.action' style='text-decoration:none'>부서 등록</a> ]			
			</div> 
			<h3 style="text-align: center;">부서 관리 목록</h3>
			<br /><br />
			
			<% List<Employee> employees = (List<Employee>)request.getAttribute("employees"); %>
			<% List<Dept> depts = (List<Dept>)request.getAttribute("depts"); %>
			<% List<Position> positions = (List<Position>)request.getAttribute("positions"); %>
			<!------------------------------JSTL---------------------------------->
			<c:choose>
				<c:when test="${ depts != null && depts.size() > 0}">
					<table id="listcss" border="2" bordercolor="#70a3f8" style="width:300px; border-spacing: 0px;" align="center">
						<tr style="background-color:#70a3f8; text-align:left; " height="30px">
							<th>부서</th>
							<th> </th>
						</tr>
						<c:forEach var="dept" items="${ depts }">
							<tr style="height:30px;text-align:left;">
								<td>
									${ dept.partName }
								</td>
								<td>
									<a style='text-decoration:none;font-weight: bold' href='deletedept.action?id=${ dept.deptNo}' >삭제</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			
			<%-- <% if (depts != null && depts.size() > 0) { %>			
			<!-- <table id="listcss" border='1' align='center' width='600' cellspacing="0"> -->
			<table id="listcss" border="2" bordercolor="#70a3f8" style="width:300px; border-spacing: 0px;" align="center">
				<tr style="background-color:#70a3f8; text-align:left; " height="30px">
					<th>부서</th>
					<th> </th>
				</tr>
				<% for (Dept dept : depts) { %>
					<tr style="height:30px;text-align:left;">
						<td>
							<%= dept.getPartName() %>
						</td>
						<td>
							<a style='text-decoration:none;font-weight: bold' href='deletedept.action?id=<%= dept.getDeptNo() %>' >삭제</a>
						</td>
					</tr>
				<% } %>
			</table>
			<% } else { %>
			<h3 style='text-align:center'>등록된 부서가 없습니다.</h3>
			<% } %> --%>
			${ fn:replace(dept.partName,'a', 'aa') }

		</div>
	</div>

</body>
</html>