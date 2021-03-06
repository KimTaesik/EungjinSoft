
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
$(document).ready(function() {
	var temp=null;
	var dlg;
	

	var confirmNum=0;
	var approvalName=null;
	
	
	//var approvalId= $("#approvalId").val;
	//var buttonTemp=$('.dialog-confirm');
	//var loginuser='${loginuser}';
	//alert(loginuser);
	//alert(approvalId);
	//if(approvalId != loginuser){
		
	//	$(buttonTemp).css('display','none');
		
	//}
	
	dlg = $("#dialog-form2").dialog({
				resizable : false,
				autoOpen : false,
				buttons: {
				             "결재 하기": 
				            	 function() {
				            	 //$(this).click(function(){
				            	// $('#approvalconfirm').submit(function() {)
				                	
				                	//event.preventDefault();
				                	//var formData = new FormData($('#approvalconfirm')[0]);
				                	//	formData.append("confirmNum",confirmNum);
				                	$.ajax({
				        				url : "approvalconfirm.action",
				        				method : 'post',
				        				data : {
				        					approval_No : $("input[name = 'approval_No']").val(),
				        					
				        					confirmNum : confirmNum,
				        					id:approvalName,
				        					approveCheck : $("input[name='approveCheck']:checked").val(),
				        				},
				        				dataType : 'json',
				        				success : function(result, status, xhr) {
				        					
				        					$('#approvalConfirm'+confirmNum).attr('value',"-"+result.approveCheck+"-").css("color",'red')
				        					$('#appDate'+confirmNum).attr('value',result.approvalDay);
				        					$('#approvalConfirm'+confirmNum).css("display","block");
				        					$(dlg).dialog("close");
				        					if(result.count==confirmNum){
				        						alert('결재가 완료 되었습니다.');
				        						$('#frame').load("approvalend.action");
				        					}
				        					$(temp).css("display","none");
				        						
				        				},
				        				error : function(xhr, status, ex) {
				        					$('#result').text(status + "/" + ex);
				        				}
				        			});
				                	//});
				            	 //});
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
		temp=$(this);
		confirmNum=$(this).attr('id');
		approvalName=$(this).attr('name');
		$("#dialog-form2").dialog("open");
	}); 
});
</script>
			
</head>

<body>

	
		<!-- 버튼영역 -->
		<div id="title">

		
		</div>
				
					<c:set var="loginuser" value="${loginuser}" > </c:set>
					
			<!-- init editor : 결재문서 작성(설정형 에디터/기본형 에디터) -->
			<!-- 결재양식 제목 -->
			<h2 class="eword_maincolumn">
				${approval.approvalForm.form_Name}
			</h2>
		
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
									&nbsp;${approval.approvalForm.form_No}
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
														<td id="approvalId">
															${approval.approvalLines[status.index].employee.name}
															<div align="center">
																<c:choose>
					  											<c:when test="${approval.approvalLines[status.index].approveCheck eq null}">
					  												<nobr>
					  													<c:set var="approvalId" value="${approval.approvalLines[status.index].employee.id}" > </c:set>
					  												
					  												 <input type="button" value="결재" class="dialog-confirm" id="${status.current + 1}" name="${approval.approvalLines[status.index].employee.id}" style="display:${ loginuser ne approvalId ? 'none':'block'}">
					  												 <input type="text" value="-${approval.approvalLines[status.index].approveCheck}-" id="approvalConfirm${status.current + 1}"   class="form_transparent" onclick="1" readonly="readonly"
					  											 style="display:none;  width: 100%">
					  												 </nobr>
					  											</c:when>
					  											<c:otherwise>
					  											<input type="text" value="-${approval.approvalLines[status.index].approveCheck}-" id="approvalConfirm${status.current + 1}"   class="form_transparent" onclick="1" readonly="readonly"
					  											 style="display:block; color:red; width: 100%">
					  										</c:otherwise>
					  										</c:choose>
															</div> 
														</td>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</tr>
										<div id="dialog-form2" title="결재">
											<form  id="approvalconfirm" method="post">
												<input name="approveCheck" type="radio" value="결재"> 결재
												<input name="approveCheck" type="radio" value="전결"> 전결
												<input name="approveCheck" type="radio" value="보류"> 보류
												<input name="approveCheck" type="radio" value="기각"> 기각
												<input name="approval_No" type="hidden" value="${approval.approval_No }">
												<input name="id" type="hidden" value="${approval.id }">
											</form>
										</div>
										<tr class="date" style="height: 20px;">
											<!-- 결재일시 표시 영역 -->
											
											<td><span ><input type="text" value="${approval.approvalLines[0].approvalDay}" readonly class="form_transparent" id="appDate1" style='width: 100%;'> </span></td>
											<td><span ><input type="text" value="${approval.approvalLines[1].approvalDay}" readonly class="form_transparent" id="appDate2" style='width: 100%;'> </span></td>
											<td><span ><input type="text" value="${approval.approvalLines[2].approvalDay}" readonly class="form_transparent" id="appDate3" style='width: 100%;'> </span></td>
											<td><span ><input type="text" value="${approval.approvalLines[3].approvalDay}" readonly class="form_transparent" id="appDate4" style='width: 100%;'> </span></td>
											<td><span ><input type="text" value="${approval.approvalLines[4].approvalDay}" readonly class="form_transparent" id="appDate5" style='width: 100%;'> </span></td>
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
											</td>
											<td>
												${approval.cooperations[1].employee.name}
											</td>
											<td>
												${approval.cooperations[2].employee.name}
											</td>
											<td>
												${approval.cooperations[3].employee.name}
											</td>
											<td>
												${approval.cooperations[4].employee.name}
											</td>
										</tr>
										<tr class="date" style="height: 20px;">
											<!-- 결재일시 표시 영역 -->
											<td style="border-bottom: none;"><span id="appDate11" >&nbsp;</span>
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
								<td class="pad15l" colspan="3">&nbsp;${approval.approvalForm.form_Name}</td>
							</tr>
							<tr class="eword_meta_height">
								<th style="border-left: none;">부서</th>
								<td class="pad15l" colspan="3">&nbsp;${approval.employee.deptName}</td>
								
							</tr>
							<c:set var="reportDate" value="${approval.reportDate}" />
							<tr class="eword_meta_height">
								<th style="border-left: none;">기안일</th>
								<td class="pad15l" colspan="3">
									&nbsp;<fmt:formatDate value="${reportDate}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
							<tr class="eword_meta_height">
								<th style="border-left: none;">기안자</th>
								<td class="pad15l " colspan="3">
										&nbsp;${approval.employee.name}
								</td>
							</tr>
							<tr class="eword_meta_height">
								<th style="border-left: none;">공개여부</th>
								<td class="txt_ce">
									<!-- 작성 --> 
									<c:choose>
   											<c:when test="${ approval.opening==true}">
   												<nobr>&nbsp; 공개 </nobr>
   											</c:when>
   											<c:otherwise>	
   												<nobr>&nbsp; 비공개 </nobr>
   											</c:otherwise>
									</c:choose>
								</td>
								<th>보존기간</th>
								<td class="txt_ce">
									<c:choose>
   											<c:when test="${ approval.storagePeriod>=12}">
   												<nobr>&nbsp; ${approval.storagePeriod/12}년</nobr>
   											</c:when>
   											<c:when test="${ approval.storagePeriod>=1200}">
   												<nobr>&nbsp; 무기한</nobr>
   											</c:when>
   											<c:otherwise>	
   												<nobr>&nbsp;${approval.storagePeriod}개월</nobr>
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
										&nbsp;${approval.receiveDept}
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
								&nbsp;${approval.title}</td>
							</tr>
						</table>
					</td>
				</tr>
				<!-- 기본형 에디터 -->
				<tr>
					<td id="eword_content" class="pad5">
					
						<textarea readonly="readonly" name="content" id="Contents" style="width: 100%; height: 400px; display: block;">	${approval.content }</textarea>
					</td>
				</tr>
			</table>
			
</body>
</html>