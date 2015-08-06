<%@page import="com.groupware.dto.BoardComment"%>
<%@page import="com.groupware.dto.Employee"%>
<%@page import="com.groupware.dto.Board"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

<html>
<head>

	<meta charset="utf-8" />
	<title>글쓰기</title>
	<!--  <link rel="Stylesheet" href="/groupware/styles/default2.css" /> -->
	<link rel="Stylesheet" href="/groupware/resources/styles/input3.css" />
	<script type="text/javascript">
	function deleteBoard(boardNo, pageNo,classify) {
	
		//1. 삭제 확인 (사용자 선택)
		var yes = confirm("삭제할까요?");
		//2. 1의 결과에 따라 삭제하거나 또는 취소
		if (yes) {
			location.href = 'delete.action?boardNo=' + boardNo + "&pageno=" + pageNo+"&classify=" + classify;
		}
	}
	
	function toggleCommentStatus(commentNo, editable) {
		document.getElementById('commentview' + commentNo).style.display 
		= editable ? "none" : "block";
		document.getElementById('commentedit' + commentNo).style.display 
		= editable ? "block" : "none";
	}
	function deleteComment(commentNo,boardNo,board_No,pageNo,classify){
		var yes =confirm(commentNo + "번 댓글을 삭제할까요?");
	
		if(yes){
			location.href='deletecomment.action?'+
					'commentNo='+commentNo+'&board_No='+board_No+'&pageno='+pageNo+'&classify='+classify+"&boardNo="+boardNo;
			
		}
	
	}
	function updateComment(commentNo){
		var yes =confirm(commentNo + "번 댓글을 수정할까요?");
	
		if(yes){
		
			document.getElementById('editcommentform'+commentNo).submit();
		}
	
	}
	function resetComment(commentNo){
		
		
			document.getElementById('editcommentform'+commentNo).reset();
	
	
	}
	function editBoard(boardNo, pageNo, classify) {
		location.href = 'edit.action?boardNo=' + boardNo + "&pageno=" + pageNo + "&classify=" + classify;
}
	</script>
