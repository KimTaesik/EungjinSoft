<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>  	

	<link rel="Stylesheet" href="/groupware/resources/styles/addressframe.css" />  
	<link rel='Stylesheet' href='/groupware/resources/styles/input.css' />
	<link rel="Stylesheet" href="/groupware/resources/styles/admin.css" />
	<link rel="stylesheet" href="/resources/demos/style.css">
	
<!-- 	<link rel="stylesheet" href="/groupware/resources/styles/jquery/jquery-ui.css"> -->
	
<!-- 	<script src="/groupware/resources/styles/script/jquery.js"></script>
	<script src="/groupware/resources/styles/script/jquery-ui.js"></script>  -->
	

	<script type="text/javascript">

	function doCheck() {
		//1. 필요하다면 유효성 검사 수행
		if(document.getElementById("name").value.length == 0) {
			alert("이름을 입력해주세요.");
		}else if(document.getElementById("email").value.length == 0) {
			alert("이메일을 입력해주세요.");
		}else {
			document.getElementById("addressbookaddform").submit();
			//document.forms[0].submit();
		}
	}
	
	
	</script>
	
	<script>
 	/* $(document).ready(function() {
		$('#showlist').click(function(event) {
			alert("djkjkjkj");
		
			var classify = $(this).attr("id");
			alert(classify);
			$.ajax({
				url : "addressheader.action",
				method : 'get',
				data : {"classify" : classify},
				
				success: function(result, status, xhr) {
				}

		})
		
	})
	})  */
	
	</script>
	
