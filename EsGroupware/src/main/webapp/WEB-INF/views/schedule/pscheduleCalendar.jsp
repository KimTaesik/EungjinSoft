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
												<td class="${ dateString[j-1] }" height="70" align="left" valign="top">
													<font class="org8">${dateNum}<img class="plus" id="${ currentMonth }-${dateNum}" src="/groupware/resources/image/cal_plus.png" border="0"  /></font>
													<br />
														<c:forEach var="scList" items="${ scList }">
															<c:if test="${ dateNum eq scList.date && currentYear eq scList.year && currentMonth eq scList.month }">
																				 ${ scList.title } : ${ scList.cont }<br />
															</c:if>
														</c:forEach>
												</td>
											</c:otherwise>
										</c:choose>
										<c:set var="dateNum" value="${ dateNum=dateNum+1 }"></c:set>
									</c:forEach>
								</tr>
			</c:forEach>
			</tbody>
			</table>
					<script type="text/javascript">
					    $(".plus").click(function(){
							var id = $(this).attr('id');
							var url = 'addScheduleForm.action?dayid='+id+"&year="+${ currentYear };
							$(location).attr('href', url);
						});
					</script>