<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

			<c:set var="date" value="${ date }" />
			<c:set var="currentYear" value="${ currentYear }" />
			<c:set var="currentMonth" value="${ currentMonth }" />
			<c:set var="currentDate" value="${ currentDate }" />
			<c:set var="currentDay" value="${ currentDay }" />
			<c:set var="dateString" value="${ dateString }" />
			<c:set var="lastDate" value="${ lastDate }" />
			<c:set var="cate" value="${ cate }" />
			<c:set var="scList" value="${ scList }"/>
			
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
													<font class="org8">${dateNum}<img class="plus cursor" id="${currentMonth}-${dateNum}" src="/groupware/resources/image/cal_plus.png" border="0"  /></font>
													<br />
														<c:forEach var="scList" items="${ scList }">
														<c:choose>
															<c:when test="${ dateNum eq scList.date && currentYear eq scList.year && currentMonth eq scList.month }">
													          <c:choose>
													          	<c:when test="${cate eq 'ps'}">
													          		<c:if test="${ scList.category eq '개인일정' || scList.category eq '공개일정' }">
													          			<c:choose>
															          		<c:when test="${fn:length(scList.title) > 4}">
															          			<div class="cursor uDate" id="${scList.key}" title="${ scList.cont }">[${ scList.makepublic }] ${fn:substring(fn:replace(scList.title, rn, br),0,4)}....</div>
															          		</c:when>
															          		<c:otherwise>
															          			<div class="cursor uDate" id="${scList.key}" title="${ scList.cont }">[${ scList.makepublic }] ${fn:substring(fn:replace(scList.title, rn, br),0,4)}</div>
															          		</c:otherwise>
														          		</c:choose>
													          		</c:if>
												          		</c:when>
													          	<c:when test="${cate eq 'pus' and scList.makepublic eq 'open' }">
												          			<c:choose>
														          		<c:when test="${fn:length(scList.title) > 4}">
														          			<div class="cursor uDate" id="${scList.key}" title="${ scList.cont }">[${ scList.makepublic }] ${fn:substring(fn:replace(scList.title, rn, br),0,4)}....</div>
														          		</c:when>
														          		<c:otherwise>
														          			<div class="cursor uDate" id="${scList.key}" title="${ scList.cont }">[${ scList.makepublic }] ${fn:substring(fn:replace(scList.title, rn, br),0,4)}</div>
														          		</c:otherwise>
													          		</c:choose>
												          		</c:when>
												          		<c:when test="${cate eq 'ts' and scList.dept eq scList.makepublic }">
												          			<c:choose>
														          		<c:when test="${fn:length(scList.title) > 4}">
														          			<div class="cursor uDate" id="${scList.key}" title="${ scList.cont }">[${ scList.makepublic }] ${fn:substring(fn:replace(scList.title, rn, br),0,4)}....</div>
														          		</c:when>
														          		<c:otherwise>
														          			<div class="cursor uDate" id="${scList.key}" title="${ scList.cont }">[${ scList.makepublic }] ${fn:substring(fn:replace(scList.title, rn, br),0,4)}</div>
														          		</c:otherwise>
													          		</c:choose>
												          		</c:when>
												          		<c:when test="${cate eq 'cs' and scList.category eq '회사일정' }">
												          			<c:choose>
														          		<c:when test="${fn:length(scList.title) > 4}">
														          			<div class="cursor uDate" id="${scList.key}" title="${ scList.cont }">[회사일정] ${fn:substring(fn:replace(scList.title, rn, br),0,4)}....</div>
														          		</c:when>
														          		<c:otherwise>
														          			<div class="cursor uDate" id="${scList.key}" title="${ scList.cont }">[회사일정] ${fn:substring(fn:replace(scList.title, rn, br),0,4)}</div>
														          		</c:otherwise>
													          		</c:choose>
												          		</c:when>
													          </c:choose>
															</c:when>
															<c:otherwise>
																<c:set var="tempdate" value="${currentYear}-${currentMonth<10?'0':''}${currentMonth}-${dateNum<10?'0':''}${dateNum}"/>
																<c:if test="${ scList.repeat == 1 }">
																	<c:forEach var="scTemp" items="${ scList.scTemp }">
																		<c:if test="${ scTemp == tempdate }">
																	          <c:choose>
																	          	<c:when test="${cate eq 'ps'}">
																	          		<c:if test="${ scList.category eq '개인일정' || scList.category eq '공개일정' }">
																	          			<c:choose>
																			          		<c:when test="${fn:length(scList.title) > 4}">
																			          			<div class="cursor uDate" id="${scList.key}" title="${ scList.cont }">[${ scList.makepublic }] ${fn:substring(fn:replace(scList.title, rn, br),0,4)}....</div>
																			          		</c:when>
																			          		<c:otherwise>
																			          			<div class="cursor uDate" id="${scList.key}" title="${ scList.cont }">[${ scList.makepublic }] ${fn:substring(fn:replace(scList.title, rn, br),0,4)}</div>
																			          		</c:otherwise>
																		          		</c:choose>
																	          		</c:if>
																          		</c:when>
																	          	<c:when test="${cate eq 'pus' and scList.makepublic eq 'open' }">
																          			<c:choose>
																		          		<c:when test="${fn:length(scList.title) > 4}">
																		          			<div class="cursor uDate" id="${scList.key}" title="${ scList.cont }">[${ scList.makepublic }] ${fn:substring(fn:replace(scList.title, rn, br),0,4)}....</div>
																		          		</c:when>
																		          		<c:otherwise>
																		          			<div class="cursor uDate" id="${scList.key}" title="${ scList.cont }">[${ scList.makepublic }] ${fn:substring(fn:replace(scList.title, rn, br),0,4)}</div>
																		          		</c:otherwise>
																	          		</c:choose>
																          		</c:when>
																          		<c:when test="${cate eq 'ts' and scList.dept eq scList.makepublic }">
																          			<c:choose>
																		          		<c:when test="${fn:length(scList.title) > 4}">
																		          			<div class="cursor uDate" id="${scList.key}" title="${ scList.cont }">[${ scList.makepublic }] ${fn:substring(fn:replace(scList.title, rn, br),0,4)}....</div>
																		          		</c:when>
																		          		<c:otherwise>
																		          			<div class="cursor uDate" id="${scList.key}" title="${ scList.cont }">[${ scList.makepublic }] ${fn:substring(fn:replace(scList.title, rn, br),0,4)}</div>
																		          		</c:otherwise>
																	          		</c:choose>
																          		</c:when>
																          		<c:when test="${cate eq 'cs' and scList.category eq '회사일정' }">
																          			<c:choose>
																		          		<c:when test="${fn:length(scList.title) > 4}">
																		          			<div class="cursor uDate" id="${scList.key}" title="${ scList.cont }">[회사일정] ${fn:substring(fn:replace(scList.title, rn, br),0,4)}....</div>
																		          		</c:when>
																		          		<c:otherwise>
																		          			<div class="cursor uDate" id="${scList.key}" title="${ scList.cont }">[회사일정] ${fn:substring(fn:replace(scList.title, rn, br),0,4)}</div>
																		          		</c:otherwise>
																	          		</c:choose>
																          		</c:when>
																	          </c:choose>
																		</c:if>	
																	</c:forEach>
																</c:if>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</td>
											</c:otherwise>
										</c:choose>
									<c:set var="dateNum" value="${ dateNum=dateNum+1 }"></c:set>
								</c:forEach>
							</tr>
						</c:forEach>
			</table>
					<script type="text/javascript">
						$(function(){
						    $(".plus").click(function(){
						    	var z = $("#cate").val();
								var id = $(this).attr('id');
								var y = $("#currentYear").val();
/* 								var url = 'addScheduleForm.action?dayid='+id+"&year="+${ currentYear }+"&cate="+cate;
								$(location).attr('href', url); */
								
						    	$.ajax({
						    		type:"post",
						    		url: "/groupware/schedule/addScheduleForm.action",
						    		data:{ "year": y, "dayid": id, "cate":z  },
						    		async : true,
						            success: function(result,status,xhr){
						            	$("#sub").html(result);
						            },
						            error: function(xhr, status, er){
						            	alert(xhr+"/"+status+"/"+er)
						            }
						    	});
							});
						    
						    $(".uDate").click(function(){
						    	var z = $("#cate").val();
						    	var id = $(this).attr('id');
						    	$.ajax({
						    		type:"post",
						    		url: "/groupware/schedule/editScheduleForm.action",
						    		data:{ "key": id, "cate":z  },
						    		async : true,
						            success: function(result,status,xhr){
						            	$("#sub").html(result);
						            },
						            error: function(xhr, status, er){
						            	alert(xhr+"/"+status+"/"+er)
						            }
						    	});
/* 								var url = 'editScheduleForm.action?key='+id+"&cate="+cate;
								$(location).attr('href', url); */
							});
						});
					</script>