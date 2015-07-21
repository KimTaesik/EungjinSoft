<%@page import="com.groupware.dto.Employee"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
	<title>글쓰기</title>
	<link rel="Stylesheet" href="/groupware/resources/styles/default2.css" />
	<link rel="Stylesheet" href="/groupware/resources/styles/input3.css" />
	
	<script type="text/javascript">
	function doSubmit() {
		//1. 필요하다면 유효성 검사 수행
		//2. 서버로 전송
		//이 문서 내부에 포함된 여러개의 <form> 요소 중에서 첫 번째 항목을 submit -> <input type = 'submit'을 누르는 것과 같은 의미  
		document.forms[0].submit();
		//document.getElementById("writeform").submit(); -> 이 방법으로 할 수 도 있다. 
	}
	</script>	
</head>
<body>

	<div id="pageContainer">

		<div id="inputcontent">
			<div id="inputmain">
				<div class="inputsubtitle">게시판 글 쓰기</div>
				<form action="write.action" method="post">
				<table>
					<tr>
					<th>분류</th>
					<td>
					<select name="classify" style="WIDTH: 200px" > 
							<option value='1' >공지사항</option>
							<option value='2' >시스템공지사항</option>
							<option value='3' >자유게시판</option>
							<option value='4' >자료실</option>
						
					</select>
					<td>
					</tr>
					<tr>
						<th>제목</th>
						<td>
							<input type="text" name="title" style="width:280px" />
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
						<%-- <% Employee member = (Employee)session.getAttribute("loginuser"); %> --%>
						${member.id}
						<!--  hidden : 눈에 보이진 않지만 , 서버로 전송되는 데이터  -->
						<input type="hidden" name="writer" value="${member.id}" />
 						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>		                    
							<textarea 
								name="content" cols="76" rows="15"></textarea>
						</td>
					</tr>
				</table>
				<div class="buttons">	        	
					<!--  <a href="#" onclick="">글쓰기</a> -->
					<a href="javascript:doSubmit();">글쓰기</a> <!--  javascript함수 호출을 통한 ... -->
					&nbsp;&nbsp;
					<%-- 
					<a href="javascript:history.back();">목록보기</a> <!-- history 라는 객체 : 현재 작업의 바로 전 단계로 되돌아가는 조작. -->
					--%>
					<c:set var="pageno" value="1" />
					<c:if test="${ pageno != null }" >
						<c:set var="pageno" value="${ pageno }" />
					</c:if>
				
					<c:set var="classify" value="1" />
					<c:if test="${ classify != null }" >
						<c:set var="classify" value="${ classify }" />
					</c:if>
					
					<a href="list.action?pageno=${pageno}&classify=${classify}">목록보기</a>
				</div>
				</form>
			</div>
		</div>   	
	
	</div>


</body>
</html>