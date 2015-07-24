<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>일정관리</title>
	<link rel="Stylesheet" href="/groupware/resources/styles/pschedule.css" />
	<script type='text/javascript'>
	</script>
  	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	<script>
	$(function() {	
	    $( "#accordion" ).accordion();
	    
	    $("#ps").click(function(){
	        $("#frame").load("pschedule.action");
	    });
	});
	</script>
</head>
<body>
<nav>
	<div id="accordion" style="font-size: 10pt">
			<h3>내 일정</h3>
		  		<ul>
			        <li><a href="#" id="ps">개인일정</a></li>
		    	</ul>
		    <h3>공개일정</h3>
		    	<ul>
			        <li><a href="#">공개일정</a></li>
			        <li><a href="#">부서일정</a></li>
			        <li><a href="#">회사일정</a></li>
		    	</ul>
	</div>
</nav>

<div class="frame" id="frame"></div>
</body>
</html>
