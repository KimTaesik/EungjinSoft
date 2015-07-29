<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@page import="java.util.logging.SimpleFormatter"%>
<%@page import="java.util.Date"%>
<%@page import="com.groupware.dto.Position"%>
<%@page import="com.groupware.dto.Dept"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Whois Groupware - Ubiquitous Collaboration!</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=7" />
	<link href="/groupware/resources/styles/admin/common.css" rel="stylesheet" type="text/css" />
	<link href="/groupware/resources/styles/admin/board.css" rel="stylesheet" type="text/css" />
	<link href="/groupware/resources/styles/admin/subpage.css" rel="stylesheet" type="text/css" />
	<link href="/groupware/resources/styles/admin/popup.css" rel="stylesheet" type="text/css" />
	<!--[if IE 6]>
	<link href="http://css.whoisdesk.net/Src/Skin/Renewal/board_ie6.css" rel="stylesheet" type="text/css" />
	<![endif]-->
	<link type="text/css" href="http://css.whoisdesk.net/Src/WebCommon/Jquery/Jquery_ui_1_7_2/blitzer/jquery-ui-1.7.2.custom.css" rel="stylesheet" />
	<script src="/groupware/resources/styles/script/jquery.js"></script>
	<script src="/groupware/resources/styles/script/jquery-ui.js"></script>
</head>

<body>

