<%@page import="com.groupware.dto.Employee"%>
<%@page import="com.groupware.dto.Board"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" pageEncoding="utf-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel='Stylesheet' href='/groupware/resources/styles/admin/default.css' />
<title>Insert title here</title>
<script src="/groupware/resources/styles/script/jquery.js"></script>
<script src="/groupware/resources/styles/script/jquery-ui.js"></script>

</head>
<body>
	<div id="login">
            <div>
                <ul>
					<!------------------------------JSTL------------------------------->
					<c:choose>
						<c:when test="${loginuser == null}">	
							<li><a href="/groupware/login/loginform.action">로그인</a></li>
		                	<li><a href="#"></a></li>
						</c:when>
						<c:otherwise>
							${ loginuser.name }님 환영합니다.
		                	<li><a href='/groupware/login/logout.action'>로그아웃</a></li>
						</c:otherwise>
					</c:choose>				
                </ul>
            </div>
		</div>
		
	<div style="float: left;width: 49%">
	<table id="menu" style="width: 500px;height: 110px;padding-left: 20px;text-align: center;color: #999999; font-weight: bolder;">
		<tr height="100px">
			
			<c:set var="count" value="0"/>
			<c:forEach var="menu" items="${ menus }">
				<c:if test="${ menu.use == 1 }">
				<c:if test="${ count > 0 && count % 4 == 0 }">			
					</tr>
					<tr>
				</c:if>
				
					<c:if test="${ menu.menuno == 1 }">
						<c:if test="${ loginuser.userType == 1 }">
							<td onclick="window.open('/groupware/admin/admin.action','관리자','left=100, top=100, toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=1150, height=650');">
								<img src="/groupware/resources/image/admin/admin.png" /><br />
								관리자
							</td>
							<c:set var="count" value="${ count + 1 }"/>
						</c:if>
					</c:if>
					<c:if test="${ menu.menuno == 2 }">
						<td onclick="window.open('/groupware/attendance/check.action','근태현황','left=100, top=100, toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, width=1150, height=650');">
							<img src="/groupware/resources/image/admin/assiduity.png" /><br />
							근태현황
						</td>
						<c:set var="count" value="${ count + 1 }"/>	
					</c:if>
					<c:if test="${ menu.menuno == 3 }">
						<td onclick="window.open('/groupware/board/list.action?classify=1','커뮤니티','left=100, top=100, toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=1150, height=650');">
							<img src="/groupware/resources/image/admin/community.png" /><br />
							커뮤니티
						</td>
						<c:set var="count" value="${ count + 1 }"/>
					</c:if>	
					<c:if test="${ menu.menuno == 4 }">
						<td onclick="window.open('/groupware/organization/organization.action','조직도','left=100, top=100, toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=1150, height=650');">
							<img src="/groupware/resources/image/admin/organization.png" /><br />
							조직도
						</td>
						<c:set var="count" value="${ count + 1 }"/>
					</c:if>
					<c:if test="${ menu.menuno == 5}">
						<td onclick="window.open('/groupware/address/addressheader.action?classify=1','주소록','left=100, top=100, toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=1150, height=650');">
							<img src="/groupware/resources/image/admin/home.png" /><br />
							주소록
						</td>
						<c:set var="count" value="${ count + 1 }"/>
					</c:if>
					<c:if test="${ menu.menuno == 6 }">
						<td onclick="window.open('/groupware/schedule/scheduleheader.action','일정관리','left=100, top=100, toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=1150, height=650');">
							<img src="/groupware/resources/image/admin/assiduity.png" /><br />
							일정관리
						</td>
						<c:set var="count" value="${ count + 1 }"/>
					</c:if>
					<c:if test="${ menu.menuno == 7 }">
						<td onclick="window.open('/groupware/approval/approvalheader.action','전자결제','left=100, top=100, toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=1150, height=650');">
							<img src="/groupware/resources/image/admin/organization.png" /><br />
							전자결제
						</td>
						<c:set var="count" value="${ count + 1 }"/>
					</c:if>		
	
				</c:if>	
						
			</c:forEach>
		</tr>

	</table>
	</div>
	<div style="float: right;width: 49%"><img  style="float: right;height: 20%;margin-top: 5%;margin-right: 5%;" src="/groupware/resources/image/admin/logo.png" /></div>
	<h1 style=""></h1>
</body>
</html>
