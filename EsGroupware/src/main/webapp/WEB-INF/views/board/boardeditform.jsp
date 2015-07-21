
<%@page import="com.groupware.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
<!DOCTYPE html>


<html>
<head>
	<meta charset="utf-8" />
	<title>글 수정</title>
	<link rel="Stylesheet" href="/groupware/resources/styles/default2.css" />
	<link rel="Stylesheet" href="/groupware/resources/styles/input3.css" />
	
	<script type="text/javascript">
	function doSubmit() {
		document.getElementById("updateform").submit();
	}
	
	</script>
</head>
<body>
	<div id="pageContainer">
	

		
		<div style="padding-top:25px;text-align:center">
		<div id="inputcontent">
		    <div id="inputmain">
		        <div class="inputsubtitle">게시판 글 쓰기</div>
		        <%Board board = (Board)request.getAttribute("board"); %>
		        <form id="updateform" action="edit.action" method="post">
		        <table>
		            <tr>
		                <th>제목</th>
		                <td>
		                <input type="text" name="title" value="<%= board.getTitle() %>" />
		                
		                <input type="hidden" name="boardno" value="<%=board.getBoardNo() %>" />
		                <input type="hidden" name="pageno" value="${pageno}"  />
		                <input type="hidden" name="board_no" value="<%=board.getBoard_No() %>" />
		                <input type="hidden" name="classify" value="<%=board.getClassify() %>"  />
		                
		                
		                </td>
		            </tr>
		            <tr>
		                <th>작성자</th>
		                <td><%= board.getWriter() %></td>
		            </tr>
		            <tr>
		                <th>작성일</th>
		                <td><%= board.getRegDate() %></td>
		            </tr>
					<tr>
		                <th>조회수</th>
		                <td><%= board.getReadCount() %></td>
		            </tr>
		            <tr>
		                <th>내용</th>
		                <td>
							<textarea 
		                    	name="content" style="width:580px" 
		                    	rows="15">
		                    	 ${fn:replace(board.content,cn,br)}</textarea>
		                </td>
		            </tr>
		        </table>
		        </form>
		        <%String pageno="1";
					if(request.getParameter("pageno")!=null){
						pageno=request.getParameter("pageno"); 
					}
					%>
					
		        <div class="buttons">
		        	<!--  <input type="submit" value="수정" /> -->
		        	<a href="javascript:doSubmit();">수정</a>
		        	&nbsp;
		        	<a href="list.action?classify=<%=board.getClassify()%>&pageno=<%=pageno%>">취소</a>
		        </div>
		    </div>
		</div>   	
	
	</div>
	</div>

</body>
</html>