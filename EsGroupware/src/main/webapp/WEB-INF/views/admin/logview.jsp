<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Whois Groupware - Ubiquitous Collaboration!</title>
	<	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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



<style type="text/css"> 
A:link, A:active, A:visited	{color: #000000; text-decoration: none;}
A:hover	{ text-decoration: none; color: #004A80;}
</style>


<div id="popup" style="width:598px;height:523px;">

	<div id="title">		
		<h3>'과장 유종환' 접속 로그 통계</h3>	
	</div>
	<c:choose>
	<c:when test="${ logAllcount != 0 }">

	<div class="table">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<form name="form" method="get" action="userLoginInfo.action">
		<input type="hidden" name="id" value="${ id }">
		<input type="hidden" name="date" value="7">


			<thead>


			<tr class="pad10">
				<th class="txt_le">
					<div style="width:100%;floar:left;">										
						<div style="width:80%;float:left;">
							<div class="left pad1tb mar3r">
								&nbsp;
								<select name="year" onChange="javascript:showMon();" class='input'>
									<option value="0" selected>
										연도</option>
																			<option value="15" >
										2015년										</option>
																			<option value="14" >
										2014년										</option>
																			<option value="13" >
										2013년										</option>
									</option>
								</select>

							</div>

							<div style="float:left;">
								<div class="btn_page"><a href="#blank-list" onclick="javascript:formSubmit();"><span>검색</span></a></div>
							</div>

							
						</div>
					</div>
				</th>
				
				<th align="right">
					총 로그인 수 : ${ logAllcount }				&nbsp;&nbsp;
				</th>

			</tr>
			</thead>

		</form>
		</table>


		<hr />


		<div style='width:100%;height:400px;overflow-y:scroll;'>
						<table width="95%" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="EFEFEF"> 
					<td width="20%" height="25" align="center">월별</td>
					<td width="20%" align="center">로그인 수</td>
					<td width="60%" height="25" align="center" bgcolor="EFEFEF">그래프</td>
				</tr>
				<c:forEach var="i" begin="0" end="11">
				<tr> 
					<td height="25" align="center">${ i + 1 }</td>
					<td height="25" align="center">${ logMonthcount[i] }</td>
					<td height="25" align="left">
						<table border="0" cellpadding="0" cellspacing="0" class="menu">
							<tr>
								<td height="11">
								<%-- <fmt:parseNumber var="index" integerOnly="true" value="${logMonthcount[i] / logAllcount}"/>
								<img src="http://static.whoisdesk.net/Src/Img/Renewal/Admin/log_bar_bluebg.gif" height="11" width="${ index * 100 }"> --%>
								<img src="http://static.whoisdesk.net/Src/Img/Renewal/Admin/log_bar_bluebg.gif" height="11" width="${ (logMonthcount[i] / logAllcount) * 100 }">
								<%-- <fmt:parseNumber var="index" integerOnly="true" value="${ (logMonthcount[i] / logAllcount) * 100 }"/> --%>
								<fmt:formatNumber value="${ (logMonthcount[i] / logAllcount) * 100 }" type="number" maxFractionDigits="2" var="index" />
								${ index } %</td>
							</tr>
						</table>
					</td>
				</tr>
				</c:forEach>
				<%-- <tr> 
					<td height="25" align="center">2</td>
					<td height="25" align="center">294</td>
					<td height="25" align="left">
						<table border="0" cellpadding="0" cellspacing="0" class="menu">
							<tr>
								<td height="11"><img src="http://static.whoisdesk.net/Src/Img/Renewal/Admin/log_bar_bluebg.gif" height="11" width="43.56"> 14.52%</td>
							</tr>
						</table>
					</td>
				</tr>
								<tr> 
					<td height="25" align="center">3</td>
					<td height="25" align="center">325</td>
					<td height="25" align="left">
						<table border="0" cellpadding="0" cellspacing="0" class="menu">
							<tr>
								<td height="11"><img src="http://static.whoisdesk.net/Src/Img/Renewal/Admin/log_bar_bluebg.gif" height="11" width="48.15"> 16.05%</td>
							</tr>
						</table>
					</td>
				</tr>
								<tr> 
					<td height="25" align="center">4</td>
					<td height="25" align="center">264</td>
					<td height="25" align="left">
						<table border="0" cellpadding="0" cellspacing="0" class="menu">
							<tr>
								<td height="11"><img src="http://static.whoisdesk.net/Src/Img/Renewal/Admin/log_bar_bluebg.gif" height="11" width="39.12"> 13.04%</td>
							</tr>
						</table>
					</td>
				</tr>
								<tr> 
					<td height="25" align="center">5</td>
					<td height="25" align="center">219</td>
					<td height="25" align="left">
						<table border="0" cellpadding="0" cellspacing="0" class="menu">
							<tr>
								<td height="11"><img src="http://static.whoisdesk.net/Src/Img/Renewal/Admin/log_bar_bluebg.gif" height="11" width="32.46"> 10.82%</td>
							</tr>
						</table>
					</td>
				</tr>
								<tr> 
					<td height="25" align="center">6</td>
					<td height="25" align="center">246</td>
					<td height="25" align="left">
						<table border="0" cellpadding="0" cellspacing="0" class="menu">
							<tr>
								<td height="11"><img src="http://static.whoisdesk.net/Src/Img/Renewal/Admin/log_bar_bluebg.gif" height="11" width="36.45"> 12.15%</td>
							</tr>
						</table>
					</td>
				</tr>
								<tr> 
					<td height="25" align="center">7</td>
					<td height="25" align="center">241</td>
					<td height="25" align="left">
						<table border="0" cellpadding="0" cellspacing="0" class="menu">
							<tr>
								<td height="11"><img src="http://static.whoisdesk.net/Src/Img/Renewal/Admin/log_bar_bluebg.gif" height="11" width="35.7"> 11.9%</td>
							</tr>
						</table>
					</td>
				</tr>
								<tr> 
					<td height="25" align="center">8</td>
					<td height="25" align="center">${ logMonthcount[7] }</td>
					<td height="25" align="left">
						<table border="0" cellpadding="0" cellspacing="0" class="menu">
							<tr>
								<td height="11"><img src="http://static.whoisdesk.net/Src/Img/Renewal/Admin/log_bar_bluebg.gif" height="11" width="5.31"></td>
							</tr>
						</table>
					</td>
				</tr>
								<tr> 
					<td height="25" align="center">9</td>
					<td height="25" align="center">0</td>
					<td height="25" align="left">
						<table border="0" cellpadding="0" cellspacing="0" class="menu">
							<tr>
								<td height="11"><img src="http://static.whoisdesk.net/Src/Img/Renewal/Admin/log_bar_bluebg.gif" height="11" width="0"> 0%</td>
							</tr>
						</table>
					</td>
				</tr>
								<tr> 
					<td height="25" align="center">10</td>
					<td height="25" align="center">0</td>
					<td height="25" align="left">
						<table border="0" cellpadding="0" cellspacing="0" class="menu">
							<tr>
								<td height="11"><img src="http://static.whoisdesk.net/Src/Img/Renewal/Admin/log_bar_bluebg.gif" height="11" width="0"> 0%</td>
							</tr>
						</table>
					</td>
				</tr>
								<tr> 
					<td height="25" align="center">11</td>
					<td height="25" align="center">0</td>
					<td height="25" align="left">
						<table border="0" cellpadding="0" cellspacing="0" class="menu">
							<tr>
								<td height="11"><img src="http://static.whoisdesk.net/Src/Img/Renewal/Admin/log_bar_bluebg.gif" height="11" width="0"> 0%</td>
							</tr>
						</table>
					</td>
				</tr>
								<tr> 
					<td height="25" align="center">12</td>
					<td height="25" align="center">0</td>
					<td height="25" align="left">
						<table border="0" cellpadding="0" cellspacing="0" class="menu">
							<tr>
								<td height="11"><img src="http://static.whoisdesk.net/Src/Img/Renewal/Admin/log_bar_bluebg.gif" height="11" width="0"> 0%</td>
							</tr>
						</table>
					</td>
				</tr> --%>
				</table>

		
	</div>
	</c:when>
	<c:otherwise>
	<br /><br /><br /><br /><br /><br /><br /><br />
	<div align="center">
		사용자가 없습니다.
	</div>
	</c:otherwise>
	</c:choose>
	<div id="contents">
			<div class="btn_page" style="margin-left:45%;"><a href="#blank-list" onclick="javascript:setPopupClose();"><span><img src="http://static.whoisdesk.net/Src/Img/Renewal/icon_cross.gif" class="vm" /> 닫기</span></a></div>
	</div>

</div>


<form name="form2" method="post" action=''>
	<input type="hidden" name="domain_name" value=''>
</form>


<script language="JavaScript">
<!--
function getWhoisIp(ip)
{
	var newWin = window.open('about:blank','WhoisWin','top=0,left=0,width=800,height=600,toolbar=yes,menubar=yes,location=yes,scrollbars=yes,status=yes,resizable=yes,fullscreen=yes');

	var f = document.form2;
	f.domain_name.value = ip;
	f.action = 'http://whois.nida.or.kr/result.php';
	f.target = 'WhoisWin';
	f.submit();
}

function OpenUserLoginInfo(Id)
{
	if(!Id) return;

	window.open('userLoginInfo.php?Id='+Id, 'Login_'+Id ,'top=0,left=0,width=600,height=400,enubar=yes,scrollbars=yes,status=yes,resizable=yes');
}

function formSubmit() 
{
    var f = document.form;
    f.submit();
}

function loginPageView( num )
{
	var f = document.form;
	var id = f.Id.value;

	location.href="?Id="+id+"&date="+num;
}

function showMon()
{
	var f=document.form;
	if(f.year.selectedIndex >0) 
	{
		f.mon.style.display = '';
	}
	else 
	{
		f.mon.style.display = 'none';
		f.mon.selectedIndex = 0;
	}

	if(f.mon.selectedIndex >0) 
	{
		f.day.style.display = '';
	}
	else 
	{
		f.day.style.display = 'none';
		f.day.selectedIndex = 0;
	}
}
//-->
function setPopupClose() 
{
	try 
	{ 
		window.parent.document.getElementById('light').style.display = 'none';
		window.parent.document.getElementById('fade').style.display = 'none';
	}
	catch(e) 
	{ 
		self.close();
	}
}

showMon();

</script>




</body>
</html>

