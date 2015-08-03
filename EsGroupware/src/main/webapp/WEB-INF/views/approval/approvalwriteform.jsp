
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

var get=null;
var i;
var temp =null;

	
	$(function() {
		
		$("#accordion").accordion({
			header : "> div > h3"
		}).sortable({
			axis : "y",
			handle : "h3",
			stop : function(event, ui) {

				ui.item.children("h3").triggerHandler("focusout");
				$(this).accordion("refresh");
			}
		});
		$("#check_all").click(function() {
			
			$("input[class=box_class3]").each(function() {
				$("input[class=box_class2]").prop("checked", false);
					$(this).prop("checked", true);
					$("#dialog-form").dialog("close");
			});
		});
		$("#uncheck_all").click(function() {

			$("input[class=box_class3]").each(function() {
				$("input[class=box_class1]").prop("checked", false);
				$(this).prop("checked", false);

			});

		});
		$("#check_all2").click(function() {
			
			$("input[class=box_class6]").each(function() {
				$("input[class=box_class5]").prop("checked", false);
					$(this).prop("checked", true);
					$("#dialog-form").dialog("close");
			});
		});
		$("#uncheck_all2").click(function() {

			$("input[class=box_class6]").each(function() {
				$("input[class=box_class4]").prop("checked", false);
				$(this).prop("checked", false);
			});
		});
		$("#accordion2").accordion({
			header : "h3"
		}).sortable({
			axis : "y",
			handle : "h3",
			stop : function(event, ui) {
				ui.item.children("h3").triggerHandler("focusout");
				$(this).accordion("refresh");
			}
		});
		$("#dialog-form").dialog({
			resizable : false,
			autoOpen : false,
		  
			create : function(event, ui) {},
			open : function(event, ui) {},
			close : function() {},
			cancle : function() {}
		});
		//수신부서
		$("#dialog-form2").dialog({
			resizable : false,
			autoOpen : false,
			buttons: {
			             "확인": function() {
			                 $( this ).dialog( "close" );
			                 var check="";
			                 $("input[class=box_class3]:checked").each(function(index) {
								if(index==0)
			                	 check += $(this).val();
								else
								check += ", " + $(this).val()
			                 
			                 });
			                 $("#ReceiveTreeKeyName").attr('value', check);
			             },
			             "취소": function() {
			                 $( this ).dialog( "close" );
			             }
			    	 },
			create : function(event, ui) {},
			open : function(event, ui) {},
			close : function() {},
			cancle : function() {}
		});
		//참조자
		$("#dialog-form3").dialog({
			resizable : false,
			autoOpen : false,
			buttons: {
			             "확인": function() {
			                 $( this ).dialog( "close" );
			                 var check="";
			                 var count=0;
			                 var total = $("input.box_class6:checked").length; 
			                 $("input.box_class6:checked").each(function(index, item) {
			                	 if(index<5){
			                		
			                	 	
			                	 	if(index<4 && index>0)
			                		 	check += ", ";
			                	 	check += $(this).val() 
			                	 }
								else if(5<=index && index < total){
									count++;
									
									if(index == total-1)
										check +=" "+"외"+ count+ "명";
									}
			                 });
			                 $("#referenceUserName").attr('value', check);
			             },
			             "취소": function() {
			                 $( this ).dialog( "close" );
			             }
			    	 },
			create : function(event, ui) {},
			open : function(event, ui) {},
			close : function() {},
			cancle : function() {}
		});
		$(".get").click(function(e) {
			get=$(this);
			var id = $(this).attr('id');
			
			$(".dialog-cancel"+i).css("display","block");
			$(temp).css("display","none");
			$.ajax({
				url : "infomation.action?employeeid=" + id,
				method : 'get',
				data : {},
				dataType : 'text',
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
			e.preventDefault();
			$("#dialog-form").dialog("close");
		});	
	
		$(".dialog-confirm").click(function(event) {
			i=$(this).attr('onclick');
			var b =$(this);//취소에 씀
			temp=$(this); //get에 씀
			$("#dialog-form").dialog("open");
		
			$(".dialog-cancel"+i).click(function(e) {
				var a = $(this).attr('onclick');
				
				$('#positionName'+a).attr('value', "");
				$('#selectName'+a).attr('value',"");
				$(".dialog-cancel"+a).css("display","none");
				$(b).css("display","block");
			});		
		});
		//수신부서
		$(".dialog-confirm2").click(function(event) {
		
			
			$("#dialog-form2").dialog("open");
			event.preventDefault();
		});
		//참조자
		$(".dialog-confirm3").click(function(event) {
		
			$("#dialog-form3").dialog("open");
			event.preventDefault();
		});
		
		$('#submit').click(function() { 
			$('form').submit(); 
		}); 
		 var  jqCalendar = {
				
				    dateFormat: "yy/mm/dd",
				
				   };
		$('#datepicker').datepicker(
			   jqCalendar);

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
				<c:forEach var="approvalform2" items="${approvalforms}">
					<c:if test="${approvalform2.form_No eq approvalform.form_No}">
						<div>${approvalform.form_Name}</div>
						<br />
					</c:if>
				</c:forEach>
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
										<input type="text" id="WordNo" name="form_No" style="border: 0pt;" value="${approvalform.form_No}" size='10' readonly />
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
											<td style="border-top: none;">
												<input type="text" name="OrderTitle1" value="" readonly class="form_transparent" id="positionName1"style='width: 100%; line-height: 21px;'>
											</td>
											<td style="border-top: none;">
												<input type="text" name="OrderTitle2" value="" readonly class="form_transparent" id="positionName2" style='width: 100%; line-height: 21px;'>
											</td>
											<td style="border-top: none;">
												<input type="text"name="OrderTitle3" value="" readonly class="form_transparent" id="positionName3"style='width: 100%; line-height: 21px;'>
											</td>
											<td style="border-top: none;">
												<input type="text" name="OrderTitle4" value="" readonly class="form_transparent" id="positionName4" style='width: 100%; line-height: 21px;'>
											</td>
											<td style="border-top: none;">
												<input type="text"name="OrderTitle5" value="" readonly class="form_transparent" id="positionName5" style='width: 100%; line-height: 21px;'>
											</td>
										</tr>

										<tr class="date" style="height: 61px;">
											<!-- 결재 버튼/결재완료 서명 표시 영역 -->
											<td>
											<input type="hidden" name="lineId1" value="" id="selectId1">
											<input type="text" name="OrderName1" value=""readonly class="form_transparent" id="selectName1" style='width: 100%;'>
												<div id="dialog-form" title="직원 리스트">
													<div id="accordion">
														<c:forEach var="dept" items="${depts}">
															<div class="group">
																<h3>${dept.partName}</h3>
																<div>
																	<c:forEach var="employee" items="${employees}">
																		<c:if test="${dept.deptNo eq employee.deptNo}">
																			<div>
																				<a id="${ employee.id }" class="get" href="#"> 
																				<img src='/groupware/resources/image/re.gif' />&nbsp;
																					${employee.position.positionName}&nbsp;&nbsp;${employee.name}
																				</a>
																			</div>
																			<br />
																		</c:if>
																	</c:forEach>
																</div>
															</div>
														</c:forEach>
													</div>
												</div>
												<div align="center">
													<input type="button" value="취소" class="dialog-cancel1" onclick="1"  style="display: none"> 
													<input type="button" value="지정" class="dialog-confirm" onclick="1">
												</div> 
											</td>
											<td>
												<input type="hidden" name="lineId2" value="" id="selectId2">
												<input type="text" name="OrderName2" value="" readonly class="form_transparent" id="selectName2" style='width: 100%;'> 
													<div align="center">
														<input type="button" value="취소" class="dialog-cancel2"  onclick="2" style="display: none"> 
													<input type="button" value="지정" class="dialog-confirm" onclick="2">
													</div>
												</td>
											<td>
												<input type="hidden" name="lineId3" value="" id="selectId3">
												<input type="text" name="OrderName3" value="" readonly class="form_transparent" id="selectName3" style='width: 100%;'> 
													<div align="center">
														<input type="button" value="취소" class="dialog-cancel3" onclick="3"  style="display: none"> 
														<input type="button" value="지정" class="dialog-confirm" onclick="3"> 
													</div>
												</td>
											<td>
												<input type="hidden" name="lineId4" value="" id="selectId4">
												<input type="text" name="OrderName4" value=""readonly class="form_transparent" id="selectName4" style='width: 100%;'>
												<div align="center">
													<input type="button" value="취소" class="dialog-cancel4" onclick="4"  style="display: none"> 
													<input type="button" value="지정" class="dialog-confirm" onclick="4"> 
												</div> 
											</td>
											<td>
											<input type="hidden" name="lineId5" value="" id="selectId5">
											<input type="text" name="OrderName5" value="" readonly class="form_transparent" id="selectName5" style='width: 100%;'>
												 <div align="center">
													<input type="button" value="취소" class="dialog-cancel5" onclick="5"  style="display: none"> 
													<input type="button" value="지정" class="dialog-confirm" onclick="5"> 
												</div> 
											</td>
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
											<td>
												<input type="text" name="OrderTitle6" value="" readonly class="form_transparent" id="positionName6" style='width: 100%; line-height: 21px;'></td>
											<td>
												<input type="text" name="OrderTitle7" value="" readonly class="form_transparent" id="positionName7" style='width: 100%; line-height: 21px;'></td>
											<td>
												<input type="text" name="OrderTitle8" value="" readonly class="form_transparent" id="positionName8" style='width: 100%; line-height: 21px;'></td>
											<td>
												<input type="text" name="OrderTitle9" value="" readonly class="form_transparent" id="positionName9" style='width: 100%; line-height: 21px;'></td>
											<td>
											<input type="text" name="OrderTitle10" value="" readonly class="form_transparent" id="positionName10" style='width: 100%; line-height: 21px;'></td>
										</tr>
										<tr class="date" style="height: 61px;">
											<!-- 결재 버튼/결재완료 서명 표시 영역 -->
											<td>
												<input type="hidden" name="lineId6" value="" id="selectId6">
												<input type="text" name="OrderName11" value="" readonly class="form_transparent"  id="selectName6" style='width: 100%;'>
											 	<div id="MembersFindCell11" class="btn_page pad15l overf">
													<div align="center">
														<input type="button" value="취소" class="dialog-cancel6" onclick="6" style="display: none"> 
														<input type="button" value="지정" class="dialog-confirm" onclick="6"> 
													</div> 
												</div>
											</td>
											<td>
												<input type="hidden" name="lineId7" value="" id="selectId7">
												<input type="text" name="OrderName12" value="" readonly class="form_transparent"  id="selectName7"  style='width: 100%;'>
													<div id="MembersFindCell12" class="btn_page pad15l overf">
														<div align="center">
															<input type="button" value="취소" class="dialog-cancel7"  onclick="7" style="display: none"> 
															<input type="button" value="지정" class="dialog-confirm" onclick="7"> 
														</div> 
													</div>
											</td>
											<td>
												<input type="hidden" name="lineId8" value="" id="selectId8">
												<input type="text" name="OrderName13" value="" readonly class="form_transparent"  id="selectName8" style='width: 100%;'>
													<div id="MembersFindCell13" class="btn_page pad15l overf">
														<div align="center">
															<input type="button" value="취소" class="dialog-cancel8" onclick="8" style="display: none"> 
															<input type="button" value="지정" class="dialog-confirm" onclick="8"> 
														</div> 
													</div>
											</td>
											<td>
												<input type="hidden" name="lineId9" value="" id="selectId9">
												<input type="text" name="OrderName14" value="" readonly class="form_transparent"  id="selectName9" style='width: 100%;'>
													<div id="MembersFindCell14" class="btn_page pad15l overf">
														<div align="center">
															<input type="button" value="취소" class="dialog-cancel9" onclick="9" style="display: none"> 
															<input type="button" value="지정" class="dialog-confirm" onclick="9"> 
														</div> 
													</div>
											</td>
											<td>
												<input type="hidden" name="lineId10" value="" id="selectId10">
												<input type="text" name="OrderName15" value="" readonly class="form_transparent"  id="selectName10" style='width: 100%;'>
													<div id="MembersFindCell15" class="btn_page pad15l overf">
														<div align="center">
															<input type="button" value="취소" class="dialog-cancel10" onclick="10" style="display: none"> 
															<input type="button" value="지정" class="dialog-confirm" onclick="10"> 
														</div> 
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
								<td class="pad15l" colspan="3">${approvalform.form_Name}</td>
							</tr>
							<tr class="eword_meta_height">
								<th style="border-left: none;">부서</th>
								<td class="pad15l" colspan="3">${drafter.dept.partName}</td>
								
							</tr>

							<tr class="eword_meta_height">
								<th style="border-left: none;">기안일</th>
								<td class="pad15l" colspan="3">
									<input id="datepicker" name="reportDate" type="text" >
								</td>
							</tr>
							<tr class="eword_meta_height">
								<th style="border-left: none;">기안자</th>
								<td class="pad15l " colspan="3">
								<input type="hidden" name="id" value="${drafter.id}">
								${drafter.name}</td>
							</tr>
							<tr class="eword_meta_height">
								<th style="border-left: none;">공개여부</th>
								<td class="txt_ce">
									<!-- 작성 --> 
									<select name="opening">
										<option label="공개" value="1" selected="selected">공개</option>
										<option label="비공개" value="0">비공개</option>
									</select>
								</td>
								<th>보존기간</th>
								<td class="txt_ce">
									<select name='storagePeriod'>
										<option label="3 개월" value="3">3 개월</option>
											<option label="6 개월" value="6">6 개월</option>
											<option label="1 년" value="12">1 년</option>
											<option label="2 년" value="24">2 년</option>
											<option label="3 년" value="36">3 년</option>
											<option label="4 년" value="48">4 년</option>
											<option label="5 년" value="60">5 년</option>
											<option label="6 년" value="72">6 년</option>
											<option label="7 년" value="84">7 년</option>
											<option label="8 년" value="96">8 년</option>
											<option label="9 년" value="108">9 년</option>
											<option label="10 년" value="120" selected="selected">10년</option>
											<option label="무기한" value="12000">무기한</option>
									</select>
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
										<input type="text" name="receiveDept" value="" id="ReceiveTreeKeyName" readonly class="left" style="width: 394px;" /> 
											<div id="dialog-form2" title="부서 리스트">
												<div id="accordion2">
													<input type="checkbox" id="check_all" class="box_class1">전체선택하기
													<input type="checkbox" id="uncheck_all" class="box_class2">전체선택해제
													<c:forEach var="dept" items="${depts}">
														<div class="check_item">
															<h3>${dept.partName}</h3>
															<div>
																<input type="checkbox"  class="box_class3" value="${dept.partName}" >${dept.partName}
															</div>
														</div>
													</c:forEach>
												</div>
											</div>
										<span class="btn_page right"> <!-- 수신부서 지정 --> 
												<span class="txt_ce" style="width: 70px;">
													<button class="dialog-confirm2" >수신 부서 지정</button>
												</span>
											
										</span>
									</span>
								</td>
							</tr>
							
							<div id="dialog-form3" title="직원 리스트">
								<div id="accordion2">
									<input type="checkbox" id="check_all2" class="box_class4">전체선택하기
									<input type="checkbox" id="uncheck_all2" class="box_class5">전체선택해제
									<c:forEach var="dept" items="${depts}">
										<div class="group">
											<h3>${dept.partName}</h3>
											<div>
												<c:forEach var="employee" items="${employees}">
													<c:if test="${dept.deptNo eq employee.deptNo}">
														<div>
																<input type="checkbox"  class="box_class6" value="${employee.position.positionName}&nbsp;${employee.name}" >
																${employee.position.positionName}&nbsp;${employee.name}
														</div>
														<br />
													</c:if>
												</c:forEach>
											</div>
										</div>
									</c:forEach>
								</div>
							</div> 	
							<!-- 참조자 -->
							<tr class="eword_meta_height">
								<th style="border-left: none;">참조자</th>
								<td class="pad15l" style="padding-right: 7px;">
									<input type="text" name="referrers" id="referenceUserName" value="" readonly class="left" style="width: 394px;" /> 
											<span class="txt_ce" style="width: 70px;">
												<button class="dialog-confirm3" >참조자 지정</button>
											</span>
								</td>
							</tr>
							<tr class="eword_meta_height">
								<th style="border-left: none;">제목</th>
								<td class="pad15l">
								<input name="title" type="text"  style="width: 98%;" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<!-- 기본형 에디터 -->
				<tr>
					<td id="eword_content" class="pad5">
						<textarea name="content" id="Contents" style="width: 100%; height: 400px; display: block;">&nbsp;</textarea>
					</td>
				</tr>
				<tr>
					<td id="eword_content" class="pad5" align="right">
						<input id="submit" type="submit" value="상신 하기"> 
					</td>
				</tr>

			</table>
			</form>
</body>
</html>