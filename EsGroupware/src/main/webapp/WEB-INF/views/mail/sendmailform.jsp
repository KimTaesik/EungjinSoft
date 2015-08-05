<%@page import="com.groupware.dto.AddressBook"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>메일보내기</title>
	
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
 	<link rel="Stylesheet" href="/groupware/resources/styles/default4.css" />
	<link rel="Stylesheet" href="/groupware/resources/styles/input3.css" />	
	
	<script type="text/javascript">
	$(function() {	
		if($('#email').val()== null) {
			alert("이메일을 입력해주세요");
		}
	})

	</script>
</head>
<body>

	<div id="pageContainer">
	
		<%-- <% pageContext.include("/WEB-INF/views/include/header.jsp"); %> --%>
		
		<div style="padding-top:25px;text-align:center">
		<div id="inputcontent">
		    <div id="inputmain">
		        <div class="inputsubtitle">메일보내기</div>
		        <form action="sendmail.action" method="post">
		        <table>
		        <% AddressBook addressbook5 = (AddressBook)request.getAttribute("emailadd"); %>
		            <tr>
		                <th>받는이</th>
		                <td>
		                	<%-- <%= addressbook5.getEmail()%> --%>
		                    <input type="text" name="to" style="width:550px" /> 
		                </td>
		            </tr>
		            <tr>
		                <th>보내는이</th>
		                <td>
		                ${ email }
		                <input id="email" type="text" style="width:550px" value="이메일을 입력해주세요." />
		                </td>
		            </tr>		            
		            <tr>
		                <th>제목</th>
		                <td>
		                    <input type="text" name="subject" style="width:550px" />
		                </td>
		            </tr>
		            <tr>
		                <th>내용</th>
		                <td>
		                    <textarea name="content" rows="20" cols="76"></textarea>
		                </td>
		            </tr>
		        </table>
		        <div class="buttons">		        	
		        	<a href="javascript:document.forms[0].submit();">>보내기</a>
		        	&nbsp;&nbsp;
		        	<a href="#">취소</a>
		        </div>
		        </form>
		    </div>
		</div>   	
	
	</div>
	</div>

</body>
</html>