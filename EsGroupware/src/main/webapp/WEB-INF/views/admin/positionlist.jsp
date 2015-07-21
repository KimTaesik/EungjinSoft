<%@page import="javax.crypto.spec.PSource"%>
<%@page import="com.groupware.dto.Position"%>
<%@page import="com.groupware.dto.Dept"%>
<%@page import="com.groupware.dto.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
			[ <a class="reg" href='positionregister.action' style='text-decoration:none'>직급 등록</a> ]			
			</div> 
			<h3 style="text-align: center;">직급 관리 목록</h3>
			<br /><br />
			
<%-- 			<% List<Employee> employees = (List<Employee>)request.getAttribute("employees"); %>
			<% List<Dept> depts = (List<Dept>)request.getAttribute("depts"); %>
			<% List<Position> positions = (List<Position>)request.getAttribute("positions"); %> --%>
			<c:choose>
				<c:when test="${ positions != null && positions.size() > 0 }">		
					<table id="listcss" border="2" bordercolor="#70a3f8" style="width:300px; border-spacing: 0px;" align="center">
						<tr style="background-color:#70a3f8; text-align:left; " height="30px">
							<th>직급</th>
							<th> </th>
						</tr>
						<c:forEach var="position" items="${ positions }">
							<tr style="height:30px;text-align:left;">
								<td>
									${ position.positionName }
								</td>
								<td>
									<a style='text-decoration:none;font-weight: bold' href='deleteposition.action?id=${ position.positionNo }' >삭제</a>
								</td>
							</tr>
						</c:forEach>				
					</table>
				</c:when>
				<c:otherwise>
						<h3 style='text-align:center'>등록된 직급이 없습니다.</h3>
				</c:otherwise>
			</c:choose>
			
			<%-- <% if (positions != null && positions.size() > 0) { %>			
			<!-- <table id="listcss" border='1' align='center' width='600' cellspacing="0"> -->
			<table id="listcss" border="2" bordercolor="#70a3f8" style="width:300px; border-spacing: 0px;" align="center">
				<tr style="background-color:#70a3f8; text-align:left; " height="30px">
					<th>직급</th>
					<th> </th>
				</tr>
				<% for (Position position : positions) { %>
					<tr style="height:30px;text-align:left;">
						<td>
							<%= position.getPositionName() %>
						</td>
						<td>
							<a style='text-decoration:none;font-weight: bold' href='deleteposition.action?id=<%= position.getPositionNo() %>' >삭제</a>
						</td>
					</tr>
				<% } %>
			</table>
			<% } else { %>
			<h3 style='text-align:center'>등록된 직급이 없습니다.</h3>
			<% } %> --%>

		</div>
	</div>

</body>
</html>