</head>
<body>

	<div id="pageContainer">
	
		
		<div style="padding-top:25px;text-align:center">
		<div id="inputcontent">
		    <div id="inputmain">
		        <div class="inputsubtitle">게시판 글 내용</div>
		 			
		      <%--  <% Board board = (Board)request.getAttribute("board"); %> --%>
		        <table>
		            <tr>
		                <th>제목</th>
		                <td>${ board.title }</td>
		            </tr>
		            <tr>
		                <th>작성자</th>
		                <td>${ board.id }</td>
		            </tr>
		            <tr>
		                <th>작성일</th>
		                <td>${ board.regDate }</td>
		            </tr>
					<tr>
		                <th>조회수</th>
		                <td>${ board.readCount }</td>
		            </tr>
		            <tr>
		                <th>내용</th>
		                <td style="height:200px;vertical-align:top">		                    
		                  ${board.content}
		                </td>
		            </tr>
		        </table>
		        <div class="buttons">		        
		      
		        
		      
		       <c:set var="pageNo" value="1" />
		       <c:if test="${ pageno != null }" >
		       		<c:set var="pageNo" value="${ pageno }" />
		       </c:if>
		  
		        	
		   <%--   	<% Employee member = (Employee)session.getAttribute("loginuser"); %> --%>
		        	
		        	<c:if test="${ board.id.equals(loginuser.id) }" >
		        	[&nbsp;<a href="javascript:editBoard(${ board.boardNo }, ${ pageNo }, ${ board.classify })">편집</a>&nbsp;]
		        	[&nbsp;<a href="javascript:deleteBoard(${ board.boardNo }, ${ pageNo }, ${ board.classify})">삭제</a>&nbsp;]
		        	</c:if>
		   
		        	[&nbsp;<a href='list.action?pageno=${pageno}&classify=${classify}'>목록보기</a>&nbsp;]
		        </div>
		    </div>
		</div>
		
		<!------------------ comment 쓰기 영역 시작 -------------------->
		
		<br /><br />
		
		
		<form id="commentform" 
			action="writecomment.action" method="post" >
			<input type="hidden" name="pageno" value="${pageNo}" />
			<input type="hidden" name="boardNo" value="${board.boardNo}" />
			<input type="hidden" name="board_No" value="${board.board_No}" />
			<input type="hidden" name="id" value="${loginuser.id}" />
			<input type="hidden" name="classify" value="${classify}" />
			<table style="width:600px;border:solid 1px;margin:0 auto">
	            <tr>
	                <td style="width:550px">	                	
	                    <textarea name="content" 
	                    	style="width:550px" rows="3"></textarea>
	                </td>
	                <td style="width:50px;vertical-align:middle">
	                	<a href="javascript:document.getElementById('commentform').submit();" style="text-decoration:none">
	                		댓글<br />등록
	                	</a>
	                </td>
	            </tr>                    
	        </table>
        </form>
        
        
        <hr align="center" style="width:600px;" />
        
        <!-------------------------------------------------------->
       <%--  <% List<BoardComment> comments = board.getComments(); %> --%>
       <c:set var="comments" value="${board.comments }" />
        <c:choose>
        <c:when test="${ comments == null || comments.size() == 0 }" >
        <h4 id="nodata" style="text-align:center">
            작성된 댓글이 없습니다.
        </h4>
        </c:when>
        <c:otherwise>
		
		<!-- comment 표시 영역 -->
		<table style="width:600px;border:solid 1px;margin:0 auto">
			<c:forEach var="comment" items="${comments }">
        	<tr>
        		<td style="text-align:left;margin:5px;border-bottom: solid 1px">
        		
        		<div id='commentview${comment.commentNo}'>
                    ${comment.id}&nbsp;&nbsp;
                    [${comment.regDate}]
                    <br /><br />
                    ${ fn:replace(comment.content, rn, br) }
                    <br /><br />
                   
           <%--          <div style='display:<%= member.getId().equals(comment.getWriter()) ? "block" : "none" %>'>
                    	<a href="javascript:toggleCommentStatus(<%= comment.getCommentNo() %>, true);">편집</a>
                    	&nbsp;
                    	<a href="javascript:deleteComment(<%=comment.getCommentNo()%>,<%=board.getBoardNo() %>,<%=board.getBoard_No()%>,<%=pageNo%>,<%=board.getClassify() %>)">삭제</a>
                    </div> --%>
                   
                   
                    <div style="display:${loginuser.id.equals(comment.id) ? 'block' : 'none' }">
                    	<a href="javascript:toggleCommentStatus(${comment.commentNo}, true);">편집</a>
                    	&nbsp;
                    	<a href="javascript:deleteComment(${comment.commentNo},${board.boardNo},${board.board_No},${pageNo},${board.classify});">삭제</a>
                    </div>
                    
                    
                </div>                
                <div id='commentedit${comment.commentNo}' style='display:none'>					
					${comment.id}&nbsp;&nbsp;
                    [${comment.regDate}]
					<br /><br />
					<form id="editcommentform${comment.commentNo}"
						action="updatecomment.action" method="post">
					
					<input type='hidden' name=commentNo value="${comment.commentNo}">
					<input type='hidden' name=pageno value="${pageno}">
					<input type="hidden" name="board_No" value="${board.board_No}" />
					<input type="hidden" name="boardNo" value="${board.boardNo}" />
					<input type="hidden" name="classify" value="${board.classify}" />
					<textarea name="content" style='width:99%' rows="3">${comment.content}</textarea>					
					</form>
					<br />
					<div>
						<a href="javascript:updateComment(${comment.commentNo});">수정</a> 
						&nbsp; 
						<a href="javascript:resetComment(${comment.commentNo});toggleCommentStatus(${comment.commentNo}, false);">취소</a>
					</div>
				</div>
	
				</td>
        	</tr>
			</c:forEach>
        </table>
        
		</c:otherwise>
		</c:choose>
		
		<br /><br /><br /><br /><br /><br /><br />
		
		
		
		<%-- 
		
			        <table>
		            <tr>
		                <th>제목</th>
		                <td>${ board.title }</td>
		            </tr>
		            <tr>
		                <th>작성자</th>
		                <td>${ board.writer }</td>
		            </tr>
		            <tr>
		                <th>작성일</th>
		                <td>${ board.regDate }</td>
		            </tr>
					<tr>
		                <th>조회수</th>
		                <td>${ board.readCount }</td>
		            </tr>
		            <tr>
		                <th>내용</th>
		                <td style="height:200px;vertical-align:top">		                    
		                  ${board.content}
		                </td>
		            </tr>
		        </table>
		        <div class="buttons">		        
		      
		        
		        
		       
		         <%
		        String pageNo = "1";
		        if (request.getParameter("pageno") != null) {
		        	pageNo = request.getParameter("pageno");
		        }
		        %>
		      
		        	
		        	<% Employee member = (Employee)session.getAttribute("loginuser"); %>
		        	
		        	<% if (board.getWriter().equals(member.getId())) { //글의 작성자만 삭제 또는 편집 가능 %>
		        	[&nbsp;<a href="javascript:editBoard(<%= board.getBoardNo()%>, <%= pageNo %>, <%= board.getClassify() %>);">편집</a>&nbsp;]
		        	[&nbsp;<a href="javascript:deleteBoard(<%= board.getBoardNo() %>, <%= pageNo %>,<%=board.getClassify()%>);">삭제</a>&nbsp;]
		        	<% } %>
		   
		        	[&nbsp;<a href='list.action?pageno=${pageno}&classify=${classify}'>목록보기</a>&nbsp;]
		        </div>
		    </div>
		</div>
		
		<!------------------ comment 쓰기 영역 시작 -------------------->
		
		<br /><br />
		
		
		<form id="commentform" 
			action="writecomment.action" method="post" >
			<input type="hidden" name="pageno" value="${pageno}" />
			<input type="hidden" name="boardno" value="${board.boardNo}" />
			<input type="hidden" name="board_no" value="${board.board_No}" />
			<input type="hidden" name="writer" value="<%=member.getId() %>" />
			<input type="hidden" name="classify" value="${classify}" />
			<table style="width:600px;border:solid 1px;margin:0 auto">
	            <tr>
	                <td style="width:550px">	                	
	                    <textarea name="content" 
	                    	style="width:550px" rows="3"></textarea>
	                </td>
	                <td style="width:50px;vertical-align:middle">
	                	<a href="javascript:document.getElementById('commentform').submit();" style="text-decoration:none">
	                		댓글<br />등록
	                	</a>
	                </td>
	            </tr>                    
	        </table>
        </form>
        
        
        <hr align="center" style="width:600px;" />
        
        <!-------------------------------------------------------->
        <% List<BoardComment> comments = board.getComments(); %>
        <% if (comments == null || comments.size() == 0) { %>
        <h4 id="nodata" style="text-align:center">
            작성된 댓글이 없습니다.
        </h4>
        <% } else { %>
		
		<!-- comment 표시 영역 -->
		<table style="width:600px;border:solid 1px;margin:0 auto">
			<% for (BoardComment comment : comments) { %>
        	<tr>
        		<td style="text-align:left;margin:5px;border-bottom: solid 1px">
        		
        		<div id='commentview<%= comment.getCommentNo() %>'>
                    <%= comment.getWriter() %>&nbsp;&nbsp;
                    [<%= comment.getRegDate() %>]
                    <br /><br />
                    <%= comment.getContent().replace("\r\n", "<br />") %>
                    <br /><br />
                    <div style='display:<%= member.getId().equals(comment.getWriter()) ? "block" : "none" %>'>
                    	<a href="javascript:toggleCommentStatus(<%= comment.getCommentNo() %>, true);">편집</a>
                    	&nbsp;
                    	<a href="javascript:deleteComment(<%=comment.getCommentNo()%>,<%=board.getBoardNo() %>,<%=board.getBoard_No()%>,<%=pageNo%>,<%=board.getClassify() %>)">삭제</a>
                    </div>
                </div>                
                <div id='commentedit<%= comment.getCommentNo() %>' style='display:none'>					
					<%= comment.getWriter() %>&nbsp;&nbsp;
                    [<%= comment.getRegDate() %>]
					<br /><br />
					<form id="editcommentform<%= comment.getCommentNo() %>"
						action="updatecomment.action" method="post">
					
					<input type='hidden' name=commentNo value="<%=comment.getCommentNo() %>">
					<input type='hidden' name=pageno value="<%=pageNo %>">
					<input type="hidden" name="board_No" value="<%= board.getBoard_No() %>" />
					<input type="hidden" name="boardno" value="<%= board.getBoardNo() %>" />
					<input type="hidden" name="classify" value="<%= board.getClassify() %>" />
					<textarea name="content" style='width:99%' rows="3"><%=comment.getContent() %></textarea>					
					</form>
					<br />
					<div>
						<a href="javascript:updateComment(<%=comment.getCommentNo()%>);">수정</a> 
						&nbsp; 
						<a href="javascript:resetComment(<%=comment.getCommentNo()%>);toggleCommentStatus(<%= comment.getCommentNo() %>, false);">취소</a>
					</div>
				</div>
	
				</td>
        	</tr>
			<% } %>
        </table>
        
		<% } %> --%>
		</div>
	</div>

</body>
</html>