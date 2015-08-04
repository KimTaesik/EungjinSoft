<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

	<link type="text/css" href="http://css.whoisdesk.net/Src/WebCommon/Jquery/Jquery_ui_1_7_2/blitzer/jquery-ui-1.7.2.custom.css" rel="stylesheet" />

	<script src="/groupware/resources/styles/script/jquery.js"></script>
	<script src="/groupware/resources/styles/script/jquery-ui.js"></script>
	
</head>

<body>

<style style='text/css'>
.whiteContent 
{	
	width: 500px;
	height: 220px;
	background:#FFFFFF;
	overflow: auto;
	margin:0 auto;
	
}

</style>

<script type="text/javascript" src="http://gw.whoisdesk.kr/Src/WebCommon/Amcharts/Ampie/swfobject.js"></script>
<script type="text/javascript" src="http://gw.whoisdesk.kr/Src/WebCommon/Script/addTab.js"></script>

<div id="sub">
	
	<!-- 타이틀 영역 -->
	<div id="title">
		<h2><span class="admin">관리자 메인</span></h2>
	</div>
	<div class="under">
	</div>
	<!-- //타이틀 영역 -->

	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="txt_le"><img src="http://static.whoisdesk.net/Src/Img/Renewal/Admin/title_img_left.gif" /></td>
			<td>&nbsp;</td>
			<td class="txt_ri"><img src="http://static.whoisdesk.net/Src/Img/Renewal/Admin/title_img_right.gif" /></td>
		</tr>
	</table>

	<!--  테이블 영역 -->
	<div class="table">
		<table width="100%"  border="0" cellspacing="0" cellpadding="0">
			<col width="40">
			<col width="">
			<col width="100">
			<thead>
			<tr>
				<th class="bdr_top">NO</th>
			    <th class="bdr_top">제목</th>
			    <th class="bdr_top">작성일</th>
			</tr>
			</thead>
			<tbody>

						<tr>
			    <td class="txt_ce">1</td>
			    <td>
					<nobr style='width: 99%;overflow: hidden;text-overflow:ellipsis'>
						<a href='#blank-link' onclick='subTabActive("18", "18-00-05", "시스템 공지사항", "../Admin/SNotice/view.php?dummy=1438662874&No=306", true)' class='main_menu'>
							[정기점검] 7월 09일(목) 새벽 0시 그룹웨어 서버 정기점검 안내						</a>
											</nobr>				
				</td>
			    <td class="txt_ce bdr_none">15.07.06</td>
			</tr>
					<tr>
			    <td class="txt_ce">2</td>
			    <td>
					<nobr style='width: 99%;overflow: hidden;text-overflow:ellipsis'>
						<a href='#blank-link' onclick='subTabActive("18", "18-00-05", "시스템 공지사항", "../Admin/SNotice/view.php?dummy=1438662874&No=305", true)' class='main_menu'>
							[긴급공지] 6월 12일(금) 서버 긴급점검 안내						</a>
											</nobr>				
				</td>
			    <td class="txt_ce bdr_none">15.06.11</td>
			</tr>
					<tr>
			    <td class="txt_ce">3</td>
			    <td>
					<nobr style='width: 99%;overflow: hidden;text-overflow:ellipsis'>
						<a href='#blank-link' onclick='subTabActive("18", "18-00-05", "시스템 공지사항", "../Admin/SNotice/view.php?dummy=1438662874&No=304", true)' class='main_menu'>
							[정기점검] 6월 11일(목) 새벽 0시 그룹웨어 서버 정기점검 안내						</a>
											</nobr>				
				</td>
			    <td class="txt_ce bdr_none">15.06.09</td>
			</tr>
					<tr>
			    <td class="txt_ce">4</td>
			    <td>
					<nobr style='width: 99%;overflow: hidden;text-overflow:ellipsis'>
						<a href='#blank-link' onclick='subTabActive("18", "18-00-05", "시스템 공지사항", "../Admin/SNotice/view.php?dummy=1438662874&No=303", true)' class='main_menu'>
							[공지] 후이즈 그룹웨어 2.0 기능 추가 업데이트						</a>
											</nobr>				
				</td>
			    <td class="txt_ce bdr_none">15.05.22</td>
			</tr>
		
			</tbody>
		</table>
	</div>


	<!--  //테이블 영역 -->
	<h4>그룹웨어 이용정보</h4>
	<div class="table_view mar5t">
		<table width="100%"  border="0" cellspacing="0" cellpadding="0">
			
			<col width="15%">
			<col width="35%">
			<col width="15%">
			<col width="35%">

			<thead>
			<tr>
			    <th>도메인 명</th>
			    <td class="bdr_none">

					<span class="left">${ host }</span>
					
				</td>
			    <th>가입된 회원수</th>
			    <td>
					<span class="left">19 명</span>
					<span class="right btn_page"><a href="#blank-link" onclick="javascript:memberOk();"><span>가입회원 목록</span></a></span> 				
				</td>
			</tr>
			</thead>
			<tbody>
			<tr>
			    <th>그룹웨어 개설일</th>
			    <td class="bdr_none">2010.04.08 </td>
			    <th>가입대기자</th>
			    <td>
					<span class="left">0 명</span><span class="right btn_page"><a href="#blank-link" onclick="javascript:memberWait();"><span>가입대기 목록</span></a></span>				
				</td>
			</tr>
			<tr>
			    <th>관리자 ID</th>
			    <td class="bdr_none">admin </td>
			    <th>퇴사처리 된 회원</th>
			    <td>
					<span class="left">1 명</span><span class="right btn_page"><a href="#blank-link" onclick="javascript:memberRetire();"><span>퇴사자 목록</span></a></span>	
				</td>
			</tr>
			<tr>
			    <th>관리자명</th>
			    <td class="bdr_none">이한용 </td>
			    <th>최대 사용자 </th>
			    <td>
					<span class="left">20 명</span><span class="right btn_page"><a href="#blank-link" onclick="javascript:openPageOpen('http://whoisdesk.net/manage_gw20/');"><span>사용자 추가</span></a></span>	
				</td>
			</tr>

			<tr>
			    <th>관리자 연락처</th>
			    <td class="bdr_none">
					<span class="left"> </span><span class="right btn_page"><a href="#blank-link" onclick="javascript:memberModify('YWRtaW46MQ==');"><span>관리자 정보수정</span></a></span>
				</td>
			    <th>그룹웨어 이용정보</th>
			    <td class="bdr_none">
					<span class="left">2010.04.08 ~ 2020.03.31 (0 개월)</span><span class="right btn_page"><a href="#blank-link" onclick="javascript:openPageOpen('http://whoisdesk.net/manage_gw20/');"><span>기간연장하기</span></a></span>
				</td>
			</tr>

			</tbody>
		</table>


</body>
</html>

