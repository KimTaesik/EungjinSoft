<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리포트 제출</title>
</head>
<body>
	<h3>@RequestParam 사용</h3>
	<form action="submitReport1.do" method="post" enctype="multipart/form-data">
		학번 : <input type="text" name="studentNumber"/> <br/>
		리포트파일 : <input type="file" name="report"/><br/>
	<input type="submit"/>
	</form>
	
	<h3>MultiartHttpServletRequest 사용</h3>
	<form action="submitReport2.do" method="post" enctype="multipart/form-data">
		학번 : <input type="text" name="studentNumber"/> <br/>
		리포트파일 : <input type="file" name="report"/><br/>
	<input type="submit"/>
	</form>
	
	<h3>커맨드 객체 사용</h3>
	<form action="submitReport3.do" method="post" enctype="multipart/form-data">
		학번 : <input type="text" name="studentNumber"/> <br/>
		리포트파일 : <input type="file" name="report"/><br/>
	<input type="submit"/>
	</form>
</body>
</html>