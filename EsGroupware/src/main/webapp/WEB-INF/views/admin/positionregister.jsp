<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>

<html>
<head>
	<meta charset='utf-8' />
	<title>사용자등록</title>
	<link rel='Stylesheet' href='/groupware/resources/styles/input.css' />
	<link rel="Stylesheet" href="/groupware/resources/styles/admin.css" />
	<script type="text/javascript">
	function idcheck() {
		window.open("idcheck.action", "_blank", "width=1200,height=300,titlebar=no");
	}
	function doSubmit() {
		
		//2. 서버로 전송
		//document.forms[0].submit();//이 문서 내부에 포함된 <form 요소 중 첫 번째 항목을 submit
		//-> <input type='submit'을 클릭하는 것과 같은 의미
		document.getElementById("positionregister").submit();//document.forms[0].submit();과같다
		alert("직급 추가가 되었습니다.");
	
	
	}
	</script>
</head>
<body>
	<div id='pageContainer'>		
			
		<div id='inputcontent'>
			<br /><br />
		    <div id='inputmain'>
		        <div class='inputsubtitle'>회원기본정보</div>
		        <form id='positionregister'action='positionregister.action' method='post'><!-- 상대경로표시 -->
		        <table>
		        	<tr>
		            	<th style='background-color: #fffffc;text-align: left;'>
		            		▶직급등록
		            	</th>
		            	<td>
		            	</td>
		            </tr>
		            <tr>
		                <th>직급명</th>
		                <td>
		                	<input type='text' name='positionname' style='width:280px' />
		                </td>
		            </tr>	       
		        </table>
		        <div class='buttons'>
		        	<input type='button' value='등록' style='height:25px;' onclick="javascript:doSubmit();" />
		        	<input type='button' value='목록' style='height:25px'
		        		onclick="location.href='positionlist.action';" />
		        	<input type='button' value='취소' style='height:25px'
		        		onclick="location.href='list.action';" />
		        </div>
		        </form>
		    </div>
		</div>

	</div>

</body>
</html>