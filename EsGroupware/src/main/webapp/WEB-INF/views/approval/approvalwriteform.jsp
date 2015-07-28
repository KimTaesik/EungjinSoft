 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
	
	
</head>

<body>

<link rel="stylesheet" type="text/css" href="http://css.whoisdesk.net/Src/Skin/Renewal/eword_common.css?v=20150706"/>
<link rel="stylesheet" type="text/css" href="http://css.whoisdesk.net/Src/Skin/Renewal/eword_write.css?v=20150702"/>

<div id="sub">
	<!-- 버튼영역 -->
	<div id="title">
		<h2>
			<span class="appr">결재문서 작성</span>
		</h2>
	</div>

	<div class="toparea mar10b">
		<span class="leftarea">
			<span class="btn">
				<!-- 목록 -->
				<a class="cursor" onclick="GoList();">
					<img src="http://static.whoisdesk.net/Src/Img/Renewal/icon_list.gif" alt="" width="16" height="16"  align="absmiddle" />
					목록
				</a>
									<!-- 결재선 지정 -->
					<a class="cursor openPopupLineSet">
						<img src="http://static.whoisdesk.net/Src/Img/Renewal/icon_pencil.gif" alt=""  align="absmiddle" />
						결재선 지정
					</a>
							</span>
		</span>
		<span class="rightarea">
			<span class="btn">
													<!-- 임시 저장하기 -->
					<a id="preSubmitBtn" class="cursor" onclick="try { parent.Ext.Msg.alert('Groupware Demo','<span style=color:#C8C9CA;><br />데모 체험하기는 글쓰기 등록 및 수정이 제한되어 있습니다. <br /><br />이점 양해해주시기 바랍니다.</span>');return false; } catch(e) { try { parent.parent.Ext.Msg.alert('Groupware Demo','<span style=color:#C8C9CA;><br />데모 체험하기는 글쓰기 등록 및 수정이 제한되어 있습니다. <br /><br />이점 양해해주시기 바랍니다.</span>');return false; } catch(e) { alert('그룹웨어 데모에서는 사용하실 수 없습니다.');return false; } }preSubmitPrc();">
						<img src="http://static.whoisdesk.net/Src/Img/Renewal/icon_document-save.gif" alt="" width="16" height="16"  align="absmiddle" />
						임시 저장하기
					</a>
								<!-- 상신하기 -->
				<a id="exitSubmitBtn" class="cursor" onclick="try { parent.Ext.Msg.alert('Groupware Demo','<span style=color:#C8C9CA;><br />데모 체험하기는 글쓰기 등록 및 수정이 제한되어 있습니다. <br /><br />이점 양해해주시기 바랍니다.</span>');return false; } catch(e) { try { parent.parent.Ext.Msg.alert('Groupware Demo','<span style=color:#C8C9CA;><br />데모 체험하기는 글쓰기 등록 및 수정이 제한되어 있습니다. <br /><br />이점 양해해주시기 바랍니다.</span>');return false; } catch(e) { alert('그룹웨어 데모에서는 사용하실 수 없습니다.');return false; } }exitSubmitPrc();">
					<img src="http://static.whoisdesk.net/Src/Img/Renewal/document-icon_import.gif" alt=""  align="absmiddle" />
					상신하기
				</a>
			</span>
		</span>
	</div>
	<!-- //버튼영역 -->

	<!-- 전자결재 문서 -->
	<form name="form" method="post" action='prc.php' enctype='multipart/form-data' class="mar10b black">
		<input type="hidden" name="code"			value="Conversion">
		
		<input type="hidden" name="DcsNo"			value="1">
		<input type="hidden" name="No"				value="">
		<input type="hidden" name="Category"		value="1">
		<input type="hidden" name="Category2"		value="0">
		<input type="hidden" name="gubun"			value="">
		<input type="hidden" name="UseChk"			value="N">
		<input type="hidden" name="UseEditor"		value="Y">
		<input type="hidden" name="ReceiveTreeKey"	value="0004">
		<input type="hidden" name="referenceUser"	value="desk08">
		
		<input type="hidden" name="eId"				value="desk02">
		<input type="hidden" name="eName"			value="한상준">
		<input type="hidden" name="eTreeKey"		value="0001">
		<input type="hidden" name="eCopLevel"		value="1">
		<input type="hidden" name="presave"			value=''>
		<input type="hidden" name="listPageNow"		value="">
		<input type="hidden" name="HCnt"			value="">
		<input type="hidden" name="HIdx"			value="">
		<input type="hidden" name="AIdx"			value="">
		<input type="hidden" name="Cd"				value="">
		
				
		<input type="hidden" name="editorName"		value="">
		<input type="hidden" name="returnPage"		value="">
		<input type="hidden" name="agentInfo"		value="" />
		<input type="hidden" name="HalfTimeUse"		value="">
		
			<!-- init editor : 결재문서 작성(설정형 에디터/기본형 에디터) -->
			<!-- tinymce editor -->		<script type="text/javascript" src="/Src/WebCommon/tiny_mce/tiny_mce.js"></script>
		<script type="text/javascript" src="/Src/WebCommon/tiny_mce/tiny_mce_init_eword.js"></script>
	<!-- 결재양식 제목 -->
<h1 class="eword_maincolumn">기안서</h1>

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
				<col style="width:50%;">
				<!-- 문서번호, 결재선/협조선 -->
				<tr class="eword_meta_height">
					<th style="border-top: none; border-left: none;" >문서번호</th>
<td class="pad15l" colspan="3" style="border-top: none;" >
			<span id ="sub_subject">
			<input type="text" id="WordNo" name="WordNo" style="border:0pt;" value="1507-XXXX" size='10' readonly />
		</span>
					<span id ="sub_subject1" style ="display: none;">
				<input type="text" id="WordNo1" name="WordNo" value="1507-XXXX" size='10'  />
			</span>
			<!-- 문서번호 등록 -->
			<input type="checkbox"  id="AutoWordNo" name="AutoWordNo" value="1" class="form_transparent" onclick="getAutoWordNo()" />
			<span>문서번호 등록</span>
			</td>

					<td rowspan="6" style="border-top: none; border-right: none;"  >
						<table id="eword_orderline" class="eword_meta">
							<col class="orderline_th_width">
							<col class="orderline_width" span="5">
							<!-- 결재선 -->
							<tr class="txt_ce" style="height:20px;">
	<th rowspan="3" 
		style="border-left: none; border-top: none; "
			>
		<!-- 결재선/협조선 제목 -->
					<!-- 결재 -->
			결<br><br>재
			</th>
	<!-- 결재자/협조자 직급 표시 영역 -->
		<td 
		style="border-top: none;"			>
				<input type="text" name="OrderTitle1" value="대표" readonly class="form_transparent" style='width:100%;line-height:21px;'>
			</td>
		<td 
		style="border-top: none;"			>
				<input type="text" name="OrderTitle2" value="주임" readonly class="form_transparent" style='width:100%;line-height:21px;'>
			</td>
		<td 
		style="border-top: none;"			>
				<input type="text" name="OrderTitle3" value="과장" readonly class="form_transparent" style='width:100%;line-height:21px;'>
			</td>
		<td 
		style="border-top: none;"			>
				<input type="text" name="OrderTitle4" value="상무이사" readonly class="form_transparent" style='width:100%;line-height:21px;'>
			</td>
		<td 
		style="border-top: none;"			>
				<input type="text" name="OrderTitle5" value="대표" readonly class="form_transparent" style='width:100%;line-height:21px;'>
			</td>
	</tr>
