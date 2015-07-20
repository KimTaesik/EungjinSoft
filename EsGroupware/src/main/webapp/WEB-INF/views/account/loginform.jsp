<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
	<title>로그인</title>
	<link rel='Stylesheet' href='/groupware/resources/styles/default.css' />
	<link rel='Stylesheet' href='/groupware/resources/styles/input.css' />
	<script type='text/javascript'>
	function loadHandler() {
		<% String id = (String)request.getAttribute("failedid"); %>
		<% if (id != null) { %>
		alert('로그인 실패');
		document.getElementById("id").value = '<%= id %>';
		<% } %>
	}
	</script>	
</head>
<body  onload="loadHandler();">
	
	<div >
		
		<div id="inputcontent">
			<br /><br />
		    <div id="inputmain" style="margin-top: 20%;">
		        <div class="inputsubtitle">로그인정보</div>
		        
		        <!--  <form action="/demoweb/account/login.action" method="post"> -->
		        <form action="/groupware/login/login.action" method="post">
		       	        
		       	<% String returnUrl = request.getParameter("returnurl");
		       	if (returnUrl == null) returnUrl = "";
		       	%>
		       	<%-- <%= returnUrl %> --%>
		       	로그인이 필요한 페이지입니다. 로그인해주세요.
		       	<input type="hidden" name="returnurl" value="<%= returnUrl %>" />
		        <table>
		            <tr>
		                <th>아이디(ID)</th>
		                <td>
		                    <input type="text" id="id" name="memberId" style="width:280px" />
		                </td>
		            </tr>
		            <tr>
		                <th>비밀번호</th>
		                <td>
		                	<input type="password" name="passwd" style="width:280px" />
		                </td>
		            </tr>
		        </table>
		        <div class="buttons">
		        	<input type="submit" value="로그인" style="height:25px" />
		        	<input type="button" value="취소" style="height:25px"
		        		onclick="location.href='/groupware/';" />
		        </div>
		        </form>
		        
		    </div>
		</div>   	
	</div>
	<footer>
		<h4>copyright 응진Soft</h4>
	</footer>
</body>
</html>