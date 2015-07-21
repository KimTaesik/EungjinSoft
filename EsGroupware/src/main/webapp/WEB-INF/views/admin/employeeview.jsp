<%@page import="com.groupware.dto.Employee"%>
<%@page import="com.groupware.dto.Position"%>
<%@page import="com.groupware.dto.Dept"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>

<html>
<head>
	<meta charset='utf-8' />
	<title>사용자등록</title>
	<link rel='Stylesheet' href='/groupware/resources/styles/input.css' />
	<link rel="Stylesheet" href="/groupware/resources/styles/admin.css" />
	<script type="text/javascript">
	var idchck = false;
	function idcheck() {
		var id = document.getElementById("id");
		window.open("idcheck.action?id=" + id.value, "_blank", "width=600,height=330,titlebar=no");
		idchck = true;
	}
	
	function doSubmit() {
			document.getElementById("form").submit();//document.forms[0].submit();과같다
	}
	function deleteEmployee(id) {
		//1. 삭제 확인 (사용자 선택)
		var yes = confirm("삭제할까요");
		//2. 1의 결과에 따라 삭제하거나 또는 취소
		if (yes) {
			location.href = 'employeedelete.action?id=' + id;
		}
	}
	
	
	function pass(){ 

		     // 비밀번호(패스워드) 유효성 체크 (문자, 숫자, 특수문자의 조합으로 8~16자리) 
		      var pwd = document.getElementById("password").value; 
		      //var pwdChk = document.getElementById("passwordconf").value; 
		      var text_box = document.querySelector("#sPwdTxt");
		      //var text_box2 = document.querySelector("#sPwdTxt2");
		      var bStatus = false; 
		       
		      if(pwd.length<8 || pwd.length >16){ 
		         	text_box.innerHTML = '비밀번호는 최소 8자 이상, 16자 이하로 구성해야 합니다.';    	  	
		      }else if(/^\d/.test(pwd.substr(1).match)){ 
		             text_box.innerHTML = '비밀번호는 숫자로 시작할 수 없습니다.'; 
		      }else if(/(\w)\1/.test(pwd)){ 
		             text_box.innerHTML = '비밀번호는 반복된 숫자또는 문자를 입력할 수 없습니다.'; 
		      }else{ 
		             text_box.innerHTML = '사용가능한 비밀번호 입니다.'; 
		             bStatus = true;
		      }
	}
	
	function pass2(){ 
	     // 비밀번호(패스워드) 유효성 체크 (문자, 숫자, 특수문자의 조합으로 8~16자리) 
	      var pwd = document.getElementById("password").value; 
	      var pwdChk = document.getElementById("passwordconf").value; 
	      var text_box2 = document.querySelector("#sPwdTxt2");

	      if(pwd.length == pwdChk.length) {
		      if(pwdChk != pwd){
		    	  text_box2.innerHTML = '비밀번호가 일치하지않습니다.';
		      } else if(pwdChk == pwd){
		    	  text_box2.innerHTML = '비밀번호 일치.';
		      }
	      }
}


	</script>
</head>
<body>
	<section >
	<div id='pageContainer'>		
			
		<div id='inputcontent'>
			<br /><br />
		    <div id='inputmain'>
		        <div class='inputsubtitle'>회원기본정보</div>
		        <form id='form' action='employeeupdate.action' method='post'><!-- 상대경로표시 -->
		         <% Employee employee = (Employee)request.getAttribute("employee"); %>  
		        <table>
		        	<tr>
		            	<th style='background-color: #fffffc;text-align: left;'>
		            		▶개인정보
		            	</th>	            	
		            </tr>
		            <tr>
		                <th>아이디(ID)</th>
		                <td>
		                    <input type='text' id="id" name='id' 
		                    	<%-- style='width:200px' value=<%= employee.getId() %> readonly="readonly"/> --%>
		                    	style='width:200px' value=${ employee.id } readonly="readonly"/>
		                </td>
		            </tr>
