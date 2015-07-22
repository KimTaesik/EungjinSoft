<%@page import="com.groupware.dto.Employee"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Groupware</title>
<link rel="Stylesheet" href="/groupware/styles/default.css" />
</head>
<body background="/groupware/image/background05.jpg">

	<div>
		
		<%-- <% pageContext.include("/WEB-INF/views/include/header.jsp"); %> --%>
		<c:import url="/WEB-INF/views/include/header.jsp" />
			
		<div style="margin-top: 15%;">
			<br /><br /><br />
			<h1 style='text-align:center;'>Groupware project demo</h1>
			<h3 style='text-align:center;'>TEST 관리자 계정 : admin / admin123</h3>
			<h3 style='text-align:center;'>TEST 사원  계정 : employee1 / 123123123  </h3>
		</div>
	</div>
</body>
</html>