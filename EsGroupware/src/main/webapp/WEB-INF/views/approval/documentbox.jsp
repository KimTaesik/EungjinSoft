<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html >
<html>
<head>

<link rel="stylesheet"
	href="/groupware/resources/styles/approvalboard.css">
<link rel="stylesheet"
	href="/groupware/resources/styles/jquery/jquery-ui.css">
<script src="/groupware/resources/styles/script/jquery.js"></script>
<script src="/groupware/resources/styles/script/jquery-ui.js"></script>
<link rel="stylesheet" href="/groupware/resources/styles/approval.css">

</head>

<body>


	<div
		style="width: 90%; float: right; margin-left: 10px; border: 1px solid;">
		<!--  검색 버튼 영역 -->
		<form name="form" action="" method="post"
			onsubmit="return setSearchSubmit();">

			<div id="title">
				<h2>
					<c:if test=""></c:if>
					<span class="appr">결재할 문서함 &gt; 미결재 문서</span>
				</h2>
			</div>
			<div class="toparea">
				<span class="leftarea">

					<table border='0' cellpadding='0' cellspacing='0'>
						<tr>
							<td class='pad1tb'><select name="key_field"
								onchange="FieldSearch(this.value, 1);SearchKeyCheck(this.value);">
									<option value="" selected>검색조건</option>
									<option value="all">전체보기</option>
									<option value="a.WordNo">문서번호</option>
									<option value="a.Category">결재문서양식</option>
									<option value="a.Subject">제목</option>
									<option value="a.Name">기안자</option>
									<option value="a.Date">기안일자</option>
							</select></td>
						</tr>
					</table>

				</span>

			</div>
			<!--  //검색 버튼 영역 -->
			<!--  테이블 영역 -->
			<div class="table">
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="table_layout">

					<col width="10%" class="overf"></col>
					<col width="10%" class="overf"></col>
					<col width="10%" class="overf"></col>
					<col width="2%" class="overf"></col>
					<col width="20%" class="overf"></col>
					<col width="12%" class="overf"></col>
					<col width="10%" class="overf"></col>
					<col width="8%" class="overf"></col>
					<col width="12%" class="overf"></col>
					<col width="8%" class="overf"></col>

					<thead>
						<tr>
							<th>
								<div>
									<nobr> 문서번호 </nobr>
								</div>
							</th>
							<th>
								<div>
									<nobr> 기안일자 </nobr>
								</div>
							</th>
							<th>
								<div>
									<nobr>
										결재일자 <a class="cursor"> </a>
									</nobr>
								</div>
							</th>
							<th>
								<div>&nbsp;</div>
							</th>
							<th>
								<div>
									<nobr>
										문서명 <a class="cursor"> </a>
									</nobr>
								</div>
							</th>
							<th>
								<div>
									<nobr>
										기안자 <a class="cursor"> </a>
									</nobr>
								</div>
							</th>
							<th>
								<div>
									<nobr> 나의결재 </nobr>
								</div>
							</th>
							<th>
								<div>
									<nobr> 상태 </nobr>
								</div>
							</th>
							<th>
								<div>
									<nobr> 다음결재자 </nobr>
								</div>
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="approval" items="${approvals}" >
						<tr>
					
							<c:set var="reportDate" value="${approval.reportDate}" />
							
							<td class="txt_ce">
								<div>
									<nobr> ${approval.form_No} </nobr>
								</div>
							</td>
							<td class="txt_ce">
								<div>
									<nobr>
									<fmt:formatDate value="${reportDate}" pattern="yyyy-MM-dd"/>
								</nobr>
								
								</div>
							</td>
							<td class="txt_ce">
								<div>
									<nobr>  </nobr>
								</div>
							</td>
							<td>
								<div>
									<nobr> &nbsp; </nobr>
								</div>
							</td>
							<td>
								<div>
									<nobr>
										<a href='approvalview.action?approval_No=${approval.approval_No}'>
											${approval.title} </a>
									</nobr>
								</div>
							</td>
							<td class="txt_ce">
								<div>
									<nobr> ${approval.employee.name }</nobr>
								</div>
							</td>
							<td class="txt_ce">
								<div>
										
										<c:choose>
   											<c:when test="${ approval.approvalConfirm eq true}">
   												<nobr> 결재 </nobr>
   											</c:when>
   											<c:otherwise>	
   												<nobr> 미결재 </nobr>
   											</c:otherwise>
										</c:choose>
								</div>
							</td>
							<td class="txt_ce">
								<div>
										<c:choose>
   											<c:when test="${ approval.approvalConfirm eq true}">
   												<nobr> 결재 </nobr>
   											</c:when>
   											<c:otherwise>	
   												<nobr> 진행중 </nobr>
   											</c:otherwise>
										</c:choose>
									
								</div>
							</td>
							<td class="txt_ce">
								<div>
									<c:set var="chk" value="1" />
									<c:forEach var="approvalline" items="${approval.approvalLines}" >
										<c:if test="${approvalline.approveCheck eq null and chk eq 1}">
											<nobr> ${approvalline.employee.name} </nobr>
											<c:set var="chk" value="${chk+1}" />
										</c:if>
									</c:forEach>
								</div>
							</td>
							
						</tr>
						</c:forEach>
					</tbody>

				</table>
			</div>
			<!--  //테이블 영역 -->
			<!--  넘버링 영역 -->
			<div class="paging">
				<div class="number">1</div>
			</div>
			<!--  //넘버링 영역 -->
			<!--  검색 버튼 영역 -->

		</form>
		<!--  //검색 버튼 영역 -->
	</div>

</body>
</html>

