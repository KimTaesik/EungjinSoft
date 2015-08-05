<%@page import="java.util.logging.SimpleFormatter"%>
<%@page import="java.util.Date"%>
<%@page import="com.groupware.dto.Position"%>
<%@page import="com.groupware.dto.Dept"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
			//document.getElementById("registerform").submit();//document.forms[0].submit();과같다
			document.forms[0].submit();
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


	</script>
</head>
<body>
	<section >
	<div id='pageContainer'>		
			
		<div id='inputcontent'>
			<br /><br />
		    <div id='inputmain'>
		        <div class='inputsubtitle'>회원기본정보</div>
		        <form id='registerform' action='registerform.action' method='post'><!-- 상대경로표시 -->
		        
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
		                    <input type='text' id="id" name='id' style='width:200px' />
		                    &nbsp;
		                    <input type="button" value="중복검사" style='height:25px' onclick="idcheck();" />
		                </td>
		            </tr>
		            <tr>
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
		                    <input id='passwordconf' type='password' style='width:280px' onkeyup ="pass2();" />
		                    <br />
		                	<span id="sPwdTxt2"></span>
		                </td>
		            </tr>
		            <tr>
		                <th id="essential">* 이름</th>
		                <td>
		                	<input id='name' type='text' name='name' style='width:280px' />
		                </td>
		            </tr>	       
		            <tr>
		                <th>성별</th>
		                <td>
		                	<input type='radio' name='sex' value='male' checked="checked">남성</input>
		                	<input type='radio' name='sex' value='female'>여성</input>
		                </td>
		            </tr>
		            <tr>
		                <th>생년월일</th>
		                <td>
		                	<input type="date" name='birthDate' style='width:280px' />
		                </td>
		            </tr>
		            <tr>
		                <th>자택 전화번호</th>
		                <td>
		                	<input type='text' name='homePhone1' style='width:60px' />&nbsp;-&nbsp; 
		                	<input type='text' name='homePhone2' style='width:60px' />&nbsp;-&nbsp;
		                	<input type='text' name='homePhone3' style='width:60px' />
		                </td>
		            </tr>
		            <tr>
		                <th>핸드폰</th>
		                <td>
		                	<input type='text' name='cellPhone1' style='width:60px' />&nbsp;-&nbsp; 
		                	<input type='text' name='cellPhone2' style='width:60px' />&nbsp;-&nbsp;
		                	<input type='text' name='cellPhone3' style='width:60px' />
		                </td>
		            </tr>
