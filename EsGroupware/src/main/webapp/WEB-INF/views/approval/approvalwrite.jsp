<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>groupware</title>
<link rel="stylesheet"
	href="/groupware/resources/styles/jquery/jquery-ui.css">
<script src="/groupware/resources/styles/script/jquery.js"></script>
<script src="/groupware/resources/styles/script/jquery-ui.js"></script>
<link rel="stylesheet" href="/groupware/resources/styles/approval.css">

<script type="text/javascript">
	$(document).ready(function() {
		$('#get').click(function() {

			$.ajax({
				url : "infomation.action?employeeid=" + id,
				method : 'get',
				dataType : 'text',
				success : function(data) {
					$('#output').val(data);
				}
			});
		});
	});
	$(function() {
		$("#accordion").accordion({
			header : "> div > h3"
		}).sortable({
			axis : "y",
			handle : "h3",
			stop : function(event, ui) {

				ui.item.children("h3").triggerHandler("focusout");
				$(this).accordion("refresh");
			}
		});
	});
</script>
</head>

<body>
	<div style="float: left; border: 1px solid;">
		<%
			pageContext.include("/WEB-INF/views/include/approvalheader.jsp");
		%>
	</div>
	<div
		style="width: 85%; float: right; margin-left: 10px; border: 1px solid;">
		<!--  검색 버튼 영역 -->
		<div id="title" style="border: 1px solid;">
			<h2>
				<span>결재문서 작성</span>
			</h2>
		</div>
		<div class="under"></div>
		<!--  //검색 버튼 영역 -->
		<div class="pad10">
			<!--전자결재 컨텐츠 -->
			


</body>
</html>