<tr class="date" style="height:61px;">
	<!-- 결재 버튼/결재완료 서명 표시 영역 -->
			<td>
							<input type="text"   name="OrderName1" value="한상준" readonly class="form_transparent" style='width:100%;'>
				<input type="hidden" name="OrderId1" value="ME">
									</td>
			<td>
							<input type="text"   name="OrderName2" value="이한용" readonly class="form_transparent" style='width:100%;'>
				<input type="hidden" name="OrderId2" value="admin">
									<!-- 지정/취소 버튼 -->					<div id="MembersFindCell2"  class="btn_page pad15l overf">
													<!-- 취소 -->
							<a class="cursor" onclick="MembersDelete(2);">
								<span>취소</span>
							</a>
											</div>
									</td>
			<td>
							<input type="text"   name="OrderName3" value="유종환" readonly class="form_transparent" style='width:100%;'>
				<input type="hidden" name="OrderId3" value="desk05">
									<!-- 지정/취소 버튼 -->					<div id="MembersFindCell3"  class="btn_page pad15l overf">
													<!-- 취소 -->
							<a class="cursor" onclick="MembersDelete(3);">
								<span>취소</span>
							</a>
											</div>
									</td>
			<td>
							<input type="text"   name="OrderName4" value="박소현" readonly class="form_transparent" style='width:100%;'>
				<input type="hidden" name="OrderId4" value="desk09">
									<!-- 지정/취소 버튼 -->					<div id="MembersFindCell4"  class="btn_page pad15l overf">
													<!-- 취소 -->
							<a class="cursor" onclick="MembersDelete(4);">
								<span>취소</span>
							</a>
											</div>
									</td>
			<td>
							<input type="text"   name="OrderName5" value="김남민" readonly class="form_transparent" style='width:100%;'>
				<input type="hidden" name="OrderId5" value="desk10">
									<!-- 지정/취소 버튼 -->					<div id="MembersFindCell5"  class="btn_page pad15l overf">
													<!-- 취소 -->
							<a class="cursor" onclick="MembersDelete(5);">
								<span>취소</span>
							</a>
											</div>
									</td>
	</tr>
<tr class="date" style="height:20px;">
	<!-- 결재일시 표시 영역 -->
			<td >
							<span id="appDate1">&nbsp;</span>
					</td>
			<td >
							<span id="appDate2">&nbsp;</span>
					</td>
			<td >
							<span id="appDate3">&nbsp;</span>
					</td>
			<td >
							<span id="appDate4">&nbsp;</span>
					</td>
			<td >
							<span id="appDate5">&nbsp;</span>
					</td>
	</tr>
							<!-- 협조선 -->
							<tr class="txt_ce" style="height:20px;">
	<th rowspan="3" 
		style="border-left: none; border-top: none; border-bottom: none;"
			>
		<!-- 결재선/협조선 제목 -->
								<!-- 협조 -->
				협<br><br>조
						</th>
	<!-- 결재자/협조자 직급 표시 영역 -->
		<td 
					>
				<input type="text" name="OrderTitle11" value="주임" readonly class="form_transparent" style='width:100%;line-height:21px;'>
			</td>
		<td 
					>
				<input type="text" name="OrderTitle12" value="" readonly class="form_transparent" style='width:100%;line-height:21px;'>
			</td>
		<td 
					>
				<input type="text" name="OrderTitle13" value="" readonly class="form_transparent" style='width:100%;line-height:21px;'>
			</td>
		<td 
					>
				<input type="text" name="OrderTitle14" value="" readonly class="form_transparent" style='width:100%;line-height:21px;'>
			</td>
		<td 
					>
				<input type="text" name="OrderTitle15" value="" readonly class="form_transparent" style='width:100%;line-height:21px;'>
			</td>
	</tr>
<tr class="date" style="height:61px;">
	<!-- 결재 버튼/결재완료 서명 표시 영역 -->
			<td>
							<input type="text"   name="OrderName11" value="박경희" readonly class="form_transparent" style='width:100%;'>
				<input type="hidden" name="OrderId11" value="desk25">
									<!-- 지정/취소 버튼 -->					<div id="MembersFindCell11"  class="btn_page pad15l overf">
													<!-- 취소 -->
							<a class="cursor" onclick="MembersDelete(11);">
								<span>취소</span>
							</a>
											</div>
									</td>
			<td>
							<input type="text"   name="OrderName12" value="" readonly class="form_transparent" style='width:100%;'>
				<input type="hidden" name="OrderId12" value="">
									<!-- 지정/취소 버튼 -->					<div id="MembersFindCell12"  class="btn_page pad15l overf">
													<!-- 지정 -->
							<a class="openPopup"  href="myOrderUserAppointPopup.php?mode=order&number=12&total=5&WordUseHelper=Y">
								<span>지정</span>
							</a>
											</div>
									</td>
			<td>
							<input type="text"   name="OrderName13" value="" readonly class="form_transparent" style='width:100%;'>
				<input type="hidden" name="OrderId13" value="">
									<!-- 지정/취소 버튼 -->					<div id="MembersFindCell13"  class="btn_page pad15l overf">
													<!-- 지정 -->
							<a class="openPopup"  href="myOrderUserAppointPopup.php?mode=order&number=13&total=5&WordUseHelper=Y">
								<span>지정</span>
							</a>
											</div>
									</td>
			<td>
							<input type="text"   name="OrderName14" value="" readonly class="form_transparent" style='width:100%;'>
				<input type="hidden" name="OrderId14" value="">
									<!-- 지정/취소 버튼 -->					<div id="MembersFindCell14"  class="btn_page pad15l overf">
													<!-- 지정 -->
							<a class="openPopup"  href="myOrderUserAppointPopup.php?mode=order&number=14&total=5&WordUseHelper=Y">
								<span>지정</span>
							</a>
											</div>
									</td>
			<td>
							<input type="text"   name="OrderName15" value="" readonly class="form_transparent" style='width:100%;'>
				<input type="hidden" name="OrderId15" value="">
									<!-- 지정/취소 버튼 -->					<div id="MembersFindCell15"  class="btn_page pad15l overf">
													<!-- 지정 -->
							<a class="openPopup"  href="myOrderUserAppointPopup.php?mode=order&number=15&total=5&WordUseHelper=Y">
								<span>지정</span>
							</a>
											</div>
									</td>
	</tr>
