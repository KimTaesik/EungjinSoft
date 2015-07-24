<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="/groupware/resources/styles/jquery/jquery-ui.css">
<script src="/groupware/resources/styles/script/jquery.js"></script>
<script src="/groupware/resources/styles/script/jquery-ui.js"></script>
<link rel="stylesheet" href="/groupware/resources/styles/approval.css">
<style>
/* IE has layout issues when sorting (see #5413) */
.group {
	zoom: 1
}
</style>

<script>
	$(function() {
		$("#accordion").accordion({
			header : ">  h3"
		}).sortable({
			axis : "y",
			handle : "h3",
			stop : function(event, ui) {

				ui.item.children("h3").triggerHandler("focusout");
				$(this).accordion("refresh");
			}
		});
		$("#approvalwrite").click(function() {
			$("#frame").load("approvalwrite.action");
		});
		$("#approvalmain").click(function() {
			$("#frame").load("approvalmain.action");
		});
	});
</script>
</head>
<body>
	<nav>
		<div id="accordion">
			<h3>전자결재 메인</h3>
			<ul>
				<li><a href="#" id="approvalmain">전자결제 메인</a></li>
			</ul>
			<h3>결재 문서 작성</h3>
			<ul>
				<li><a href="#" id="approvalwrite">결재 문서 작성</a></li>
				
			</ul>
			<h3>결재할 문서함</h3>
			<ul>
				<li><a href="#">결재할 문서</a></li>
				<li><a href="#">결재완료 문서</a></li>
				
			</ul>
			<h3>개인 문서함</h3>
			<ul>
				<li><a href="#">상신 문서</a></li>
				<li><a href="#">임시 저장</a></li>
				<li><a href="#">반려 문서</a></li>
				<li><a href="#">결재 완료</a></li>
				<li><a href="#">상신 취소</a></li>
				
			</ul>
			<h3>협조 문서함</h3>
			<ul>
				<li><a href="#">미결재 문서</a></li>
				<li><a href="#">결재완료 문서</a></li>
				
			</ul>
			<h3>부서 수신함</h3>
			<ul>
				<li><a href="#">부서 수신함</a></li>
				
			</ul>
			<h3>결재 문서 작성</h3>
			<ul>
				<li><a href="#">참조 문서함</a></li>
				
			</ul>
		</div>
	</nav>
	<div style="float: left;" id="frame" class="frame">
		<c:import url="/WEB-INF/views/approval/approvalmain.jsp"/>
	</div>
</body>