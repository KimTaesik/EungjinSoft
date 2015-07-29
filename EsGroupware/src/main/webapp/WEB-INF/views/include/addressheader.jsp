<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

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
	   
	    });
	    

	
	$(document).ready(function() {
		$('.getclassify').click(function(event) {
			var classify = $(this).attr("id");
			alert(classify);
			$.ajax({
				url : "addresslist.action?classify="+classify,
				method : 'get',
				data : {},
				dataType : 'text',
				success: function(result, status, xhr) {
					alert(result)
			 	$("#get").text(result);	
				}
			})
			event.preventDefault();
		})
		
	})
	</script>
</head>
<body>
<div class="left_menu" style="background-color: #88cbff">
	<div id="accordion" style="font-size: 10pt;width: 100pt;">
	<h3>개인 주소록</h3>
	<ul>
        <li><a href="#" id="1" class="getclassify">개인 주소록</a></li>
        <br />
        <li><a href="#" id="2" class="getclassify">공용 주소록</a></li>
        <br />
        <li><a href="#" id="3" class="getclassify">명함철</a></li>
    </ul>
	
	</div>
</div>
<div id="getclassify" >
		<c:import url="/WEB-INF/views/addressbook/addressbooklist.jsp" />
	</div>
</body>