<tr class="date" style="height:20px;">
	<!-- 결재일시 표시 영역 -->
			<td style="border-bottom: none;">
							<span id="appDate11">&nbsp;</span>
					</td>
			<td style="border-bottom: none;">
							<span id="appDate12">&nbsp;</span>
					</td>
			<td style="border-bottom: none;">
							<span id="appDate13">&nbsp;</span>
					</td>
			<td style="border-bottom: none;">
							<span id="appDate14">&nbsp;</span>
					</td>
			<td style="border-bottom: none;">
							<span id="appDate15">&nbsp;</span>
					</td>
	</tr>
						</table>
					</td>
				</tr>
				<!-- 문서종류 -->
				<tr class="eword_meta_height">
					<th style="border-left: none;" >문서종류</th>
<td class="pad15l"  colspan="3" >기안서</td>

				</tr>
				<!-- 부서 -->
				<tr class="eword_meta_height">
					<th style="border-left: none;">부서</th>
<td class="pad15l" colspan="3">임원</td>

				</tr>
				<!-- 기안일 -->
				<tr class="eword_meta_height">
					<th style="border-left: none;">기안일</th>
<td class="pad15l" colspan="3" >
			<input name="DraftingY" type="text" value="2015" size="4" maxlength="4">
		<label>년</label>
		<input name="DraftingM" type="text" value="07" size="2" maxlength="2">
		<label>월</label>
		<input name="DraftingD" type="text" value="27" size="2" maxlength="2">
		<label>일</label>
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
<td class="txt_ce"  >
										<!-- 작성 -->
				<select name="Opening" onchange="ReceiveTreeKeyButton();"><option label="공개" value="Y" selected="selected">공개</option>
<option label="비공개" value="N">비공개</option>
</select>
						</td>

					<th  >보존기간</th>
<td class="txt_ce"  >
						<!-- 작성 -->
			<select name='StoragePeriod'><option label="3 개월" value="3">3 개월</option>
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
<option label="10 년" value="120" selected="selected">10 년</option>
<option label="무기한" value="12000">무기한</option>
</select>
			</td>

				</tr>
			</table>
			<!-- /ORDER 5 -->
						
			<table id="eword_header_common" class="eword_meta">
									<col class="eword_th_width">
								<col>
								<!-- 수신부서 -->
				<tr class="eword_meta_height">
					<th style="border-left: none;">수신부서</th>
					<td class="pad15l" style="padding-right:7px;">
													<span id="ReceiveTreeKeyButtonArea" style='width:100%;'>
								<input type="text" name="ReceiveTreeKeyName" value="전략기획팀" readonly class="left" style="width:394px;"/>
								<span class="btn_page right">
																			<!-- 수신부서 지정 -->
										<a class="cursor openPopupTreeKeyFind">
											<span class="txt_ce"style="width:70px;">수신부서 지정</span>
										</a>
																		<!-- 수신부서 보기 -->
									<a class="cursor openPopupTreeKeyView">
										<span class="txt_ce"style="width:70px;">수신부서 보기</span>
									</a>
								</span>
							</span>
											</td>
				</tr>
						
								<!-- 참조자 -->
				<tr class="eword_meta_height">
					<th style="border-left: none;">참조자</th>
					<td class="pad15l" style="padding-right:7px;">
													<input type="text" name="referenceUserName" value="김태희 대표" readonly class="left" style="width:394px;"/>
							<span class="btn_page right">
															<!-- 참조자 지정 -->
								<a class="cursor openPopupReferenceUser">
									<span class="txt_ce"style="width:70px;">참조자 지정</span>
								</a>
														<!-- 참조자 보기 -->
							<a class="cursor openPopupReferenceUserView">
								<span class="txt_ce"style="width:70px;">참조자 보기</span>
							</a>
											</td>
				</tr>
						
				<!-- 제목 -->
				<tr class="eword_meta_height">
					<th style="border-left: none;" >제목</th>
					<td class="pad15l"  >
													<input name="Subject" type="text" value=""  style="width:98%;"/>
											</td>
				</tr>
			</table>
		</td>
	</tr>
	
			
			
			<!-- 기본형 에디터 -->
		<tr>
			<td id="eword_content" class="pad5">
									<textarea name="Contents" id="Contents" style="width:100%;height:800px;display:block;">&nbsp;</textarea>
				</td>
		</tr>
			
	</table>

<!-- 첨부파일 -->
<table class="eword_maincolumn eword_meta mar10b">
	<col class="eword_th_width">
	<col>
		<tr>
		<th>첨부파일</th>
		<td id="addFile" class="pad5"></td>
	</tr>
	</table>


<!-- 안내 -->
<div class="eword_maincolumn mar10b black">
	※ 한번에 올릴 수 있는 파일용량은 최대 10MB 입니다.<br>
	※ 파일 업로드시 파일명을 되도록 영문 또는 숫자로 해주시고, 한글로 할 경우에는 파일열기가 안될경우도 있습니다.<br>

	</div>

