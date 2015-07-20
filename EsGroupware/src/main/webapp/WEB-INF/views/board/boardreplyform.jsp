
<%@page import="com.groupware.dto.Employee"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
	<title>글쓰기</title>
	<link rel="Stylesheet" href="/groupware/resources/styles/default2.css" />
	<link rel="Stylesheet" href="/groupware/resources/styles/input3.css" />	
</head>
<body>

	<div id="pageContainer">
		
	
		
		
		<div style="padding-top:25px;text-align:center">
		<div id="inputcontent">
		    <div id="inputmain">
		        <div class="inputsubtitle">댓글 쓰기</div>
		        <form action="reply.action" method="post">
		        <!--  이 밑에는 서버에서 데이터를 받아오는 거고... -->
		        <%
		        String pageNo = (String)request.getAttribute("pageno");
		        String boardNo = (String)request.getAttribute("boardno");
		        String classify = (String)request.getAttribute("classify");
		        String board_no = (String)request.getAttribute("board_no");
		        %>
		        <!-- 이 밑에는 다시 이 데이터들을 서버로 넘겨주는 거... (form사용. doPost쪽으로..  -->
		        <input type="hidden" name="pageno" value="<%= pageNo %>" />
		        <input type="hidden" name="boardno" value="<%= boardNo %>" />
		        <input type="hidden" name="classify" value="<%= classify%>" />
		        <input type="hidden" name="board_no" value="<%= board_no%>" />
		        
		        <table>
		            <tr>
		                <th>제목</th>
		                <td>
		                    <input type="text" name="title" style="width:550px"
		                    	value="" />
		                </td>
		            </tr>
		            <tr>
		                <th>작성자</th>
		                <td>
					<% Employee member = (Employee) session.getAttribute("loginuser"); %>
		                	<input type="hidden" name="writer"
		                		value='<%= member.getId() %>' />
		                	<%= member.getId() %>
		                </td>
		            </tr>
		            <tr>
		                <th>내용</th>
		                <td>
							<textarea name="content" cols="76" rows="15"></textarea>
		                </td>
		            </tr>
		        </table>
		        <div class="buttons">		        	
		        	<a href="javascript:document.forms[0].submit();">저장</a>
		        	&nbsp;&nbsp;
		        	<a href="list.action?pageno=<%= pageNo %>">취소</a>
		        	&nbsp;&nbsp;
		        	<a href="list.action?pageno=<%= pageNo %>">목록보기</a>
		        </div>
		        </form>
		    </div>
		</div>   	
	
	</div>
	</div>

</body>
</html>