<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="Stylesheet" href="/groupware/resources/styles/pschedule.css" />
	<link rel="Stylesheet" href="/groupware/resources/styles/scalendar.css" >
	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<title>개인일정</title>
	
	<script type="text/javascript">
		$(document).ready(function(){
		    $('#day_day').click(function () {
		        if ($(this).is(':checked')) {
		        	$("#hour_s").hide();
		        	$("#min_s").hide();
		        	$("#hour_e").hide();
		        	$("#min_e").hide();
		        	
		        	$("#hour").hide();
		        	$("#min").hide();
		        	$("#duration_hour").hide();
		        	$("#duration_min").hide();
		        }
		    });

		    $('#hour_day').click(function () {
		        if ($(this).is(':checked')) {
		        	$("#hour").val("0");
		        	$("#min").val("0");
		        	$("#duration_hour").val("0");
		        	$("#duration_min").val("0");
		        	
		        	$("#hour_s").show();
		        	$("#min_s").show();
		        	$("#hour_e").show();
		        	$("#min_e").show();
		        	
		        	$("#hour").show();
		        	$("#min").show();
		        	$("#duration_hour").show();
		        	$("#duration_min").show();
		        }
		    });
		    
		    $('#schedule_add').click(function(e) {
		    	var title = $("#schedule_title").val()
		    	var cont = $("#schedule_detail").val()
		    	var stdate = $("#addcalendar").val()
		    	var classify = $("#schedule_kind").val()
		    	var priority = $("#schedule_priority").val()
		    	var makepublic = $("#schedule_group").val()
				var url = 'insertSchedule.action?title='+title+"&cont="+cont+"&stdate="+stdate+"&classify="+classify+"&priority="+priority+"&makepublic="+makepublic;
				$(location).attr('href', url);
		    });
		    
		    $('#schedule_return').click(function(e) {
				var url = 'reSchedule.action';
				$(location).attr('href', url);
		    });
		});
	</script>