<!-- 회사명 -->
<div class="company eword_maincolumn mar10b black"></div>	</form>
	<!-- 전자결재 문서 -->

	<!-- 버튼영역 -->
	<div class="btmarea">
		<span class="leftarea">
			<span class="btn">
				<!-- 목록 -->
				<a class="cursor" onclick="GoList();">
					<img src="http://static.whoisdesk.net/Src/Img/Renewal/icon_list.gif" alt="" width="16" height="16"  align="absmiddle" />
					목록
				</a>
									<!-- 결재선 지정 -->
					<a class="cursor openPopupLineSet">
						<img src="http://static.whoisdesk.net/Src/Img/Renewal/icon_pencil.gif" alt=""  align="absmiddle" />
						결재선 지정
					</a>
							</span>
		</span>
		<span class="rightarea">
			<span class="btn">
													<!-- 임시 저장하기 -->
					<a id="preSubmitBtnBottom" class="cursor" onclick="try { parent.Ext.Msg.alert('Groupware Demo','<span style=color:#C8C9CA;><br />데모 체험하기는 글쓰기 등록 및 수정이 제한되어 있습니다. <br /><br />이점 양해해주시기 바랍니다.</span>');return false; } catch(e) { try { parent.parent.Ext.Msg.alert('Groupware Demo','<span style=color:#C8C9CA;><br />데모 체험하기는 글쓰기 등록 및 수정이 제한되어 있습니다. <br /><br />이점 양해해주시기 바랍니다.</span>');return false; } catch(e) { alert('그룹웨어 데모에서는 사용하실 수 없습니다.');return false; } }preSubmitPrc();">
						<img src="http://static.whoisdesk.net/Src/Img/Renewal/icon_document-save.gif" alt="" width="16" height="16"  align="absmiddle" />
						임시 저장하기
					</a>
								<!-- 상신하기 -->
				<a id="exitSubmitBtnBottom" class="cursor" onclick="try { parent.Ext.Msg.alert('Groupware Demo','<span style=color:#C8C9CA;><br />데모 체험하기는 글쓰기 등록 및 수정이 제한되어 있습니다. <br /><br />이점 양해해주시기 바랍니다.</span>');return false; } catch(e) { try { parent.parent.Ext.Msg.alert('Groupware Demo','<span style=color:#C8C9CA;><br />데모 체험하기는 글쓰기 등록 및 수정이 제한되어 있습니다. <br /><br />이점 양해해주시기 바랍니다.</span>');return false; } catch(e) { alert('그룹웨어 데모에서는 사용하실 수 없습니다.');return false; } }exitSubmitPrc();">
					<img src="http://static.whoisdesk.net/Src/Img/Renewal/document-icon_import.gif" alt=""  align="absmiddle" />
					상신하기
				</a>
			</span>
		</span>
	</div>
	<!-- //버튼영역 -->
</div>

<script type="text/javascript" src="/Src/WebCommon/Script/preventDuplicateSubmit.js"></script>
<script type="text/javascript">
var $jquery = jQuery.noConflict();
var writeModify = Boolean('');

$jquery().ready(function() {
	//결재자/협조자/대체근무자 지정 팝업
	$jquery('.openPopup').openDOMWindow(getOpenDomWindowOpt(510, 478, false, 'click'));

	if ( !writeModify ) {
		// 결재문서 작성에서만 사용
		
		//수신부서 지정 팝업
		$jquery('.openPopupTreeKeyFind').click(function(){
			var dateObj = new Date();
			var dummy = dateObj.getTime();
			var f = document.form;
			if ( f.Opening && f.Opening.value == 'Y' ) {
				var pars = f.ReceiveTreeKey.value;
				var url = 'receiveTreeKeyFind.php?dummy='+dummy;
				url += '&treeKeys='+pars;
	
				var opt = getOpenDomWindowOpt(577, 690, url);
	
				$jquery.openDOMWindow(opt);
			} else {
				alert('공개여부를 공개로 선택하셔야\n\n수신부서를 선택할 수 있습니다.');
			}
		});
		
		//참조자 지정 팝업
		$jquery('.openPopupReferenceUser').click(function(){
			var dateObj = new Date();
			var dummy = dateObj.getTime();
			var f = document.form;
			var pars = f.referenceUser.value;
			var url = 'referenceUserFind.php?dummy='+dummy+'&ids='+pars;
			var opt = getOpenDomWindowOpt(577, 690, url);
			$jquery.openDOMWindow(opt);
		});
		
		// 결재선 지정 팝업
		$jquery('.openPopupLineSet').click(function(){
			try { parent.Ext.Msg.alert('Groupware Demo','<span style=color:#C8C9CA;><br />데모 체험하기는 글쓰기 등록 및 수정이 제한되어 있습니다. <br /><br />이점 양해해주시기 바랍니다.</span>');return false; } catch(e) { try { parent.parent.Ext.Msg.alert('Groupware Demo','<span style=color:#C8C9CA;><br />데모 체험하기는 글쓰기 등록 및 수정이 제한되어 있습니다. <br /><br />이점 양해해주시기 바랍니다.</span>');return false; } catch(e) { alert('그룹웨어 데모에서는 사용하실 수 없습니다.');return false; } }
			var dateObj = new Date();
			var dummy = dateObj.getTime();
			var f = document.form;
			var url = 'myOrderLineSet.php?dummy='+dummy;
			url+= '&mode=popup';
			url+= '&Category='+f.Category.value;
			url+= '&OrderTotal=5';
			url+= '&WordUseHelper=Y';
			var opt = getOpenDomWindowOpt(550, 650, url);
			$jquery.openDOMWindow(opt);
			return false;
		});
	}
	
	// 수신부서 보기 팝업 (지정한 수신부서)
	$jquery('.openPopupTreeKeyView').click(function(){
		var dateObj = new Date();
		var dummy = dateObj.getTime();
		var f = document.form;
		var pars = f.ReceiveTreeKey.value;
		var url = 'receiveTreeKeyView.php?dummy='+dummy+'&treeKeys='+pars;
		var opt = getOpenDomWindowOpt(500, 500, url);
		$jquery.openDOMWindow(opt);
	});
	
	//참조자 보기 팝업 (지정한 참조자 보기)
	$jquery('.openPopupReferenceUserView').click(function(){
		var dateObj = new Date();
		var dummy = dateObj.getTime();
		var f = document.form;
		var pars = f.referenceUser.value;
		var url = 'referenceUserView.php?dummy='+dummy+'&ids='+pars;
		var opt = getOpenDomWindowOpt(500, 500, url);
		$jquery.openDOMWindow(opt);
		return false;
	});


	// 대결자 정보 초기화
	initSetAgent();
});

function getOpenDomWindowOpt(wid, hei, url, evtType) {
	var opt = {
		height:hei,
		width:wid,
		loader:1,
		modal : 1,
		overlayColor: '#C2C2C2',
		overlayOpacity : '50',
		windowSource:'iframe',
		borderColor: '#737373',
		borderSize: 1,
		windowPadding:0
	};

	if(!url && typeof evtType != 'undefined') opt.eventType = evtType;
	else opt.windowSourceURL = url;

	return opt;
}

function setPopupClose() {
	$jquery.closeDOMWindow();
	document.form.Subject.focus();
}

