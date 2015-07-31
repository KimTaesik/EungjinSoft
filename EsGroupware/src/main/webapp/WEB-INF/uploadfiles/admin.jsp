<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>관리자</title>
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
<nav>
<!-- 	<ul>
        <li><a href="/groupware/admin/registerform.action" target="myframe">사원등록</a></li>
        <li><a href="/groupware/admin/deptlist.action" target="myframe">부서관리</a></li>
        <li><a href="/groupware/admin/positionlist.action" target="myframe">직급등록</a></li>
        <li><a href="/groupware/admin/employeelist.action?lineup=position" target="myframe">사원관리</a></li>
    </ul> -->
     <div id="accordion" style="font-size: 10pt">
		  <h3>회원 / 관리자 관리</h3>
		  		<ul>
			        <li><a href="/groupware/admin/registerform.action" target="myframe">사원등록</a></li>
			        <li><a href="/groupware/admin/deptlist.action" target="myframe">부서관리</a></li>
			        <li><a href="/groupware/admin/positionlist.action" target="myframe">직급등록</a></li>
			        <li><a href="/groupware/admin/employeelist.action?lineup=position" target="myframe">사원관리</a></li>
			        <li><a href="/groupware/admin/admingrant.action" target="myframe">관리자지정</a></li>
		    	</ul>
		  <h3>기본관리</h3>
		  		<ul>
			        <li><a href="/groupware/admin/companylogo.action" target="myframe">회사로고 등록</a></li>
		    	</ul>
		  <h3>관리자 3</h3>
			    <ul>
				      <li>List item one</li>
				      <li>List item two</li>
				      <li>List item three</li>
			    </ul>
		  <h3>관리자 4</h3>
		  <div>

		  </div>
		</div>
		
</nav>

<iframe name="myframe" src="/groupware/admin/registerform.action">	
</iframe>   
 
<!-- 크기를 지정해줘야함, 안그럼 거지같이 나옴 ㅋ 보더값도 0으로 줘야함. 스크롤은 맘대로-->
 


<%--
<footer>
<h4>copyright 응진Soft</h4>
</footer>
 --%>
</body>
</html>