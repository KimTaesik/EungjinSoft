<%@page import="com.groupware.dto.AddressBook"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>주소록</title>
	<link rel="Stylesheet" href="/groupware/resources/styles/addressframe.css" />
	

	<script type="text/javascript">
	
/* 	function search() {
		 var type = document.getElementById("type");
		 var search = document.getElementById("search");
		 location.href="list.action?type="+type.value+"&search="+search.value;
	}
	
	function init() {
		var type = ${ type }
		if (type) {
			var type2 = document.getElementById("type");
			type2.selectedIndex=type-1;
			
		}
	}	 */
	
	function deleteAddress(addressNo, classify) {
		
		//1. 삭제 확인 (사용자 선택)
		var yes = confirm("삭제할까요?");
		//2. 1의 결과에 따라 삭제하거나 또는 취소
		if (yes) {
			location.href = 'addressdelete.action?addressNo=' + addressNo + "&classify=" + classify;
		}
	}
	
	function editAddress(addressNo, classify) {
		location.href = 'addressedit.action?addressNo=' + addressNo + "&classify=" + classify;
	}
	</script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
 
 
   	

</head>
<body>

<%-- 
<% pageContext.include("/WEB-INF/views/include/addressheader.jsp"); %> --%>

<div class="content" style="background-color: #ffffff">
	<div class="subject">
		
		<caption align="left"><font color="#000000" font size="3" ><b>
		<c:choose>
		<c:when test="${ classify.equals('1') }">
		개인 주소록
		</c:when>
		<c:otherwise>
		공용 주소록
		</c:otherwise>
		</c:choose>
		</b></font></caption>
		
			<br><br>
			<input type="button" value="전체">
			<input type="button" value="ㄱ">
			<input type="button" value="ㄴ">
			<input type="button" value="ㄷ">
			<input type="button" value="ㄹ">
			<input type="button" value="ㅁ">
			<input type="button" value="ㅂ">
			<input type="button" value="ㅅ">
			<input type="button" value="ㅇ">
			<input type="button" value="ㅈ">
			<input type="button" value="ㅊ">
			<input type="button" value="ㅌ">
			<input type="button" value="ㅍ">
			<input type="button" value="ㅎ">
			<input type="button" value="a~z">
			<br>
		
			
			<table style="width:850px;">
				<tr>
				
				<select id="type" name="sel" style='width=20px'>
					<option value="1">이름</option>
					<option value="2">휴대폰</option>
					<option value="3">이메일</option>
					<option value="4">전화번호</option>
				</select>
				
				
				<input id="search" type="text" width="10px" value="${ search == null ? '' : search}">
				
				
				<input type="button" value="검색" onclick="search()">
				
				</tr>
			</table>
						
			<table id="menubar">
				<tr>
					<th scope="col"><img src="/groupware/resources/image/add.png" /><a href='#' class="addform" id=${ classify }>주소추가</a></th>
			        <th scope="col"><img src="/groupware/resources/image/add.png" />그룹추가</th>
			     <!--    <th scope="col"><img src="/groupware/resources/image/minus.png" />삭제</th> -->
			        <th scope="col">
			        <select name="menu" style='width=30px'>
						<option selected>개인주소록/</option>
						<option value="">그룹1</option>
						<option value="">그룹2</option>
						<option value="">그룹3</option>
					</select>
					</th>
					<th scope="col">주소록 가져오기</th>
					<th scope="col">주소록 내보내기</th>
				</tr>
			</table>
			
			<table id="menubar" class="address">
				<tr>
					<th style="width:40px;text-align:center">이름</th>
					<th style="width:150px;text-align:center">이메일</th>
					<th style="width:130px;text-align:center">휴대폰</th>
					<th style="width:130px;text-align:center">전화</th>
					<th style="width:130px;text-align:center">팩스</th>
					<th style="width:40px;text-align:center">수정</th>
					<th style="width:40px;text-align:center">삭제</th>
				</tr>
			 	
			 	<% List<AddressBook> addressbook1 = (List<AddressBook>)request.getAttribute("addressbook1"); %> 
				<%-- <% String loginUser = (String)request.getAttribute("loginUser");%> --%>
				<% for (AddressBook addressbook2 : addressbook1) { %>
				  	<%-- <% if (addressbook2.getId().equals(loginUser)) { %>  --%>
				 	<%-- <%= loginUser.getId() %> --%>
				 <!-- <tbody> -->
				 	<tr>
			        	<td id="name" style="width:40px;text-align:center" ><%= addressbook2.getName() %></td>
			            <td id="email" style="width:150px;text-align:center" ><a href="" ><%= addressbook2.getEmail() %></a></td>
			            <td id="phonenumber" style="width:130px;text-align:center"><%= addressbook2.getPhoneNumber() %></td>
			            <td id="homenumber" style="width:130px;text-align:center"><%= addressbook2.getHomeNumber() %></td>
			            <td id="fax" style="width:130px;text-align:center"><%= addressbook2.getFax() %></td>
			            <td style="width:40px;text-align:center">
			            	<img class="editaddress" onchange="<%=addressbook2.getAddressNo() %>" src="/groupware/resources/image/edit.gif" />
			            </td>
			            <td style="width:40px;text-align:center"><img src="/groupware/resources/image/delete.gif" 
			            onclick="javascript:deleteAddress(<%= addressbook2.getAddressNo()%>,<%= addressbook2.getClassify() %>)" />
			            </td>
			        </tr>  
				<!-- </tbody> -->
				 	<% }  %> 
				
		 	<%-- 	<% } %>   --%>
				<%-- <c:forEach var="addressbook" items="${ addressbook }"> --%>
				
				<%-- </c:forEach> --%>
			</table>
			
			<div style="text-align:center">
			 ${ pager.toString() }
			 <br/>
			</div>
			<!-- 	<div style="width:910px; height:370px">
			
				</div> -->
		

		</div>
		

</div>
			

</body>
</html>