// 결재자/협조자 지정
function MembersAppoint( idx, Id, agtId, Name, Cdnm ) {
//	// 해당 idx가 정말 있는지 검사(협조선 미사용 문서 대응)
	var cond = ($jquery("input[name='OrderId"+idx+"']").length > 0);
	// 협조선 미사용인 경우 협조선 idx에 대해 지정 안함
	var WordUseHelper = 'Y';
	if ( WordUseHelper == 'N' ) {
		cond = cond && ( idx <= 10 );
	}
	if ( cond ) {
		if ( agtId ) {
			if ( agtId == 'desk02' ) {
				// 해당 대결자는 현재 로그인한 사용자
				agtId = 'ME';
			}
			// 대결자 정보 등록
			pushAgent(idx, Id, agtId);
			// 대결 아이콘 생성
			var agtBtn = '';
			agtBtn+= '<span id="appDate'+idx+'">';
			agtBtn+= 	'<img src="../Img/Renewal/btn_agent.gif" class="vm" style="cursor:pointer" onclick="agentPopup(\''+Id+'\');" />';
			agtBtn+= '</span>';
			$jquery('#appDate'+idx).html(agtBtn);
		}
		// 결재자/협조자/대결자/협조대결자 정보 등록
		$jquery("input[name='OrderId"+idx   +"']").val(agtId ? agtId : Id);
		$jquery("input[name='OrderTitle"+idx+"']").val(Cdnm);
		$jquery("input[name='OrderName"+idx +"']").val(Name);
		// 지정 버튼 -> 취소 버튼으로 변경
		var OrderButton = '';
		OrderButton+= '<div class=btn_page>';
		OrderButton+= 	'<a href=javascript:MembersDelete('+idx+');>';
		OrderButton+= 		'<span>취소</span>';
		OrderButton+= 	'</a>';
		OrderButton+= '</div>';
		$jquery('#MembersFindCell'+idx).html(OrderButton);
	}
}

// 결재자/협조자 취소
// 상신후수정 : 사용안함
function MembersDelete(a) {
	document.form.elements.namedItem('OrderId'+a).value = '';
	document.form.elements.namedItem('OrderName'+a).value = '';
	document.form.elements.namedItem('OrderTitle'+a).value = '';

	if ( a <= 10 ) {
		var Title = '지정';
	} else {
		var Title = '지정';
	}

	var btn = '';
	btn+= '<div class="btn_page">';
	btn+= 	'<a href="myOrderUserAppointPopup.php?mode=order&number='+a+'&total=5" class="openPopup'+a+'">';
	btn+= 		'<span>'+Title+'</span>';
	btn+= 	'</a>';
	btn+= '</div>';
	$jquery('#MembersFindCell'+a).html(btn);
	$jquery('#appDate'+a).html('<span id="appDate'+a+'">&nbsp;</span>');

	$jquery('.openPopup'+a).openDOMWindow(getOpenDomWindowOpt(510, 478, false, 'click'));

	//대결자 취소
	popAgent(a);
}

// Document Preview
function openDocumentView() {
	var dateObj = new Date();
	var dummy = dateObj.getTime();

	var f = document.form;
	var DcsNo = f.DcsNo.value;
	var No = f.No.value;
	var WordType = 1;

	if(WordType == 2) w = 1020;
	else w = 760;
	window.open('view.php?dummy='+dummy+'&DcsNo='+DcsNo+'&No='+No,'','top=0,left=0,width='+w+',height=550,scrollbars=yes,menubar=yes;');
}

// Term Auto Calculation
function getTremAutoCalculation() {
	var f = document.form;

	if ( f.No.value == '' && f.Category.value == '4' ) {
		// 휴가계
		f.Term.value = 1;
	} else if( f.No.value == '' && f.Category.value == '7' ) {
		// 출장계
		f.OutTerm.value = 1;
	}
}

// 결재선/협조선 유효성 검사
// 상신후수정 : 사용안함
function getOrderLineCheck() {
	var OrderId = function(i){ return document.form.elements.namedItem('OrderId'+i).value; };
	var breaked = function(i){ return (OrderId(i) != '' && OrderId(i-1) == '') };
	var WordUseHelper = 'Y';
	for ( i = 2; i <= parseInt('5'); i++ ) {
		// 결재선 유효성 검사
		var invalid = breaked(i);
		if ( WordUseHelper == 'Y' ) {
			// 협조선 유효성 검사
			invalid = invalid || breaked(10+i);
		}
		if ( invalid ) return false;
	}
	return true;
}

// 임시 저장하기 제출
// 상신후수정 : 사용안함
function preSubmitPrc() {
	document.form.presave.value = 'true';
	regist("save");
}

// 상신하기
function exitSubmitPrc() {
	if ( writeModify ) {
		// 상신 후 수정
		document.form.presave.value = "writemodify";
		submitForm();
	} else {
		// 작성
		var f = document.form;
		f.AutoWordNo.value = $jquery("#AutoWordNo:checked").length;
		if ( f.AutoWordNo.value == 1 ) {
			// 문서번호 등록 : 문서번호 유효성 검사
			if ( document.getElementById("WordNo1").value == '' || document.getElementById("WordNo1").value == null ) {
				alert('문서번호를 입력하세요.');
				f.WordNo1.focus();
				return false;
			}
		}
		document.form.presave.value='';
		regist("reg");
	}
}

function regist( mode ) {
	var f = document.form;
	f.AutoWordNo.value = $jquery("#AutoWordNo:checked").length;
	if ( f.AutoWordNo.value == 1 ) {
		submitNo(document.getElementById("WordNo1").value, mode);
	} else {
		submitForm();
	}
}

function submitNo(wordNo,mode) {
	if ( mode =="reg" ) {
		var NoFlag ='true';
		$jquery.ajax({
			url: 'prc.php',
			data: 'wordNo='+wordNo+'&NoFlag='+NoFlag,
			success: function(msg) {
				switch($jquery.trim(msg)) {
				case 'err_01':
					// 중복된 문서번호가 존재합니다.
					alert('중복된 문서번호가 존재합니다.');
					break;
				default:
					submitForm();
					break;
				}
			}
		});
	} else {
		submitForm();
	}
}

