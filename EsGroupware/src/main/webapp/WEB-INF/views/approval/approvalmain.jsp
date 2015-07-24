<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="/groupware/resources/styles/jquery/jquery-ui.css">
<script src="/groupware/resources/styles/script/jquery.js"></script>
<script src="/groupware/resources/styles/script/jquery-ui.js"></script>
<link rel="stylesheet" href="/groupware/resources/styles/approval.css">

<script type="text/javascript">
$(document).ready(function() {
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
		
	});
});
</script>
</head>

<body>

	<div id="frame"
		style="width: 83%; float: right; margin-left: 10px; border: 1px solid;">
		<!--  검색 버튼 영역 -->
		<div id="title" style="border: 1px solid;">
			<h2>
				<span>전자결재 메인</span>
			</h2>
		</div>
		<div class="under"></div>
		<!--  //검색 버튼 영역 -->
		<div class="pad10">
			<!--전자결재 컨텐츠 -->
			<table class="table_layout">
				<tr>
					<td>
						<div>
							<nobr>
								<h4>결재할 문서함</h4>
							</nobr>
						</div>
					</td>
					<td width="15" rowspan="2">&nbsp;</td>
					<td>
						<div>
							<nobr>
								<h4>개인 문서함</h4>
							</nobr>
						</div>
					</td>
					<td width="15" rowspan="2">&nbsp;</td>
					<td>
						<div>
							<nobr>
								<h4>협조 문서함</h4>
							</nobr>
						</div>
					</td>
					<td width="15" rowspan="2">&nbsp;</td>
					<td>
						<div>
							<nobr>
								<h4>부서/참조 수신함</h4>
							</nobr>
						</div>
					</td>
				</tr>
				<tr style="vertical-align: top;">
					<td>
						<div>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<thead>
									<tr>
										<th>
											<div>
												<nobr> 미결재 </nobr>
											</div>
										</th>
										<td>
											<div>
												<nobr>
													<a> 3건 </a>
												</nobr>
											</div>
										</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>
											<div>
												<nobr> 결재완료 </nobr>
											</div>
										</th>
										<td>
											<div>
												<nobr>
													<a> 5건</a>
												</nobr>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</td>
					<td>
						<div>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<thead>
									<tr>
										<th>
											<div>
												<nobr> 상신문서 </nobr>
											</div>
										</th>
										<td>
											<div>
												<nobr>
													<a> 11건</a>
												</nobr>
											</div>
										</td>
										<th>
											<div>
												<nobr> 반려문서 </nobr>
											</div>
										</th>
										<td>
											<div>
												<nobr>
													<a> 3건</a>
												</nobr>
											</div>
										</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>
											<div>
												<nobr> 임시저장 </nobr>
											</div>
										</th>
										<td>
											<div>
												<nobr>
													<a> 0건</a>
												</nobr>
											</div>
										</td>
										<th>
											<div>
												<nobr> 결재완료 </nobr>
											</div>
										</th>
										<td>
											<div>
												<nobr>
													<a> 7건</a>
												</nobr>
											</div>
										</td>
									</tr>
									<tr>
										<!-- 상신취소 -->
										<th>
											<div>
												<nobr> 상신취소 </nobr>
											</div>
										</th>
										<td>
											<div>
												<nobr>
													<a> 0건</a>
												</nobr>
											</div>
										</td>
										<td colspan="2"></td>
									</tr>
								</tbody>
							</table>
						</div>

					</td>
					<td>
						<div>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<thead>
									<tr>
										<th>
											<div>
												<nobr> 미결재 </nobr>
											</div>
										</th>
										<td>
											<div>
												<nobr>
													<a> 0건 </a>
												</nobr>
											</div>
										</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>
											<div>
												<nobr> 결재완료 </nobr>
											</div>
										</th>
										<td>
											<div>
												<nobr>
													<a> 0건 </a>
												</nobr>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</td>
					<td>
						<div>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<thead>
									<tr>
										<th>
											<div>
												<nobr> 부서 수신함 </nobr>
											</div>
										</th>
										<td>
											<div>
												<nobr>
													<a> 0 건</a>
												</nobr>
											</div>
										</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>
											<div>
												<nobr> 참조 수신함 </nobr>
											</div>
										</th>
										<td>
											<div>
												<nobr>
													<a> 0 건</a>
												</nobr>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</td>
				</tr>
			</table>
			<h4 class="mar5b left">결재할 문서함 &gt; 미결재 문서</h4>
			<span class="right"><a onfocus='this.blur();'><img
					src="http://static.whoisdesk.net/Src/Img/Renewal/btn_more.gif" /></a></span>
			<div class="table2  clear">
				<table class="table_layout">
					<thead>
						<tr>
							<th><div>
									<nobr>문서번호</nobr>
								</div></th>
							<th><div>
									<nobr>기안일자</nobr>
								</div></th>
							<th><div>
									<nobr>문서명</nobr>
								</div></th>
							<th><div>
									<nobr>기안자</nobr>
								</div></th>
							<th><div>
									<nobr>나의결재</nobr>
								</div></th>
							<th><div>
									<nobr>상태</nobr>
								</div></th>
							<th><div>
									<nobr>다음결재자</nobr>
								</div></th>
							<th><div>
									<nobr>의견 </nobr>
								</div></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="txt_ce"><div>
									<nobr> 1012-0009 </nobr>
								</div></td>
							<td class="txt_ce"><div>
									<nobr> 10.12.03 </nobr>
								</div></td>
							<td class="txt_ce"><div>
									<nobr>
										<a>비공개문서2</a>
									</nobr>
								</div></td>
							<td class="txt_ce"><div>
									<nobr> 최진성 사원 </nobr>
								</div></td>
							<td class="txt_ce"><div>
									<nobr> 미결재 </nobr>
								</div></td>
							<td class="txt_ce"><div>
									<nobr> 진행중 </nobr>
								</div></td>
							<td class="txt_ce"><div>
									<nobr> 김철수 이사 </nobr>
								</div></td>
							<td class="bdr_none txt_ce"><div>
									<nobr>1개</nobr>
								</div></td>
						</tr>


						<tr>
							<td class="txt_ce"><div>
									<nobr> 1012-0007 </nobr>
								</div></td>
							<td class="txt_ce"><div>
									<nobr> 10.12.03 </nobr>
								</div></td>
							<td class="txt_ce"><div>
									<nobr>
										<a>비공개문서</a>
									</nobr>
								</div></td>
							<td class="txt_ce"><div>
									<nobr> 최진성 사원 </nobr>
								</div></td>
							<td class="txt_ce"><div>
									<nobr> 미결재 </nobr>
								</div></td>
							<td class="txt_ce"><div>
									<nobr> 진행중 </nobr>
								</div></td>
							<td class="txt_ce"><div>
									<nobr> 김철수 이사 </nobr>
								</div></td>
							<td class="bdr_none txt_ce"><div>
									<nobr>4개</nobr>
								</div></td>
						</tr>


						<tr>
							<td class="txt_ce"><div>
									<nobr> 1012-0005 </nobr>
								</div></td>
							<td class="txt_ce"><div>
									<nobr> 10.12.03 </nobr>
								</div></td>
							<td class="txt_ce"><div>
									<nobr>
										<a>수신부서없는공개문서</a>
									</nobr>
								</div></td>
							<td class="txt_ce"><div>
									<nobr> 최진성 사원 </nobr>
								</div></td>
							<td class="txt_ce"><div>
									<nobr> 미결재 </nobr>
								</div></td>
							<td class="txt_ce"><div>
									<nobr> 진행중 </nobr>
								</div></td>
							<td class="txt_ce"><div>
									<nobr> 김철수 이사 </nobr>
								</div></td>
							<td class="bdr_none txt_ce"><div>
									<nobr>1개</nobr>
								</div></td>
						</tr>



					</tbody>
				</table>
			</div>


			<h4 class="mar5b left">개인 문서함 &gt; 상신문서</h4>
			<span class="right"><a
				onclick="javascript:subTabActive('', '3-15-00', '상신문서', '../EWord/?dummy=1437467164&gubun=1');"
				onfocus='this.blur();'><img
					src="http://static.whoisdesk.net/Src/Img/Renewal/btn_more.gif"
					class="pad10t mar5t mar5r" /></a></span>
			<div class="table2 clear">
				<table class="table_layout">
					<thead>
						<tr>
							<th><div>
									<nobr>문서번호</nobr>
								</div></th>
							<th><div>
									<nobr>기안일자</nobr>
								</div></th>
							<th><div>
									<nobr>문서명</nobr>
								</div></th>
							<th><div>
									<nobr>상태</nobr>
								</div></th>
							<th><div>
									<nobr>의견 </nobr>
								</div></th>
						</tr>
					</thead>
					<tbody>



						<tr>
							<td class="txt_ce"><div>
									<nobr> 1412-0001 </nobr>
								</div></td>
							<td class="txt_ce"><div>
									<nobr> 14.12.30 </nobr>
								</div></td>
							<td class="txt_ce"><div>
									<nobr>
										<a>dfasdf</a></td>
							<td class="txt_ce"><div>
									<nobr> 진행중 </nobr>
								</div></td>
							<td class="txt_ce bdr_none"><div>
									<nobr> 0개 </nobr>
								</div></td>
						</tr>
						<tr>
							<td class="txt_ce"><div>
									<nobr> 1301-0001 </nobr>
								</div></td>
							<td class="txt_ce"><div>
									<nobr> 13.01.09 </nobr>
								</div></td>
							<td class="txt_ce"><div>
									<nobr>
										<a>sdfsdf</a></td>
							<td class="txt_ce"><div>
									<nobr> 진행중 </nobr>
								</div></td>
							<td class="txt_ce bdr_none"><div>
									<nobr> 1개 </nobr>
								</div></td>
						</tr>
						<tr>
							<td class="txt_ce"><div>
									<nobr> 1105-0012 </nobr>
								</div></td>
							<td class="txt_ce"><div>
									<nobr> 11.05.09 </nobr>
								</div></td>
							<td class="txt_ce"><div>
									<nobr>
										<a>개발팀 워크샵 지출 결의서</a></td>
							<td class="txt_ce"><div>
									<nobr> 진행중 </nobr>
								</div></td>
							<td class="txt_ce bdr_none"><div>
									<nobr> 1개 </nobr>
								</div></td>
						</tr>





					</tbody>
				</table>
			</div>

			<h4>협조 문서함 &gt; 미결재 문서</h4>
			<span class="right"><a
				onclick="javascript:subTabActive('', '3-20-00', '미결재 문서', '../EWord/orderList.php?dummy=1437467164&gubun=3');"
				onfocus='this.blur();'><img
					src="http://static.whoisdesk.net/Src/Img/Renewal/btn_more.gif"
					class="pad10t mar5t mar5r" /></a></span>

			<div>
				<table class="table_layout">
					<thead>
						<tr>
							<th><div>
									<nobr>문서번호</nobr>
								</div></th>
							<th><div>
									<nobr>기안일자</nobr>
								</div></th>
							<th><div>
									<nobr>문서명</nobr>
								</div></th>
							<th><div>
									<nobr>기안자</nobr>
								</div></th>
							<th><div>
									<nobr>나의결재</nobr>
								</div></th>
							<th><div>
									<nobr>상태</nobr>
								</div></th>
							<th><div>
									<nobr>다음결재자</nobr>
								</div></th>
							<th><div>
									<nobr>의견 </nobr>
								</div></th>
						</tr>
					</thead>
					<tbody>


						<tr>
							<td colspan='8'>
								<div>
									<nobr> 해당 문서 정보가 없습니다. </nobr>
								</div>
							</td>
						</tr>






						<tr>
							<td colspan='8'>
								<div>
									<nobr>
										&nbsp;
										<!--해당 문서 정보가 없습니다.-->
									</nobr>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan='8'>
								<div>
									<nobr>
										&nbsp;
										<!--해당 문서 정보가 없습니다.-->
									</nobr>
								</div>
							</td>
						</tr>


					</tbody>
				</table>
			</div>
			<h4>전자결재 문서함 설명</h4>
			<div>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">

					<col width="20%" class="overf"></col>
					<col width="80%" class="overf"></col>

					<thead>
						<tr>
							<th rowspan="2">
								<div>
									<nobr>
										<span>결재할 문서함 </span>
									</nobr>
								</div>
							</th>
							<td>
								<div>
									<nobr>
										<span>미결재 문서 |</span> 내가 결재할 문서 중에 결재하지 않은 문서입니다.
									</nobr>
								</div>
							</td>
						</tr>
						<tr>
							<td style="border-top: none;">
								<div>
									<nobr>
										<span>결재완료 문서 |</span> 내가 결재할 문서 중 결재한 문서입니다.
									</nobr>
								</div>
							</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th rowspan="5">
								<div>
									<nobr>
										<span>개인 문서함 </span>
									</nobr>
								</div>
							</th>
							<td>
								<div>
									<nobr>
										<span>상신문서 |</span> 결재를 올린 문서 중 아직 진행중인 문서입니다.
										(결재/보류/기각/결재완료가 안된 문서)
									</nobr>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div>
									<nobr>
										<span>임시저장 | </span> 문서를 작성한 후 상신을 하지 않고, [임시저장하기] 버튼을 눌러 임시
										저장한 문서입니다.
									</nobr>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div>
									<nobr>
										<span>반려문서 | </span> 상신한 문서 중에 결재자가 보류/기각한 문서입니다.
									</nobr>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div>
									<nobr>
										<span>결재완료 | </span> 상신한 문서 중에서 결재자가 결재/전결한 문서입니다.
									</nobr>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div>
									<nobr>
										<span>상신취소 | </span> 상신한 문서 중에서 기안자가 상신을 취소한 문서입니다.
									</nobr>
								</div>
							</td>
						</tr>
						<tr>
							<th rowspan="2">
								<div>
									<nobr>
										<span>협조 문서함</span>
									</nobr>
								</div>
							</th>
							<td>
								<div>
									<nobr>
										<span>미결재 문서 | </span> 본인이 협조 결재라인에 들어가 있으며, 아직 협조란에 결재를 하지
										않은 상태입니다.
									</nobr>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div>
									<nobr>
										<span>결재완료 문서 | </span> 본인이 협조 결재라인에 들어가 있으며, 협조란에 결재를 완료한
										상태입니다.
									</nobr>
								</div>
							</td>
						</tr>
						<tr>
							<th>
								<div>
									<nobr>
										<span>부서 수신함 </span>
									</nobr>
								</div>
							</th>
							<td>
								<div>
									<nobr> 부서 수신함은 기안자가 수신부서를 선택하고, 결재가 완료되었을 경우 해당 결재문서를 부서
										수신함에서 볼 수 있습니다. </nobr>
								</div>
							</td>
						</tr>
						<tr>
							<th>
								<div>
									<nobr>
										<span>참조 수신함 </span>
									</nobr>
								</div>
							</th>
							<td>
								<div>
									<nobr> 참조 수신함은 기안자가 참조자를 선택하고, 결재가 완료되었을 경우 해당 결재문서를 참조
										수신함에서 볼 수 있습니다. </nobr>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- //전자결재 컨텐츠 -->
		</div>
	</div>
</body>

