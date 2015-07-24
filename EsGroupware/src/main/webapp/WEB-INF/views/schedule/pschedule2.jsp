<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
			<tbody>
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
			</tbody>
			</table>