function submitForm() {
	var f = document.form;
	// for field empty check
	var checkList = [];

	// 결재문서 정보 유효성 검사
	if ( !writeModify ) {
		// 기안일자
		checkList.push({type: 'field', target: f.DraftingY, msg: '기안일 연도를 입력하세요.'});
		checkList.push({type: 'field', target: f.DraftingM, msg: '기안일 월을 입력하세요.'});
		checkList.push({type: 'field', target: f.DraftingD, msg: '기안일 일을 입력하세요.'});
		// 결재선
		checkList.push({type: 'bool', target: !getOrderLineCheck(), msg: '결재선이 잘못되었습니다.'});
		// 제목
		checkList.push({type: 'field', target: f.Subject, msg: '제목을 입력하세요.'});
	}
	
	// 본문 내용 유효성 검사
	if ( f.UseEditor.value == 'Y' ) {
		// Editor 사용 : 본문 입력창 유효성 검사
		if ( f.editorName.value != 'whois' ) {
			tinyMCE.triggerSave();
		} else {
			f.Contents.value = document.getElementById('TrueWebHTMLEditor').getHTML();
		}
		checkList.push({type: 'field', target: f.Contents, msg: '결재 문서를 작성하세요.'});
	} else {
		// Editor 미사용 : 서식 유효성 검사
		if ( f.Category.value == '4' ) {
			// 휴가계
			// 기간 계산
			AutoCalculation('Term');
			
			if ( f.Category2.value == '4' ) {
				//조퇴계 (조퇴시간 체크)
				checkList.push({type: 'field', target: f.s_hour,   msg: '조퇴 시간을 선택하세요.'});
				checkList.push({type: 'field', target: f.s_minute, msg: '조퇴 시간을 선택하세요.'});
				checkList.push({type: 'field', target: f.e_hour,   msg: '조퇴 시간을 선택하세요.'});
				checkList.push({type: 'field', target: f.e_minute, msg: '조퇴 시간을 선택하세요.'});

				// 시작시간~종료시간 유효성 검사
				var time_interval_invalid = (
					(parseInt(f.s_hour.value) > parseInt(f.e_hour.value)) 
					|| (parseInt(f.s_hour.value) == parseInt(f.e_hour.value) && parseInt(f.s_minute.value) > parseInt(f.e_minute.value) )
				);
				checkList.push({type: 'bool', target: time_interval_invalid, focus: f.s_hour, msg: '조퇴 시간을 확인하세요.'});
			} else if ( f.HalfTimeUse.value == 'Y' ) {
				// 반차계 (오전/오후 반차 선택 체크)
				checkList.push({type:'field', target: f.halfHoliday, msg: ''});
			}

			// 휴가신청일수
			var Term = document.getElementById("Term").value;
			// 휴가기간을 체크해주십시오.
			checkList.push({type: 'bool', target: ( Term == 0 || Term == '0' ),  msg:'휴가 기간을 체크해주십시오.'});
			checkList.push({type: 'bool', target: ( Term == '' )});

			// 휴가신청일수, 휴가신청가능일수 검사
			if ( f.HCnt.value > 0 ) {
				// 년도 설정 검사
				if ( f.HalfTimeUse.value != 'Y' && f.Category2.value != '4' ) {
					// 일단위 휴가계 : 반차계 or 조퇴계 아님
					// 휴가 시작년도와 휴가 종료년도는 같아야 함
					checkList.push({type: 'bool', target: ( f.s_year.value != f.e_year.value ), msg: '기간설정이 잘못되었습니다.\n\n확인해주십시오.'});
				}
				// 년도별 휴가신청가능일수
				var holidayAvailableYear = $jquery.parseJSON('null');
				if ( f.HalfTimeUse.value == 'Y' || f.Category2.value == "4" ) {
					// 반차 휴가계 or 조퇴계
					for ( var year in holidayAvailableYear  ) {
						holidayAvailableYear[year] = Math.round(holidayAvailableYear[year]);
					}
				}
				// 현재 남은 휴가일수가 없습니다. 휴가 신청 시 전체관리자나 인사관리자에게 휴가일수를 문의하시기 바랍니다.'
				checkList.push({type: 'bool', target: ( holidayAvailableYear[f.s_year.value] < 1 ),    msg: '현재 남은 휴가일수가 없습니다. \n\n휴가 신청 시 전체관리자나 인사관리자에게 휴가일수를 \n\n문의하시기 바랍니다.'});
				// 남은 휴가일수가 휴가기간에 비해 부족합니다. 전체관리자나 인사관리자에게 휴가일수를 문의하시기 바랍니다.'
				checkList.push({type: 'bool', target: ( holidayAvailableYear[f.s_year.value] < Term ), msg: '남은 휴가일수가 휴가기간에 비해 부족합니다. \n\n전체관리자나 인사관리자에게 휴가일수를 문의하시기 바랍니다.'});
			}

			// 사유를 입력하세요.
			checkList.push({type: 'field', target: f.Reason, msg: '사유를 입력하세요.'});
			// 행선지를 입력하세요.
			checkList.push({type: 'field', target: f.Destination, msg: '행선지를 입력하세요.'});
			// 연락처를 입력하세요.
			checkList.push({type: 'field', target: f.Tel, msg: '연락처를 입력하세요.'});
			// 대체근무자를 입력하세요.
			checkList.push({type: 'field', target: f.Etc, msg: '대체근무자를 입력하세요.'});
			
		} else if ( f.Category.value == '7' ) {
			// 출장계
			// 기간 계산
			AutoCalculation('OutTerm');
			// 기간설정이 잘못되었습니다. 확인해 주십시오.
			checkList.push({type: 'bool', target: ( f.OutTerm.value == '' )});
			checkList.push({type: 'bool', target: ( f.OutTerm.value == '0' ), msg: '기간설정이 잘못되었습니다.\n\n확인해주십시오.'});
			
			// 출장지를 입력하세요.
			checkList.push({type: 'field', target: f.OutDestination, msg: '출장지를 입력하세요.'});

			if ( f.Category2.value == '1'  ) {
				// 출장계 > 출장 신청서
				
				// 출장목적을 입력하세요.
				checkList.push({type: 'field', target: f.OutReason, msg: '출장목적을 입력하세요.'});
				// 연락처를 입력하세요.
				checkList.push({type: 'field', target: f.OutTel, msg: '연락처를 입력하세요.'});
				// 대체 근무자를 입력하세요.
				checkList.push({type: 'field', target: f.OutEtc, msg: '대체 근무자를 입력하세요.'});
				
			} else if ( f.Category2.value == '2' ) {
				// 출장계 > 출장 보고서

				// 출장보고를 입력하세요.
				checkList.push({type: 'field', target: f.OutEtc2, msg: '출장보고를 입력하세요.'});
				// 일비를 입력하세요.
				checkList.push({type: 'field', target: f.OutWorkExpense, msg: '일비를 입력하세요.'});
				// 숙박비를 입력하세요
				checkList.push({type: 'field', target: f.OutHotelExpense, msg: '숙박비를 입력하세요.'});
				// 식비를 입력하세요.
				checkList.push({type: 'field', target: f.OutFoodExpense, msg: '식비를 입력하세요.'});
				// 교통비를 입력하세요.
				checkList.push({type: 'field', target: f.OutTrafficExpense, msg: '교통비를 입력하세요.'});
				// 기타비를 입력하세요.
				checkList.push({type: 'field', target: f.OutEtcExpense, msg: '기타비를 입력하세요.'});
				
				// 출장 여비 합계
				AutoExpenseCalculation();
			}
		}
	}
	// 유효성 검사 실행
	if ( !validate(checkList) ) {
		return false;
	}
	
	// 대결자 정보 넣기
	flushAgent();

	// 상신/임시저장
	var msg;
	var targetBtnId;
	var targetBtnBottomId;
	if ( writeModify ) {
		// 상신 후 수정
		// 상신 하시겠습니까?
		msg = '상신 하시겠습니까?';
		targetBtnId = 'exitSubmitBtn';
		targetBtnBottomId = 'exitSubmitBtnBottom';
		
	} else {
		// 작성
		if ( f.presave.value == '' ) {
			// 상신하기
			if ( f.OrderId2.value == '' ) {
				// 지정된 결재선이 없습니다. 이대로 결재를 진행하시겠습니까?
				msg = '지정된 결재선이 없습니다.\n\n이대로 결재를 진행하시겠습니까?';
			} else {
				// 상신 하시겠습니까?
				msg = '상신 하시겠습니까?';
			}
			targetBtnId = 'exitSubmitBtn';
			targetBtnBottomId = 'exitSubmitBtnBottom';
		} else {
			// 임시 저장하기
			// 임시 저장을 하시겠습니까?
			msg = '임시 저장을 하시겠습니까?';
			targetBtnId = 'preSubmitBtn';
			targetBtnBottomId = 'preSubmitBtnBottom';
		}
	}
	if ( confirm(msg) ) {
		f.target='_self';
		f.code.value = 'write'
		f.action='prc.php';
		$jquery(f).submit();
		preventDuplicateSubmit(
			'전송중입니다.',
			document.getElementById(targetBtnId),
			document.getElementById(targetBtnBottomId)
		);
	}
}

