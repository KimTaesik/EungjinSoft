<%@page import="com.groupware.dto.Employee"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="Stylesheet" href="/groupware/resources/styles/attendanceframe.css" />
	<title>근태</title>
	<script type="text/javascript">
		function selectSearchTerm(day) {
			var date = new Date();
			var endYear = date.getFullYear();
			var endMonth = checkNum(date.getMonth()+1);
			var endDate = checkNum(date.getDate());
			var endDate = endYear + '-' + endMonth + '-' + endDate;
			
			if(day == 'year'){
				var newDate = new Date(endYear,0,1);
			}else{
				var newDate = new Date(endYear,date.getMonth(),date.getDate()-day);			
			}
		
			var startYear = newDate.getFullYear();
			var startMonth = checkNum(newDate.getMonth()+1);
			var startDate = checkNum(newDate.getDate());
			var startDate = startYear + '-' + startMonth + '-' + startDate;
			
			var frm = document.forms[0];
			frm.EndDate.value = endDate;
			frm.StartDate.value = startDate;
			frm.submit();
			
		}
		function checkNum(num){
			if(num<10){
				num = '0'+num;
			}
			return num;
		}
	
		function showSearchField(select){	
			if(select.value == 'Name'){
				document.getElementById('searchFieldTreeKey').style.display="none";
				document.getElementById('searchFieldName').style.display="block";			
				
			}else if (select.value == 'TreeKey'){
				document.getElementById('searchFieldName').style.display="none";	
				document.getElementById('searchFieldTreeKey').style.display="block";
			}else{
				document.getElementById('searchFieldName').style.display="none";	
				document.getElementById('searchFieldTreeKey').style.display="none";
			}
		}
	
		function chk(compare){
			if(compare.length>1){
				alert("검색범위를 잘못 입력하셨습니다. 다시 시도해주세요.");
			}
		}
	</script>