</head>
<body>

	
	<section>
	<div id='pageContainer'>	
		
		<div id='inputcontent'>
		<div id='inputmain'>
		<div class="subject">
			<caption align="left"><font color="#0431B4" size="2" ><b>
			<c:choose>
			<c:when test="${ classify.equals('1') }">
			개인주소록 주소추가
			</c:when>
			<c:otherwise>
			공용주소록 주소추가
			</c:otherwise>
			</c:choose>
			</b></font></caption>
		</div>
		<form id='addressbookaddform' action='addressbookadd.action' method='post'>
		<input type="hidden" name="classify" value=${ classify } />
 		<input type="hidden" name="groupno" value="1" />
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
	                	<input id='name' type='text' name='name' style='width:280px;height:18px;' />
	                </td>
	            </tr>
	            <tr>
	                <th id="essential">* 메일주소</th>
	                <td>
	                	<input id='email' type='text' name='email' style='width:280px;height:18px;' />
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
	                	<input type='text' name='fax1' style='width:60px' />&nbsp;-&nbsp; 
	                	<input type='text' name='fax2' style='width:60px' />&nbsp;-&nbsp;
	                	<input type='text' name='fax3' style='width:60px' />
	                </td>
	            </tr>
	            <tr>	
	            	<th>국가</th>
	            	<td>	
					<select style='width=20px' name='nation'>
						<option value="Korea, Republic of">한국, 대한민국</option>
						<option value="Korea, Democratic People's Republic of">한국, 조선 민주주의 인민 공화국</option>
						<option value="Japan">일본</option>
						<option value="China">중국</option>
						<option value="United Kingdom">영국</option>
						<option value="United States">미국</option>
						<option value="United Arab Emirates">아랍국가 연합</option>
						<option value="Afghanistan">아프카니스탄</option>
						<option value="Albania">알바니아</option>
						<option value="Armenia">아르메니아</option>
						<option value="Netherlands Antilles">네덜란드</option>
						<option value="Angola">앙골라</option>
						<option value="Argentina">아르헨티나</option>
						<option value="American Samoa">미국령 사모아</option>
						<option value="Austria">오스트리아</option>
						<option value="Australia">호주</option>
						<option value="Azerbaijan">아제르바이잔</option>
						<option value="Bangladesh">방글라데쉬</option>
						<option value="Bahrain">바레인</option>
						<option value="Bermuda">버뮤다</option>
						<option value="Bolivia">볼리비아</option>
						<option value="Brazil">브라질</option>
						<option value="Bahamas">바하마</option>
						<option value="Bhutan">부탄</option>
						<option value="Canada">캐나다</option>
						<option value="Congo, The Democratic Republic of the">콩고</option>
						<option value="Central African Republic">중앙아프리카 공화국</option>
						<option value="Congo">콩고</option>
						<option value="Switzerland">스위스</option>
						<option value="Cook Islands">쿡 군도</option>
						<option value="Chile">칠레</option>
						<option value="Cameroon">카메룬</option>
						<option value="Colombia">콜롬비아</option>
						<option value="Costa Rica">코스타리카</option>
						<option value="Cuba">쿠바</option>
						<option value="Christmas Island">크리스마스 군도</option>
						<option value="Czech Republic">체코 공화국</option>
						<option value="Germany">독일</option>
						<option value="Denmark">덴마크</option>
						<option value="Dominica">도미니카</option>
						<option value="Dominican Republic">도미니카 공화국</option>
						<option value="Algeria">알제리아</option>
						<option value="Ecuador">에콰도르</option>
						<option value="Estonia">에스토니아</option>
						<option value="Egypt">이집트</option>
						<option value="Western Sahara">서 사모아</option>
						<option value="Spain">스페인</option>
						<option value="Ethiopia">이디오피아</option>
						<option value="Finland">핀란드</option>
						<option value="Fiji">피지</option>
						<option value="Micronesia, Federated States of">마이크로네시아, </option>
						<option value="France">프랑스</option>
						<option value="Gabon">가봉</option>
						<option value="Grenada">그레나다</option>
						<option value="Georgia">그루지아</option>
						<option value="French Guiana">프랑스령 구아나</option>
						<option value="Ghana">가나</option>
						<option value="Greenland">그린랜드</option>
						<option value="Gambia">잠비아</option>
						<option value="Guinea">기니</option>
						<option value="Greece">그리스</option>
						<option value="South Georgia and the South Sandwich Islands">남조지아와 남샌드위치 군도</option>
						<option value="Guam">괌</option>
						<option value="Hong Kong">홍콩</option>
						<option value="Croatia">크로아티아</option>
						<option value="Hungary">헝가리</option>
						<option value="Indonesia">인도네시아</option>
						<option value="Ireland">아일랜드</option>
						<option value="Israel">이스라엘</option>
						<option value="India">인도</option>
						<option value="British Indian Ocean Territory">영국령 인도양</option>
						<option value="Iraq">이라크</option>
						<option value="Iran, Islamic Republic of">이란, 이슬람 공화국</option>
						<option value="Iceland">아이스랜드</option>
						<option value="Italy">이탈리아</option>
						<option value="Jamaica">자마이카</option>
						<option value="Kenya">케냐</option>
						<option value="Kuwait">쿠웨이트</option>
						<option value="Kazakhstan">카자흐스탄</option>
						<option value="Lebanon">레바논</option>
						<option value="Saint Lucia">세인트루시아</option>
						<option value="Sri Lanka">스리랑카</option>
						<option value="Lithuania">리투아니아</option>
						<option value="Luxembourg">룩셈부르크</option>
						<option value="Latvia">라비에타</option>
						<option value="Morocco">모로코</option>
						<option value="Monaco">모나코</option>
						<option value="Madagascar">마다카스카르</option>
						<option value="Marshall Islands">마샬 제도</option>
						<option value="Mexico">멕시코</option>
						<option value="Malaysia">말레이지아</option>
						<option value="Mozambique">모잠비크</option>
						<option value="New Caledonia">신 칼레도니아</option>
						<option value="Niger">니제르</option>
						<option value="Nigeria">나이지리아</option>
						<option value="Netherlands">네덜란드</option>
						<option value="Norway">노르웨이</option>
						<option value="Nepal">네팔</option>
						<option value="New Zealand">뉴질랜드</option>
						<option value="Oman">오만</option>
						<option value="Panama">파나마</option>
						<option value="Peru">페루</option>
						<option value="Philippines">필리핀</option>
						<option value="Pakistan">파키스탄</option>
						<option value="Poland">폴란드</option>
						<option value="Puerto Rico">푸에르토리코</option>
						<option value="Portugal">포르투칼</option>
						<option value="Rwanda">르완다</option>
						<option value="Saudi Arabia">사우디아라비아</option>
						<option value="Solomon Islands">솔로몬 군도</option>
						<option value="Sudan">수단</option>
						<option value="Sweden">스웨덴</option>
						<option value="Singapore">싱가폴</option>
						<option value="Saint Helena">세인트헬레나</option>
						<option value="Slovenia">슬로베니아</option>
						<option value="Slovakia">슬로바키아</option>
						<option value="San Marino">산마리노</option>
						<option value="Senegal">세네갈</option>
						<option value="Somalia">소말리아</option>
						<option value="Suriname">수리남</option>
						<option value="El Salvador">엘살바도르</option>
						<option value="Syrian Arab Republic">시리아 아랍국가 연합</option>
						<option value="Swaziland">스와질랜드</option>
						<option value="Turks and Caicos Islands">투르크와 카이코스 군도</option>
						<option value="Togo">토고</option>
						<option value="Thailand">태국</option>
						<option value="Tajikistan">타지키스탄</option>
						<option value="Turkmenistan">투르크메니스탄</option>
						<option value="Tunisia">튀니지아</option>
						<option value="Tonga">통가</option>
						<option value="Timor-Leste">티모르</option>
						<option value="Turkey">터키</option>
						<option value="Taiwan">대만</option>
						<option value="Tanzania, United Republic of">탄자니아, 공화국</option>
						<option value="Ukraine">우크라이나</option>
						<option value="Uganda">우간다</option>
						<option value="Uruguay">우루과이</option>
						<option value="Uzbekistan">우즈베키스탄</option>
						<option value="Holy See (Vatican City State)">바티칸 시국</option>
						<option value="Saint Vincent and the Grenadines">세인트 빈센트</option>
						<option value="Venezuela">베네주엘라</option>
						<option value="Virgin Islands, British">버진 군도, 영국령</option>
						<option value="Virgin Islands, U.S.">버진 군도, 미국령.</option>
						<option value="Viet Nam">베트남</option>
						<option value="Samoa">사모아</option>
						<option value="Yemen">예멘</option>
						<option value="Yugoslavia">유고슬라비아</option>
						<option value="South Africa">남아프리카 공화국</option>
						<option value="Zambia">잠비아</option>
						<option value="Zaire">자이르</option>
						<option value="Zimbabwe">짐바브웨</option>
						<option value="Other">기타</option>
						<option value="Congo, Republic of">콩고 공화국</option>
						<option value="European Union">유럽국가 연합</option>
						<option value="Heard and McDonald Islands">맥도날드 군도</option>
						<option value="Croatia/Hrvatska">크로아티아/헤르바트스카</option>
						<option value="Jersey">저지</option>
						<option value="Reunion Island">리유니온 군도</option>
						<option value="Serbia">세르비아</option>
						<option value="Soviet Union">소비에트 연방</option>
						<option value="East Timor">동 티모르</option>
						<option value="Serbia and Montenegro">세르비아와 몬테니그로</option>
						<option value="Other">기타</option>
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
	                	<input id='name' type='text' name='companyName' style='width:280px' />
	                </td>
	            </tr>
	            <tr>
	                <th>부서</th>
	                <td>
	                	<input id='deptName' type='text' name='deptName' style='width:280px' />
	                </td>
	            </tr>
	            <tr>
	                <th>직책</th>
	                <td>
	              		<input id='positionName' type='text' name='positionName' style='width:280px' />
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
	                <th>메모</th>
	                <td>
	                	<textarea name='memo' style='height: 120px; width:280px'></textarea>
	                </td>
	            </tr>
	        </table>
			        <div class='buttons'>
			        <input type='button' value='목록보기' style='height:25px;' id="showlist" class="addressbook"/>
		        	<input type='button' value='주소추가' style='height:25px;' id="addressadd" onclick="javascript:doCheck();"/>
		        	</div>
		        </form>
			</div>
		</div>
	</div>		
	</section>
</body>
</html>