<!-- 		            <tr>
		                <th id="essential">* 비밀번호</th>
		                <td>
		                	<input id='password' type='password' name='password' style='width:280px' onkeyup="pass();" />
		                	<br />
		                	<span id="sPwdTxt"></span>
		                </td>
		            </tr>
		            <tr>
		                <th id="essential">* 비밀번호 확인</th>
		                <td>
		                    <input id='passwordconf' type='password' name='passwordconf' style='width:280px' onkeyup ="pass2();" />
		                    <br />
		                	<span id="sPwdTxt2"></span>
		                </td>
		            </tr> -->
		            <tr>
		                <th>이름</th>
		                <td>
		                	<%-- <input id='name' type='text' name='name' style='width:280px' value=<%= employee.getName() %> readonly="readonly" /> --%>
		                	<input id='name' type='text' name='name' style='width:280px' value=${ employee.name } readonly="readonly" />
		                </td>
		            </tr>	       
		            <%-- <tr>
		                <th>자택 전화번호</th>
		                <td>
		                <% String[] home = employee.getHomeNumber().split("-"); %>
		                	<input type='text' name='homePhone1' style='width:60px' value='<%= (home.length ==0) ? "" : home[0]%>' />&nbsp;-&nbsp; 
		                	<input type='text' name='homePhone2' style='width:60px' value='<%= (home.length ==0) ? "" : home[1]%>' />&nbsp;-&nbsp;
		                	<input type='text' name='homePhone3' style='width:60px' value='<%= (home.length ==0) ? "" : home[2]%>' />
		                </td>
		            </tr>
		            <tr>
		                <th>핸드폰</th>
		                <td>
		                <% String[] phone = employee.getPhoneNumber().split("-"); %>
		                	<input type='text' name='cellPhone1' style='width:60px' value='<%= (phone.length ==0) ? "" : phone[0]%>' />&nbsp;-&nbsp; 
		                	<input type='text' name='cellPhone2' style='width:60px' value='<%= (phone.length ==0) ? "" : phone[1]%>' />&nbsp;-&nbsp;
		                	<input type='text' name='cellPhone3' style='width:60px' value='<%= (phone.length ==0) ? "" : phone[2]%>' />
		                </td>
		            </tr>
		            <tr>
		                <th>이메일</th>
		                <td>
		                	<input type='text' name='email' style='width:280px' />
		                </td>
		            </tr> --%>
		            	<th style='background-color: #fffffc;text-align: left;'>
		            		▶회사정보
		            	</th>
		            	<td id="essential">
		            		*사원 부서 및 직급 관리
		            	</td>
		            </tr>
		            <!-- <tr>
		                <th>직통 전화번호</th>
		                <td>
		                	<input type='text' name='directLine1' style='width:60px' />&nbsp;-&nbsp; 
		                	<input type='text' name='directLine2' style='width:60px' />&nbsp;-&nbsp;
		                	<input type='text' name='directLine2' style='width:60px' />&nbsp;&nbsp;
		                	내선
		                	<input type='text' name='extension' style='width:60px' />
		                	※ 내선은 선택 입력사항입니다.
		                </td>
		            </tr> -->
		            <% List<Dept> depts = (List<Dept>)request.getAttribute("depts"); %>            
		            <tr>
		                <th id="essential">* 부서</th>
		                <td>
		                	<select id='dept' type='text' name='deptNo' style='width:80px'>
<%-- 		                	<% for (Dept dept : depts) { %>
								<% if(employee.getDeptNo().equals(dept.getDeptNo())) {%>
		                		<option value= '<%= employee.getDeptNo() %>'><%= dept.getPartName() %></option>
		                		<% } %>    
		                	<%} %> --%>
		                	
		                	<c:forEach var="dept" items="${ depts }">
		                		<option value='${ dept.deptNo }' 
		                			<c:if test="${ employee.deptNo.equals(dept.deptNo) }"> selected = "selected" </c:if>
								>
			                	${ dept.partName }
			                	</option>
		                	</c:forEach>
		                	            	
<%-- 		                	<% for (Dept dept : depts) { %>
			                	<option value='<%= dept.getDeptNo() %>' <% if(employee.getDeptNo().equals(dept.getDeptNo())){%> selected = "selected" <%}%> >
			                	<%= dept.getPartName() %></option>
		                	<% } %> --%>
		                	</select>
		                </td>
		            </tr>
		            <% List<Position> positions = (List<Position>)request.getAttribute("positions"); %> 
		            <tr>
		                <th id="essential">* 직급</th>
		                <td>
		                	<select id='position' type='text' name='positionNo' style='width:80px'>
<%-- 		                	<% for (Position position : positions) { %>
			                	<% if(employee.getPositionNo().equals(position.getPositionNo())) {%>
			                	<option value= '<%= employee.getPositionNo() %>'><%= position.getPositionName() %></option>
			                	<% } %>
			                <%} %> --%>
			                
			                
			                
		                	<% for (Position position : positions) { %>
		                	<option value='<%= position.getPositionNo() %>' <% if(employee.getPositionNo().equals(position.getPositionNo())) {%> selected = "selected" <%}%> >
		                	<%= position.getPositionName()%></option>
		                	<% } %>
		                	</select>
		                </td>
		            </tr>
		            <!-- <tr>
		                <th>IP 주소</th>
		                <td>
		                	<input type='text' name='ipaddress' style='width:180px' />
		                </td>
		            </tr> -->
		        </table>
		        
		        <div class='buttons'>
		        	<input type='button' value='수정' style='height:25px' onclick="javascript:doSubmit();"; />
		        	<input type='button' value='삭제' style='height:25px' onclick="javascript:deleteEmployee('<%=employee.getId()%>');"; />
		        	<input type='button' value='취소' style='height:25px'
		        		onclick="location.href='employeelist.action';" />
		        </div>
		        </form>
		        
		    </div>
		</div>
		
	</div>
</section>
</body>
</html>