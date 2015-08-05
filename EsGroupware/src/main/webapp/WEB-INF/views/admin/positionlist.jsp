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
				<c:when test="${ positions != null && positions.size() > 0 }">	
				<div class="table" align="center">	
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_layout">
						<tr>
							<th class="nobr text_overf">직급</th>
							<th class="nobr text_overf">삭제</th>
						</tr>
						<c:forEach var="position" items="${ positions }">
							<tr style="height:30px;text-align:left;">
								<td class='nobr text_overf txt_ce'>
									${ position.positionName }
								</td>
								<td class='nobr text_overf txt_ce'>
									<a style='text-decoration:none;font-weight: bold' href='deleteposition.action?id=${ position.positionNo }' >삭제</a>
								</td>
							</tr>
						</c:forEach>				
					</table>
				</div>
				</c:when>
				<c:otherwise>
						<h3 style='text-align:center'>등록된 직급이 없습니다.</h3>
				</c:otherwise>
			</c:choose>
			
</div>
</body>
</html>