
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>

<link rel="stylesheet"
	href="/groupware/resources/styles/jquery/jquery-ui.css">
<script src="/groupware/resources/styles/script/jquery.js"></script>
<script src="/groupware/resources/styles/script/jquery-ui.js"></script>
<link rel="stylesheet" href="/groupware/resources/styles/approval.css">
<link rel="stylesheet"
	href="/groupware/resources/styles/eword_common.css">
<link rel="stylesheet"
	href="/groupware/resources/styles/eword_write.css">
<script type="text/javascript">
$(function() {
	var confirmNum=0;
	$("#dialog-form2").dialog({
				resizable : false,
				autoOpen : false,
				buttons: {
				             "결재 하기": function() {
				                $('form').submit(function(event){
				                	event.preventDefault();
				                	var formData=new formData(this);
				                		formData.append("confirmNum",confirmNum);
				                	$.ajax({
				        				url : "approvalconfirm.action",
				        				method : 'post',
				        				data : formData,
				        				dataType : 'json',
				        				success : function(result, status, xhr) {
				        					//alert('성공');
				        					eval("var r=" + result);
				        	
				        					$('#positionName'+i).attr('value', r.position.positionName);
				        					$('#selectId'+i).attr('value',id);
				        					$('#selectName'+i).attr('value', r.name);
				        					
				        				},
				        				error : function(xhr, status, ex) {
				        					$('#result').text(status + "/" + ex);
				        				}
				        			});
				        			
				                });
				             },
				             "닫기": function() {
				                 $( this ).dialog( "close" );
				             }
				    	 },
				create : function(event, ui) {},
				open : function(event, ui) {},
				close : function() {},
				cancle : function() {}
			});

	$('.dialog-confirm').click(function() {
		confirmNum=(this).attr('id');
		$("#dialog-form2").dialog("open");
	}); 
});
</script>
			
</head>

