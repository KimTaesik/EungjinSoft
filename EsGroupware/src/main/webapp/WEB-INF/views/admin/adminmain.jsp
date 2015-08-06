<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>ESsoft Groupware</title>
	<link href="/groupware/resources/styles/admin/common.css" rel="stylesheet" type="text/css" />
</head>

<body>

<div id="sub">
	
	<!-- 타이틀 영역 -->
	<div id="title">
		<h2><span class="admin">관리자 메인</span></h2>
	</div>
	<div class="under">
	</div>
	<!-- //타이틀 영역 -->

	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="txt_le"><img style="margin-left: 50px;" height="100px" src="/groupware/resources/image/admin/logo.png" /></td>
			<td>&nbsp;</td>
			<td class="txt_ri"><img src="/groupware/resources/image/admin/logo2.JPG" /></td>
		</tr>
	</table>


	<!--  //테이블 영역 -->
	<h4>그룹웨어 이용정보</h4>
	<div class="table_view mar5t">
		<table width="100%"  border="0" cellspacing="0" cellpadding="0">
			
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="35%" />

			<thead>
			<tr>
			    <th>도메인 명</th>
			    <td class="bdr_none">

					<span class="left">${ host }</span>
					
				</td>
			    <th>가입된 사원수</th>
			    <td>
					<span class="left">${ membercount } 명</span>
					<span class="right btn_page"><a href="/groupware/admin/employeelist.action"><span>가입사원 목록</span></a></span> 				
				</td>
			</tr>
			</thead>
			<tbody>
			<tr>
			    <th>관리자 ID</th>
			    <td class="bdr_none">${ admin.id } </td>
			    <th>퇴사처리 된 회원</th>
			    <td>
					<span class="left">${ deletedmembercount } 명</span>
					<span class="right btn_page"><a href="/groupware/admin/employeedeletelist.action"><span>퇴사자 목록</span></a></span>	
				</td>
			</tr>
			<tr>
			    <th>관리자명</th>
			    <td class="bdr_none">${ admin.name }</td>
			    <th>최대 사용자 </th>
			    <td>
					<span class="left">${  membercount + deletedmembercount } 명</span><span class="right btn_page"><a href="/groupware/admin/registerform.action"><span>사용자 추가</span></a></span>	
				</td>
			</tr>

			<tr>
			    <th>관리자 연락처</th>
			    <td class="bdr_none">
			    	${ admin.phoneNumber }
					<span class="left"> </span><span class="right btn_page"><a href="#blank-link" onclick="javascript:memberModify('YWRtaW46MQ==');"><span>관리자 정보수정</span></a></span>
				</td>
			    <th>그룹웨어 이용정보</th>
			    <td class="bdr_none">
					<span class="left">2015.02.08 ~ 2015.08.07 (6 개월)</span><span class="right btn_page"><a href="#blank-link"><span></span></a></span>
				</td>
			</tr>

			</tbody>
		</table>
	</div>
</div>
</body>
</html>

