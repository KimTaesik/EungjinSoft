<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >

<head>
<title>Whois Groupware - Ubiquitous Collaboration!</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<!--[if IE 6]>
	<link href="http://css.whoisdesk.net/Src/Skin/Renewal/board_ie6.css" rel="stylesheet" type="text/css" />
	<![endif]-->
<link type="text/css"
	href="http://css.whoisdesk.net/Src/WebCommon/Jquery/Jquery_ui_1_7_2/blitzer/jquery-ui-1.7.2.custom.css"
	rel="stylesheet" />
</head>

<body>

	<script type="text/javascript"
		src="http://gw.whoisdesk.kr/Src/WebCommon/Jquery/Plugin/DatePicker/ui.datepicker.js"></script>
	<script type="text/javascript"
		src="http://gw.whoisdesk.kr/Src/WebCommon/Jquery/Plugin/DatePicker/jquery.datepick-ko.js"></script>
	<link type="text/css"
		href="http://gw.whoisdesk.kr/Src/WebCommon/Jquery/Plugin/DatePicker/Demos/demos.css"
		rel="stylesheet" />
	<div id="sub">
		<!--  검색 버튼 영역 -->
		<form name="form" action="" method="post"
			onsubmit="return setSearchSubmit();">
			
			<div id="title">
				<h2>
					<c:if test=""></c:if>
					<span class="appr">결재할 문서함 &gt; 미결재 문서</span>
				</h2>
				<span class="tb_num"> <a class="cursor"
					onclick="javascript:goPageSizeMove(15);"><img
						src="http://static.whoisdesk.net/Src/Img/Renewal/table_number15_on.gif"
						alt="" title="15" /></a> <a class="cursor"
					onclick="javascript:goPageSizeMove(20);"><img
						src="http://static.whoisdesk.net/Src/Img/Renewal/table_number20_off.gif"
						alt="" title="20" /></a> <a class="cursor"
					onclick="javascript:goPageSizeMove(25);"><img
						src="http://static.whoisdesk.net/Src/Img/Renewal/table_number25_off.gif"
						alt="" title="25" /></a> <a class="cursor"
					onclick="javascript:goPageSizeMove(30);"><img
						src="http://static.whoisdesk.net/Src/Img/Renewal/table_number30_off.gif"
						alt="" title="30" />&nbsp;</a>
				</span>
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
										결재일자 <a class="cursor">
											</a>
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
							<th>
								<div>
									<nobr> 의견 </nobr>
								</div>
							</th>
						</tr>
					</thead>
					<tbody>

						<!-- COMMON DATA -->




						<tr>


							<td class="txt_ce">
								<div>
									<nobr> 1012-0009 </nobr>
								</div>
							</td>
							<td class="txt_ce">
								<div>
									<nobr> 10.12.03 </nobr>
								</div>
							</td>
							<td class="txt_ce">
								<div>
									<nobr> - </nobr>
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
										<a href='javascript:EWordView( 3, 7, 1 );' title='비공개문서2'>
											비공개문서2 </a>
									</nobr>
								</div>
							</td>
							<td class="txt_ce">
								<div>
									<nobr> 사원 최진성 </nobr>
								</div>
							</td>
							<td class="txt_ce">
								<div>
									<nobr> 미결재 </nobr>
								</div>
							</td>
							<td class="txt_ce">
								<div>
									<nobr> 진행중 </nobr>
								</div>
							</td>
							<td class="txt_ce">
								<div>
									<nobr> 김철수 이사 </nobr>
								</div>
							</td>
							<td class="txt_ce">
								<div>
									<nobr> 1 개 </nobr>
								</div>
							</td>
						</tr>


						<tr class="bgcolor">


							<td class="txt_ce">
								<div>
									<nobr> 1012-0007 </nobr>
								</div>
							</td>
							<td class="txt_ce">
								<div>
									<nobr> 10.12.03 </nobr>
								</div>
							</td>
							<td class="txt_ce">
								<div>
									<nobr> - </nobr>
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
										<a href='javascript:EWordView( 3, 6, 1 );' title='비공개문서'>
											비공개문서 </a>
									</nobr>
								</div>
							</td>
							<td class="txt_ce">
								<div>
									<nobr> 사원 최진성 </nobr>
								</div>
							</td>
							<td class="txt_ce">
								<div>
									<nobr> 미결재 </nobr>
								</div>
							</td>
							<td class="txt_ce">
								<div>
									<nobr> 진행중 </nobr>
								</div>
							</td>
							<td class="txt_ce">
								<div>
									<nobr> 김철수 이사 </nobr>
								</div>
							</td>
							<td class="txt_ce">
								<div>
									<nobr> 4 개 </nobr>
								</div>
							</td>
						</tr>


						<tr>


							<td class="txt_ce">
								<div>
									<nobr> 1012-0005 </nobr>
								</div>
							</td>
							<td class="txt_ce">
								<div>
									<nobr> 10.12.03 </nobr>
								</div>
							</td>
							<td class="txt_ce">
								<div>
									<nobr> - </nobr>
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
										<a href='javascript:EWordView( 3, 5, 1 );' title='수신부서없는공개문서'>
											수신부서없는공개문서 </a>
									</nobr>
								</div>
							</td>
							<td class="txt_ce">
								<div>
									<nobr> 사원 최진성 </nobr>
								</div>
							</td>
							<td class="txt_ce">
								<div>
									<nobr> 미결재 </nobr>
								</div>
							</td>
							<td class="txt_ce">
								<div>
									<nobr> 진행중 </nobr>
								</div>
							</td>
							<td class="txt_ce">
								<div>
									<nobr> 김철수 이사 </nobr>
								</div>
							</td>
							<td class="txt_ce">
								<div>
									<nobr> 1 개 </nobr>
								</div>
							</td>
						</tr>

						<!-- /COMMON DATA -->

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
	<!-- light box -->
	<div id="light" name="light" class="white_content">
		<table width='100%' height='100%' border='0'>
			<tr>
				<td align="center" valign="middle"><iframe id='iframePopup'
						name='iframePopup' frameborder='0' marginwidth='0'
						marginheight='0' scrolling='no'></iframe></td>
			</tr>
		</table>
	</div>

	<div id="fade" class="black_overlay"></div>
	<!-- /lignt box -->


</body>
</html>