// 양식 유효성 검사
function validate( list ) {
	for ( var i = 0; i < list.length; i++ ) {
		var type   = list[i].type;
		var target = list[i].target;
		var focus  = list[i].focus;
		var msg    = list[i].msg;
		var invalid = false;
		switch ( type ) {
		case 'field'    : invalid = (target.value == ''); break;
		case 'function' : invalid = target.call(invalid); break;
		case 'bool'     : invalid = target; break;
		default :
			alert('[ERROR] 잘못된 유효성 검사입니다.');
			return false;
		}
		if ( invalid ) {
			if ( msg ) alert(msg);
			if ( focus && focus.focus ) {
				focus.focus();
			} else if ( target.focus ) {
				target.focus();
			}
			return false;
		}
	}
	return true;
}

// 목록
function GoList() {
	var dateObj = new Date();
	var dummy = dateObj.getTime();

	var f = document.form;
	if ( f.No.value == '' && f.gubun.value == '' ) {
		// 결재문서 작성
		location.href="../EWord/form.php?dummy="+dummy+"&listPageNow=";
	} else {
		// 재상신, 상신 후 수정
		var returnPage = '';
		if ( !returnPage ) 		{
			returnPage = "../EWord/?dummy="+dummy+"&gubun=&listPageNow=";
		}
		location.href = returnPage;
	}
}

// 휴가계/출장계 기간 계산
function AutoCalculation( Term ) {
	var f = document.form;
	if ( f.HalfTimeUse.value == 'Y' || f.Category2.value == '4' ) {
		// 반차계 || 조퇴계 : 기간검사하지 않음
		return;
	} else {
		var dateObj = new Date();
		var dummy = dateObj.getTime();

		if ( Term == 'Term' ) {
			var s_year	= f.s_year.value;
			var s_month	= f.s_month.value;
			var s_day	= f.s_day.value;
			var e_year	= f.e_year.value;
			var e_month	= f.e_month.value;
			var e_day	= f.e_day.value;
			var targetTerm = f.Term;

		} else if( Term == 'OutTerm' ) {
			var s_year	= f.OutStartYear.value;
			var s_month	= f.OutStartMonth.value;
			var s_day	= f.OutStartDay.value;
			var e_year	= f.OutEndYear.value;
			var e_month	= f.OutEndMonth.value;
			var e_day	= f.OutEndDay.value;
			var targetTerm = f.OutTerm;
		}

		// 월, 일 padding 0
		if ( s_month.length == 1) s_month = '0' + s_month;
		if ( s_day.length == 1) s_day = '0' + s_day;
		if ( e_month.length == 1) e_month = '0' + e_month;
		if ( e_day.length == 1) e_day = '0' + e_day;

		var Sdate	= parseInt(s_year + s_month + s_day);
		var Edate	= parseInt(e_year + e_month +e_day);

		if ( Sdate <= Edate ) {
			// 휴일 포함인지
			if ( document.getElementById('flagHoliday').checked ) {
				// 휴일도 휴가일수에 포함
				var Method = 3;
			} else {
				// 휴일은 휴가일수에 미포함
				var Method = 2;
			}

			// Ajax
			var url = '../Holiday/holidayRegistCalculation.php';
			var pars = "&dummy="+dummy
					+"&s_year="+s_year+"&s_month="+s_month+"&s_day="+s_day
					+"&e_year="+e_year+"&e_month="+e_month+"&e_day="+e_day
					+"&Term="+Term+'&Method='+Method;
			$jquery.ajax({
				url: url,
				data: pars,
				success: function(rs) {
					if ( !isNaN(parseInt(rs)) ) {
						targetTerm.value = parseInt(rs);
					}
				}
			});
		} else {
			alert('기간설정이 잘못되었습니다.\n\n확인해주십시오.');
			targetTerm.value = '';
			return;
		}
	}
}

