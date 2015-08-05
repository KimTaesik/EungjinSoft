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
	<title>부서 관리</title>
	
	<link href="/groupware/resources/styles/admin/common.css" rel="stylesheet" type="text/css" />
	
</head>
<body>
	<div id='sub'>
		<div id="title">
			<h2>
				<span class="join">부서 관리 목록</span>
			</h2>	
		</div>
			
		<div class="toparea">
			<span class="rightarea">
				<!-- 퇴사자 회원 리스트 -->
				<span class="btn">
					<a class="reg" href='deptregister.action' style='text-decoration:none'>
						<img src="/groupware/resources/image/admin/icon_pencil.gif" alt="" align="absmiddle" />
						부서 등록
					</a>
				</span>
			</span>
		</div> 

		<c:choose>
			<c:when test="${ depts != null && depts.size() > 0}">
				<div class="table" align="center">
				
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_layout">
					<tr>
						<th class="nobr text_overf">부서</th>
						<th class="nobr text_overf">삭제</th>
					</tr>
				
					<c:forEach var="dept" items="${ depts }">
						<tr style="height:30px;text-align:left;border-bottom: 2px #000000 solid;">
							<td class='nobr text_overf txt_ce'>
								${ dept.partName }
							</td>
							<td class='nobr text_overf txt_ce'>
								<a style='text-decoration:none;font-weight: bold' href='deletedept.action?id=${ dept.deptNo}' >삭제</a>
							</td>
						</tr>
					</c:forEach>

				</table>
				</div>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
			
			
			${ fn:replace(dept.partName,'a', 'aa') }

	</div>

</body>
</html>