</head>
<body onload="chk('${ chk ne null ? true : '' }');">
	<c:import url="/WEB-INF/views/include/attheader.jsp" />
		<section>
			<form action="restatistic.action" method="post">
				<div>
					<!--  검색 버튼 영역 -->
					<div id="title">
						<h2><span class="attend ">출퇴근 통계</span></h2>
					</div>
					<hr />
					<div class="table_view mar10t">
						<table width="100%"  border="0" cellspacing="0" cellpadding="0">
							<col width="100px"></col>
							<col></col>
							<thead>
								<tr>
									<th>검색기간</th>
									<td>
										<span class="left">
											<input name="startDate" type="date" id="StartDate" value="${start}"  />
											~ 
											<input name="endDate" type="date" id="EndDate"  value="${end}"/>
										</span>
	<!--  								<div class="btn_page left mar5l vm">
										<a href="" onclick="selectSearchTerm(3);">
											<span>3일</span>
										</a>
									</div>
									<div class="btn_page left mar3l vm">
										<a href="" onclick="selectSearchTerm(7);">
											<span>7일</span>
										</a>
									</div>
									<div class="btn_page left mar3l vm">
										<a href="" onclick="selectSearchTerm(30);">
											<span>30일</span>
										</a>
									</div>
									<div class="btn_page left mar3l vm">
										<a href="" onclick="selectSearchTerm('year');">
											<span>2015년</span>
										</a>
									</div> -->
									</td>
								</tr>			
							</thead>
							<tbody>				
								<tr>
									<th>검색구분</th>
									<td>
	<%-- 								<div class="left"> 
										<input type="radio" name="searchType" value="User" checked onclick="document.form.submit();" class="vm" />
										<span class="vm">
											직원별
										</span>
										<input type="radio" name="searchType" value="TreeKey"  onclick="document.form.submit();" class="vm" />
										<span class="vm">
											부서별
										</span>
										
										<select name="Exception" onchange="document.form.submit();" class="vm">
											<option value="Y">퇴사자 미포함</option>
											<option value="" selected>퇴사자 포함</option>				
										</select>	
										
									</div> --%>					
									<div class="left pad1tb pad5l">
										<select name="searchKey" onchange="showSearchField(this);" class="left">
											<option value="">전체보기</option>
											<option value="Name" >
												이름
											</option>
											<option value="TreeKey" >
												부서
											</option>
										</select>	
										<input type="text" name="searchName" id="searchFieldName" class="left input mar5l" 
												value=""
												style="display:none;" 
												onkeydown="if(event.keyCode==13) {document.form.submit();} ">
										<select name="searchTreeKey" id="searchFieldTreeKey" class="left mar5l" style="display:none;">
											<option value='' ></option>
											<option value='001' > L 경영지원팀</option>
											<option value='002' > L 개발2팀</option>
											<option value='003' > L 개발1팀</option>
											<option value='004' > L 마케팅팀</option>
											<option value='005' > L 임원</option>
											<option value='006' > L 인사과</option>
										</select>
										</div>
										<div class="btn_page left mar5l">
											<a href="javascript:document.forms[0].submit();" >
												<span class="left vm"> 검색</span>
											</a>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="title">
					</div>
					<div class="table">
						<table width="99%"  border="0" cellspacing="0" cellpadding="0" class="table_layout bdr_top">
							<thead class="cmenu">
								<tr>
									<th height="28">
										<div class="no-bdr">
											<nobr>
												<table border="0" cellspacing="0" cellpadding="0"> 
													<thead>
														<tr>
															<td rowspan="2" height="22">
																<span class="pad5r">No</span></td>
															<td height="11" class="vb"></td>
														</tr>
														<tr>
															<td height="11" class="vt"></td>
														</tr>
													</thead>
												</table>
											</nobr>
										</div>
									</th>
									<th>
										<div class="no-bdr">
											<nobr>
												<table border="0" cellspacing="0" cellpadding="0"> 
													<thead>
														<tr>
															<td rowspan="2" height="22">
																<span class="pad5r">이름</span>
															</td>
															<td height="11" class="vb">
																<!-- <img src="/groupware/image/top.png" onclick="listSort('Name','ASC');" class="cursor" /> -->
															</td>
														</tr>
														<tr>
															<td height="11" class="vt">
																<!-- <img src="/groupware/image/bottom.png" onclick="listSort('Name','DESC');" class="cursor" /> -->
															</td>
														</tr>
													</thead>
												</table>
											</nobr>
										</div>
									</th>			
									<th>
										<div class="no-bdr">
											<nobr>
												<table border="0" cellspacing="0" cellpadding="0" align="center">
													<thead>
														<tr>
															<td rowspan="2" height="22"><span class="pad5r">부서</span></td>
															<!-- <td height="11" class="vb"><img src="/groupware/image/top.png" onclick="listSort('T.Title','ASC');" class="cursor" /></td> -->
														</tr>
														<tr>
															<!-- <td height="11" class="vt"><img src="/groupware/image/bottom.png" onclick="listSort('T.Title','DESC');" class="cursor" /></td> -->
														</tr>
													</thead>
												</table>
											</nobr>
										</div>
									</th>
									<th>		
										<div class="no-bdr">
											<nobr>
												<table border="0" cellspacing="0" cellpadding="0" align="center">
													<thead>
														<tr>
															<td rowspan="2" height="22"><span class="pad5r">정상출근</span></td>
															<!-- <td height="11" class="vb"><img src="/groupware/image/top.png" onclick="listSort('sum1','ASC');" class="cursor" /></td> -->
														</tr>
														<tr>
															<!-- <td height="11" class="vt"><img src="/groupware/image/bottom.png" onclick="listSort('sum1','DESC');" class="cursor" /></td> -->
														</tr>
													</thead>
												</table>
											</nobr>
										</div>
									</th>
									<th>
										<div class="no-bdr">
											<nobr>
												<table border="0" cellspacing="0" cellpadding="0" align="center">
													<thead>
														<tr>
															<td rowspan="2" height="22"><span class="pad5r">지각</span></td>
															<!-- <td height="11" class="vb"><img src="/groupware/image/top.png" onclick="listSort('sum2','ASC');" class="cursor" /></td> -->
														</tr>
														<tr>
															<!-- <td height="11" class="vt"><img src="/groupware/image/bottom.png" onclick="listSort('sum2','DESC');" class="cursor" /></td> -->
														</tr>
													</thead>
												</table>
											</nobr>
										</div>
									</th>
									<th>
										<div class="no-bdr">
											<nobr>
												<table border="0" cellspacing="0" cellpadding="0" align="center">
													<thead>
														<tr>
															<td rowspan="2" height="22"><span class="pad5r">조퇴</span></td>
															<!-- <td height="11" class="vb"><img src="/groupware/image/top.png" onclick="listSort('sum3','ASC');" class="cursor" /></td> -->
														</tr>
														<tr>
															<!-- <td height="11" class="vt"><img src="/groupware/image/bottom.png" onclick="listSort('sum3','DESC');" class="cursor" /></td> -->
														</tr>
													</thead>
												</table>
											</nobr>
										</div>
									</th>
									<th>
										<div class="no-bdr">
											<nobr>
												<table border="0" cellspacing="0" cellpadding="0" align="center">
													<thead>
														<tr>
															<td rowspan="2" height="22"><span class="pad5r">결근</span></td>
															<!-- <td height="11" class="vb"><img src="/groupware/image/top.png" onclick="listSort('sum4','ASC');" class="cursor" /></td> -->
														</tr>
														<tr>
															<!-- <td height="11" class="vt"><img src="/groupware/image/bottom.png" onclick="listSort('sum4','DESC');" class="cursor" /></td> -->
														</tr>
													</thead>
												</table>
											</nobr>
										</div>
									</th>
									<th>
										<div class="no-bdr">
											<nobr>
												<table border="0" cellspacing="0" cellpadding="0" align="center">
													<thead>
														<tr>
															<td rowspan="2" height="22"><span class="pad5r">휴가</span></td>
															<!-- <td height="11" class="vb"><img src="/groupware/image/top.png" onclick="listSort('sum5','ASC');" class="cursor" /></td> -->
														</tr>
														<tr>
															<!-- <td height="11" class="vt"><img src="/groupware/image/bottom.png" onclick="listSort('sum5','DESC');" class="cursor" /></td> -->
														</tr>
													</thead>
												</table>
											</nobr>
										</div>
									</th>
									<th>
										<div class="no-bdr">
											<nobr>
												<table border="0" cellspacing="0" cellpadding="0" align="center">
													<thead>
														<tr>
															<td rowspan="2" height="22"><span class="pad5r">출장</span></td>
															<!-- <td height="11" class="vb"><img src="/groupware/image/top.png" onclick="listSort('sum6','ASC');" class="cursor" /></td> -->
														</tr>
														<tr>
															<!-- <td height="11" class="vt"><img src="/groupware/image/bottom.png" onclick="listSort('sum6','DESC');" class="cursor" /></td> -->
														</tr>
													</thead>
												</table>
											</nobr>
										</div>
									</th>
									<th>
										<div class="no-bdr">
											<nobr>
												<table border="0" cellspacing="0" cellpadding="0" align="center">
													<thead>
														<tr>
															<td rowspan="2" height="22"><span class="pad5r">교육훈련</span></td>
															<!-- <td height="11" class="vb"><img src="/groupware/image/top.png" onclick="listSort('sum7','ASC');" class="cursor" /></td> -->
														</tr>
														<tr>
															<!-- <td height="11" class="vt"><img src="/groupware/image/bottom.png" onclick="listSort('sum7','DESC');" class="cursor" /></td> -->
														</tr>
													</thead>
												</table>
											</nobr>
										</div>
									</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="table test1">
						<table style="width:100%;table-layout:fixed;">
								<c:forEach var="emps" items="${emp}" >
									<tr>
										<td class="txt_ce">1</td>
										<td class="txt_ce">${ emps.name }</td>
										<td class="txt_ce">${ emps.deptName}</td>
										<td class="txt_ce">${ emps.normalCount }</td>
										<td class="txt_ce">${ emps.attCount }</td>
										<td class="txt_ce">0</td>
										<td class="txt_ce">0</td>
										<td class="txt_ce">0</td>
										<td class="txt_ce">0</td>
										<td class="txt_ce">0</td>
									</tr>
								</c:forEach>
								<c:forEach var="emps" items="${emp}" >
									<tr>
										<td class="txt_ce">1</td>
										<td class="txt_ce">${ emps.name }</td>
										<td class="txt_ce">${ emps.deptName}</td>
										<td class="txt_ce">${ emps.normalCount }</td>
										<td class="txt_ce">${ emps.attCount }</td>
										<td class="txt_ce">0</td>
										<td class="txt_ce">0</td>
										<td class="txt_ce">0</td>
										<td class="txt_ce">0</td>
										<td class="txt_ce">0</td>
									</tr>
								</c:forEach>
						</table>
					</div>
				</div>
			</form>
		</section>
</body>
</html>