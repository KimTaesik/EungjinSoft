<%@page import="java.util.logging.SimpleFormatter"%>
<%@page import="java.util.Date"%>
<%@page import="com.groupware.dto.Position"%>
<%@page import="com.groupware.dto.Dept"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		//1. 필요하다면 유효성 검사 수행
		if(document.getElementById("id").value.length == 0)
		{
			alert("아이디를 입력해주세요.");
		}
		else if (document.getElementById("password").value.length == 0) {
			alert("비밀번호를을 입력해주세요.");
		}
		else if  (document.getElementById("password").value != document.getElementById("passwordconf").value) {
			alert("비밀번호가 같지 않습니다.");
		}
		else if(document.getElementById("name").value.length == 0)
		{
			alert("이름를 입력해주세요.");
		}
		else if(document.getElementById("dept").value.length == 0)
		{
			alert("부서를 입력해주세요.");
		}
		else if(document.getElementById("position").value.length == 0)
		{
			alert("직급를 입력해주세요.");
		}
		else if(document.getElementById("joindate").value.length == 0)
		{
			alert("입사일을 입력해주세요.");
		}
		else if(idchck==false)
		{
			alert("중복확인을 해주세요.");
		}
		else {
			//2. 서버로 전송
			//document.forms[0].submit();//이 문서 내부에 포함된 <form 요소 중 첫 번째 항목을 submit
			//-> <input type='submit'을 클릭하는 것과 같은 의미
			document.getElementById("registerform").submit();//document.forms[0].submit();과같다
			alert("등록이 되었습니다.");
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
		      }
		      else if(/^\d/.test(pwd.substr(1).match)){ 
		             text_box.innerHTML = '비밀번호는 숫자로 시작할 수 없습니다.'; 
		      }
		      else if(/(\w)\1/.test(pwd)){ 
		             text_box.innerHTML = '비밀번호는 반복된 숫자또는 문자를 입력할 수 없습니다.'; 
		      }
		      else{ 
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
		        
		        <table>
		        	<tr>
		            	<th style='background-color: #fffffc;text-align: left;'>
		            		▶개인정보
		            	</th>
		            	<td id="essential">
		            		*는 필수 입력 사항입니다.
		            	</td>
		            </tr>
		            <tr>
		                <th id="essential" >* 아이디(ID)</th>
		                <td>
		                    <input type='text' id="id" name='id' 
		                    	style='width:280px' readonly="readonly" value="${ employee.id }"/>
		                    
		                </td>
		            </tr>
		            <tr>
		                <th id="essential">* 비밀번호</th>
		                <td>
		                	<input id='password' type='password' name='password' style='width:280px' onkeyup="pass();" value="${ employee.password }" />
		                	<br />
		                	<span id="sPwdTxt"></span>
		                </td>
		            </tr>
		            <tr>
		                <th id="essential">* 비밀번호 확인</th>
		                <td>
		                    <input id='passwordconf' type='password' name='passwordconf' style='width:280px' onkeyup ="pass2();" value="${ employee.password }" />
		                    <br />
		                	<span id="sPwdTxt2"></span>
		                </td>
		            </tr>
		            <tr>
		                <th id="essential">* 이름</th>
		                <td>
		                	<input id='name' type='text' name='name' style='width:280px' value="${ employee.name }"/>
		                </td>
		            </tr>	       
		            <tr>
		                <th>성별</th>
		                <td>
		                	<input type='radio' name='sex' value='male' ${ employee.sex == '남' ? 'checked' : '' }>남성
		                	<input type='radio' name='sex' value='female' ${ employee.sex == '여' ? 'checked' : '' }>여성
		                </td>
		            </tr>
		            <tr>
		                <th>생년월일</th>
		                <td>
		                	<fmt:formatDate var="bdate" pattern="yyyy-MM-dd" value="${ employee.birthDatetype }"/>
		                	<input type="date" name='birthDate' style='width:280px' value="${ bdate }"/>
		                </td>
		            </tr>                 
		                      
		             <tr>
		                <th id="essential">* 부서</th>
		                <td>
		                	<select id='dept' type='text' name='deptNo' style='width:80px'>
		                	<c:forEach var="dept" items="${ depts }">
		                		<c:if test="${ employee.deptNo.equals(dept.deptNo) }">
		                			<option value= '${ employee.deptNo }'>${ dept.partName }</option>  
		                		</c:if>
		                	</c:forEach>  	
		                	<c:forEach var="dept" items="${ depts }">
		                		<option value='${ dept.deptNo }' 
		                			<c:if test="${ employee.deptNo.equals(dept.deptNo) }"> selected = "selected" </c:if>
								>
			                	${ dept.partName }
			                	</option>
		                	</c:forEach>
		                	</select>
		                </td>
		            </tr>
		            <tr>
		                <th id="essential">* 직급</th>
		                <td>
		                	<select id='position' type='text' name='positionNo' style='width:80px'>
		                
			                <c:forEach var="position" items="${ positions }">
			                	<c:if test="${ employee.positionNo.equals(position.positionNo) }">
			                		<option value= '${ employee.positionNo }'>${ position.positionName }</option>
			                	</c:if>
			                </c:forEach>
			                <c:forEach var="position" items="${ positions }">
			                	<option value="${ position.positionNo }"
			                	<c:if test="${ employee.positionNo.equals(position.positionNo) }">
			                		selected = "selected"
			                	</c:if>
			                	>
		                		${ position.positionName }</option>
			                </c:forEach>
		                	</select>
		                </td>
		            </tr>
		        </table>
		        
		        <div class='buttons'>
		        	<input type='button' value='수정' style='height:25px' onclick="javascript:doSubmit();"; />
		        	<%-- <input type='button' value='삭제' style='height:25px' onclick="javascript:deleteEmployee('<%=employee.getId()%>');"; /> --%>
		        	<input type='button' value='삭제' style='height:25px' onclick="javascript:deleteEmployee('${ employee.id }');"; />
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