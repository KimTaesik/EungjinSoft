<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="Stylesheet" href="/groupware/resources/styles/pschedule.css" />
	<link rel="Stylesheet" href="/groupware/resources/styles/scalendar.css" />
  	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>개인일정</title>
	
	<script type="text/javascript">
		$(document).ready(function(){
		    $('#day_day').click(function () {
		        if ($(this).is(':checked')) {
		        	$("#hour_s").hide();$("#min_s").hide();$("#hour_e").hide();$("#min_e").hide();$("#hour").hide();$("#min").hide();$("#duration_hour").hide();$("#duration_min").hide();
		        }
		    });

		    $('#hour_day').click(function () {
		        if ($(this).is(':checked')) {
		        	$("#hour").val("0");$("#min").val("0");$("#duration_hour").val("0");$("#duration_min").val("0");
		        	$("#hour_s").show();$("#min_s").show();$("#hour_e").show();$("#min_e").show();$("#hour").show();$("#min").show();$("#duration_hour").show();$("#duration_min").show();
		        }
		    });
		    
		    $('#schedule_edit').click(function(e) {
		    	var cate = $("#cate").val()
		    	var title = $("#schedule_title").val()
		    	var cont = $("#schedule_detail").val().replace(/\n/g, "<br>")
		    	var stdate = $("#addcalendar").val()
		    	var classify = $("#schedule_kind").val()
		    	var priority = $("#schedule_priority").val()
		    	var makepublic = $("#schedule_group").val()
		    	var key = $("#key").val()
				var url = 'editSchedule.action?title='+title+"&cont="+cont+"&stdate="+stdate+"&classify="+classify+"&priority="+priority+"&makepublic="+makepublic+"&key="+key+"&cate="+cate;
				$(location).attr('href', url);
		    });
		    
		    $('#schedule_return').click(function(e) {
		    	var cate = $("#cate").val()
				var url = 'reSchedule.action?cate='+cate;
				$(location).attr('href', url);
		    });
		    
		    $('#delete_sc').click(function(e) {
		    	var stdate = $("#addcalendar").val();
		    	var title = $("#schedule_title").val();
				var bool = confirm("title: ["+title+"]\ndate: "+stdate+"\n삭제하시겠습니까?");
				if(bool){
					$(location).attr('href', 'deleteSchedule.action?key='+$("#key").val()+'&cate='+$("#cate").val());
					alert("title: ["+title+"]\ndate: "+stdate+"\n삭제하였습니다.");
				}else{
					alert("취소하셨습니다.");
				}
		    });
		    
		});
	</script>
</head>
<body class="addbody">
<section>
<div id="sub">
	<div id="title">
		<h2><span class="sched">일정관리 &gt; <font color="0073BD">일정수정</font></span></h2>
	</div>
	<input type="hidden" id="cate" name="cate" value="${ cate }">
	<input type="hidden" id="key" name="key" value="${ eSchedule.key }">
	<div class="toparea">		
		<span class="rightarea">
			<span class="btn">
				<span><a id="delete_sc" href="#"><img src="/groupware/resources/image/delete.png" border="0" /> 일정삭제</a></span>
				<span><a id="schedule_edit" href='#'><img id="schedule_edit" src="/groupware/resources/image/save.png" border="0" />일정수정</a></span>
				<span><a id="schedule_return" href='#'><img src="/groupware/resources/image/back.png" border="0" />돌아가기</a></span>
			</span>
		</span>
	</div>
	
	<div>
		<br>
		<form id="asd">
		<table width="100%" border="0" cellspacing="1" cellpadding="3" bgcolor="#C9C9C9">
			<tr bgcolor="#FFFFFF" valign="middle"> 
				<td width="90" height="28" bgcolor="#efefef" align="center">일정 제목</td>
				<td style="padding-left:5px;">
					<input type=text id="schedule_title" maxlength=60 class="input" style="width:98%" value="${ eSchedule.title }">
				</td>
			</tr>
		
			<tr bgcolor="#FFFFFF">
				<td bgcolor="#efefef" align="center">일정 내용</td>
				<td style="padding-left:5px;">
					<textarea id="schedule_detail" class="memo" maxlength=512 style="width:100%;height:200px" >${ eSchedule.cont }</textarea>
				</td>
			</tr>
		
			<tr bgcolor="#FFFFFF">
				<td height="100%" bgcolor="#efefef" align="center">일정 날짜</td>
				<td style="padding-left:10px;">
					<input id="addcalendar" type="date" value="${ eSchedule.stDate }">
