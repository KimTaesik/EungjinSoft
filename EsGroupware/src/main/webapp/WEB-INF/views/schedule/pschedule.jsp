<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>일정관리</title>
	<link rel="Stylesheet" href="/groupware/resources/styles/admin.css" />
	<script type='text/javascript'>
	</script>
  	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	<script>
	$(function() {	
	    $( "#accordion" ).accordion();	
	});	
	</script>
</head>
<body>
	<div id="accordion" style="font-size: 10pt">
			 <h3>회원 / 관리자 관리</h3>
		  		<ul>
			        <li><a href="/groupware/admin/registerform.action" target="myframe">사원등록</a></li>
			        <li><a href="/groupware/admin/deptlist.action" target="myframe">부서관리</a></li>
			        <li><a href="/groupware/admin/positionlist.action" target="myframe">직급등록</a></li>
			        <li><a href="/groupware/admin/employeelist.action?lineup=position" target="myframe">사원관리</a></li>
			        <li><a href="/groupware/admin/admingrant.action" target="myframe">관리자지정</a></li>
		    	</ul>
	</div>
</body>
</html>