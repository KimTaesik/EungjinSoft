<%@page import="com.groupware.dto.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   
<!DOCTYPE html>

<html>
<head>

	<meta charset="utf-8" />
	<title>게시물 목록</title>
    <link rel="Stylesheet" href="/groupware/resources/styles/boardframe2.css" /> 
	<script type="text/javascript">
	function search() {
		 var type = document.getElementById("type");
		 var search = document.getElementById("search");
		 var classify = document.getElementById("classify");
		 //alert(type.value+search.value);
		 location.href="/groupware/board/list.action?type="+type.value+"&search="+search.value+'&classify='+classify.value; //get방식으로 보내기(주소로) !
	}
	
	function init() {
		var type = <%=request.getParameter("type")%>;
		if (type) {
			var type2 = document.getElementById("type");
			type2.selectedIndex=type-1;
			
		}
	}	
	</script>
</head>
<body onload="init()">


	<% pageContext.include("/WEB-INF/views/include/boardheader.jsp"); %>

	
	<div id="pageContainer" style="padding-top: 50px">
	

		<div style="padding-top:25px;text-align:center">
		
		
				<table style="width:600px;">
				<tr>
				<td align="left" width="370px">
				<%if(request.getAttribute("classify").equals("1")){ %>
					<img src="/groupware/resources/image/공지사항.png" height="25px" >
				<%} %>
				<%if(request.getAttribute("classify").equals("2")){ %>
					<img src="/groupware/resources/image/시스템공지사항.png" height="25px" >
				<%} %>
				<%if(request.getAttribute("classify").equals("3")){ %>
					<img src="/groupware/resources/image/게시판.png" height="25px" >
				<%} %>
				<%if(request.getAttribute("classify").equals("4")){ %>
					<img src="/groupware/image/자료실.png" height="25px" >
				<%} %>
				</td>
				<td>
				
				<select id="type" name="sel" style='width=20px'>
					<option value="1">전체보기</option>
					<option value="2">제목</option>
					<option value="3">작성자</option>
				</select>
				</td>
				<td>
				<input id="search" type="text" width="10px" value='<%=request.getParameter("search")==null? "" : request.getParameter("search")%>'>
				<input id="classify" type="hidden" width="10px" value='<%=request.getParameter("classify")%>'/>
				</td>
				<td>
				<input type="button" value="검색" onclick="search()">
				</td>
				</tr>
				</table>
				<br />
				

				<table border="2" bordercolor="#90D9FF" style="width:600px; border-spacing: 0px;" align="right">
					<tr style="background-color:#90D9FF;">
						<th style="width:50px">번호</th>
						<th style="width:400px">제목</th>
						<th style="width:150px;text-align:center">작성자</th>
						<th style="width:150px;text-align:center">등록일</th>
						<th style="width:50px">조회</th>
					</tr>
			
				<% List<Board> boards = (List<Board>)request.getAttribute("boards");%>
				<% for (Board board : boards) { %>

				<tr style="height:25px;text-align:center;">

					<td><%= board.getBoardNo() %>
					<td style="text-align:left;padding-left:10px;color: black;">
					
					<!--  댓글 쓰는거 들여쓰기? 효과 -->
					<% for (int i=0; i < board.getDepth(); i++) { %>
					&nbsp;&nbsp;
					<% } %>
					<% if (board.getDepth() > 0) { %>
					<img src='/groupware/image/re.gif' />
					<% } %>
					
					<% if (board.isDeleted()) { %>
					<span style='color:gray' onclick="alert('삭제된 글입니다.')">
					<%=board.getTitle() %>
					</span>
					&nbsp;[삭제된 글]
					<% } else {%>
					<a href='view.action?boardno=<%= board.getBoardNo() %>&pageno=<%= request.getAttribute("pageno") %>&classify=<%= request.getAttribute("classify")%>&board_no=<%= board.getBoard_No() %> '>
					<%= board.getTitle() %></a>
						
						<% } %>
					</td>
					<td><%= board.getWriter() %></td>
					<td><%= board.getRegDate() %></td>
					<td><%= board.getReadCount() %></td>
				</tr>
				<% } %>
			</table>
			
			<br /><br />
			<div style="text-align:center">
			<%= request.getAttribute("pager").toString() %>
			<br/><br/>
			<a href='write.action?pageno=<%= request.getAttribute("pageno")%>&classify=<%= request.getAttribute("classify") %>'>글쓰기</a>
			</div>
		</div>
	
	</div>
			
	
</body>
</html>