// 출장계 보고서 출장 여비 자동 합계
function AutoExpenseCalculation() {
	var f = document.form;

	var OutWorkExpense	  = getFloat(f.OutWorkExpense.value);
	var OutHotelExpense	  = getFloat(f.OutHotelExpense.value);
	var OutFoodExpense	  = getFloat(f.OutFoodExpense.value);
	var OutTrafficExpense = getFloat(f.OutTrafficExpense.value);
	var OutEtcExpense	  = getFloat(f.OutEtcExpense.value);
	var OutTotalExpense	  = 0;

	OutTotalExpense	= parseInt(OutWorkExpense + OutHotelExpense + OutFoodExpense + OutTrafficExpense + OutEtcExpense);

	f.OutTotalExpense.value	= OutTotalExpense;
	f.OutTotalExpense.value	= add_comma2(f.OutTotalExpense.value);
}


// Go Page Whois Editor
function goWhoisEditor()
{
	if (confirm('에디터 변경 시 작성하신 문서가 초기화 됩니다. 변경하시겠습니까?'))
	{
		var f = document.form;
		var DcsNo = f.DcsNo.value;
		var No = f.No.value;
		var gubun = f.gubun.value;
		var Category = f.Category.value;
		var listPageNow = f.listPageNow.value;

		var dateObj = new Date();
		var dummy = dateObj.getTime();

		var url = "write.php?";
		url += "dummy="+dummy;
		url += "&DcsNo="+DcsNo;
		url += "&No="+No;
		url += "&gubun="+gubun;
		url += "&Category="+Category;
		url += "&listPageNow="+listPageNow;
		url += "&editorName=whois";

		location.href = url;
	}
}

// Go Page Common Editor
function goCommonEditor()
{
	if (confirm('에디터 변경 시 작성하신 문서가 초기화 됩니다. 변경하시겠습니까?'))
	{
		var f = document.form;
		var DcsNo = f.DcsNo.value;
		var No = f.No.value;
		var gubun = f.gubun.value;
		var Category = f.Category.value;
		var listPageNow = f.listPageNow.value;

		var dateObj = new Date();
		var dummy = dateObj.getTime();

		var url = "write.php?";
		url += "dummy="+dummy;
		url += "&DcsNo="+DcsNo;
		url += "&No="+No;
		url += "&gubun="+gubun;
		url += "&Category="+Category;
		url += "&listPageNow="+listPageNow;
		url += "&editorName=common";

		location.href = url;
	}
}


// Whois Editor ActiveX Use Window
function openActiveXSetup()
{
	window.open('whoisEditorNotice.php', 'whoisEditorNotice', 'top=0,left=0,width=463,height=186;');
}

// Whois Editor ActiveX Delete Method
function openActiveXDel()
{
	window.open('activeDel.php','UserFind','top=0,left=0,width=700,height=800,scrollbars=yes');
}

function setWhoisEditorApply()
{
	var f = document.getElementById('form');
	var compo = document.getElementById('TrueWebHTMLEditor');
	if( f && compo && f.Contents )
	{
		compo.setHTML( f.Contents.value );
	}
}

// 문서번호 등록
// 상신후수정 : 사용안함
function getAutoWordNo(){
	var WordNo = $jquery("#AutoWordNo:checked").length;
	if ( WordNo ) {
		$jquery("#sub_subject").hide();
		$jquery("#sub_subject1").show();
	} else {
		$jquery("#sub_subject").show();
		$jquery("#sub_subject1").hide();
	}
}

// 수신부서 버튼 활성화/비활성화
// 상신후수정 : 사용안함
function ReceiveTreeKeyButton() {
	var ReceiveTreeKeyButtonArea = $jquery('#ReceiveTreeKeyButtonArea');

	var f = document.form;

	if ( f.Opening && f.Opening.value == 'Y' ) {
		ReceiveTreeKeyButtonArea.show();
	} else {
		ReceiveTreeKeyButtonArea.hide();
	}
}

// 대결자 지정
var agentStore = new Array();
function pushAgent(idx, absId, agtId) {
	agentStore[idx] = new Array();
	agentStore[idx]['absId'] = absId;
	agentStore[idx]['agtId'] = agtId;
}
// 대결자 지정 취소
// 상신후수정 : 사용안함
function popAgent(idx) {
	agentStore[idx] = undefined;
}
function flushAgent() {
	var fv = '';
	for ( i = 2; i <= 20; i++ ) {
		if ( agentStore[i] == undefined ) {
			continue;
		}
		fv += '&' + i + '=' + agentStore[i]['absId'] + ';' + agentStore[i]['agtId'];
	}
	document.form.agentInfo.value = fv;
}
function agentPopup(id) {
	var url = 'agentPopup.php?id='+id;
	$jquery.openDOMWindow({
		height:300,
		width:400,
		loader:1,
		modal : 1,
		overlayColor: '#C2C2C2',
		overlayOpacity : '50',
		windowSource:'iframe',
		windowSourceURL: url,
		borderColor: '#737373',
		borderSize: 1,
		windowPadding:0
	});
}
function initSetAgent() {
	}

// 휴일포함
function chkHoliday(el, type) {
	if ( el.checked == true ) {
		if ( !confirm('휴일이 포함되어 있습니다.\n\r휴일포함을 체크할 시에는 휴일도 포함됩니다.\n\r휴일 일수를 적용하시겠습니까?') ) {
			el.checked = false;
		}
	}
	AutoCalculation(type);
}

function setTermDate(obj) {
	$jquery('select[name=s_'+obj+']').change(function(){
		var sdate = $jquery(this).val();
		$jquery('select[name=e_'+obj+'] option').each(function(){
			if($jquery(this).val() == sdate) $jquery(this).attr('selected', 'selected');
			else $jquery(this).attr('selected', '');
		});

		$jquery('#hidden_e_'+obj).val(sdate);
	});
}

function makeHiddenInput(name) {
	return $jquery('<input />').attr({'type':'hidden', 'name':name, 'id':'hidden_'+name}).appendTo($jquery('form[name=form]'));
}

$jquery(document).ready(function(){
	getTremAutoCalculation();
	ReceiveTreeKeyButton();
	getAutoWordNo();
	// 첨부파일 목록 생성
	previewFileUpload("addFile");
	if ( parseInt('0') > 0 ) {
			}

	var halftimeUse = '';
	if ( halftimeUse == 'Y' ) {
		$jquery('select[name=e_year], select[name=e_month], select[name=e_day], input[name=Term]').attr({'disabled':true});

		makeHiddenInput('e_year').val($jquery('select[name=e_year]').val());
		makeHiddenInput('e_month').val($jquery('select[name=e_month]').val());
		makeHiddenInput('e_day').val($jquery('select[name=e_day]').val());
		makeHiddenInput('Term').val($jquery('input[name=Term]').val());

		setTermDate('year');
		setTermDate('month');
		setTermDate('day');
	}
});

</script>

</body>
</html>