<body>

	<div id="sub">
		<!-- 버튼영역 -->
		<div id="title">

			<h2>
				<span class="appr">결재문서 작성 </span>
			</h2>
		</div>

			<!-- init editor : 결재문서 작성(설정형 에디터/기본형 에디터) -->
			<!-- 결재양식 제목 -->
			<h2 class="eword_maincolumn">
			
				${approval.approvalForm.form_Name}
						
			
			</h2>
			<form action="approvalwriteform.action" method="post">	
			<!-- 결재문서 본문 -->
			<table class="eword_maincolumn boldline mar10b">
				<tr>
					<td id="eword_header">
						<!-- ORDER 5 -->
						<table id="eword_header_part" class="eword_meta">
							<col class="eword_th_width">
							<col class="eword_td_min_width">
							<col class="eword_th_width">
							<col class="eword_td_min_width">
							<col style="width: 50%;">
							<!-- 문서번호, 결재선/협조선 -->
							<tr class="eword_meta_height">
								<th style="border-top: none; border-left: none;">문서번호</th>
								<td class="pad15l" colspan="3" style="border-top: none;">
									<span id="sub_subject"> 
									${approval.approvalForm.form_No}
									</span> 
								</td>
								<td rowspan="6" style="border-top: none; border-right: none;">
									<table id="eword_orderline" class="eword_meta">
										<col class="orderline_th_width">
										<col class="orderline_width" span="5">
										<!-- 결재선 -->
										<tr class="txt_ce" style="height: 20px;">
											<th rowspan="3" style="border-left: none; border-top: none;">
												<!-- 결재선/협조선 제목 --> <!-- 결재 --> 결<br> <br>재
											</th>
											<!-- 결재자/협조자 직급 표시 영역 -->
											
											<td style="border-top: none; text-align: center">
												${approval.approvalLines[0].employee.positionName}
											</td>
											<td style="border-top: none; text-align: center">
												${approval.approvalLines[1].employee.positionName}
											</td>
											<td style="border-top: none; text-align: center">
												${approval.approvalLines[2].employee.positionName}
											</td>
											<td style="border-top: none; text-align: center">
												${approval.approvalLines[3].employee.positionName}
											</td>
											<td style="border-top: none; text-align: center">
												${approval.approvalLines[4].employee.positionName}
											</td>
										</tr>
										<div id="dialog-form2" title="결재">
											<form action="approvalconfirm.action" id="approvalconfirm" enctype="multipart/form-data">
												<input name="approveCheck" type="radio" value="결재"> 결재
												<input name="approveCheck" type="radio" value="전결"> 전결
												<input name="approveCheck" type="radio" value="보류"> 보류
												<input name="approveCheck" type="radio" value="기각"> 기각
												<input name="approval_No" type="hidden" value="${approval.approval_No }">
												<input name="id" type="hidden" value="${approval.id }">
												
											</form>
										</div>
										<tr class="date" style="height: 61px;">
											<!-- 결재 버튼/결재완료 서명 표시 영역 -->
											<c:set var="count" value="${ fn:length(approval.approvalLines) }" />
											<c:forEach begin="0" end="4" step="1" varStatus="status">
												<c:choose>
													<c:when test="${ count <= status.index }">
														<td>
														&nbsp;
														</td>
													</c:when>
													<c:otherwise>
														<td>
															${approval.approvalLines[status.index].employee.name}
															<div align="center">
																	<input type="button" value="결재" class="dialog-confirm" id="${status.current}" name="${count}">
															</div> 
														</td>
														
													</c:otherwise>
												</c:choose>
											</c:forEach>
										
										
										</tr>
										<tr class="date" style="height: 20px;">
											<!-- 결재일시 표시 영역 -->
											<td><span id="appDate1">&nbsp;</span></td>
											<td><span id="appDate2">&nbsp;</span></td>
											<td><span id="appDate3">&nbsp;</span></td>
											<td><span id="appDate4">&nbsp;</span></td>
											<td><span id="appDate5">&nbsp;</span></td>
										</tr>
										<!-- 협조선 -->
										<tr class="txt_ce" style="height: 20px;">
											<th rowspan="3" style="border-left: none; border-top: none; border-bottom: none;">
												<!-- 결재선/협조선 제목 --> <!-- 협조 --> 협<br> <br>조
											</th>
											<!-- 결재자/협조자 직급 표시 영역 -->
											<td style="text-align: center">
												${approval.cooperations[0].employee.positionName}</td>
											<td style="text-align: center">
												${approval.cooperations[1].employee.positionName}</td>
											<td style="text-align: center">
												${approval.cooperations[2].employee.positionName}</td>
											<td style="text-align: center">
												${approval.cooperations[3].employee.positionName}</td>
											<td style="text-align: center">
												${approval.cooperations[4].employee.positionName}</td>
										</tr>
										<tr class="date" style="height: 61px;">
											<!-- 결재 버튼/결재완료 서명 표시 영역 -->
											<td>
												<input type="hidden" name="lineId6" value="" id="selectId6">
												${approval.cooperations[0].employee.name}
											 	<div id="MembersFindCell11" class="btn_page pad15l overf">
													
												</div>
											</td>
											<td>
												${approval.cooperations[1].employee.name}
													<div id="MembersFindCell12" class="btn_page pad15l overf">
														
													</div>
											</td>
											<td>
												${approval.cooperations[2].employee.name}
													<div id="MembersFindCell13" class="btn_page pad15l overf">
														
													</div>
											</td>
											<td>
												${approval.cooperations[3].employee.name}
													<div id="MembersFindCell14" class="btn_page pad15l overf">
														
													</div>
											</td>
											<td>
												${approval.cooperations[4].employee.name}
													<div id="MembersFindCell15" class="btn_page pad15l overf">
														
													</div>
											</td>
										</tr>
										<tr class="date" style="height: 20px;">
											<!-- 결재일시 표시 영역 -->
											<td style="border-bottom: none;"><span id="appDate11">&nbsp;</span>
											</td>
											<td style="border-bottom: none;"><span id="appDate12">&nbsp;</span>
											</td>
											<td style="border-bottom: none;"><span id="appDate13">&nbsp;</span>
											</td>
											<td style="border-bottom: none;"><span id="appDate14">&nbsp;</span>
											</td>
											<td style="border-bottom: none;"><span id="appDate15">&nbsp;</span>
											</td>
											
										</tr>
									</table>
								</td>
							</tr>
							<tr class="eword_meta_height">
								<th style="border-left: none;">문서종류</th>
								<td class="pad15l" colspan="3">${approval.approvalForm.form_Name}</td>
							</tr>
							<tr class="eword_meta_height">
								<th style="border-left: none;">부서</th>
								<td class="pad15l" colspan="3">${approval.employee.deptName}</td>
								
							</tr>
							<c:set var="reportDate" value="${approval.reportDate}" />
							<tr class="eword_meta_height">
								<th style="border-left: none;">기안일</th>
								<td class="pad15l" colspan="3">
										<fmt:formatDate value="${reportDate}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
							<tr class="eword_meta_height">
								<th style="border-left: none;">기안자</th>
								<td class="pad15l " colspan="3">
										${approval.employee.name}
								</td>
							</tr>
							<tr class="eword_meta_height">
								<th style="border-left: none;">공개여부</th>
								<td class="txt_ce">
									<!-- 작성 --> 
									<c:choose>
   											<c:when test="${ approval.opening==true}">
   												<nobr> 공개 </nobr>
   											</c:when>
   											<c:otherwise>	
   												<nobr> 비공개 </nobr>
   											</c:otherwise>
									</c:choose>
								</td>
								<th>보존기간</th>
								<td class="txt_ce">
									<c:choose>
   											<c:when test="${ approval.storagePeriod>=12}">
   												<nobr> ${approval.storagePeriod/12}년</nobr>
   											</c:when>
   											<c:when test="${ approval.storagePeriod>=1200}">
   												<nobr> 무기한</nobr>
   											</c:when>
   											<c:otherwise>	
   												<nobr>${approval.storagePeriod}개월</nobr>
   											</c:otherwise>
										</c:choose>
								</td>

							</tr>
						</table> <!-- /ORDER 5 -->

						<table id="eword_header_common" class="eword_meta">
							<col class="eword_th_width">
							<col>
							<!-- 수신부서 -->
							<tr class="eword_meta_height">
								<th style="border-left: none;">수신부서</th>
								<td class="pad15l" style="padding-right: 7px;">
									<span id="ReceiveTreeKeyButtonArea" style='width: 100%;'> 
										${approval.receiveDept}
										<span class="btn_page right"> <!-- 수신부서 지정 --> 
												<span class="txt_ce" style="width: 70px;">
													
												</span>
											
										</span>
									</span>
								</td>
							</tr>
							
							
							<!-- 참조자 -->
							<tr class="eword_meta_height">
								<th style="border-left: none;">참조자</th>
								<td class="pad15l" style="padding-right: 7px;">
									${approval.referrers}
											<span class="txt_ce" style="width: 70px;">
												
											</span>
								</td>
							</tr>
							<tr class="eword_meta_height">
								<th style="border-left: none;">제목</th>
								<td class="pad15l">
								${approval.title}</td>
							</tr>
						</table>
					</td>
				</tr>
				<!-- 기본형 에디터 -->
				<tr>
					<td id="eword_content" class="pad5">
						${approval.content }
					</td>
				</tr>
				

			</table>
			</form>
</body>
</html>