<!-- 		            <tr>
		                <th>자택주소</th>
		                <td>
		                	<input type='text' name='postcode' style='width:60px' />&nbsp;&nbsp;
		                	<input type="button" name=''style='height:25px' value="우편번호" /><br /><br />
		                	<input type='text' name='address1' style='width:260px' />&nbsp;&nbsp;<br /><br />
		                	<input type='text' name='address2' style='width:260px' />
		                </td>
		            </tr> -->
		            

		           <tr>
		           		<th>자택주소</th>
		           		<td>
		           			
			            <input style="width: 50px;" name="postcode1" type="text" id="sample4_postcode1"> -
						<input style="width: 50px;" name="postcode2" type="text" id="sample4_postcode2">
						<input style="height: 25px;" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<br />
						<input style="width: 300px;"  name="roadAddress" type="text" id="sample4_roadAddress" placeholder="도로명주소">
						<br /><br />
						<input style="width: 300px;"  name="address" type="text" id="sample4_jibunAddress" placeholder="지번주소">
						<span id="guide" style="color:#999"></span>
						
						<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
						<script>
						    function sample4_execDaumPostcode() {
						        new daum.Postcode({
						            oncomplete: function(data) {
						                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						
						                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
						
						                // 법정동명이 있을 경우 추가한다.
						                if(data.bname !== ''){
						                    extraRoadAddr += data.bname;
						                }
						                // 건물명이 있을 경우 추가한다.
						                if(data.buildingName !== ''){
						                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						                }
						                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						                if(extraRoadAddr !== ''){
						                    extraRoadAddr = ' (' + extraRoadAddr + ')';
						                }
						                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						                if(fullRoadAddr !== ''){
						                    fullRoadAddr += extraRoadAddr;
						                }
						
						                // 우편번호와 주소 정보를 해당 필드에 넣는다.
						                document.getElementById("sample4_postcode1").value = data.postcode1;
						                document.getElementById("sample4_postcode2").value = data.postcode2;
						                document.getElementById("sample4_roadAddress").value = fullRoadAddr;
						                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
						
						                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						                if(data.autoRoadAddress) {
						                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
						                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
						                    document.getElementById("guide").innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
						
						                } else if(data.autoJibunAddress) {
						                    var expJibunAddr = data.autoJibunAddress;
						                    document.getElementById("guide").innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
						
						                } else {
						                    document.getElementById("guide").innerHTML = '';
						                }
						            }
						        }).open();
						    }
						</script>  
		           		</td>	           
		           </tr>
                      
		            <tr>
		                <th>이메일</th>
		                <td>
		                	<input type='text' name='email' style='width:280px' />
		                </td>
		            </tr>
		            <tr>
		                <th>결혼여부</th>
		                <td>
		                	<input type='radio' name='maritalStatus' value='no' checked='checked'>미혼</input>
		                	<input type='radio' name='maritalStatus' value='yes'>기혼</input>
		                </td>
		            </tr>
		            <tr>
		            	<th style='background-color: #fffffc;text-align: left;'>
		            		▶회사정보
		            	</th>
		            	<td>
		            	</td>
		            </tr>
		            <tr>
		                <th>직통 전화번호</th>
		                <td>
		                	<input type='text' name='directLine1' style='width:60px' value="033"/>&nbsp;-&nbsp; 
		                	<input type='text' name='directLine2' style='width:60px' value="333"/>&nbsp;-&nbsp;
		                	<input type='text' name='directLine3' style='width:60px' value="333"/>&nbsp;&nbsp;
		                	내선
		                	<input type='text' name='extension' style='width:60px' value="111"/>
		                	※ 내선은 선택 입력사항입니다.
		                </td>
		            </tr>
		                      
		            <tr>
		                <th id="essential">* 부서</th>
		                <td>
		                	<select id='dept' type='text' name='deptNo' style='width:80px'>
		                	<option></option>
		                	<c:forEach var="dept" items="${ depts }">
		                		<option value=${ dept.deptNo }>${ dept.partName }</option>
		                	</c:forEach>
		                	</select>
		                </td>
		            </tr>

		            <tr>
		                <th id="essential">* 직급</th>
		                <td>
		                	<select id='position' type='text' name='positionNo' style='width:80px'>
		                	<option></option>
		                	<c:forEach var="position" items="${ positions }">
		                		<option value=${ position.positionNo }>${  position.positionName }</option>
		                	</c:forEach>
		                	</select>
		                </td>
		            </tr>
		            <tr>
		                <th id="essential">* 입사일</th>
		                <td>
		                	<input id="joindate" type="date" name='joinDate' style='width:280px' value=<%=new java.text.SimpleDateFormat("yyyy-MM-dd").format(new Date())%> />
		                </td>
		            </tr>
		            <tr>
		                <th>IP 주소</th>
		                <td>
		                	<input type='text' name='ipAdress' style='width:180px' />
		                </td>
		            </tr>
<!-- 		            <tr>
		            	<th style='background-color: #fffffc;text-align: left;'>
		            		▶부가정보
		            	</th>
		            	<td>
		            	</td>
		            </tr>
		            <tr>
		                <th>사진등록</th>
		                <td>
		                	<input type='file' name='' style='width:280px;height: 30px;' /><br />
		                	※ 이미지 파일 용량은 200 KB내에서 올려주십시오.
		                </td>
		            </tr>
		            <tr>
		                <th>취미</th>
		                <td>
		                	<input type='text' name='hobbit' style='width:280px' />
		                </td>
		            </tr>
		            <tr>
		                <th>간단한 이력사항</th>
		                <td>
		                	<input type='text' name='' style='width:280px' />
		                </td>
		            </tr>
		            <tr>
		                <th>자기소개</th>
		                <td>
		                	<textarea name="selfIntro" style='height: 120px; width:280px'></textarea>
		                </td>
		            </tr> -->
		        </table>
		        
		        <div class='buttons'>
		        	<input type='button' value='등록' style='height:25px;' onclick="javascript:doSubmit();" />
		        	<input type='button' value='취소' style='height:25px'
		        		onclick="location.href='registerform.action';" />
		        </div>
		        </form>
		        
		    </div>
		</div>
		
	</div>
</section>
</body>
</html>