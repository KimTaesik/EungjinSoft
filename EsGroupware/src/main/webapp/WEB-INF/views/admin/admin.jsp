<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>관리자</title>
	<link rel="Stylesheet" href="/groupware/resources/styles/admin.css" />
	<script type='text/javascript'>
	</script>
</head>
<body>
<nav>
	<ul>
        <li><a href="/groupware/admin/registerform.action" target="myframe">사원등록</a></li>
        <li><a href="/groupware/admin/deptlist.action" target="myframe">부서관리</a></li>
        <li><a href="/groupware/admin/positionlist.action" target="myframe">직급등록</a></li>
        <li><a href="/groupware/admin/employeelist.action?lineup=position" target="myframe">사원관리</a></li>
    </ul>
</nav>
 

<iframe name="myframe" src="/groupware/admin/registerform.action" scrollbars="no" frameborder="0"></iframe>   
 
<!-- 크기를 지정해줘야함, 안그럼 거지같이 나옴 ㅋ 보더값도 0으로 줘야함. 스크롤은 맘대로-->
 


<%--
<footer>
<h4>copyright 응진Soft</h4>
</footer>
 --%>
</body>
</html>