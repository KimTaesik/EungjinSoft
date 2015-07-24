<%@page import="java.util.stream.Stream"%>
<%@page import="com.groupware.dto.Attendance"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="Stylesheet" href="/groupware/resources/styles/attendanceframe.css" />
	<link rel="Stylesheet" href="/groupware/resources/styles/calendar.css" >
	<title>근태식</title>
	<script type="text/javascript">
	function checkwork(work){
		var nowTimeStamp	= new Date();
		var clockTime		= new Date(nowTimeStamp);
		var clockHours		= clockTime.getHours();
		var clockMinutes	= clockTime.getMinutes();
		var clockSeconds	= clockTime.getSeconds();
		var clockYear		= clockTime.getFullYear();	
		var clockMonth		= clockTime.getMonth()+1;
		var clockDay		= clockTime.getDate();
		var chk				= 1;
	
		if (clockHours < 10) clockHours = "0" + clockHours;
		if (clockMinutes < 10) clockMinutes = "0" + clockMinutes;
		if (clockSeconds < 10) clockSeconds = "0" + clockSeconds;
		var out = document.getElementById("OfficeOut");
		var txt = (out.checked == true ? "Y" : "");
		if(work == 1){
			if(document.getElementById("textfield").value.length<2){
				location.href = "check.action?year="+clockYear+"&month="+clockMonth+"&day="+clockDay+"&hours="+clockHours+"&minutes="+clockMinutes+"&seconds="+clockSeconds+"&chk="+chk+"&out="+txt;
			}else{
				alert("이미 출근처리를 하셨습니다. 수정사항은 관리자에게 문의해주세요.");
			}
		}else{
			if(document.getElementById("textfield").value.length<2){
				alert("출근처리를 해주세요."); return;
			}
			if(document.getElementById("textfield2").value.length<2){
				var chk=2;
				location.href = "check.action?year="+clockYear+"&month="+clockMonth+"&day="+clockDay+"&hours="+clockHours+"&minutes="+clockMinutes+"&seconds="+clockSeconds+"&chk="+chk+"&out="+txt;
			} else {
				alert("이미 퇴근처리를 하셨습니다. 수정사항은 관리자에게 문의해주세요.");
			}
		}
	}
	</script>
