<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="Stylesheet" href="/groupware/resources/styles/pschedule.css" />
	<link rel="Stylesheet" href="/groupware/resources/styles/scalendar.css" >
	<title>개인일정</title>
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
				<span><a href='Javascript:SubmitButton("")'><img src="/groupware/resources/image/save.png" border="0" />일정저장</a></span>
				<span><a href='index.php?action=schedule_month&year=2015&month=07&day=09&auth=PRIVATE&schedule_open='><img src="/groupware/resources/image/back.png" border="0" />돌아가기</a></span>
			</span>
			
		</span>
	</div>
	<div>
		<br>
		<table width="100%" border="0" cellspacing="1" cellpadding="3" bgcolor="#C9C9C9">
		<tr bgcolor="#FFFFFF" valign="middle"> 
			
			<form action="schedule_add.php" name=compose method=post>
			<input type=hidden name=continue_flag value="">
			<input type=hidden name=groupkey value="">
			<input type=hidden name=schedule_type value="schedule_month">
			<input type=hidden name=auth value="PRIVATE">
			<input type=hidden name=schedule_open value="">
			
			<td width="90" height="28" bgcolor="#efefef" align="center">일정 제목</td>
			<td style="padding-left:5px;"><input type=text name=schedule_title maxlength=128 class="input" style="width:98%"></td>

		</tr>
		<tr bgcolor="#FFFFFF">
			<td bgcolor="#efefef" align="center">일정 내용</td>
			<td style="padding-left:5px;"><textarea name=schedule_detail class="memo" style="width:100%;height:200px"></textarea></td>
		</tr>
		
		<tr bgcolor="#FFFFFF">
			<td height="80" bgcolor="#efefef" align="center">일정 날짜</td>
			<td style="padding-left:10px;">
				
				<input id="addcalendar" type="date" value="${ date }">
				<input type=radio name=time_type value="DAY" checked>일일 일정
				<input type=radio name=time_type value="TIME" >시간 일정 <br><br>
				
				<select name=hour onChange="CheckTimed()" class="input"><option value=0 selected>0<option value=1>1<option value=2>2<option value=3>3<option value=4>4<option value=5>5<option value=6>6<option value=7>7<option value=8>8<option value=9>9<option value=10>10<option value=11>11<option value=12>12<option value=13>13<option value=14>14<option value=15>15<option value=16>16<option value=17>17<option value=18>18<option value=19>19<option value=20>20<option value=21>21<option value=22>22<option value=23>23</select>시
				<select name=min onChange="CheckTimed()" class="input"><option value=0 selected>0<option value=1>1<option value=2>2<option value=3>3<option value=4>4<option value=5>5<option value=6>6<option value=7>7<option value=8>8<option value=9>9<option value=10>10<option value=11>11<option value=12>12<option value=13>13<option value=14>14<option value=15>15<option value=16>16<option value=17>17<option value=18>18<option value=19>19<option value=20>20<option value=21>21<option value=22>22<option value=23>23<option value=24>24<option value=25>25<option value=26>26<option value=27>27<option value=28>28<option value=29>29<option value=30>30<option value=31>31<option value=32>32<option value=33>33<option value=34>34<option value=35>35<option value=36>36<option value=37>37<option value=38>38<option value=39>39<option value=40>40<option value=41>41<option value=42>42<option value=43>43<option value=44>44<option value=45>45<option value=46>46<option value=47>47<option value=48>48<option value=49>49<option value=50>50<option value=51>51<option value=52>52<option value=53>53<option value=54>54<option value=55>55<option value=56>56<option value=57>57<option value=58>58<option value=59>59</select>분(부터)
				<br>
				<select name=duration_hour onChange="CheckTimed()" class="input"><option value=0 selected>0<option value=1>1<option value=2>2<option value=3>3<option value=4>4<option value=5>5<option value=6>6<option value=7>7<option value=8>8<option value=9>9<option value=10>10<option value=11>11<option value=12>12<option value=13>13<option value=14>14<option value=15>15<option value=16>16<option value=17>17<option value=18>18<option value=19>19<option value=20>20<option value=21>21<option value=22>22<option value=23>23</select>시
				<select name=duration_min onChange="CheckTimed()" class="input"><option value=0 selected>0<option value=1>1<option value=2>2<option value=3>3<option value=4>4<option value=5>5<option value=6>6<option value=7>7<option value=8>8<option value=9>9<option value=10>10<option value=11>11<option value=12>12<option value=13>13<option value=14>14<option value=15>15<option value=16>16<option value=17>17<option value=18>18<option value=19>19<option value=20>20<option value=21>21<option value=22>22<option value=23>23<option value=24>24<option value=25>25<option value=26>26<option value=27>27<option value=28>28<option value=29>29<option value=30>30<option value=31>31<option value=32>32<option value=33>33<option value=34>34<option value=35>35<option value=36>36<option value=37>37<option value=38>38<option value=39>39<option value=40>40<option value=41>41<option value=42>42<option value=43>43<option value=44>44<option value=45>45<option value=46>46<option value=47>47<option value=48>48<option value=49>49<option value=50>50<option value=51>51<option value=52>52<option value=53>53<option value=54>54<option value=55>55<option value=56>56<option value=57>57<option value=58>58<option value=59>59</select>분 까지<br>
				

			</td>
		</tr>
		<tr bgcolor="#FFFFFF">
			<td height="28" bgcolor="#efefef" align="center">일정 종류</td>
			<td style="padding-left:5px;"><select name=schedule_kind class="input"><option value='0'><option value='1'>기념일<option value='2'>생일<option value='3'>일반 약속<option value='4'>아침식사 약속<option value='5'>점심식사 약속<option value='6'>저녁식사 약속<option value='7'>면접<option value='8'>술자리<option value='9'>결혼식<option value='10'>졸업식<option value='11'>동창회<option value='12'>전화<option value='13'>채팅<option value='14'>클럽 이벤트<option value='15'>넷 이벤트<option value='16'>콘서트<option value='17'>공연<option value='18'>영화<option value='19'>파티<option value='20'>휴일<option value='21'>휴가<option value='22'>스포츠<option value='23'>모임<option value='24'>여행<option value='25'>TV 프로그램<option value='26'>요금 납부<option value='27'>기타</select></td>
		</tr>
		<tr bgcolor="#FFFFFF">
			<td height="28" bgcolor="#efefef" align="center">우선 순위</td>
			<td style="padding-left:5px;"><select name=schedule_priority class="input"><option value='0'>없음<option value='1'>낮음<option value='2'>중간<option value='3'>높음</select></td>
		</tr>
		<tr bgcolor="#FFFFFF">
			<td height="28" bgcolor="#efefef" align="center">일정 공개</td>
			<td style="padding-left:5px;">
				<select name=schedule_group class="input">					
					<option value='' selected>=비공개=<option value='%2Fwhoisdesk_kr'>공개
				</select>

			</td>
		</tr>
		<!-- 알림 설정 -->
		
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
		
	</div>
</div>
</section>
</body>
</html>