<style type="text/css">
#file_find_atache {
	width: 95px;
	height: 19px;
	background: transparent url('http://static.whoisdesk.net/Src/Img/Renewal/gwv2_btn_find.gif') no-repeat 0px 0px;
	margin: 0px;
	float:left;
	cursor: pointer; 
}
.larea {
	background: #F2F2F2;
	line-height:140%;
}
.logo_table {
	border-collapse : collapse;
	padding:0;
}
.logo_table td {
	border:1px solid #e4e4e4;
}
.logo_title {
	width:98%;
	padding:10px 0 10px 20px;
	background: #F2F2F2;
	border-bottom:#e4e4e4 1px solid;
}
.bcolor {
	display: inline-block; 
	height:14px;
	width:14px;
}
.title {
	 BACKGROUND: url('/Src/Img/Renewal/btn_co_logo_list.gif') no-repeat 0px 85%;
}
.btn a    {border:1px solid #CFCFCF; text-decoration:none; padding:0 10px 0 10px; margin-left:10px;}
.btn a:hover {background:#FFFFFF; border:1px solid #CFCFCF; color:#444444; padding:0 10px 0 10px;margin-left:10px;}
</style>


<div id="sub">
	<div id="title">
		<!-- 회사정보 및 로고등록 -->
		<h2>
			<span class="recomm">회사정보 및 로고등록</span>
		</h2>
	</div>

	<div class="toparea">		
		<span class="leftarea">
			<!-- 로고 등록 -->
			<span class="selected">
				<a href="#blank-link" onclick="thisPageMove('');"> 로고 등록</a>
			</span>
			<!-- 회사정보 등록 -->
			<span class="tab">
				<a href="#blank-link" onclick="thisPageMove('index.php');"> 회사정보 등록</a>
			</span>
		</span>
		<!-- 등록 -->
		<span class="rightarea">
			<span class="btn">
				<a href="#blank-link" onclick="">
					<img src="http://static.whoisdesk.net/Src/Img/Renewal/icon_pencil.gif" alt="" align="absmiddle" />
					등록
				</a>
			</span>
		</span>
	</div>

    <div class="table_view2 mar20t"> 
		<form name="form" method="post" action='' enctype='multipart/form-data'>
			<input type="hidden" name="quotaExceeded" id="quotaExceeded">
			<table width="100%"  cellspacing="0" cellpadding="0" class="logo_table">
				<col width="20%" class="overf"></col>
				<col width="80%" class="overf"></col>
				
				<!-- 로고이미지 등록 -->
				<tr>
					<td class="larea txt_ce bold nobr text_overf">로고이미지 등록</td>
					<td>
						<!-- 로고이미지 등록 -->
						<div class="logo_title nobr text_overf">
							<span class="left title pad20l bold">로고이미지 등록</span>
							<!-- 등록된 로고 이미지는 그룹웨어 오른쪽 상단에 위치합니다.  -->
							<span class="right pad20r">등록된 로고 이미지는 그룹웨어 오른쪽 상단에 위치합니다. </span>
						</div>
						
						<div class="pad20l pad10t">
													<img src='http://static.whoisdesk.net/Src/Img/Cache/Logo/gw_signture2.png'  width=220 height=90 border=0 class='Png24'>
												</div>
						
						<!-- 이미지 등록 -->
						<div class="pad20l pad10t" style="overflow: hidden;">
							<span class="vm left" style="padding-top:4px;" >이미지 등록 : </span> 
							<input type="text" name="LogoPath" id="LogoPath" class="input left mar3r" style="width:40%;" readonly="readonly" />
							<div id='file_find_atache' style='overflow:hidden;cursor:pointer;' alt="찾아보기" >
								<input type='file' id="Logo" name='Logo' style="width:0px; height:20px; opacity:.0; -moz-opacity:.0; filter:alpha(opacity=0);" onchange="document.getElementById('LogoPath').value=this.value;">
							</div>
						</div>
						
						<!-- * 최적 사이즈 : 216 * 61 픽셀 -->
						<div class="pad20l pad5t">* 최적 사이즈 : <span class=report_06>220 * 90</span> 픽셀, (확장자 : jpg, jpeg, gif, png)  </div>
						
						<!-- 로고이미지 링크사용 -->
						<div class="pad20l pad10t" style="height: 1.5em; line-height: 1.5em;">
							<input type="checkbox" name="LogoLinkUse" value="Y" onclick="LogoLink_disabled();"  />
							<label>로고 이미지 링크사용</label>
						</div>
						
						<!-- 링크등록 -->
						<div class="pad20l pad5t pad20b">
							<label>링크등록 : http://</label> 
							<input type="text" name="LogoLink" value="" style="width:50%;" class="input" />
						</div>
					</td>
				</tr>
				
				<!-- 로그인 페이지 디자인 설정 -->
				<!-- 오른쪽 로고 이미지 등록 -->
				<tr>
					<td rowspan="4" class="larea txt_ce bold nobr text_overf">로그인페이지<br>디자인설정</td>
					<td>
						<div class="logo_title nobr text_overf">
							<span class="left title pad20l">
								<span class="bold">오른쪽 로고 이미지 등록</span>&nbsp;
								<!-- 미리보기 -->
								<span class="btn">
									<a  href="#blank-link" onclick="PreviewOpen();">
										<img width="16" height="16" align="absMiddle" alt="" src="/Src/Img/Renewal/icon_preview.gif" complete="complete"/>
										미리보기
									</a>
								</span>
							</span>
							<!-- 등록된 로고 이미지는 로그인 페이지 오른쪽 상단에 위치합니다 -->
							<span class="right pad20r">등록된 로고 이미지는 로그인 페이지 오른쪽 상단에 위치합니다</span>
						</div>
						
						<div class="pad20l pad10t">
													<img src='http://static.whoisdesk.net/Src/Img/Renewal/whoisdesk.png'  width=220 height=90 border=0 class='Png24'>
							<input type='hidden' name='MainImgOrg' >
												</div>
						
						<div class="pad20l pad10t">
							<input type="radio" name="MainImgUnUse" id="MainImgUnUse" value="N" checked="checked" onclick="fld_disabled();"/>
							<label>사용함</label>
							<input type="radio" name="MainImgUnUse" id="MainImgUnUse" value="Y"  onclick="fld_disabled();"/>
							<label>사용안함</label>
						</div>
						
						<!-- 이미지 등록 -->
						<div class="pad20l pad10t" style="overflow: hidden;">
							<span class="vm left" style="padding-top:4px;" >이미지 등록 : </span> 
							<input type="text" name="MainImgPath" id="MainImgPath" class="input left mar3r" style="width:40%;" readonly="readonly" />
							<div id='file_find_atache' style='overflow:hidden;cursor:pointer;' alt="찾아보기">
								<div id="MainImg" name='MainImg' style="width:100px;height:20px;" >&nbsp;</div>
							</div>
						</div>
						
						<!-- * 최적 사이즈 : 220 * 90 픽셀, (확장자 : jpg, jpeg, gif, png) -->
						<div class="pad20l pad5t">* 최적 사이즈 : <span class=report_06>220 * 90</span> 픽셀, (확장자 : jpg, jpeg, gif, png)</div>
						
						<!-- 로그인 페이지 링크 사용 -->
						<div class="pad20l pad10t">
							<input type="checkbox" name="MainImgLinkUse" value="Y"  />
							<label>로그인 페이지 링크 사용</label>
						</div> 
						
						<!-- 링크등록 -->
						<div class="pad20l pad5t pad20b">
							링크등록 : 
							http:// <input type="text" name="MainImgLink" id="MainImgLink" value="" style="width:50%;" class="input" />
						</div>
					</td>
				</tr>
				
				<!-- 상단 로고 이미지 등록 -->
				<tr>
					<td>
						<div class="logo_title nobr text_overf">
							<span class="left title pad20l">
								<span class="bold">상단 로고 이미지 등록</span>&nbsp;
								<!-- 미리보기 -->
								<span class="btn">
									<a  href="#blank-link" onclick="PreviewOpen();">
										<img width="16" height="16" align="absMiddle" alt="" src="/Src/Img/Renewal/icon_preview.gif" complete="complete"/>
										미리보기
									</a>
								</span>
							</span>
							<!-- 등록된 로고 이미지는 로그인창 상단에 위치합니다. -->
							<span class="right pad20r">등록된 로고 이미지는 로그인창 상단에 위치합니다.</span>						
						</div>
						
						<div class="pad20l pad10t">
																					<img src='http://static.whoisdesk.net/Src/Img/Cache/Login/2012/img_logo.png' width=330 height=50 border=0 class='Png24' style="background: #2D2D2D;">
														<input type='hidden' name='LogoImgOrg' >
												</div>
						
						<div class="pad20l pad10t">
							<input type="radio" name="LogoImgUnUse" id="LogoImgUnUse" value="N" checked="checked" onclick="fld_disabled();"/>
							<label>사용함</label>
							<input type="radio" name="LogoImgUnUse" id="LogoImgUnUse" value="Y"  onclick="fld_disabled();"/>
							<label>사용안함</label>
						</div>
						
						<!-- 이미지 등록 -->
						<div class="pad20l pad10t" style="overflow: hidden;">
							<span class="left" style="padding-top:4px;" >이미지 등록 :</span> 
							<input type="text" name="LogoImgPath" id="LogoImgPath" class="input left mar3r" style="width:40%;" readonly="readonly" />
							<div id='file_find_atache' style='overflow:hidden;' alt="찾아보기">									
								<div id="LogoImg" name='LogoImg' style="width:100px;height:20px;" >&nbsp;</div>
							</div>
						</div>
						
						<!-- * 최적 사이즈 : 330 * 50 픽셀, (확장자 : jpg, jpeg, gif, png) -->
						<div class="pad20l pad5t">* 최적 사이즈 : <span class=report_06>330 * 50</span> 픽셀, (확장자 : jpg, jpeg, gif, png)</div>
						
						<!-- 로그인 페이지 링크 사용 -->
						<div class="pad20l pad10t">
							<input type="checkbox" name="LogoImgLinkUse" value="Y"  />
							<label>로그인 페이지 링크 사용</label>
						</div>
						
						<!-- 링크등록 --> 
						<div class="pad20l pad5t">
							<label>링크등록 : http:// </label> 
							<input type="text" name="LogoImgLink" id="LogoImgLink" value="" style="width:50%;" class="input" />
						</div>
						
						<!-- 배경색 등록 -->
						<div class="pad20l pad10t pad20b" style="overflow: hidden;">
							<input type="checkbox" name="LogoBackgroundColorUse" id="LogoBackgroundColorUse" value="Y"  />
							<span class="mar3r" >배경색등록 :</span>
							
															<span class="input mar2t bcolor" style="background: #FFFFFF;" onclick="InputLogoColor('FFFFFF');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #FF0000;" onclick="InputLogoColor('FF0000');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #FF6C00;" onclick="InputLogoColor('FF6C00');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #FFAA00;" onclick="InputLogoColor('FFAA00');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #FFEF00;" onclick="InputLogoColor('FFEF00');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #A6CF00;" onclick="InputLogoColor('A6CF00');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #009E25;" onclick="InputLogoColor('009E25');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #00B0A2;" onclick="InputLogoColor('00B0A2');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #0075C8;" onclick="InputLogoColor('0075C8');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #3A32C3;" onclick="InputLogoColor('3A32C3');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #EF007C;" onclick="InputLogoColor('EF007C');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #000000;" onclick="InputLogoColor('000000');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #252525;" onclick="InputLogoColor('252525');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #464646;" onclick="InputLogoColor('464646');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #636363;" onclick="InputLogoColor('636363');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #7D7D7D;" onclick="InputLogoColor('7D7D7D');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #9A9A9A;" onclick="InputLogoColor('9A9A9A');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #0D514C;" onclick="InputLogoColor('0D514C');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #1B496A;" onclick="InputLogoColor('1B496A');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #2B285F;" onclick="InputLogoColor('2B285F');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #45245B;" onclick="InputLogoColor('45245B');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #721947;" onclick="InputLogoColor('721947');">&nbsp;</span>
														<input type="text" name="LogoBackgroundColor" id="LogoBackgroundColor" class="input" style="width:50px;margin-left:20px;" value="" readonly="readonly" />
						</div>
					</td>
				</tr>
				
				<!-- 왼쪽 플래시 이미지 변경 -->
				<tr>
					<td>
						<div class="logo_title nobr text_overf">
							<span class="left title pad20l">
								<span class="bold">왼쪽 플래시 이미지 변경</span>&nbsp;
								<!-- 미리보기 -->
								<span class="btn">
									<a href="#blank-link" onclick="PreviewOpen();">
										<img width="16" height="16" align="absMiddle" alt="" src="/Src/Img/Renewal/icon_preview.gif" complete="complete"/>
										미리보기
									</a>
								</span>
							</span>
							<!-- 로그인 페이지의 왼쪽 플래시 이미지를 변경하실 수 있습니다. -->
							<span class="right pad20r">로그인 페이지의 왼쪽 플래시 이미지를 변경하실 수 있습니다.</span>
						</div>
						
						<div class="pad20l pad10t">
													<input type='hidden' name='FlashImgOrg' value=''>
												</div>
						
						<div class="pad20l pad10t">
							<input type="radio" name="FlashImgUnUse" id="FlashImgUnUse" value="N" checked="checked" onclick="fld_disabled();"/>
							<label>사용함</label>
							<input type="radio" name="FlashImgUnUse" id="FlashImgUnUse" value="Y"  onclick="fld_disabled();"/>
							<label>사용안함</label>
						</div>
						
						<!-- 이미지 등록 -->
						<div class="pad20l pad10t" style="overflow: hidden;">
							<span class="left" style="padding-top:4px;" readonly="readonly">이미지 등록 :</span>
							<input type="text" name="FlashImgPath" id="FlashImgPath" class="input left mar3r" style="width:40%;" readonly="readonly" />
							<div id='file_find_atache' style='overflow:hidden;' alt="찾아보기">
								<div id="FlashImg" name='FlashImg' style="width:100px;height:20px;" >&nbsp;</div>
							</div>
						</div>
						
						<!--  * 최적 사이즈 : 320 * 720 픽셀, (확장자 : jpg, jpeg, gif, png) -->
						<div class="pad20l pad5t pad20b">* 최적 사이즈 : <span class=report_06>320 * 720</span> 픽셀, (확장자 : jpg, jpeg, gif, png)  </div>
						
					</td>
				</tr>
				
				<!-- 로그인 페이지 배경색 변경    -->
				<tr>
					<td>
						<div class="logo_title nobr text_overf">
							<span class="left title pad20l">
								<span class="bold">로그인 페이지 배경색 변경</span>&nbsp;
								<!-- 미리보기 -->
								<span class="btn">
									<a  href="#blank-link" onclick="PreviewOpen();">
										<img width="16" height="16" align="absMiddle" alt="" src="/Src/Img/Renewal/icon_preview.gif" complete="complete"/>
										미리보기
									</a>
								</span>
							</span>
							<!-- 로그인 페이지의 배경색을 변경하실 수 있습니다. -->
							<span class="right pad20r">로그인 페이지의 배경색을 변경하실 수 있습니다.</span>
						</div>	
						<!-- 배경색등록 -->
						<div class="pad20l pad10t pad20b" style="overflow: hidden;">
							<input type="checkbox" name="BackgroundColorUse" id="BackgroundColorUse" value="Y"  />
							<span class="mar3r">배경색등록 :</span>
							
															<span class="input mar2t bcolor" style="background: #FFFFFF;" onclick="InputColor('FFFFFF');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #FF0000;" onclick="InputColor('FF0000');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #FF6C00;" onclick="InputColor('FF6C00');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #FFAA00;" onclick="InputColor('FFAA00');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #FFEF00;" onclick="InputColor('FFEF00');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #A6CF00;" onclick="InputColor('A6CF00');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #009E25;" onclick="InputColor('009E25');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #00B0A2;" onclick="InputColor('00B0A2');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #0075C8;" onclick="InputColor('0075C8');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #3A32C3;" onclick="InputColor('3A32C3');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #EF007C;" onclick="InputColor('EF007C');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #000000;" onclick="InputColor('000000');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #252525;" onclick="InputColor('252525');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #464646;" onclick="InputColor('464646');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #636363;" onclick="InputColor('636363');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #7D7D7D;" onclick="InputColor('7D7D7D');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #9A9A9A;" onclick="InputColor('9A9A9A');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #0D514C;" onclick="InputColor('0D514C');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #1B496A;" onclick="InputColor('1B496A');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #2B285F;" onclick="InputColor('2B285F');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #45245B;" onclick="InputColor('45245B');">&nbsp;</span>
															<span class="input mar2t bcolor" style="background: #721947;" onclick="InputColor('721947');">&nbsp;</span>
														<input type="text" name="BackgroundColor" id="BackgroundColor" class="input" style="width:50px;margin-left:20px;" value="" readonly="readonly" />
						</div>			
					</td>
				</tr>
				
				<!-- 모바일 페이지 로고 이미지 등록 -->
				<tr>
					<td class="larea txt_ce bold nobr text_overf">모바일 페이지<br> 로고 이미지 등록</td>
					<td>
						<div class="logo_title nobr text_overf">
							<span class="left title pad20l bold">모바일 페이지 로고 이미지 등록</span>
							<!-- 등록된 로고 이미지는 모바일 페이지 상단 중앙에 위치합니다. -->
							<span class="right pad20r">등록된 로고 이미지는 모바일 페이지 상단 중앙에 위치합니다.</span>
						</div>
						
						<div class="pad20l pad10t">
													<img src='http://static.whoisdesk.net/Src/Img/Mobile/gw2_logo.png'  width="201" height="31" border=0 class='Png24'>
												</div>
						
						<!-- ※ 이미지 등록 후 모바일 기기에서 다시 로그인하면 변경된 이미지로 표시됩니다. -->
						<div class="pad20l pad5t">※ 이미지 등록 후 모바일 기기에서 다시 로그인하면 변경된 이미지로 표시됩니다.</div>
						
						<!-- 이미지 등록 -->
						<div class="pad20l pad10t" style="overflow: hidden;">
							<span class="left" style="padding-top:4px;" >이미지 등록 : </span> 
							<input type="text" name="MobileLogoPath" id="MobileLogoPath" class="input left mar3r" style="width:40%;" readonly="readonly" />
							<div id='file_find_atache' style='overflow:hidden;cursor:pointer;' alt="찾아보기" >
								<input type='file' id="MobileLogo" name='MobileLogo' style="width:0px; height:20px; opacity:.0; -moz-opacity:.0; filter:alpha(opacity=0);" onchange="document.getElementById('MobileLogoPath').value=this.value;">
							</div>
						</div>
						
						<!-- * 최적 사이즈 : 200 * 55 픽셀, (확장자 : jpg, jpeg, gif, png) -->
						<div class="pad20l pad5t pad20b">* 최적 사이즈 : 200 * 55 픽셀, (확장자 : jpg, jpeg, gif, png)</div>
					</td>
				</tr>
				
				<!-- 관리자 정보 설정 -->
				<tr>
					<td class="larea txt_ce bold">관리자 정보 설정</td>
					<td>
						<!-- 그룹웨어 사용자가 아이디/비밀번호를 분실했을 경우 확인할 수 있는 관리자정보를 설정할 수 있습니다. -->
						<div class="logo_title" >
							그룹웨어 사용자가 아이디/비밀번호를 분실했을 경우 확인할 수 있는 관리자정보를 설정할 수 있습니다.
							<span id="infoQuestion">
								<img src="http://static.whoisdesk.net/Src/Img/Renewal/Logo/company_q.gif" alt="" align="absmiddle" />
							</span>						
						</div>
						
						<textarea name="AdminInfo" rows="10" cols="50" style="width:95%;" class="mar10 mar20b pad10">아이디/비밀번호 분실 시
회사 그룹웨어 관리자에게 문의해 주세요.

이름 : 
연락처 : </textarea>
					</td>
				</tr>
			</table>
		</form>
		
	</div> 
	<!-- //컨텐츠 --> 

	<div class="btmarea">		
		<span class="rightarea">
			<!-- 등록 -->
			<span class="btn">
				<a href="#blank-link" onclick=" }SubmitChk();">
					<img src="http://static.whoisdesk.net/Src/Img/Renewal/icon_pencil.gif" alt="" align="absmiddle" />
					등록
				</a>
			</span>
		</span>
	</div>
</div>

<script type="text/javascript" src="/Src/WebCommon/Jquery/Plugin/Upload/ajaxupload.js"></script>
<script type="text/javascript">
var dateObj = new Date();
var dummy = dateObj.getTime();

/*
function setPng24(obj) 
{
	obj.width = obj.height = 1;
	obj.className = obj.className.replace(/\bPng24\b/i,'');
	obj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + obj.src + "',sizingMethod='image');"
	obj.src = '/Src/Img/Desktop/s.gif';
	return '';
}
*/

function SubmitChk()
{
	var f = document.form;

	if($('input[name=LogoLinkUse]').is(':checked') && $.trim($('input[name=LogoLink]').val()) == '')
	{
		// 링크 주소가 등록되지 않았습니다. 링크 주소를 입력해주세요.
		alert('링크 주소가 등록되지 않았습니다. 링크 주소를 입력해주세요.');
		$('input[name=LogoLink]').focus();
		return;
	}

	if($('input[name=MainImgLinkUse]').is(':checked') && $.trim($('input[name=MainImgLink]').val()) == '')
	{
		// 링크 주소가 등록되지 않았습니다. 링크 주소를 입력해주세요.
		alert('링크 주소가 등록되지 않았습니다. 링크 주소를 입력해주세요.');
		$('input[name=MainImgLink]').focus();
		return;
	}

	if ( f.quotaExceeded.value ) {
		// 홈페이지 용량을 전부 사용하셨습니다. 관리자님께 문의하시기 바랍니다
		alert('홈페이지 용량을 전부 사용하셨습니다.\n관리자님께 문의하시기 바랍니다.');
		location.reload();
		return;
	}

	f.action = 'logoPrc.php?dummy='+dummy;
	f.submit();
}

function thisPageMove( v )
{
	if( v )
	{
		location.href = v + '?dummy='+dummy;
	}
}

/*
function setHelpBoxDisplay()
{
	if( document.getElementById("help_box_display").style.display == 'block' )
	{
		document.getElementById("help_box_display").style.display = 'none';
	}
	else
	{
		document.getElementById("help_box_display").style.display = 'block';
	}
}
*/

function InputColor(Color)
{
	var BackgroundColorUse = document.getElementById('BackgroundColorUse').checked;
	
	if(BackgroundColorUse == true){
		document.getElementById("BackgroundColor").value = Color;
	}
}

function InputLogoColor(Color)
{
	var LogoBackgroundColorUse = document.getElementById('LogoBackgroundColorUse').checked;
	
	if(LogoBackgroundColorUse == true){
		document.getElementById("LogoBackgroundColor").value = Color;
	}
}

function PreviewOpen() 
{
	var BackgroundColor = document.getElementById('BackgroundColor').value;
	var LogoBackgroundColor = document.getElementById('LogoBackgroundColor').value;
	var FlashImgPath = document.getElementById('FlashImgPath').value;
	var MainImgPath = document.getElementById('MainImgPath').value;
	var LogoImgPath = document.getElementById('LogoImgPath').value;
	var FlashImgOrg = document.getElementById('FlashImgOrg').value;
	var MainImgOrg = document.getElementById('MainImgOrg').value;
	var LogoImgOrg = document.getElementById('LogoImgOrg').value;
	
	var BackgroundColorUse = document.getElementById('BackgroundColorUse').checked;
	var LogoBackgroundColorUse = document.getElementById('LogoBackgroundColorUse').checked;
	var FlashImgUnUse = $('input[name=FlashImgUnUse]:checked').val();
	var MainImgUnUse	= $('input[name=MainImgUnUse]:checked').val();
	var LogoImgUnUse	= $('input[name=LogoImgUnUse]:checked').val();

	var PreviewUrl = "";	
	if(FlashImgPath == "") FlashImgPath = FlashImgOrg;
	if(MainImgPath == "") MainImgPath = MainImgOrg;
	if(LogoImgPath == "") LogoImgPath = LogoImgOrg;


	if(FlashImgPath)
	{
		PreviewUrl = PreviewUrl + "&FlashImg=" + FlashImgPath;
	}

	if(FlashImgUnUse == 'Y')
	{
		PreviewUrl = PreviewUrl + "&FlashImgUnUse=Y";
	}

	if(MainImgPath)
	{
		PreviewUrl = PreviewUrl + "&MainImg=" + MainImgPath;		
	}
	if(MainImgUnUse == 'Y')
	{
		PreviewUrl = PreviewUrl + "&MainImgUnUse=Y";
	}

	if(LogoImgPath)
	{
		PreviewUrl = PreviewUrl + "&LoginLogoImg=" + LogoImgPath;		
	}
	if(LogoImgUnUse == 'Y')
	{
		PreviewUrl = PreviewUrl + "&LoginLogoImgUnUse=Y";
	}

	if(BackgroundColor)
	{
		if(BackgroundColorUse == true)
		{
			PreviewUrl = PreviewUrl + "&BackgroundColorUse=Y";
		}
			PreviewUrl = PreviewUrl + "&BackgroundColor=" + BackgroundColor;
	}

	if(LogoBackgroundColor)
	{
		if(LogoBackgroundColorUse == true)
		{
			PreviewUrl = PreviewUrl + "&LogoBackgroundColorUse=Y";
		}
			PreviewUrl = PreviewUrl + "&LogoBackgroundColor=" + LogoBackgroundColor;
	}
	
	if(PreviewUrl)
	{
		window.open('/Src/Main/login.php?Preview=Y'+PreviewUrl,'GroupWare','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,center=yes,width=1024,height=600');
	}
}

function fld_disabled()
{
	var FlashImgUnUse	= $('input[name=FlashImgUnUse]:checked').val();
	var MainImgUnUse	= $('input[name=MainImgUnUse]:checked').val();
	var LogoImgUnUse	= $('input[name=LogoImgUnUse]:checked').val();

	// 로그인 페이지 로고이미지 사용여부
	if(MainImgUnUse == 'Y')
	{
		document.getElementById('MainImgPath').style.background = "#e3e3e3";
		document.getElementById('MainImgLink').style.background = "#e3e3e3";
		document.getElementById('MainImgLink').readOnly = true;
	}
	else
	{
		document.getElementById('MainImgPath').style.background = "";
		document.getElementById('MainImgLink').style.background = "";
		document.getElementById('MainImgLink').readOnly = false;
	}

	// 로그인 상단 로고이미지 사용여부
	if(LogoImgUnUse == 'Y')
	{
		document.getElementById('LogoImgPath').style.background = "#e3e3e3";
		document.getElementById('LogoImgLink').style.background = "#e3e3e3";
		document.getElementById('LogoImgLink').readOnly = true;
	}
	else
	{
		document.getElementById('LogoImgPath').style.background = "";
		document.getElementById('LogoImgLink').style.background = "";
		document.getElementById('LogoImgLink').readOnly = false;
	}
	// 로그인 페이지 플래쉬 사용여부
	if(FlashImgUnUse == 'Y')
	{
		document.getElementById('FlashImgPath').style.background = "#e3e3e3";
	}
	else
	{
		document.getElementById('FlashImgPath').style.background = "";
	}	
}

function LogoLink_disabled()
{
	if(!$('input[name=LogoLinkUse]').is(':checked')){
		$('input[name=LogoLink]').css('background', '#e3e3e3').attr('readonly', true);
	}else{
		$('input[name=LogoLink]').css('background', '').attr('readonly', false);
	}
}

function FlashImgUpload(){
	var button = $('#FlashImg'), interval; 
	new AjaxUpload(button,{    
		action: 'AjaxUpload.php', // <- 업로드 웹애플리케이션
		name: 'flash', //<- 파일 업로드 이름    
		data: { 
			FileFld : 'flash'				
		},			
		onSubmit : function(file, ext){
			this.disable(); 
		},
		onComplete: function(file, response){
			if ( response == 'quota exceeded' ) {
				$('#quotaExceeded').val(1);
			} else {
				window.clearInterval(interval);
				this.enable();
				if ( $("#FlashImgPath").val() ) {
					$.ajax({
						type: "POST",
						url: "AjaxUpload.php",
						data: "FileFld=flash&FileFldDel=1&FileFldOrg="+$("#FlashImgPath").val(),
						success: function(msg){
							$("#FlashImgPath").val(response);
						}
					});
				} else {
					$("#FlashImgPath").val(response);
				}
			}
		}
	});
}

function LogoImgUpload(){
	var button = $('#MainImg'), interval; 
	new AjaxUpload(button,{    
		action: 'AjaxUpload.php', // <- 업로드 웹애플리케이션
		name: 'mainimg', //<- 파일 업로드 이름    
		data: { 
			FileFld : 'mainimg'				
		},			
		onSubmit : function(file, ext){
			this.disable(); 
		},
		onComplete: function(file, response){
			if ( response == 'quota exceeded' ) {
				$('#quotaExceeded').val(1);
			} else {
				window.clearInterval(interval);           
				this.enable(); 
				if ( $("#MainImgPath").val() ) {
					$.ajax({
						type: "POST",
						url: "AjaxUpload.php",
						data: "FileFld=logo&FileFldDel=1&FileFldOrg="+$("#MainImgPath").val(),
						success: function(msg){							
							$("#MainImgPath").val(response);  		 
						}
					});
				} else {
					$("#MainImgPath").val(response);  
				}
				
			}
		}
	});
}

function LogoTopImgUpload(){
	var button = $('#LogoImg'), interval; 
	new AjaxUpload(button,{    
		action: 'AjaxUpload.php', // <- 업로드 웹애플리케이션
		name: 'logoimg', //<- 파일 업로드 이름    
		data: { 
			FileFld : 'logoimg'				
		},			
		onSubmit : function(file, ext){
			this.disable(); 
		},
		onComplete: function(file, response){
			if ( response == 'quota exceeded' ) {
				$('#quotaExceeded').val(1);
			} else {
				window.clearInterval(interval);           
				this.enable(); 
				if ( $("#LogoImgPath").val() ) {
					$.ajax({
						type: "POST",
						url: "AjaxUpload.php",
						data: "FileFld=logotop&FileFldDel=1&FileFldOrg="+$("#LogoImgPath").val(),
						success: function(msg){							
							$("#LogoImgPath").val(response);  		 
						}
					});
				} else {
					$("#LogoImgPath").val(response);  
				}
			}
		}
	});
}

function viewInfoHelp(){
	$('#infoQuestion').css('cursor', 'pointer').click(function(){
		document.getElementById('light').style.display = 'block';
		document.getElementById('fade').style.display = 'block';
		var url = 'helpAdminInfo.php';

		var st = document.documentElement.scrollTop;
		$('#light, #fade').css('top', st+'px');

		setIframeSrc(url, 464, 502);
	});
}

function setIframeSrc(url, width, height) 
{
	var iframePopup = document.getElementById('iframePopup');
	iframePopup.src = url;
	iframePopup.width = width;
	iframePopup.height = height;
}

$(document).ready(function() {
	FlashImgUpload();
	LogoImgUpload();
	LogoTopImgUpload();
	fld_disabled();
	LogoLink_disabled();
	viewInfoHelp();
});
</script>

<!-- light box -->
<div id="light" name="light" class="white_content">
	<table width='100%' height='100%' border='0'>
		<tr>
			<td align="center" valign="middle">
				<iframe id='iframePopup' name='iframePopup' frameborder='0' marginwidth='0' marginheight='0' scrolling ='no'></iframe>
			</td>
		</tr>
	</table>
</div> 

<div id="fade" class="black_overlay"></div>
<!-- /lignt box -->

</body>
</html>

