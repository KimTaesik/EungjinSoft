<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>

<html>
<head>
	<meta charset='utf-8' />
	<title>아이디 중복 검사</title>
	<link rel='Stylesheet' href='/groupware/resources/styles/default.css' />
	<link rel='Stylesheet' href='/groupware/resources/styles/input.css' />
	<script type="text/javascript">
	function checkandsubmit() {
		//입력 유효성 검사
		var id = document.getElementById('id');
		if (id.value.length == 0) {//아이디를 입력하지 않은 경우
			alert('사용할 아이디를 입력하세요');
			id.focus();
			return;
		}
		//전송
		var form = document.getElementById("idcheckform");
		form.submit();//<input type='submit' ... /> 버튼을 누른 것과 같은 기능 수행
	}
	function useThisId(id) {
		//opener : 이 브라우저를 window.open으로 실행시킨 브라우저 윈도우
		var input = opener.window.document.getElementById('id');
		input.value = id;
		
		window.close();
	}
	
	function init() {
		if (opener == null) {//다른 브라우저 윈도우로부터 생성된 경우가 아니라면
			window.close();//창닫기
		}
	}
	</script>
</head>
<body onload="init();">
	<div id='pageContainer'>		
		<div id='inputcontent'>
			<br /><br />
		    <div id='inputmain'>
		        <div class='inputsubtitle'>아이디 중복 검사</div>
		        <form id="idcheckform" action='idcheck.action' method='post'>
		        <table>
		            <tr>
		                <th>아이디(ID)</th>
		                <td>
		                	<% String getid = (String)request.getAttribute("getid"); %>
		                    <input type='text' id="id" name='memberId' style='width:200px' value='<%= getid %>'/>
		                    &nbsp;&nbsp;
		                    <input type="button" value="중복검사" style='height:25px' onclick="checkandsubmit();" />
		                </td>
		            </tr>
		            
		        </table>
		        <br /><br />
		        <div id="message" style='text-align:center;color:blue'>
		        	<% String id = (String)request.getAttribute("id"); %>
		        	<% boolean valid = false; %>
		        	<% if (id != null) { %>
		        		<%= id %>는
			        	<% valid = (boolean)request.getAttribute("valid"); %>
			        	<%= valid ? "사용가능한 아이디입니다." : "이미 사용중인 아이디입니다." %>
		        	<% } else { %>
		         	아이디를 입력하고 중복 검사를 수행하세요
		         	<% } %>
		        </div>
		        <div class='buttons'>
		        	<input type='button' value='사용' style='height:25px'
		        		onclick="useThisId('<%= id %>');" 
		        		<%= valid ? "" : "disabled='disabled'" %> />
		        	<input type='button' value='취소' style='height:25px'
		        		onclick="window.close();" />
		        </div>
		        </form>
		    </div>
		</div>

	</div>

</body>
</html>