</head>
<body >
	<c:import url="/WEB-INF/views/include/attheader.jsp"></c:import>
		<section>
			<form method="get" action="check.action" name="officeform">
				<input type="hidden" name="year" id="year" value="0" />
				<div id="sub">
					<!--  검색 버튼 영역 -->
					<div id="title">
						<h2>
							<span class="attend">출퇴근 체크</span>
						</h2>
					</div>
					<hr />
					<div class="mar10 pad10 box_soft">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_layout">
							<tr>
								<td width="220">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr style="text-align: center">
											<td height="18" class="bold txt_ce">
												<div id="liClockDateStr"></div>
											</td>
										</tr>
										<tr style="text-align: center">
											<td class="bold txt_ce pad3tb f28 verd vt">
												<div id="liClockTimeStr"></div>
											</td>
										</tr>
										<tr>
											<td colspan="2" class="txt_ce pad3tb bgcolor3">
												현재 접속 IP :
												<span class="org">${ userIp }</span>
											</td>
										</tr>
										
									</table>
								</td>
								<td width="10">&nbsp;</td>
								<td class="nobr text_overf">
									<div>
										<input type="checkbox" id="OfficeOut" name="OfficeOut" value="Y" class="vm"/> 외근 출퇴근 시에는 체크박스를 체크해주세요.
									</div>
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="90" >
												<div  class="pad2tb">
													<span class='btn_page2'>
														<img width="40px" src='/groupware/resources/image/work.png' onclick="checkwork(1);" /> 출근
													</span>
												</div>
											</td>
											<!-- 출근 입력 시각 -->
											<td class="vm pad3t">
												<input id="textfield" name="textfield" type="text" class="input" style="width:98%" value='${workdate eq null ? "-":workdate}' readonly />
											</td>
										</tr>
										<tr>
											<td height="5" colspan="2"></td>
										</tr>
										<tr>
											<td width="90">
												<div class="pad2tb">
													<span class='btn_page2'>
																<img width="40px" src='/groupware/resources/image/home.png' onclick="checkwork(2);" /> 퇴근
													</span>
												</div>
											</td>
											<td class="vm pad3t">
												<input id="textfield2" type="text" name="textfield2" class="input" style="width: 98%" value='${homedate eq null ? "-":homedate}' readonly />
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</form>
			<br />
			<form method="get" action="check.action" name="calendar">
			<c:choose>
				<c:when test="${ ryear != null }">
					<c:set var="date" value="${ rdate }" />
					<c:set var="currentYear" value="${ ryear }" />
					<c:set var="currentMonth" value="${ rmonth }" />
					<c:set var="currentDate" value="1" />
					<c:set var="currentDay" value="${ currentDay }" />
				</c:when>
				<c:otherwise>
					<c:set var="date" value="${ date }" />
					<c:set var="currentYear" value="${ currentYear }" />
					<c:set var="currentMonth" value="${ currentMonth }" />
					<c:set var="currentDate" value="${ currentDate }" />
					<c:set var="currentDay" value="${ currentDay }" />
				</c:otherwise>
			</c:choose>
			<c:set var="dateString" value="${ dateString }" />
			<c:set var="lastDate" value="${ lastDate }" />
			<c:if test="${(currentYear % 4 == 0 && currentYear % 100 != 0) || currentYear % 400 == 0}">			
				${ lastDate[1] = 29 }
			</c:if>
			<c:set var="currentLastDate" value="${ lastDate[currentMonth-1] }"/>
			<c:set var="week" value="${((( currentDay + currentLastDate )/7) + (1-((( currentDay + currentLastDate )/7)%1))%1)+1}" />
				<div id="header" class="kheader">
					<span id="date">${ currentYear }년 ${ currentMonth }월</span>
				</div>
				<div class="sheader">
					
					<select name="yyear" style="WIDTH: 60px" class="sinput" onchange="submit();"> 
						<option value='2008' ${ currentYear==2008 ? "selected":"" } >2008</option>
						<option value='2009' ${ currentYear==2009 ? "selected":"" } >2009</option>
						<option value='2010' ${ currentYear==2010 ? "selected":"" } >2010</option>
						<option value='2011' ${ currentYear==2011 ? "selected":"" } >2011</option>
						<option value='2012' ${ currentYear==2012 ? "selected":"" } >2012</option>
						<option value='2013' ${ currentYear==2013 ? "selected":"" } >2013</option>
						<option value='2014' ${ currentYear==2014 ? "selected":"" } >2014</option>
						<option value='2015' ${ currentYear==2015 ? "selected":"" } >2015</option>
					</select>
					년
					<select name="mmonth" style="WIDTH: 60px" class="sinput" onchange="submit();"> 
						<option value='1' ${ currentMonth==1 ? "selected":"" } >1</option>
						<option value='2' ${ currentMonth==2 ? "selected":"" } >2</option>
						<option value='3' ${ currentMonth==3 ? "selected":"" } >3</option>
						<option value='4' ${ currentMonth==4 ? "selected":"" } >4</option>
						<option value='5' ${ currentMonth==5 ? "selected":"" } >5</option>
						<option value='6' ${ currentMonth==6 ? "selected":"" } >6</option>
						<option value='7' ${ currentMonth==7 ? "selected":"" } >7</option>
						<option value='8' ${ currentMonth==8 ? "selected":"" } >8</option>
						<option value='9' ${ currentMonth==9 ? "selected":"" } >9</option>
						<option value='10' ${ currentMonth==10 ? "selected":"" } >10</option>
						<option value='11' ${ currentMonth==11 ? "selected":"" } >11</option>
						<option value='12' ${ currentMonth==12 ? "selected":"" } >12</option>
					</select>
					월
				</div>
				 <hr/>
				 
			<table border="0" cellspacing="0" cellpadding="0" class="cal" style="width:99%">
					<thead>
						<tr>
						  <th class="sun" scope="row">일</th>
						  <th class="mon" scope="row">월</th>
						  <th class="tue" scope="row">화</th>
						  <th class="wed" scope="row">수</th>
						  <th class="thu" scope="row">목</th>
						  <th class="fri" scope="row">금</th>
						  <th class="sat" scope="row">토</th>
						</tr>
						
					</thead>
					
					<tbody>
			<c:set var="dateNum" value="${ 1 - currentDay }"></c:set>
			<c:if test="${ dateNum eq 2 }">
				<c:set var="dateNum" value="-6"></c:set>
			</c:if>
			<c:forEach begin="0" end="${ week +1 }" step="1">
								<tr>
									<c:forEach var="j" begin="1" end="7" step="1">
										<c:set var="dateNum" value="${ dateNum=dateNum+1 }"></c:set>
										<c:choose>
											<c:when test="${dateNum < 1 || dateNum > currentLastDate}">
												<td class="${ dateString[j-1] }"></td>
											</c:when>
											<c:otherwise>
												<td class="${ dateString[j-1] }">${dateNum}<br />
														<c:forEach var="allAtt" items="${ all }">
															<c:if test="${ dateNum eq allAtt.days && currentYear eq allAtt.years && currentMonth eq allAtt.months }">
																				 ${ allAtt.classify } : ${ allAtt.hours }시 ${ allAtt.minutes }분 <br />
															</c:if>
														</c:forEach>
													</td>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</tr>
			</c:forEach>
						</tbody>
			</table>
			</form>
		</section>
		<script language="javascript">
			var clientTimeStamp = new Date().getTime();
			var timeDistance = 1430114935795 - clientTimeStamp;
			
			function jsClock(){
				var nowTimeStamp	= new Date();
				var clockTime		= new Date(nowTimeStamp);
				var clockHours		= clockTime.getHours();
				var clockMinutes	= clockTime.getMinutes();
				var clockSeconds	= clockTime.getSeconds();
				var weekArr = new Array(
					'일요일', 
					'월요일', 
					'화요일', 
					'수요일', 
					'목요일', 
					'금요일', 
					'토요일' 
				);
				//var clockYear		= clockTime.getYear();	// IE ○, FF ×
				var clockYear		= clockTime.getFullYear();	
				var clockMonth		= clockTime.getMonth()+1;
				var clockDay		= clockTime.getDate();
			
				if (clockHours < 10)
					clockHours = "0" + clockHours;
			
				if (clockMinutes < 10)
					clockMinutes = "0" + clockMinutes;
			
				if (clockSeconds < 10)
					clockSeconds = "0" + clockSeconds;
			
				var liClockTimeStr = document.getElementById('liClockTimeStr');
				var liClockDateStr = document.getElementById('liClockDateStr');
				
				liClockTimeStr.innerHTML = clockHours + ":" + clockMinutes + ":" + clockSeconds;
				liClockDateStr.innerHTML = clockYear + "년 ";
				liClockDateStr.innerHTML += clockMonth + "월 ";
				liClockDateStr.innerHTML += clockDay + "일 " + weekArr[clockTime.getDay()];
			
				setTimeout("jsClock()", 1000);
			}
			
			var useJsClock = Boolean('1');
			
			if ( useJsClock ) { jsClock();}
		</script>

</body>
</html>
