<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>주소록</title>
	<link rel="Stylesheet" href="/groupware/resources/styles/addressframe.css" /> 
	<script type="text/javascript">
	function search() {
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
	}	
	</script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	<script>
	$(function() {	
	    $( "#accordion" ).accordion();	
	});	
	</script>
	
	
</head>
<body>
<div class="left_menu" style="background-color: #88cbff">
	<div id="accordion" style="font-size: 10pt;width: 100pt;">
	<h3>
	주소록</h3>
	<ul>
        <li>개인 주소록</li>
        <br />
        <li>공용 주소록</li>
        <br />
        <li>명함철</li>
	</ul>
	</div>
</div>

<div class="content" style="background-color: #88cbff">
	<div class="subject">
		
		<caption align="left"><font color="#0431B4" font size="3" ><b>개인주소록관리</b></font></caption>
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
					<th scope="col"><img src="/groupware/resources/image/add.png" />주소추가</th>
			        <th scope="col"><img src="/groupware/resources/image/add.png" />그룹추가</th>
			        <th scope="col"><img src="/groupware/resources/image/minus.png" />삭제</th>
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
			
			<table id="menubar">
				<tr>
					<th style="width:45px;text-align:center">이름</th>
					<th style="width:170px;text-align:center">이메일</th>
					<th style="width:180px;text-align:center">휴대폰</th>
					<th style="width:170px;text-align:center">전화</th>
					<th style="width:190px;text-align:center">팩스</th>
					<th style="width:40px;text-align:center">수정</th>
					<th style="width:90px;text-align:center">삭제</th>
				</tr>
			</table>
			
		<div style="width:910px; height:370px">
			<table class="contacts">
				<tbody>
			    	<tr>
			        	<td width="10%">홍길동</td>
			            <td width="20%">abc@naver.com</td>
			            <td width="20%">010-1234-5678</td>
			            <td width="18%">02-123-4567</td>
			            <td width="18%">02-000-0000</td>
			            <td width="7%"><img src="/groupware/resources/image/edit.png" /></td>
			            <td width="7%"><img src="/groupware/resources/image/del.png" /></td>
			        </tr>
			        <tr>
			        	<td>홍길동</td>
			            <td>abc@naver.com</td>
			            <td>010-1234-5678</td>
			            <td>02-123-4567</td>
			            <td>02-000-0000</td>
			            <td><img src="/groupware/resources/image/edit.png" /></td>
			            <td><img src="/groupware/resources/image/del.png" /></td>
			        </tr>
			        <tr>
			        	<td>홍길동</td>
			            <td>abc@naver.com</td>
			            <td>010-1234-5678</td>
			            <td>02-123-4567</td>
			            <td>02-000-0000</td>
			            <td><img src="/groupware/resources/image/edit.png" /></td>
			            <td><img src="/groupware/resources/image/del.png" /></td>
			        </tr>
			        <tr>
			        	<td>홍길동</td>
			            <td>abc@naver.com</td>
			            <td>010-1234-5678</td>
			            <td>02-123-4567</td>
			            <td>02-000-0000</td>
			            <td><img src="/groupware/resources/image/edit.png" /></td>
			            <td><img src="/groupware/resources/image/del.png" /></td>
			        </tr>
			        <tr>
			        	<td>홍길동</td>
			            <td>abc@naver.com</td>
			            <td>010-1234-5678</td>
			            <td>02-123-4567</td>
			            <td>02-000-0000</td>
			            <td><img src="/groupware/resources/image/edit.png" /></td>
			            <td><img src="/groupware/resources/image/del.png" /></td>
			        </tr>
			        <tr>
			        	<td>홍길동</td>
			            <td>abc@naver.com</td>
			            <td>010-1234-5678</td>
			            <td>02-123-4567</td>
			            <td>02-000-0000</td>
			            <td><img src="/groupware/resources/image/edit.png" /></td>
			            <td><img src="/groupware/resources/image/del.png" /></td>
			        </tr>
			        <tr>
			        	<td width="10%">홍길동</td>
			            <td width="20%">abc@naver.com</td>
			            <td width="20%">010-1234-5678</td>
			            <td width="18%">02-123-4567</td>
			            <td width="18%">02-000-0000</td>
			            <td width="7%"><img src="/groupware/resources/image/edit.png" /></td>
			            <td width="7%"><img src="/groupware/resources/image/del.png" /></td>
			        </tr>
			        <tr>
			        	<td width="10%">홍길동</td>
			            <td width="20%">abc@naver.com</td>
			            <td width="20%">010-1234-5678</td>
			            <td width="18%">02-123-4567</td>
			            <td width="18%">02-000-0000</td>
			            <td width="7%"><img src="/groupware/resources/image/edit.png" /></td>
			            <td width="7%"><img src="/groupware/resources/image/del.png" /></td>
			        </tr>
			    </tbody>
			</table>
		</div>

		</div>
		

</div>
			

</body>
</html>