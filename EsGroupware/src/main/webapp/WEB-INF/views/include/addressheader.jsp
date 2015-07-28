<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	<script>
	$(function() {	
	    $( "#accordion" ).accordion();	
	    $("personaladdressbook").click(function() {
	    	$("#")
	    });
	    
	});	
	</script>
</head>
<body>
<div class="left_menu" style="background-color: #88cbff">
	<div id="accordion" style="font-size: 10pt;width: 100pt;">
	<h3>개인 주소록</h3>
	<ul>
        <li><a href="#" id="personaladdressbook">개인 주소록</a></li>
    </ul>
    <h3>공용 주소록</h3>
    <ul>
        <li><a href="#" id="shareaddressbook">공용 주소록</a></li>
    </ul>
    <h3>명함철</h3>
    <ul>
        <li><a href="#" id="idcard">명함철</a></li>
	</ul>
	
	</div>
</div>
</body>