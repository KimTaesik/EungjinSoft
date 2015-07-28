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
			    	var y = $("#currentYear").val();
			    	var m = $("#currentMonth").val()-1;
			    	if(m==0){
			    		m=12;
			    		y-=1;
			    	}
			    	$.ajax({
			    		type:"post",
			    		url: "pschedule2.action",
			    		data:{ "yyear": y, "mmonth":m  },
			    		async : true,
			            success: function(result,status,xhr){
			            	$("#currentMonth").val(m);
			            	$("#currentYear").val(y);
			            	$("#calendarContainer").html(result)
			            },
			            error: function(xhr, status, er){
			            	alert(xhr+"/"+status+"/"+er)
			            }
			    	});
			    })
			    
			    $('#plus').click(function(e){
			    	var y = $("#currentYear").val();
			    	var m = parseInt($("#currentMonth").val())+parseInt(1);
			    	if(m>12){
			    		m=1;
			    		y=parseInt(y)+parseInt(1);
			    	}
			    	$.ajax({
			    		type:"post",
			    		url: "pschedule2.action",
			    		data:{ "yyear": y, "mmonth": m  },
			    		async : true,
			            success: function(result,status,xhr){
			            	$("#currentMonth").val(m);
			            	$("#currentYear").val(y);
			            	$("#calendarContainer").html(result)
			            },
			            error: function(xhr, status, er){
			            	alert(xhr+"/"+status+"/"+er)
			            }
			    	});
			    })
			    
			    $("#add_sc").click(function(){
					var url = 'addScheduleForm.action?dayid='+${currentMonth}+"-"+${ currentDate}+"&year="+${ currentYear };
					$(location).attr('href', url);
				});
				
			    $("#quick_add").click(function(){
			    	$("#quickaddform").show();
				});
			    $("#quick_add_submit").click(function(){
			    	
			    	$("#quickaddform").hide();
				});
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
					<span class="tab"><a href="#">DAY</a></span>
					<span class="tab"><a href="#">WEEK</a></span>
					<span class="selected"><a href="#">MONTH</a></span>
					<span class="tab"><a href="#">YEAR</a></span>
				</div>
				<div class="rightarea">
					<span class="btn">
						<span><a id="quick_add" href="#"><img src="/groupware/resources/image/plus.png" border="0" /> 빠른 일정추가</a></span>
						<span><a id="add_sc" href="#"><img src="/groupware/resources/image/plus.png" border="0" /> 일정추가</a></span>
					</span>
				</div>
			</div>
			<div id="quickaddform" class="mar5t" hidden>
				<form id="quickadd">
					<table width="100%" height="30" border="0" cellpadding="0" cellspacing="1" bgcolor="81A5C8">
						<input type="hidden" name="schedule_type" value="schedule_month">
						<input type="hidden" name="auth" value="PRIVATE">
						<input type="hidden" name="groupkey" value="">
						<input type="hidden" name="schedule_open" value="">
				        	<tr>
				        		<td bgcolor="EBF6FD" class="padding10w"> 
					    		<table width="100%" border="0" cellspacing="0" cellpadding="0">
				        			<tr>
				        				<td height="14">제목
				                      		<input name="schedule_title" type="text" class="blueinput" style="width:300px">
				                    	</td>
					                    <td align="right">
											<select name="year" class="input">
					                        	<option value="2013" ${ currentYear==2013 ? "selected":"" }>2013</option>
												<option value="2014" ${ currentYear==2014 ? "selected":"" }>2014</option>
												<option value="2015" ${ currentYear==2015 ? "selected":"" }>2015</option>
												<option value="2016" ${ currentYear==2016 ? "selected":"" }>2016</option>
												<option value="2017" ${ currentYear==2017 ? "selected":"" }>2017</option>
											</select>년
											<select name="month" class="input">
					                        	<option value="1" ${ currentMonth==1 ? "selected":"" }>1</option>
					                        	<option value="2" ${ currentMonth==2 ? "selected":"" }>2</option>
					                        	<option value="3" ${ currentMonth==3 ? "selected":"" }>3</option>
					                        	<option value="4" ${ currentMonth==4 ? "selected":"" }>4</option>
					                        	<option value="5" ${ currentMonth==5 ? "selected":"" }>5</option>
					                        	<option value="6" ${ currentMonth==6 ? "selected":"" }>6</option>
					                        	<option value="7" ${ currentMonth==7 ? "selected":"" }>7</option>
					                        	<option value="8" ${ currentMonth==8 ? "selected":"" }>8</option>
					                        	<option value="9" ${ currentMonth==9 ? "selected":"" }>9</option>
					                        	<option value="10" ${ currentMonth==10 ? "selected":"" }>10</option>
					                        	<option value="11" ${ currentMonth==11 ? "selected":"" }>11</option>
					                        	<option value="12" ${ currentMonth==12 ? "selected":"" }>12</option>
											</select>월
					                      	<select name="day" class="input">
					                        	<option value="1" ${ currentDate==1 ? "selected":"" }>1</option>
					                        	<option value="2" ${ currentDate==2 ? "selected":"" }>2</option>
					                        	<option value="3" ${ currentDate==3 ? "selected":"" }>3</option>
					                        	<option value="4" ${ currentDate==4 ? "selected":"" }>4</option>
					                        	<option value="5" ${ currentDate==5 ? "selected":"" }>5</option>
					                        	<option value="6" ${ currentDate==6 ? "selected":"" }>6</option>
					                        	<option value="7" ${ currentDate==7 ? "selected":"" }>7</option>
					                        	<option value="8" ${ currentDate==8 ? "selected":"" }>8</option>
					                        	<option value="9" ${ currentDate==9 ? "selected":"" }>9</option>
					                        	<option value="10"${ currentDate==10 ? "selected":"" }>10</option>
					                        	<option value="11"${ currentDate==11 ? "selected":"" }>11</option>
					                        	<option value="12"${ currentDate==12 ? "selected":"" }>12</option>
					                        	<option value="13"${ currentDate==13 ? "selected":"" }>13</option>
					                        	<option value="14"${ currentDate==14 ? "selected":"" }>14</option>
					                        	<option value="15"${ currentDate==15 ? "selected":"" }>15</option>
					                        	<option value="16"${ currentDate==16 ? "selected":"" }>16</option>
					                        	<option value="17"${ currentDate==17 ? "selected":"" }>17</option>
					                        	<option value="18"${ currentDate==18 ? "selected":"" }>18</option>
					                        	<option value="19"${ currentDate==19 ? "selected":"" }>19</option>
					                        	<option value="20"${ currentDate==20 ? "selected":"" }>20</option>
					                        	<option value="21"${ currentDate==21 ? "selected":"" }>21</option>
					                        	<option value="22"${ currentDate==22 ? "selected":"" }>22</option>
					                        	<option value="23"${ currentDate==23 ? "selected":"" }>23</option>
					                        	<option value="24"${ currentDate==24 ? "selected":"" }>24</option>
					                        	<option value="25"${ currentDate==25 ? "selected":"" }>25</option>
					                        	<option value="26"${ currentDate==26 ? "selected":"" }>26</option>
					                        	<option value="27"${ currentDate==27 ? "selected":"" }>27</option>
					                        	<option value="28"${ currentDate==28 ? "selected":"" }>28</option>
					                        	<option value="29"${ currentDate==29 ? "selected":"" }>29</option>
					                        	<option value="30"${ currentDate==30 ? "selected":"" }>30</option>
					                        	<option value="31"${ currentDate==31 ? "selected":"" }>31</option>
					                      	</select>일
					                      	<select name="hour" class="input">
					                        	<option value="" selected="">하루</option>
												<option value="0">자정</option>
					                        	<option value="1">오전 1</option>
					                        	<option value="2">오전 2</option>
					                        	<option value="3">오전 3</option>
					                        	<option value="4">오전 4</option>
					                        	<option value="5">오전 5</option>
					                        	<option value="6">오전 6</option>
					                        	<option value="7">오전 7</option>
					                        	<option value="8">오전 8</option>
					                        	<option value="9">오전 9</option>
					                        	<option value="10">오전 10</option>
					                        	<option value="11">오전 11</option>
					                        	<option value="12">정오 12</option>
					                        	<option value="13">오후 1</option>
					                        	<option value="14">오후 2</option>
					                        	<option value="15">오후 3</option>
					                        	<option value="16">오후 4</option>
					                        	<option value="17">오후 5</option>
					                        	<option value="18">오후 6</option>
					                        	<option value="19">오후 7</option>
					                        	<option value="20">오후 8</option>
					                        	<option value="21">오후 9</option>
					                        	<option value="22">오후 10</option>
					                        	<option value="23">오후 11</option>
					                      	</select>시
					                      	<select name="min" class="input">
					                      		<option value="0" selected="">00</option>
					                        	<option value="15">15</option>
					                        	<option value="30">30</option>
					                        	<option value="45">45</option>
					                      	</select>분
					                      	<input id="quick_add_submit" type="image" src="/groupware/resources/image/addsc.png" width="36" height="15" align="absmiddle" border="0">
										</td>
									</tr>
				                </table>
				               </td>
				            </tr>	  
				         </table>
						<br>
					</form>
				</div>
				<%-- 빠른추가잼 --%>
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
					<div class="today">
						<div class="center big bold">
							이전달<img class="cursor" id="minus" src="/groupware/resources/image/left.png" width="11" height="11" border="0">
							다음달
							<img class="cursor" id="plus" src="/groupware/resources/image/right.png" width="11" height="11" border="0">
						</div>
						<input type="hidden" id="currentMonth" value="${ currentMonth }">
						<input type="hidden" id="currentYear" value="${ currentYear }">
					</div>
				<div id="calendarContainer">
					<div id="header" class="kheader">
						<span id="date">${ currentYear }년 ${ currentMonth }월</span>
					</div>
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
												<td class="${ dateString[j-1] }" height="70" align="left" valign="top">
													<font class="org8">${dateNum}<img class="plus" id="${ currentMonth }-${dateNum}" src="/groupware/resources/image/cal_plus.png" border="0"  /></font>
													<br />
												</td>
											</c:otherwise>
										</c:choose>
										<c:set var="dateNum" value="${ dateNum=dateNum+1 }"></c:set>
									</c:forEach>
								</tr>
							</c:forEach>
					</table>
					<script type="text/javascript">
					    $(".plus").click(function(){
							var id = $(this).attr('id');
							var url = 'addScheduleForm.action?dayid='+id+"&year="+${ currentYear };
							$(location).attr('href', url);
						});
					</script>
				</div>
			</form>
		</div>
	</section>
</body>
</html>