<!-- 				<input type=radio name=time_type id="day_day" value="DAY" checked>일일 일정
					<input type=radio name=time_type id="hour_day" value="TIME" >시간 일정 <br><br>
					
					<select id="hour" class="input">
						<option value=0 selected>0<option value=1>1<option value=2>2<option value=3>3<option value=4>4<option value=5>5<option value=6>6<option value=7>7<option value=8>8<option value=9>9<option value=10>10<option value=11>11<option value=12>12<option value=13>13<option value=14>14<option value=15>15<option value=16>16<option value=17>17<option value=18>18<option value=19>19<option value=20>20<option value=21>21<option value=22>22<option value=23>23</select><span id="hour_s">시</span>
					<select id="min"  class="input">
						<option value=0 selected>0<option value=1>1<option value=2>2<option value=3>3<option value=4>4<option value=5>5<option value=6>6<option value=7>7<option value=8>8<option value=9>9<option value=10>10<option value=11>11<option value=12>12<option value=13>13<option value=14>14<option value=15>15<option value=16>16<option value=17>17<option value=18>18<option value=19>19<option value=20>20<option value=21>21<option value=22>22<option value=23>23<option value=24>24<option value=25>25<option value=26>26<option value=27>27<option value=28>28<option value=29>29<option value=30>30<option value=31>31<option value=32>32<option value=33>33<option value=34>34<option value=35>35<option value=36>36<option value=37>37<option value=38>38<option value=39>39<option value=40>40<option value=41>41<option value=42>42<option value=43>43<option value=44>44<option value=45>45<option value=46>46<option value=47>47<option value=48>48<option value=49>49<option value=50>50<option value=51>51<option value=52>52<option value=53>53<option value=54>54<option value=55>55<option value=56>56<option value=57>57<option value=58>58<option value=59>59</select><span id="min_s">분 부터</span>
					<br>
					<select id="duration_hour" class="input">
						<option value=0 selected>0<option value=1>1<option value=2>2<option value=3>3<option value=4>4<option value=5>5<option value=6>6<option value=7>7<option value=8>8<option value=9>9<option value=10>10<option value=11>11<option value=12>12<option value=13>13<option value=14>14<option value=15>15<option value=16>16<option value=17>17<option value=18>18<option value=19>19<option value=20>20<option value=21>21<option value=22>22<option value=23>23</select><span id="hour_e">시</span>
					<select id="duration_min" class="input">
						<option value=0 selected>0<option value=1>1<option value=2>2<option value=3>3<option value=4>4<option value=5>5<option value=6>6<option value=7>7<option value=8>8<option value=9>9<option value=10>10<option value=11>11<option value=12>12<option value=13>13<option value=14>14<option value=15>15<option value=16>16<option value=17>17<option value=18>18<option value=19>19<option value=20>20<option value=21>21<option value=22>22<option value=23>23<option value=24>24<option value=25>25<option value=26>26<option value=27>27<option value=28>28<option value=29>29<option value=30>30<option value=31>31<option value=32>32<option value=33>33<option value=34>34<option value=35>35<option value=36>36<option value=37>37<option value=38>38<option value=39>39<option value=40>40<option value=41>41<option value=42>42<option value=43>43<option value=44>44<option value=45>45<option value=46>46<option value=47>47<option value=48>48<option value=49>49<option value=50>50<option value=51>51<option value=52>52<option value=53>53<option value=54>54<option value=55>55<option value=56>56<option value=57>57<option value=58>58<option value=59>59</select><span id="min_e">분 까지</span><br> -->
				</td>
			</tr>
			
			<tr bgcolor="#FFFFFF">
				<td height="28" bgcolor="#efefef" align="center">일정 종류</td>
				<td style="padding-left:5px;">
					<select id="schedule_kind" name=schedule_kind class="input" >
						<option value='0' ${ eSchedule.classify == 0 ? "selected":"" }>
						<option value='1' ${ eSchedule.classify == 1 ? "selected":"" }>기념일
						<option value='2' ${ eSchedule.classify == 2 ? "selected":"" }>생일
						<option value='3' ${ eSchedule.classify == 3 ? "selected":"" }>일반 약속
						<option value='4' ${ eSchedule.classify == 4 ? "selected":"" }>아침식사 약속
						<option value='5' ${ eSchedule.classify == 5 ? "selected":"" }>점심식사 약속
						<option value='6' ${ eSchedule.classify == 6 ? "selected":"" }>저녁식사 약속
						<option value='7' ${ eSchedule.classify == 7 ? "selected":"" }>면접
						<option value='8' ${ eSchedule.classify == 8 ? "selected":"" }>술자리
						<option value='9' ${ eSchedule.classify == 9 ? "selected":"" }>결혼식
						<option value='10'${ eSchedule.classify == 10 ? "selected":"" }>졸업식
						<option value='11'${ eSchedule.classify == 11 ? "selected":"" }>동창회
						<option value='12'${ eSchedule.classify == 12 ? "selected":"" }>전화
						<option value='13'${ eSchedule.classify == 13 ? "selected":"" }>채팅
						<option value='14'${ eSchedule.classify == 14 ? "selected":"" }>클럽 이벤트
						<option value='15'${ eSchedule.classify == 15 ? "selected":"" }>넷 이벤트
						<option value='16'${ eSchedule.classify == 16 ? "selected":"" }>콘서트
						<option value='17'${ eSchedule.classify == 17 ? "selected":"" }>공연
						<option value='18'${ eSchedule.classify == 18 ? "selected":"" }>영화
						<option value='19'${ eSchedule.classify == 19 ? "selected":"" }>파티
						<option value='20'${ eSchedule.classify == 20 ? "selected":"" }>휴일
						<option value='21'${ eSchedule.classify == 21 ? "selected":"" }>휴가
						<option value='22'${ eSchedule.classify == 22 ? "selected":"" }>스포츠
						<option value='23'${ eSchedule.classify == 23 ? "selected":"" }>모임
						<option value='24'${ eSchedule.classify == 24 ? "selected":"" }>여행
						<option value='25'${ eSchedule.classify == 25 ? "selected":"" }>TV 프로그램
						<option value='26'${ eSchedule.classify == 26 ? "selected":"" }>요금 납부
						<option value='27'${ eSchedule.classify == 27 ? "selected":"" }>기타
					</select>
				</td>
			</tr>
			
			<tr bgcolor="#FFFFFF">
				<td height="28" bgcolor="#efefef" align="center">우선 순위</td>
				<td style="padding-left:5px;">
					<select id="schedule_priority" name=schedule_priority class="input">
						<option value='0' ${ eSchedule.priority == 0 ? "selected":"" }>없음
						<option value='1' ${ eSchedule.priority == 1 ? "selected":"" }>낮음
						<option value='2' ${ eSchedule.priority == 2 ? "selected":"" }>중간
						<option value='3' ${ eSchedule.priority == 3 ? "selected":"" }>높음
					</select>
				</td>
			</tr>
			
			<tr bgcolor="#FFFFFF">
				<td height="28" bgcolor="#efefef" align="center">일정 공개</td>
				<td style="padding-left:5px;">
					<select id="schedule_group" name=schedule_group class="input">
						<c:choose>
							<c:when test="${cate eq 'ps' || cate eq 'pus' }">
								<option value='closed' ${ eSchedule.makepublic == "closed" ? "selected":"" }>=비공개=
								<option value='open'   ${ eSchedule.makepublic == "open" ? "selected":"" }>공개
							</c:when>
							<c:when test="${cate eq 'ts' }">
								<option value='경영지원실'>경영지원실</option>
								<option value='전략기획팀'>전략기획팀</option>
								<option value='개발2팀'>개발2팀</option>
								<option value='개발1팀'>개발1팀</option>
								<option value='임원' selected>임원</option>
								<option value='대표이사'>대표이사</option>
							</c:when>
							<c:otherwise>
								<option value='open'   ${ eSchedule.makepublic == "open" ? "selected":"" }>공개
							</c:otherwise>
						</c:choose>				
					</select>
				</td>
			</tr>

			<tr bgcolor="#FFFFFF">
				<td height="28" bgcolor="#efefef" align="center">반복 설정</td>
				<td style="padding-left:5px;">
					<input type=radio name=repeat_flag value="N" checked>사용 안함
					<input type=radio name=repeat_flag value="D" >일
					<input type=radio name=repeat_flag value="W" >주
					<input type=radio name=repeat_flag value="M" >월
					<input type=radio name=repeat_flag value="Y" >년<br>
					반복 주기 :<input type=text name=repeat_freq value="1" size=2 maxlength=2 class="input"><br>
					반복 기간 :<input type=text name=repeat_end_year value="" size=4 maxlength=4 class="input">년
					<select name=repeat_end_month class="input">
						<option value="">---
						<option value="1">1
						<option value="2">2
						<option value="3">3
						<option value="4">4
						<option value="5">5
						<option value="6">6
						<option value="7">7
						<option value="8">8
						<option value="9">9
						<option value="10">10
						<option value="11">11
						<option value="12">12
					</select>월
					<select name=repeat_end_day class="input">
						<option value="">---
						<option value="1">1<option value="2">2<option value="3">3<option value="4">4<option value="5">5
						<option value="6">6<option value="7">7<option value="8">8<option value="9">9<option value="10">10
						<option value="11">11<option value="12">12<option value="13">13<option value="14">14<option value="15">15
						<option value="16">16<option value="17">17<option value="18">18<option value="19">19<option value="20">20
						<option value="21">21<option value="22">22<option value="23">23<option value="24">24<option value="25">25
						<option value="26">26<option value="27">27<option value="28">28<option value="29">29<option value="30">30
						<option value="31">31
					</select>일 까지
				</td>
			</tr>
		</table>
		</form>
	</div>
</div>
</section>
</body>
</html>