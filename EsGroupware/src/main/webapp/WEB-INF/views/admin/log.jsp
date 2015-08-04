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
	
	<script type="text/javascript">
	$(function() {
		$("#logexcel").click(function(event) {
			/* alert($(":radio[name='AdminGb']:checked").val()); */
			$(location).attr("href","/groupware/log/logexcel.action");
			event.preventDefault();//원래 요쇼의 이벤트에 대한 기본 동작 수행 막는 코드
		})
	})
	</script>
</head>

<body>

<script type="text/javascript" src="http://gw.whoisdesk.kr/Src/WebCommon/Jquery/Plugin/DatePicker/ui.datepicker.js"></script>
<script type="text/javascript" src="http://gw.whoisdesk.kr/Src/WebCommon/Jquery/Plugin/DatePicker/jquery.datepick-ko.js"></script>
<link type="text/css" href="http://gw.whoisdesk.kr/Src/WebCommon/Jquery/Plugin/DatePicker/Demos/demos.css" rel="stylesheet" />

<div id="sub">


	<div id="title">
		<h2><span class="join">접속 로그 통계</span></h2>
		<span class="tb_num">
		</span>
	</div>
	<div class="toparea">		
		<span class="leftarea">
			<table border='0' cellpadding='0' cellspacing='0'>
				<tr>
					<td class='pad1tb'>
					</td>
					<td>
						<div id="search_Tree1" style="display:none;" class="pad5l">
							<select name="treeKeyOpt1" id="treeKeyOpt1">
								<option value='0002' > L 경영지원실</option><option value='0004' > L 전략기획팀</option><option value='0005' > L 개발2팀</option><option value='0003' > L 개발1팀</option><option value='0001' > L 임원</option><option value='0000' > L 대표이사</option> 
							</select>
							<a href="#blank-link" onclick="execSearch(1)"><img src="http://static.whoisdesk.net/Src/Img/Renewal/btn_search.gif"  title='검색' width="55" height="18" border="0" class="vm" /></a>
						</div>	
					</td>
					<td>
						<div id="search_Field1" style="display:none;" class="pad5l">
							<input type="text" name="inputForm1" id="inputForm1" class="input" value=""><a href="#blank-link" onclick="execSearch(1)"><img src="http://static.whoisdesk.net/Src/Img/Renewal/btn_search.gif"  title='검색' width="55" height="18" border="0" class="vm" /></a>
						</div>	
					</td>
					<td>
						<div id="search_Period1" style="display:none;" class="pad5l">
							<input name="StartDate1" type="text" id="StartDate1" readonly class="pUpDate" style="width:100px;height:16px;  font-family:Dotum, '돋움'; line-height:16px; color:#666666; font-size:11px; border:1px solid #CDCDCD; vertical-align:top; margin-right:0px;" value='2015-08-03' />
							~ 
							<input name="EndDate1" type="text" id="EndDate1" readonly class="dOffDate" style="width:100px;height:16px;  font-family:Dotum, '돋움'; line-height:16px; color:#666666; font-size:11px; border:1px solid #CDCDCD; vertical-align:top; margin-right:0px;" value='2015-08-03' />
							<a href="#blank-link" onclick="execSearch(1)"><img src="http://static.whoisdesk.net/Src/Img/Renewal/btn_search.gif"  title='검색' width="55" height="18" border="0" class="vm" /></a>
						</div>
					</td>
				</tr>
			</table>
		</span>
		<span class="rightarea">
			<span class="btn">
				<a href="#" id="logexcel"><img src="http://static.whoisdesk.net/Src/Img/Renewal/icon_document-excel.gif" alt="" align="absmiddle" />엑셀 파일로 저장</a>
<%-- 				<a href="#blank-list" onclick="javascript:try { parent.Ext.Msg.alert('Groupware Demo','<span style=color:#C8C9CA;><br />데모 체험하기는 글쓰기 등록 및 수정이 제한되어 있습니다. <br /><br />이점 양해해주시기 바랍니다.</span>');return false; } catch(e) { try { parent.parent.Ext.Msg.alert('Groupware Demo','<span style=color:#C8C9CA;><br />데모 체험하기는 글쓰기 등록 및 수정이 제한되어 있습니다. <br /><br />이점 양해해주시기 바랍니다.</span>');return false; } catch(e) { alert('그룹웨어 데모에서는 사용하실 수 없습니다.');return false; } }getOpenUserLoginInfo();"><img src="http://static.whoisdesk.net/Src/Img/Renewal/icon_list.gif" alt="" align="absmiddle" /> 전체 접속 통계</a>
				<a href="#blank-list" onclick="javascript:try { parent.Ext.Msg.alert('Groupware Demo','<span style=color:#C8C9CA;><br />데모 체험하기는 글쓰기 등록 및 수정이 제한되어 있습니다. <br /><br />이점 양해해주시기 바랍니다.</span>');return false; } catch(e) { try { parent.parent.Ext.Msg.alert('Groupware Demo','<span style=color:#C8C9CA;><br />데모 체험하기는 글쓰기 등록 및 수정이 제한되어 있습니다. <br /><br />이점 양해해주시기 바랍니다.</span>');return false; } catch(e) { alert('그룹웨어 데모에서는 사용하실 수 없습니다.');return false; } }setDeleteAll();"><img src="http://static.whoisdesk.net/Src/Img/Renewal/icon_x.gif" alt="" align="absmiddle" /> 삭제</a> --%>
			</span>
		</span>
	</div>


	<!--  테이블 영역 -->
	<div class="table">
		<table width="100%"  border="0" cellspacing="0" cellpadding="0">
		<form name="form" method="post" action=''>
		<input type="hidden" id="FieldSort" name="FieldSort" value="">
		<input type="hidden" id="PageSize" name="PageSize" value="15">
		<input type="hidden" id="Parameter" name="Parameter" value="JTI2ZHVtbXklM0QxNDM4NTg1NDI2||">
			
			<col width="10%"></col>
			<col width="10%"></col>
			<col width="20%"></col>
			<col width="20%"></col>
			<col width="20%"></col>
			<col width="20%"></col>

			<thead>

			<tr>
				
				<th>NO</th>
				<th>부서 </th>
				<th>이름</th>
				<th>접속 IP</th>
				<th>접속 일자</th>
			</tr>

			</thead>

			<tbody>
<!-- foreach -->
			<c:forEach var="log" items="${ logs }">
				<%-- <c:set var="now" value="${ log.logdate }" /> --%>					
				<tr>
					<td class="txt_ce">
						<a style='text-decoration:none;font-weight: bold' href='#' >${ log.logno }</a>
					</td>
					<td class="txt_ce">${ log.dept }</td>
					<td class="txt_ce">${ log.name }</td>
					<td class="txt_ce">${ log.ip }</td>
					<td class="txt_ce">
					<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${ log.logdate }"/>								
					</td>							
				</tr>
			</c:forEach>
<!-- foreach -->
			</form>

			</tbody>
		</table>
	</div>
	<!--  //테이블 영역 -->


	<!--  넘버링 영역 -->
	<div class="paging">
		<div align="center">
			${ pager.toString() }
		</div>
	</div>	
	<!--  //넘버링 영역 -->
	
	
	<!--  버튼 영역 -->
	<div class="btmarea">
		<span class="leftarea">
		</span>
		<span class="rightarea">
			<span class="btn">
			</span>
		</span>
	</div>
	<!--  //버튼 영역 -->


</div>


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

