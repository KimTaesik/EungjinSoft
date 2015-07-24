<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>주소록</title>
	<link rel='Stylesheet' href='/groupware/resources/styles/input.css' />
	<link rel="Stylesheet" href="/groupware/resources/styles/admin.css" />
	<link rel="Stylesheet" href="/groupware/resources/styles/addressframe.css" /> 
	<script type="text/javascript">
	
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
	<section>
	<div id='pageContainer'>	
		
		<div id='inputcontent'>
		<div id='inputmain'>
		<div class="subject">
			<caption align="left"><font color="#0431B4" font size="2" ><b>개인주소록 주소추가</b></font></caption>
		 </div>	
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
			                <th id="essential">* 이름</th>
			                <td>
			                	<input id='name' type='text' name='name' style='width:280px' />
			                </td>
			            </tr>
			            <tr>
			                <th id="essential">* 메일주소</th>
			                <td>
			                	<input type='text' name='email' style='width:280px' />
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
			            <tr>
			                <th>전화번호</th>
			                <td>
			                	<input type='text' name='homePhone1' style='width:60px' />&nbsp;-&nbsp; 
			                	<input type='text' name='homePhone2' style='width:60px' />&nbsp;-&nbsp;
			                	<input type='text' name='homePhone3' style='width:60px' />
			                </td>
			            </tr>
			            <tr>
			                <th>팩스번호</th>
			                <td>
			                	<input type='text' name='homePhone1' style='width:60px' />&nbsp;-&nbsp; 
			                	<input type='text' name='homePhone2' style='width:60px' />&nbsp;-&nbsp;
			                	<input type='text' name='homePhone3' style='width:60px' />
			                </td>
			            </tr>
			            <tr>	
			            	<th>국가</th>
			            	<td>	
							<select style='width=20px'>
								<option value="1">한국,대한민국</option>
								<option value="2">일본</option>
								<option value="3">중국</option>
								<option value="4">미국</option>
							</select>
							</td>
			            </tr>
			            <tr>
			           		<th>주소</th>
			           		<td>
			           			
				            <input style="width: 50px;" name="postcode1" type="text" id="sample4_postcode1"> -
							<input style="width: 50px;" name="postcode2" type="text" id="sample4_postcode2">
							<input style="height: 25px;" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
							<br />
							<input style="width: 300px;"  name="roadAddress" type="text" id="sample4_roadAddress" placeholder="도로명주소">
							<br /><br />
							<input style="width: 300px;"  name="jibunAddress" type="text" id="sample4_jibunAddress" placeholder="지번주소">
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
			            	<th style='background-color: #fffffc;text-align: left;'>
			            		▶회사정보
			            	</th>
			            	<td>
			            	</td>
			            </tr>
			             <tr>
			                <th>회사이름</th>
			                <td>
			                	<input id='name' type='text' name='name' style='width:280px' />
			                </td>
			            </tr>
			            <tr>
			                <th>부서</th>
			                <td>
			                	<select id='dept' type='text' name='dept' style='width:80px'>
			                	<option></option>
			                	<c:forEach var="dept" items="${ depts }">
			                		<option value=${ dept.deptNo }>${ dept.partName }</option>
			                	</c:forEach>
			                	</select>
			                </td>
			            </tr>
			            <tr>
			                <th>직책</th>
			                <td>
			                	<select id='position' type='text' name='position' style='width:80px'>
			                	<option></option>
			                	<c:forEach var="position" items="${ positions }">
			                		<option value=${ position.positionNo }>${  position.positionName }</option>
			                	</c:forEach>
			                	</select>
			                </td>
			            </tr>
			            <tr>
			                <th>전화번호</th>
			                <td>
			                	<input type='text' name='directLine1' style='width:60px' value="033"/>&nbsp;-&nbsp; 
			                	<input type='text' name='directLine2' style='width:60px' value="333"/>&nbsp;-&nbsp;
			                	<input type='text' name='directLine3' style='width:60px' value="333"/>&nbsp;&nbsp;
			                	<br>내선
			                	<input type='text' name='extension' style='width:60px' />
			                	※ 내선은 선택 입력사항입니다.
			                </td>
			            </tr>
			            <tr>
			                <th>메모</th>
			                <td>
			                	<textarea style='height: 120px; width:280px'></textarea>
			                </td>
			            </tr>
			        </table>
			        <div class='buttons'>
			        <input type='button' value='목록보기' style='height:25px'; />
		        	<input type='button' value='주소추가' style='height:25px'; />
		        	<input type='button' value='취소' style='height:25px'; />
		        	</div>
			</div>
		</div>
	</div>		
	</section>
</body>
</html>