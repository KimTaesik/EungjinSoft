<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>일정관리</title>
	<link rel="Stylesheet" href="/groupware/resources/styles/pschedule.css" />
	<link rel="Stylesheet" href="/groupware/resources/styles/scalendar.css" />
  	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script type='text/javascript'>
		$(function() {	
			$( "#accordion" ).accordion();
			$("#frame").load("pschedule.action?cate=ps");
		    
			$("#ps").click(function() {
				$("#frame").load("pschedule.action?cate=ps");
			});
			$("#pus").click(function() {
				$("#frame").load("pschedule.action?cate=pus");
			});
			$("#ts").click(function() {
				$("#frame").load("pschedule.action?cate=ts");
			});
			$("#cs").click(function() {
				$("#frame").load("pschedule.action?cate=cs");
			});
		});
	</script>
	</head>
<body>
<nav>
	<div id="accordion" style="font-size: 10pt">
			<h3>내 일정</h3>
		  		<ul >
			        <li id="ps" class="cursor">개인일정</li>
		    	</ul>
		    <h3>공개일정</h3>
		    	<ul>
			        <li id="pus" class="cursor">공개일정</li>
			        <li id="ts" class="cursor">부서일정</li>
			        <li id="cs" class="cursor">회사일정</li>
		    	</ul>
	</div>
</nav>
	<div style="float: left;" id="frame" class="frame">
	</div>
</body>
</html>

