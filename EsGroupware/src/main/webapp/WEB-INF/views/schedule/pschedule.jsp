<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="Stylesheet" href="/groupware/resources/styles/pschedule.css" />
	<link rel="Stylesheet" href="/groupware/resources/styles/scalendar.css" >
	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>일정관리</title>
	<script type="text/javascript">
	 	$(document).ready(function(){
			    $('#yyear').change(function(e) {
			        $.ajax({
			            type: "post",
			            url: "pschedule2.action",
			            data: $('#calendar').serialize(),
			            success: function(result,status,xhr){
			            	$("#calendarContainer").html(result)
			            },
			            error: function(xhr, status, er){}
			        });
			        e.preventDefault();
			    });
			    $('#mmonth').change(function(e) {
			        $.ajax({
			            type: "post",
			            url: "pschedule2.action",
			            data: $('#calendar').serialize(),
			            success: function(result,status,xhr){
			            	$("#calendarContainer").html(result)
			            },
			            error: function(xhr, status, er){}
			        });
			        e.preventDefault();
			    });
			    
			    $('#minus').click(function(e){
			    	$.ajax({
			    		type:"post",
			    		url: "pschedule2.action",
			    		data:{ "yyear": $("#yyear").val(), "mmonth":$("#mmonth").val()-1  },
			    		async : true,
			            success: function(result,status,xhr){
			            	$("#calendarContainer").html(result)
			            },
			            error: function(xhr, status, er){
			            	alert(xhr+"/"+status+"/"+er)
			            }
			    	});
			    })
		});
	</script>
</head>
<body>
	<c:import url="/WEB-INF/views/schedule/scheduleheader.jsp"></c:import>
	<section>
		<div id="sub">
			<div id="title">
				<h2>
					<span class="sched" >개인일정 &gt;
			        <font color="0073BD">월간일정</font></span>
			    </h2>
			</div>
			<div class="toparea">		
				<div class="leftarea" style="width:50%;">
					<span class="tab"><a href="index.php?action=schedule_day&year=2015&month=7&day=23&auth=PRIVATE&schedule_open=">DAY</a></span>
					<span class="tab"><a href="index.php?action=schedule_week&year=2015&month=7&day=23&auth=PRIVATE&schedule_open=">WEEK</a></span>
					<span class="selected"><a href="">MONTH</a></span>
					<span class="tab"><a href="index.php?action=schedule_year&year=2015&month=7&day=23&auth=PRIVATE&schedule_open=">YEAR</a></span>
				</div>
				<div class="rightarea" style="width:250px;">
					<span class="btn">
						<span><a href="#" onclick="quickAddFormView();"><img src="/groupware/resources/image/plus.png" border="0" /> 빠른 일정추가</a></span>	
						<span><a href="index.php?action=schedule_addform&schedule_type=schedule_month&year=2015&month=7&day=23&auth=PRIVATE&schedule_open=" ><img src="/groupware/resources/image/plus.png" border="0" /> 일정추가</a></span>
					</span>
				</div>
			</div>

			<form id="calendar">
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
						<div style="width:0;height:0;display: none">${ lastDate[1] = 29 }</div>
					</c:if>
					<c:set var="currentLastDate" value="${ lastDate[currentMonth-1] }"/>
					<c:set var="week" value="${((( currentDay + currentLastDate )/7) + (1-((( currentDay + currentLastDate )/7)%1))%1)+1}" />
						<div class="sheader">
							<select id="yyear" name="yyear" style="WIDTH: 60px" class="sinput"> 
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
							<select id="mmonth" name="mmonth" style="WIDTH: 60px" class="sinput"> 
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
						 
				<div id="calendarContainer">
					<div class="today">
						<div class="left big bold">
							<img id="minus" src="/groupware/resources/image/left.png" width="11" height="11" border="0">
							${ currentYear }년 ${ currentMonth }월 ${ currentDate }일
							<img id="plus" src="/groupware/resources/image/right.png" width="11" height="11" border="0">
						</div>
					</div>
					<hr/>
					<table border="1" cellspacing="0" cellpadding="0" class="cal" style="width:99%">
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
							<c:set var="dateNum" value="${ 1-currentDay }"></c:set>
							<c:if test="${ dateNum eq 2 }">
								<c:set var="dateNum" value="-5"></c:set>
							</c:if>
							<c:forEach begin="0" end="${ week +1 }" step="1">
								<tr>
									<c:forEach var="j" begin="1" end="7" step="1">
										<c:choose>
											<c:when test="${dateNum < 1 || dateNum > currentLastDate}">
												<td class="${ dateString[j-1] }"></td>
											</c:when>
											<c:otherwise>
												<td class="${ dateString[j-1] }" height="70" align="left" valign="top">${dateNum}<a href="index.php?action=schedule_addform&schedule_type=schedule_month&year=2015&month=7&day=1&auth=PRIVATE&schedule_open="><font class="org8"><img class="plus" src="/groupware/resources/image/cal_plus.png" align="absmiddle" border="0"  /></font></a>
												<br />
												</td>
											</c:otherwise>
										</c:choose>
										<c:set var="dateNum" value="${ dateNum=dateNum+1 }"></c:set>
									</c:forEach>
								</tr>
							</c:forEach>
					</table>
				</div>
			</form>
		</div>
	</section>
</body>
</html>