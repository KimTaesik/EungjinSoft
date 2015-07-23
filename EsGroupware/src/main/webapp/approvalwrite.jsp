<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>결재작성</title>

</head>
<body>
	<div style="float: left; border: 1px solid;">
		<%
			pageContext.include("/WEB-INF/views/organization/test.jsp");
		%>
	</div>

	<div >
		<!-- 버튼영역 -->
		<div >
			<h2>
				<span >결재문서 작성</span>
			</h2>
		</div>

		<div >
			
		</div>
		<!-- //버튼영역 -->

		<!-- 전자결재 문서 -->
		<form name="form" method="post" action='prc.php'
			enctype='multipart/form-data'>
			<!-- init editor : 결재문서 작성(설정형 에디터/기본형 에디터) -->
			<!-- tinymce editor -->
			<!-- 결재양식 제목 -->
			<h1 >기안서</h1>

			<!-- 결재문서 본문 -->
			<table>
				<tr>
					<td >
						<!-- ORDER 5 -->
						<table>
							<col >
							<col >
							<col >
							<col >
							<col style="width: 50%;">
							<!-- 문서번호, 결재선/협조선 -->
							<tr >
								<th style="border-top: none; border-left: none;">문서번호</th>
								<td colspan="3" style="border-top: none;">
									<span > <input type="text" id="WordNo"
										name="WordNo" style="border: 0pt;" value="1507-XXXX" size='10'
										readonly />
								</span> <span  style="display: none;"> <input
										type="text" id="WordNo1" name="WordNo" value="1507-XXXX"
										size='10' />
								</span> <!-- 문서번호 등록 --> <input type="checkbox" id="AutoWordNo"
									name="AutoWordNo" value="1" class="form_transparent"
									onclick="getAutoWordNo()" /> <span>문서번호 등록</span>
								</td>

								<td rowspan="6" style="border-top: none; border-right: none;">
									<table >
										<col >
										<col span="5">
										<!-- 결재선 -->
										<tr class="txt_ce" style="height: 20px;">
											<th rowspan="3" style="border-left: none; border-top: none;">
												<!-- 결재선/협조선 제목 --> <!-- 결재 --> 결<br>
											<br>재
											</th>
											<!-- 결재자/협조자 직급 표시 영역 -->
											<td style="border-top: none;"><input type="text"
												name="OrderTitle1" value="대표" readonly
												class="form_transparent"
												style='width: 100%; line-height: 21px;'></td>
											<td style="border-top: none;"><input type="text"
												name="OrderTitle2" value="주임" readonly
												class="form_transparent"
												style='width: 100%; line-height: 21px;'></td>
											<td style="border-top: none;"><input type="text"
												name="OrderTitle3" value="과장" readonly
												class="form_transparent"
												style='width: 100%; line-height: 21px;'></td>
											<td style="border-top: none;"><input type="text"
												name="OrderTitle4" value="상무이사" readonly
												class="form_transparent"
												style='width: 100%; line-height: 21px;'></td>
											<td style="border-top: none;"><input type="text"
												name="OrderTitle5" value="대표" readonly
												class="form_transparent"
												style='width: 100%; line-height: 21px;'></td>
										</tr>
										<tr class="date" style="height: 61px;">
											<!-- 결재 버튼/결재완료 서명 표시 영역 -->
											<td><input type="text" name="OrderName1" value="한상준"
												readonly class="form_transparent" style='width: 100%;'>
												<input type="hidden" name="OrderId1" value="ME"></td>
											<td><input type="text" name="OrderName2" value="이한용"
												readonly class="form_transparent" style='width: 100%;'>
												<input type="hidden" name="OrderId2" value="admin">
												<!-- 지정/취소 버튼 -->
												<div id="MembersFindCell2" class="btn_page pad15l overf">
													<!-- 취소 -->
													<a class="cursor" onclick="MembersDelete(2);"> <span>취소</span>
													</a>
												</div></td>
											<td><input type="text" name="OrderName3" value="유종환"
												readonly class="form_transparent" style='width: 100%;'>
												<input type="hidden" name="OrderId3" value="desk05">
												<!-- 지정/취소 버튼 -->
												<div id="MembersFindCell3" class="btn_page pad15l overf">
													<!-- 취소 -->
													<a class="cursor" onclick="MembersDelete(3);"> <span>취소</span>
													</a>
												</div></td>
											<td><input type="text" name="OrderName4" value="박소현"
												readonly class="form_transparent" style='width: 100%;'>
												<input type="hidden" name="OrderId4" value="desk09">
												<!-- 지정/취소 버튼 -->
												<div id="MembersFindCell4" class="btn_page pad15l overf">
													<!-- 취소 -->
													<a class="cursor" onclick="MembersDelete(4);"> <span>취소</span>
													</a>
												</div></td>
											<td><input type="text" name="OrderName5" value="김남민"
												readonly class="form_transparent" style='width: 100%;'>
												<input type="hidden" name="OrderId5" value="desk10">
												<!-- 지정/취소 버튼 -->
												<div id="MembersFindCell5" class="btn_page pad15l overf">
													<!-- 취소 -->
													<a class="cursor" onclick="MembersDelete(5);"> <span>취소</span>
													</a>
												</div></td>
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
											<th rowspan="3"
												style="border-left: none; border-top: none; border-bottom: none;">
												<!-- 결재선/협조선 제목 --> <!-- 협조 --> 협<br>
											<br>조
											</th>
											<!-- 결재자/협조자 직급 표시 영역 -->
											<td><input type="text" name="OrderTitle11"
												value="주임" readonly class="form_transparent"
												style='width: 100%; line-height: 21px;'></td>
											<td><input type="text" name="OrderTitle12"
												value="" readonly class="form_transparent"
												style='width: 100%; line-height: 21px;'></td>
											<td><input type="text" name="OrderTitle13"
												value="" readonly class="form_transparent"
												style='width: 100%; line-height: 21px;'></td>
											<td><input type="text" name="OrderTitle14"
												value="" readonly class="form_transparent"
												style='width: 100%; line-height: 21px;'></td>
											<td><input type="text" name="OrderTitle15"
												value="" readonly class="form_transparent"
												style='width: 100%; line-height: 21px;'></td>
										</tr>
										<tr class="date" style="height: 61px;">
											<!-- 결재 버튼/결재완료 서명 표시 영역 -->
											<td><input type="text" name="OrderName11" value="박경희"
												readonly class="form_transparent" style='width: 100%;'>
												<input type="hidden" name="OrderId11" value="desk25">
												<!-- 지정/취소 버튼 -->
												<div id="MembersFindCell11" class="btn_page pad15l overf">
													<!-- 취소 -->
													<a class="cursor" onclick="MembersDelete(11);"> <span>취소</span>
													</a>
												</div></td>
											<td><input type="text" name="OrderName12" value=""
												readonly class="form_transparent" style='width: 100%;'>
												<input type="hidden" name="OrderId12" value=""> <!-- 지정/취소 버튼 -->
												<div id="MembersFindCell12" class="btn_page pad15l overf">
													<!-- 지정 -->
													<a class="openPopup"
														href="myOrderUserAppointPopup.php?mode=order&number=12&total=5&WordUseHelper=Y">
														<span>지정</span>
													</a>
												</div></td>
											<td><input type="text" name="OrderName13" value=""
												readonly class="form_transparent" style='width: 100%;'>
												<input type="hidden" name="OrderId13" value=""> <!-- 지정/취소 버튼 -->
												<div id="MembersFindCell13" class="btn_page pad15l overf">
													<!-- 지정 -->
													<a class="openPopup"
														href="myOrderUserAppointPopup.php?mode=order&number=13&total=5&WordUseHelper=Y">
														<span>지정</span>
													</a>
												</div></td>
											<td><input type="text" name="OrderName14" value=""
												readonly class="form_transparent" style='width: 100%;'>
												<input type="hidden" name="OrderId14" value=""> <!-- 지정/취소 버튼 -->
												<div id="MembersFindCell14" class="btn_page pad15l overf">
													<!-- 지정 -->
													<a class="openPopup"
														href="myOrderUserAppointPopup.php?mode=order&number=14&total=5&WordUseHelper=Y">
														<span>지정</span>
													</a>
												</div></td>
											<td><input type="text" name="OrderName15" value=""
												readonly class="form_transparent" style='width: 100%;'>
												<input type="hidden" name="OrderId15" value=""> <!-- 지정/취소 버튼 -->
												<div id="MembersFindCell15" class="btn_page pad15l overf">
													<!-- 지정 -->
													<a class="openPopup"
														href="myOrderUserAppointPopup.php?mode=order&number=15&total=5&WordUseHelper=Y">
														<span>지정</span>
													</a>
												</div></td>
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
							<!-- 문서종류 -->
							<tr class="eword_meta_height">
								<th style="border-left: none;">문서종류</th>
								<td class="pad15l" colspan="3">기안서</td>

							</tr>
							<!-- 부서 -->
							<tr class="eword_meta_height">
								<th style="border-left: none;">부서</th>
								<td class="pad15l" colspan="3">임원</td>

							</tr>
							<!-- 기안일 -->
							<tr class="eword_meta_height">
								<th style="border-left: none;">기안일</th>
								<td class="pad15l" colspan="3"><input name="DraftingY"
									type="text" value="2015" size="4" maxlength="4"> <label>년</label>
									<input name="DraftingM" type="text" value="07" size="2"
									maxlength="2"> <label>월</label> <input name="DraftingD"
									type="text" value="22" size="2" maxlength="2"> <label>일</label>
								</td>

							</tr>
							<!-- 기안자, (출장인원) -->
							<tr class="eword_meta_height">
								<th style="border-left: none;">기안자</th>
								<td class="pad15l " colspan="3">대표 한상준</td>

								<!-- 출장인원 -->
							</tr>
							<!-- 공개여부, 보존기간 -->
							<tr class="eword_meta_height">
								<th style="border-left: none;">공개여부</th>
								<td class="txt_ce">
									<!-- 작성 --> <select name="Opening"
									onchange="ReceiveTreeKeyButton();"><option label="공개"
											value="Y" selected="selected">공개</option>
										<option label="비공개" value="N">비공개</option>
								</select>
								</td>

								<th>보존기간</th>
								<td class="txt_ce">
									<!-- 작성 --> <select name='StoragePeriod'><option
											label="3 개월" value="3">3 개월</option>
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
										<option label="10 년" value="120" selected="selected">10
											년</option>
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
								<td class="pad15l" style="padding-right: 7px;"><span
									id="ReceiveTreeKeyButtonArea" style='width: 100%;'> <input
										type="text" name="ReceiveTreeKeyName" value="전략기획팀" readonly
										class="left" style="width: 394px;" /> <span
										class="btn_page right"> <!-- 수신부서 지정 --> <a
											class="cursor openPopupTreeKeyFind"> <span class="txt_ce"
												style="width: 70px;">수신부서 지정</span>
										</a> <!-- 수신부서 보기 --> <a class="cursor openPopupTreeKeyView">
												<span class="txt_ce" style="width: 70px;">수신부서 보기</span>
										</a>
									</span>
								</span></td>
							</tr>

							<!-- 참조자 -->
							<tr class="eword_meta_height">
								<th style="border-left: none;">참조자</th>
								<td class="pad15l" style="padding-right: 7px;"><input
									type="text" name="referenceUserName" value="김태희 대표" readonly
									class="left" style="width: 394px;" /> <span
									class="btn_page right"> <!-- 참조자 지정 --> <a
										class="cursor openPopupReferenceUser"> <span
											class="txt_ce" style="width: 70px;">참조자 지정</span>
									</a> <!-- 참조자 보기 --> <a class="cursor openPopupReferenceUserView">
											<span class="txt_ce" style="width: 70px;">참조자 보기</span>
									</a></td>
							</tr>

							<!-- 제목 -->
							<tr class="eword_meta_height">
								<th style="border-left: none;">제목</th>
								<td class="pad15l"><input name="Subject" type="text"
									value="" style="width: 98%;" /></td>
							</tr>
						</table>
					</td>
				</tr>



				<!-- 기본형 에디터 -->
				<tr>
					<td id="eword_content" class="pad5"><textarea name="Contents"
							id="Contents" style="width: 100%; height: 800px; display: block;">&nbsp;</textarea>
					</td>
				</tr>

			</table>
</body>
</html>