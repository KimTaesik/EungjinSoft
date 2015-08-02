<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>일정관리</title>
  	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  	

	<script type='text/javascript'>
		$(function() {	
			$( "#accordion" ).accordion();
			
		    $("#ps").click(function(){
				$(location).attr('href', '/groupware/schedule/pschedule.action?cate=ps');
		    });
		    $("#pus").click(function(){
				$(location).attr('href', '/groupware/schedule/pschedule.action?cate=pus');
		    });
		    $("#ts").click(function(){
				$(location).attr('href', '/groupware/schedule/pschedule.action?cate=ts');
		    });
		    $("#cs").click(function(){
				$(location).attr('href', '/groupware/schedule/pschedule.action?cate=cs');
		    });
		    
		});
	</script>
<body>
<nav>
	<div id="accordion" style="font-size: 10pt">
			<h3>내 일정</h3>
		  		<ul>
			        <li><span id="ps" style="cursor:pointer">개인일정</span></li>
		    	</ul>
		    <h3>공개일정</h3>
		    	<ul>
			        <li><span id="pus" style="cursor:pointer">공개일정</span></li>
			        <li><span id="ts" style="cursor:pointer">부서일정</span></li>
			        <li><span id="cs" style="cursor:pointer">회사일정</span></li>
		    	</ul>
	</div>
</nav>
</body>