</head>
<body class="addbody">
<c:import url="/WEB-INF/views/schedule/scheduleheader.jsp"></c:import>
<section>
<div id="sub">
	<div id="title">
		<h2><span class="sched">일정관리 &gt; <font color="0073BD">일정추가</font></span></h2>
	</div>
	
	<div class="toparea">		
		<span class="rightarea">
			<span class="btn">
				<span><a id="schedule_add" href='#'><img id="schedule_add" src="/groupware/resources/image/save.png" border="0" />일정저장</a></span>
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
					<input type=text id="schedule_title" maxlength=128 class="input" style="width:98%">
				</td>
			</tr>
		
			<tr bgcolor="#FFFFFF">
				<td bgcolor="#efefef" align="center">일정 내용</td>
				<td style="padding-left:5px;">
					<textarea id="schedule_detail" class="memo" style="width:100%;height:200px"></textarea>
				</td>
			</tr>
		
			<tr bgcolor="#FFFFFF">
				<td height="100%" bgcolor="#efefef" align="center">일정 날짜</td>
				<td style="padding-left:10px;">
					<input id="addcalendar" type="date" value="${ date }">
					<input type=radio name=time_type id="day_day" value="DAY" >일일 일정
					<input type=radio name=time_type id="hour_day" value="TIME" checked>시간 일정 <br><br>
					
					<select id="hour" class="input"><option value=0 selected>0<option value=1>1<option value=2>2<option value=3>3<option value=4>4<option value=5>5<option value=6>6<option value=7>7<option value=8>8<option value=9>9<option value=10>10<option value=11>11<option value=12>12<option value=13>13<option value=14>14<option value=15>15<option value=16>16<option value=17>17<option value=18>18<option value=19>19<option value=20>20<option value=21>21<option value=22>22<option value=23>23</select><span id="hour_s">시</span>
					<select id="min"  class="input"><option value=0 selected>0<option value=1>1<option value=2>2<option value=3>3<option value=4>4<option value=5>5<option value=6>6<option value=7>7<option value=8>8<option value=9>9<option value=10>10<option value=11>11<option value=12>12<option value=13>13<option value=14>14<option value=15>15<option value=16>16<option value=17>17<option value=18>18<option value=19>19<option value=20>20<option value=21>21<option value=22>22<option value=23>23<option value=24>24<option value=25>25<option value=26>26<option value=27>27<option value=28>28<option value=29>29<option value=30>30<option value=31>31<option value=32>32<option value=33>33<option value=34>34<option value=35>35<option value=36>36<option value=37>37<option value=38>38<option value=39>39<option value=40>40<option value=41>41<option value=42>42<option value=43>43<option value=44>44<option value=45>45<option value=46>46<option value=47>47<option value=48>48<option value=49>49<option value=50>50<option value=51>51<option value=52>52<option value=53>53<option value=54>54<option value=55>55<option value=56>56<option value=57>57<option value=58>58<option value=59>59</select><span id="min_s">분 부터</span>
					<br>
					<select id="duration_hour" class="input"><option value=0 selected>0<option value=1>1<option value=2>2<option value=3>3<option value=4>4<option value=5>5<option value=6>6<option value=7>7<option value=8>8<option value=9>9<option value=10>10<option value=11>11<option value=12>12<option value=13>13<option value=14>14<option value=15>15<option value=16>16<option value=17>17<option value=18>18<option value=19>19<option value=20>20<option value=21>21<option value=22>22<option value=23>23</select><span id="hour_e">시</span>
					<select id="duration_min" class="input"><option value=0 selected>0<option value=1>1<option value=2>2<option value=3>3<option value=4>4<option value=5>5<option value=6>6<option value=7>7<option value=8>8<option value=9>9<option value=10>10<option value=11>11<option value=12>12<option value=13>13<option value=14>14<option value=15>15<option value=16>16<option value=17>17<option value=18>18<option value=19>19<option value=20>20<option value=21>21<option value=22>22<option value=23>23<option value=24>24<option value=25>25<option value=26>26<option value=27>27<option value=28>28<option value=29>29<option value=30>30<option value=31>31<option value=32>32<option value=33>33<option value=34>34<option value=35>35<option value=36>36<option value=37>37<option value=38>38<option value=39>39<option value=40>40<option value=41>41<option value=42>42<option value=43>43<option value=44>44<option value=45>45<option value=46>46<option value=47>47<option value=48>48<option value=49>49<option value=50>50<option value=51>51<option value=52>52<option value=53>53<option value=54>54<option value=55>55<option value=56>56<option value=57>57<option value=58>58<option value=59>59</select><span id="min_e">분 까지</span><br>
				</td>
			</tr>
			
			<tr bgcolor="#FFFFFF">
				<td height="28" bgcolor="#efefef" align="center">일정 종류</td>
				<td style="padding-left:5px;"><select id="schedule_kind" name=schedule_kind class="input"><option value='0'><option value='1'>기념일<option value='2'>생일<option value='3'>일반 약속<option value='4'>아침식사 약속<option value='5'>점심식사 약속<option value='6'>저녁식사 약속<option value='7'>면접<option value='8'>술자리<option value='9'>결혼식<option value='10'>졸업식<option value='11'>동창회<option value='12'>전화<option value='13'>채팅<option value='14'>클럽 이벤트<option value='15'>넷 이벤트<option value='16'>콘서트<option value='17'>공연<option value='18'>영화<option value='19'>파티<option value='20'>휴일<option value='21'>휴가<option value='22'>스포츠<option value='23'>모임<option value='24'>여행<option value='25'>TV 프로그램<option value='26'>요금 납부<option value='27'>기타</select></td>
			</tr>
			
			<tr bgcolor="#FFFFFF">
				<td height="28" bgcolor="#efefef" align="center">우선 순위</td>
				<td style="padding-left:5px;"><select id="schedule_priority" name=schedule_priority class="input"><option value='0'>없음<option value='1'>낮음<option value='2'>중간<option value='3'>높음</select></td>
			</tr>
			
			<tr bgcolor="#FFFFFF">
				<td height="28" bgcolor="#efefef" align="center">일정 공개</td>
				<td style="padding-left:5px;">
					<select id="schedule_group" name=schedule_group class="input">					
						<option value='closed' selected>=비공개=<option value='open'>공개
					</select>
				</td>
			</tr>

			<tr bgcolor="#FFFFFF">
				<td height="28" bgcolor="#efefef" align="center">반복 설정</td>
				<td style="padding-left:5px;">
					<input type=radio name=repeat_flag value="N" checked>사용 안함
					<input type=radio name=repeat_flag value="D" onFocus="JavaScript:CheckAlarm()">일
					<input type=radio name=repeat_flag value="W" onFocus="JavaScript:CheckAlarm()">주
					<input type=radio name=repeat_flag value="M" onFocus="JavaScript:CheckAlarm()">월
					<input type=radio name=repeat_flag value="Y" onFocus="JavaScript:CheckAlarm()">년<br>
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