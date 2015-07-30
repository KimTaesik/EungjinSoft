<%@page import="com.groupware.dto.Employee"%>
<%@page import="com.groupware.dto.Board"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" pageEncoding="utf-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel='Stylesheet' href='/groupware/resources/styles/default.css' />
<title>Insert title here</title>

</head>
<body>
	<div id="login">
            <div>
                <ul>
  					<%-- <% Employee employee2= (Employee)session.getAttribute("loginuser"); %>
	            	<% if (employee2 == null) { %>
	            		<li><a href="/groupware/login/loginform.action">로그인</a></li>
	                	<li><a href="#"></a></li>   	
	                <% } else { %>
	                	<%= employee2.getName() %>님 환영합니다.
	                	<li><a href='/groupware/login/logout.action'>로그아웃</a></li>
					<% } %> --%>
					
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
		
	<table id="menu" style="width: 500px;height: 110px;padding-left: 20px;text-align: center;color: white;">
		<tr height="100px">
			<td onclick="window.open('/groupware/admin/admin.action','관리자','left=100, top=100, toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=1150, height=650');">
				<img src="/groupware/resources/image/admin/admin.png" /><br />
				관리자
			</td>
			<td onclick="window.open('/groupware/attendance/check.action','근태현황','left=100, top=100, toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, width=1150, height=650');">
			<img src="/groupware/resources/image/admin/assiduity.png" /><br />
				근태현황
			</td>
			<td onclick="window.open('/groupware/board/list.action?classify=1','커뮤니티','left=100, top=100, toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=1150, height=650');">
			<img src="/groupware/resources/image/admin/community.png" /><br />
				커뮤니티
			</td>
			<td onclick="window.open('/groupware/organization/organization.action','조직도','left=100, top=100, toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=1150, height=650');">
			<img src="/groupware/resources/image/admin/organization.png" /><br />
				조직도
			</td>
 			
		</tr>
		<tr>
			<td onclick="window.open('/groupware/address/addressheader.action?classify=1','주소록','left=100, top=100, toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=1150, height=650');">
			<img src="/groupware/resources/image/admin/home.png" /><br />
				주소록
			</td>
			
			<td onclick="window.open('/groupware/approval/approvalheader.action','전자결제','left=100, top=100, toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=1150, height=650');">
			<img src="/groupware/resources/image/admin/organization.png" /><br />

				전자결제
			</td>
			<td onclick="window.open('/groupware/schedule/pschedule.action','일정관리','left=100, top=100, toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=1150, height=650');">
			<img src="/groupware/resources/image//admin/home.png" /><br />
				일정관리
			</td>
			<td onclick="window.open('/groupware/report/reportForm.do','업로드','left=100, top=100, toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=1150, height=650');">
			<img src="/groupware/resources/image//admin/home.png" /><br />
				업로드
			</td>
		</tr>
		<!--
			<td>
				
			</td>
		 </tr>
		<tr>
			<td>
				2-1번ic
			</td>
			<td>
				2-2번ic
			</td>
			<td>
				2-3번ic
			</td>
			<td>
				2-4번ic
			</td>
			<td>
				2-5번ic
			</td>
		</tr>
		<tr>
			<td>
				3-1번ic
			</td>
			<td>
				3-2번ic
			</td>
			<td>
				3-3번ic
			</td>
			<td>
				3-4번ic
			</td>
			<td>
				3-5번ic
			</td>
		</tr>
		<tr>
			<td>
				4-1번ic
			</td>
			<td>
				4-2번ic
			</td>
			<td>
				4-3번ic
			</td>
			<td>
				4-4번ic
			</td>
			<td>
				4-5번ic
			</td>
		</tr> -->
	</table>
</body>
</html>
