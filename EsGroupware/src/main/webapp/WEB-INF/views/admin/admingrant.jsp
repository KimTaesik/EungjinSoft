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
	<link href="/groupware/resources/styles/admin/common.css?dummy=20150702" rel="stylesheet" type="text/css" />
	<link href="/groupware/resources/styles/admin/board.css?dummy=20120223" rel="stylesheet" type="text/css" />
	<link href="/groupware/resources/styles/admin/subpage.css?dummy=20120223" rel="stylesheet" type="text/css" />
	<link href="/groupware/resources/styles/admin/popup.css?dummy=20140507" rel="stylesheet" type="text/css" />
	<!--[if IE 6]>
	<link href="http://css.whoisdesk.net/Src/Skin/Renewal/board_ie6.css" rel="stylesheet" type="text/css" />
	<![endif]-->
	<link type="text/css" href="http://css.whoisdesk.net/Src/WebCommon/Jquery/Jquery_ui_1_7_2/blitzer/jquery-ui-1.7.2.custom.css" rel="stylesheet" />

	<script type="text/javascript" src="http://js.whoisdesk.net/Src/WebCommon/Script/Common.js?v=20150702"></script>
	<script type="text/javascript" src="http://js.whoisdesk.net/Src/WebCommon/Jquery/jquery.js?dt=20110117"></script>
	<script type="text/javascript" src="http://js.whoisdesk.net/Src/WebCommon/Jquery/Plugin/jquery.DOMWindow.js"></script>

	<script type="text/javascript">
	$(function() {
		$("#searchAdmin").click(function(event) {		
			$.ajax({
				url : "/groupware/admin/searchDeptAdmin.action",
				async : true,
				data : { "option": $("option:selected").val()},
				method : "post",
				success : function(result, status, xhr) {
					/* $("#result").text(result); */
					//alert(result[0].name);
					var TreeKeyDiv2 = document.getElementById('TreeKeyDiv2');
					var html = 
						"<select name='TreeKey2' size='5' style='width:500px;height:100px;' onchange='getTreeKeyCode(this.value);'>";
						for(var i= 0 ; i < result.length; i ++) {
							html += "<option class='idoption' value='" + result[i].id + "'>" + result[i].name + "</option>";
						}
						
						html += "</select>";
						
						if( result.length > 0) {
							TreeKeyDiv2.innerHTML = html;
						}
						if( result.length == 0) {
							TreeKeyDiv2.innerHTML = "<select name='TreeKey2' size='5' style='width:500px;height:100px;' onchange='getTreeKeyCode(this.value);'><option>사원 없음</option></select>";
						}	
				},
				error : function(xhr, status, ex) {
					alert(ex);
				}
			})		
			event.preventDefault();//원래 요쇼의 이벤트에 대한 기본 동작 수행 막는 코드
		})
		
		$("#registerApprovalAdmin").click(function(event) {
			$.ajax({
				url : "/groupware/admin/registerApprovalAdmin.action",
				async : true,
				data : { "id": $(".idoption:selected").val()},
				method : "post",
				success : function(result, status, xhr) {
						var html;
						//alert(result.length);

						for(var i= 0 ; i < result.length; i ++) {
		              	
						html += "<tr><td class='txt_ce'><div><nobr>" +
						i +
						"</nobr></div></td><td class='txt_ce'><div><nobr>" +
						result[i].id +
						//"</nobr></div></td><td class='txt_ce'><div><nobr>" +
						"<c:forEach var='position' items='${ positions }'>" +
						"<c:if test='${ approvals.positionNo ==  position.positionNo }'>" +
						"${ position.positionName }"+									
						"</c:if></c:forEach>" + 
						"</nobr></div></td><td class='txt_ce'><div><nobr>" +
						result[i].name +
						"</nobr></div></td><td class='txt_ce'><div><nobr>" +
						result[i].name +
						"</nobr></div></td><td class='txt_ce'><div><nobr>" +
						result[i].name +
						"</nobr></div></td><td class='txt_ce'><div><nobr>" +
						"<a href='#blank-link' onclick='javascript:'><img src='http://static.whoisdesk.net/Src/Img/Renewal/icon_modify.gif' class='vm' title=' 수정' /></a>&nbsp;&nbsp;" +
						"<a href='${ approvals.id }' class='deleteApprovalAdmin'><img src='http://static.whoisdesk.net/Src/Img/Renewal/icon_x.gif' title='삭제' /></a>" +
						"</nobr></div></td></tr>"; 
						
						}

						//alert(html);
						$(".table1").html(html);
				},
				error : function(xhr, status, ex) {
				}
			})		
			event.preventDefault();//원래 요쇼의 이벤트에 대한 기본 동작 수행 막는 코드
		})
		
		$(".deleteApprovalAdmin").click(function(event) {
			alert($(this).attr('href'));
			$.ajax({			
				url : "/groupware/admin/deleteApprovalAdmin.action",
				async : true,
				data : { "id": $(this).attr('href')},
				method : "post",
				success : function(result, status, xhr) {	
					alert();
				},
				error : function(xhr, status, ex) {
				}
			})		
			event.preventDefault();//원래 요쇼의 이벤트에 대한 기본 동작 수행 막는 코드
		})
	})
	</script>
</head>

<body>



<form name="refresh">
	<input type="hidden" name="confirm" value="1">
</form>


<div id="sub"> 

	<div id="title"> 
        <h2><span class="join">관리자 지정</span></h2> 
	</div> 

	<div class="toparea"> 
		<span class="leftarea"> 

			<span class="btn">
			<a href="#blank-link" onclick="javascript:setHelpGuide();"><img src="/groupware/resources/image/admin/icon_clock.gif" alt="" align="absmiddle" /> 관리자 설명</a>
			</span>

		</span> 

		<span class="rightarea"> 
			<span class="btn">		
				<a href="#blank-link" onclick="javascript:"><img src="/groupware/resources/image/admin/icon_pencil.gif" alt="" align="absmiddle" /> 등록</a>			
			</span> 
		</span>
	</div> 

    <div class="table_view"> 

		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_layout">
		<form name="form" method="post" action='indexPrc.php?dummy=1437557543' onsubmit='return submitPrc();'>	
		<input type='hidden' name='No' value=''>
		<input type='hidden' name='Id' value='' >
		<input type='hidden' name='TreeKeyVal' value='' >


			<col width="100px" class="overf"></col>
			<col width="" class="overf"></col>

			<tbody>
			

			<tr>
				<th>
					<div>
						<nobr>
							관리권한						</nobr>
					</div>
				</th>
				<td class="pad3tb">
					<div>
						<nobr>
							<input type="radio" name="AdminGb" value="1" checked class="vm radio" onclick='adminGb(this.value)'> 
							<span onclick="javascript:setAdminCheck(0, 1);" onfocus="this.blur();">전체관리자</span>
							&nbsp;&nbsp;
							<input type="radio" name="AdminGb" value="2"  class="vm radio" onclick='adminGb(this.value)'> 
							<span onclick="javascript:setAdminCheck(1, 2);" onfocus="this.blur();">회사메뉴 관리자</span>
							<br />

							<input type="radio" name="AdminGb" value="3"  class="vm radio" onclick='adminGb(this.value)'> 
							<span onclick="javascript:setAdminCheck(2, 3);" onfocus="this.blur();">부서메뉴 관리자</span>
							&nbsp;&nbsp;
							<input type="radio" name="AdminGb" value="4"  class="vm radio" onclick='adminGb(this.value)'> 
							<span onclick="javascript:setAdminCheck(3, 4);" onfocus="this.blur();">업무일지 관리자</span>
							<br />

							<input type="radio" name="AdminGb" value="5"  class="vm radio" onclick='adminGb(this.value)'> 
							<span onclick="javascript:setAdminCheck(4, 5);" onfocus="this.blur();">인사관리자(출근, 휴가 관리)</span>
							&nbsp;&nbsp;
							<input type="radio" name="AdminGb" value="7"  class="vm radio" onclick='adminGb(this.value)'> 
							<span onclick="javascript:setAdminCheck(5, 7);" onfocus="this.blur();">문서관리자</span>
							<br />

							<input type="radio" name="AdminGb" value="8"  class="vm radio" onclick='adminGb(this.value)'> 
							<span onclick="javascript:setAdminCheck(6, 8);" onfocus="this.blur();">전자결재 관리자</span>
							&nbsp;&nbsp;
							
							<input type="radio" name="AdminGb" value="10"  class="vm radio" onclick='adminGb(this.value)'> 
							<span onclick="javascript:setAdminCheck(7, 10);" onfocus="this.blur();">자산 관리자</span>&nbsp;&nbsp;
							
							<!--<input type="radio" name="AdminGb" value="11"  class="vm radio" onclick='adminGb(this.value)'> 
							<span onclick="javascript:setAdminCheck(8, 11);" onfocus="this.blur();">지출결의 관리자</span>&nbsp;&nbsp;-->
								
													</nobr>
					</div>
				</td>
			</tr>
			<tr>
				<th>
					<div>
						<nobr>
							부서선택						</nobr>
					</div>							
				</th>
				<td>
					<div>
						<nobr>				
							<div id="TreeKeyDiv" style='padding-top:10px;padding-bottom:10px;'>&nbsp;</div>
						</nobr>
					</div>
				</td>
			</tr>
			<tr>
				<th>
					<div>
						<nobr>				
							관리자 추가						</nobr>
					</div>						
				</th>
				<td>
					<div>
						<nobr>
							<span class="left mar3r">
								<input name="userInfo" type="text" class="input vm" value="" style="width:200px" readonly />
							</span>
							<span class="btn_page">
								<a href="#" id="searchAdmin"><span><img src="/groupware/resources/image/icon_magnify.gif" class="vm"  /> 관리자 찾기</span></a>
							</span>
						</nobr>
					</div>
				</td>
			</tr>
			<tr>
				<th>
					<div>
						<nobr>				
							관리자 선택						</nobr>
					</div>						
				</th>
				<td>
					<div>
						<nobr>				
							<div id="TreeKeyDiv2" style='padding-top:10px;padding-bottom:10px;'>&nbsp;</div>
						</nobr>
					</div>
				</td>
			</tr>

			</tbody>

		</form>
		</table>
	</div> 

	<div class="toparea"> 
		<span class="leftarea"> 

		</span> 

		<span class="rightarea"> 

			<span class="btn">
			
				<a href="#blank-link" id="registerApprovalAdmin"><img src="http://static.whoisdesk.net/Src/Img/Renewal/icon_pencil.gif" alt="" align="absmiddle" /> 등록</a>
				
			</span> 

		</span>
	</div> 


	<hr />

	<div class="table_view mar20t">

	<div id="title"> 
        <h2><span class="comm-list">등록된 관리자 리스트</span></h2> 
	</div> 


	<div class="toparea"> 
		<span class="leftarea"> 


			<table cellpadding="0" cellspacing="0" border="0">
			<form name="form1" method="post" action=''>
				
				<tr>
					<td class="pad1tb">
						<select name="SearchKey" onchange="setDisplaySearchVal(1);">
							<option value=''		  		  >
								검색선택							</option>
							<option value='all'		  		  >
								전체보기							</option>
							<option value="Id"		  		  >
								아이디							</option>
							<option value="Name"	  	  >
								이름							</option>
							<option value="CopLevel"   >
								직급							</option>
							<option value="AdminGb"     >
								관리권한							</option>
						</select> 
					</td>

					<td>
						<div id="SearchKey1" style="display:none;" class="mar5l">
							<input type="text" name="SearchVal1" value="" class="input"  onkeydown="if(event.keyCode==13) javascript:SearchChk();"><a href="#blank-link" onclick="javascript:SearchChk();"><img src="http://static.whoisdesk.net/Src/Img/Renewal/btn_search.gif"  title='검색' width="55" height="18" border="0" class="vm" /></a>
						</div>
					</td>

					<td>
						<div id="SearchKey2" style="display:none;" class="mar5l">
							<select name="SearchVal2">
							<option></option>
								<option value='3' >전무이사</option><option value='13' >상무이사</option><option value='1' >대표</option><option value='2' >소장</option><option value='5' >부장</option><option value='4' >실장</option><option value='6' >팀장</option><option value='9' >대리</option><option value='7' >차장</option><option value='8' >과장</option><option value='10' >주임</option><option value='11' >사원</option>							</select><a href="#blank-link" onclick="javascript:SearchChk();"><img src="http://static.whoisdesk.net/Src/Img/Renewal/btn_search.gif"  title='검색' width="55" height="18" border="0" class="vm mar5l" /></a>
						</div>
					</td>

					<td>
						<div id="SearchKey3" style="display:none;" class="mar5l">
							<select name="SearchVal3">
							<option selected></option>
							<option value="1"  >
								전체관리자							</option>
							<option value="2"  >
								회사메뉴 관리자							</option>
							<option value="3"  >
								부서메뉴 관리자							</option>
							<option value="4"  >
								업무일지 관리자							</option>
							<option value="5"  >
								인사관리자(출근, 휴가 관리)							</option>
							<option value="7"  >
								문서관리자							</option>
							<option value="8"  >
								전자결재 관리자							</option>
							<option value="9"  >
								지사 전체 관리자							</option>
							<option value="9"  >
								자산 관리자							</option>
							<!--<option value="11"  >
								지출결의 관리자							</option>-->
							</select><a href="#blank-link" onclick="javascript:SearchChk();"><img src="/groupware/resources/image/admin/btn_search.gif"  title='검색' width="55" height="18" border="0" class="vm mar5l" /></a>
						</div>
					</td>

				</tr>
	
			</form>
			</table>

		</span> 

	</div>

	<div class="under"></div>

		<table width="100%"  border="0" cellspacing="0" cellpadding="0" class="table">
			
			<col width="10%" class="overf"></col>
			<col width="15%" class="overf"></col>
			<col width="15%" class="overf"></col>
			<col width="15%" class="overf"></col>
			<col width="30%" class="overf"></col>
			<col width="15%" class="overf"></col>

			<thead>

			</thead>

			<tbody>

			<tr>
				<td colspan='6' align='left'><img src='/groupware/resources/image/admin/bull_arr_gray.gif' alt='' /><b>전체관리자</b></td>
			</tr>
			<tr>
			    <th>
					<div>
						<nobr>
							NO						</nobr>
					</div>
				</th>
			    <th>
					<div>
						<nobr>
							아이디						</nobr>
					</div>
				</th>
			    <th>
					<div>
						<nobr>
							직급						</nobr>
					</div>
				</th>
			    <th>
					<div>
						<nobr>
							이름						</nobr>
					</div>
				</th>
			    <th>
					<div>
						<nobr>
							관리권한						</nobr>
					</div>
				</th>
			    <th>
					<div>
						<nobr>
							관리						</nobr>
					</div>
				</th>
			</tr>


			<tr>
				<td class='txt_ce'>
					<div>
						<nobr>
							1
						</nobr>
					</div>
				</td>
				<td class='txt_ce'>
					<div>
						<nobr>				
							admin
						</nobr>
					</div>							
				</td>
				<td class='txt_ce'>
					<div>
						<nobr>				
							대표						
						</nobr>
					</div>							
				</td>
				<td class='txt_ce'>
					<div>
						<nobr>				
							김응진
						</nobr>
					</div>							
				</td>
				<td class='txt_ce'>
					<div>
						<nobr>
							전체관리자
						</nobr>
					</div>
				</td>
				<td class='txt_ce'>
					<div>
						<nobr>
								<a href='#blank-link' onclick="javascript:try { parent.Ext.Msg.alert('Groupware Demo','<span style=color:#C8C9CA;><br />데모 체험하기는 글쓰기 등록 및 수정이 제한되어 있습니다. <br /><br />이점 양해해주시기 바랍니다.</span>');return false; } catch(e) { try { parent.parent.Ext.Msg.alert('Groupware Demo','<span style=color:#C8C9CA;><br />데모 체험하기는 글쓰기 등록 및 수정이 제한되어 있습니다. <br /><br />이점 양해해주시기 바랍니다.</span>');return false; } catch(e) { alert('그룹웨어 데모에서는 사용하실 수 없습니다.');return false; } }location.href='?dummy=1437557543&No=1';"><img src='http://static.whoisdesk.net/Src/Img/Renewal/icon_modify.gif' class='vm' title=' 수정' /></a>&nbsp;&nbsp;
								<a href='#blank-link' onclick="javascript:try { parent.Ext.Msg.alert('Groupware Demo','<span style=color:#C8C9CA;><br />데모 체험하기는 글쓰기 등록 및 수정이 제한되어 있습니다. <br /><br />이점 양해해주시기 바랍니다.</span>');return false; } catch(e) { try { parent.parent.Ext.Msg.alert('Groupware Demo','<span style=color:#C8C9CA;><br />데모 체험하기는 글쓰기 등록 및 수정이 제한되어 있습니다. <br /><br />이점 양해해주시기 바랍니다.</span>');return false; } catch(e) { alert('그룹웨어 데모에서는 사용하실 수 없습니다.');return false; } }prcDel('1', '1', 'admin');"><img src='http://static.whoisdesk.net/Src/Img/Renewal/icon_x.gif' class='vm'  title='삭제' /></a>
						</nobr>
					</div>
				</td>
			</tr>
		
			<tr height='20'>
				<td colspan='6' style='border-bottom:0px;'>&nbsp;</td>
			</tr>
			<tr>
				<td colspan='6'>
					<div>
						<nobr>				
							<img src='http://static.whoisdesk.net/Src/Img/Renewal/bull_arr_gray.gif' alt='' /><b>전자결재 관리자</b>
						</nobr>
					</div>
				</td>
			</tr>
			<tr>
				<th>
					<div>
						<nobr>	
							NO
						</nobr>
					</div>
				</th>
				<th>
					<div>
						<nobr>	
							아이디
						</nobr>
					</div>
				</th>
				<th>
					<div>
						<nobr>	
							직급
						</nobr>
					</div>
				</th>
				<th>
					<div>
						<nobr>	
							이름
						</nobr>
					</div>
				</th>
				<th>
					<div>
						<nobr>	
							관리권한
						</nobr>
					</div>
				</th>
				<th>
					<div>
						<nobr>	
							관리
						</nobr>
					</div>
				</th>
			</tr>
			<table width="100%"  border="0" cellspacing="0" cellpadding="0" class="table1">
			<tr id="approvalListTable">
	            <c:forEach var="approvals" items="${ approvalAdmins }" varStatus="status">
	            <tr>
	             	<td class='txt_ce'>
						<div>
							<nobr>
								${ status.index }
							</nobr>
						</div>
					</td>
					<td class='txt_ce'>
						<div>
							<nobr>
								${ approvals.id }
							</nobr>
						</div>
					</td>
					<td class='txt_ce'>
						<div>
							<nobr>
								<c:forEach var="position" items="${ positions }">
									<c:if test="${ approvals.positionNo ==  position.positionNo }">
										${ position.positionName }										
									</c:if>
		                		</c:forEach>
							</nobr>
						</div>
					</td>
					<td class='txt_ce'>
						<div>
							<nobr>
								${ approvals.name }
							</nobr>
						</div>
					</td>
					<td class='txt_ce'>
						<div>
							<nobr>
								${ approvals.name }
							</nobr>
						</div>
					</td>
					<td class='txt_ce'>
						<div>
							<nobr>
									<a href='#blank-link' onclick="javascript:"><img src='http://static.whoisdesk.net/Src/Img/Renewal/icon_modify.gif' class='vm' title=' 수정' /></a>&nbsp;&nbsp;
									<a href='${ approvals.id }' class="deleteApprovalAdmin"><img src='http://static.whoisdesk.net/Src/Img/Renewal/icon_x.gif' title='삭제' /></a>
							</nobr>
						</div>
					</td>
				</tr>
	            </c:forEach>
		    </tr>
		    </table>
			<!-- <tr>
				<td class='txt_ce'>
					<div>
						<nobr>
							1
						</nobr>
					</div>
				</td>
				<td class='txt_ce'>
					<div>
						<nobr>				
							desk01
						</nobr>
					</div>							
				</td>
				<td class='txt_ce'>
					<div>
						<nobr>				
							대표							
						</nobr>
					</div>							
				</td>
				<td class='txt_ce'>
					<div>
						<nobr>				
							김응진
						</nobr>
					</div>							
				</td>
				<td class='txt_ce'>
					<div>
						<nobr>
							전자결재 관리자
						</nobr>
					</div>
				</td>
				<td class='txt_ce'>
					<div>
						<nobr>
								<a href='#blank-link' onclick="javascript:"><img src='http://static.whoisdesk.net/Src/Img/Renewal/icon_modify.gif' class='vm' title=' 수정' /></a>&nbsp;&nbsp;
								<a href='#blank-link' onclick="javascript:"><img src='http://static.whoisdesk.net/Src/Img/Renewal/icon_x.gif' class='vm'  title='삭제' /></a>
						</nobr>
					</div>
				</td>
			</tr> -->
		

			</tbody>

		</table>

		<hr />

	</div>


    <!-- 하단 도움말 영역 -->
    <!--div id="help_btm"> 
		<div class="txt_ce"><a href="#blank-link" onclick="javascript:setHelpBoxDisplay();" onfocus="this.blur();"><img src="http://static.whoisdesk.net/Src/Img/Renewal/help_btm_question.gif" alt="도움말" class="vb" /></a></div>
		<div id="help_box_display" class="help_box" style="display:none;"> 
        <ul> 
            <li>1. 각 메뉴마다 관리자를 지정할 수 있습니다.</li> 
        </ul> 
    </div--> 
    <!-- //하단 도움말 영역 -->


</div> 


<script language="javascript">

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

function setAdminCheck(num, val)
{
	var f = document.form;

	try 
	{ 
		eval("f.AdminGb["+num+"].checked = true");
		adminGb(val);
	}
	catch(e) { }
}

function adminGb(val) 
{
	var TreeKeyDiv = document.getElementById('TreeKeyDiv');
	if(val == 3) 
	{		
		TreeKeyDiv.innerHTML = "<select name='TreeKey[]' size='5' style='width:500px;height:100px;' onchange='getTreeKeyCode(this.value);'><c:forEach var='dept' items='${ depts }'><option value=${ dept.deptNo }>${ dept.partName }</option></c:forEach></select>";
	} 
	else if(val == 4) 
	{		
		TreeKeyDiv.innerHTML = "<select name='TreeKey[]' size='5' style='width:500px;height:100px;' onchange='getTreeKeyCode(this.value);'><c:forEach var='dept' items='${ depts }'><option value=${ dept.deptNo }>${ dept.partName }</option></c:forEach></select>";
	}
	else 
	{		
		TreeKeyDiv.innerHTML = "부서관련 관리자일경우 선택";
	}
}

function getTreeKeyCode( val )
{
	var f = document.form;

	if( val ) f.TreeKeyVal.value = val;	
}

function getUserList() 
{	
	var dateObj = new Date();
	var dummy = dateObj.getTime();

	//window.open('userFindPopup.php?dummy='+dummy,"userFind","top=0,left=0,width=400,height=568,scrollbars=no");

	document.getElementById('light').style.display = 'block';
	document.getElementById('fade').style.display = 'block';
	var url = 'userFindPopup.php?dummy='+dummy;
	setIframeSrc(url, 463, 480);
}

function submitPrc() 
{	
	if(typeof(document.form['TreeKey[]']) != 'undefined') 
	{				
		if(!document.form['TreeKey[]'].value) 
		{		
			alert('부서를 선택하세요.');
			return false;
		}
	}		
		
	if(!document.form.Id.value) 
	{
		alert('아이디를 입력하세요.');
		return false;
	}
}

function submitChk() 
{	
	var f = document.form;

	if(typeof(document.form['TreeKey[]']) != 'undefined') 
	{				
		if(!document.form['TreeKey[]'].value) 
		{		
			alert('부서를 선택하세요.');
			return;
		}
	}		
		
	if(!document.form.Id.value) 
	{		
		alert('아이디를 입력하세요.');
		return;
	}

	f.action = 'indexPrc.php';
	f.submit();
}


function submitChk2() 
{	
	var f = document.form2;

	if(typeof(document.form['TreeKey[]']) != 'undefined') 
	{				
		if(!document.form['TreeKey[]'].value) 
		{		
			alert('부서를 선택하세요.');
			return;
		}
	}		
		
	if(!document.form.Id.value) 
	{		
		alert('아이디를 입력하세요.');
		return;
	}

	f.action = 'index.php';
	f.submit();
}

function SearchPrc()
{
	var f = document.form2;

	if(f.SearchKey[0].selected == false)
	{
		f.method="get";
		f.submit();
		return true;
	}
	else
	{
		alert('검색 기준을 선택하세요.');
		f.SearchKey.focus();
		return false;
	}
}

function SearchChk()
{
	var f = document.form1;

	if(f.SearchKey[0].selected == false)
	{
		f.method="post";
		f.submit();
	}
	else
	{
		alert('검색 기준을 선택하세요.');
		f.SearchKey.focus();
		return;
	}
}

function SearchChk2()
{
	var f = document.form2;

	if(f.SearchKey[0].selected == false)
	{
		f.method="post";
		f.submit();
	}
	else
	{
		alert('검색 기준을 선택하세요.');
		f.SearchKey.focus();
		return;
	}
}

function prcDel(No, AdminGb, Id) 
{	
	var dateObj = new Date();
	var dummy = dateObj.getTime();

	if(confirm('정말 삭제 하시겠습니까 ?')) 
	{		
		document.location='indexPrc.php?dummy='+dummy+'&mode=delete&No='+No+'&AdminGb='+AdminGb+'&Id='+Id;
	}
}

// Guide Popup
function setHelpGuide()
{
	var dateObj = new Date();
	var dummy = dateObj.getTime();
	//window.open('help.php?dummy='+dummy,'',"top=0,left=0,width=820,height=608,scrollbars=yes,status=yes,resizable=yes;");

	document.getElementById('light').style.display = 'block';
	document.getElementById('fade').style.display = 'block';
	var url = 'help.php?dummy='+dummy;
	setIframeSrc(url, 552, 600);
}

function setDisplaySearchVal(submitV)
{
	var f = document.form1;

	var SearchKey1 = document.getElementById('SearchKey1');
	var SearchKey2 = document.getElementById('SearchKey2');
	var SearchKey3 = document.getElementById('SearchKey3');
   
	if(	f.SearchKey[2].selected == true || 
		f.SearchKey[3].selected == true 
	) 
	{
		SearchKey1.style.display	= 'block';
		SearchKey2.style.display	= 'none';
		SearchKey3.style.display	= 'none';

		f.SearchVal2[0].selected = true;
		f.SearchVal3[0].selected = true;
   }
   else if(f.SearchKey[4].selected == true) 
   {
		SearchKey1.style.display	= 'none';
		SearchKey2.style.display	= 'block';
		SearchKey3.style.display	= 'none';	 
		f.SearchVal1.value='';
		f.SearchVal3[0].selected = true;
   }
   else if(f.SearchKey[5].selected == true) 
   {
		SearchKey1.style.display	= 'none';
		SearchKey2.style.display	= 'none';
		SearchKey3.style.display	= 'block';
		f.SearchVal1.value='';
		f.SearchVal2[0].selected = true;
   }
   else
   {
		SearchKey1.style.display	= 'none';
		SearchKey2.style.display	= 'none';
		SearchKey3.style.display	= 'none';
		f.SearchVal1.value='';
		f.SearchVal2[0].selected = true;
		f.SearchVal3[0].selected = true;
		if(f.SearchKey[1].selected == true && submitV)
	   {
			f.submit();
	   }
   }
}

function setDisplaySearchVal2(submitV)
{
	var f = document.form2;

	var SearchKey11 = document.getElementById('SearchKey11');
	var SearchKey22 = document.getElementById('SearchKey22');
	var SearchKey33 = document.getElementById('SearchKey33');
   
	if(	f.SearchKey[1].selected == true || 
		f.SearchKey[2].selected == true 
	) 
	{
		SearchKey11.style.display	= 'block';
		SearchKey22.style.display	= 'none';
		SearchKey33.style.display	= 'none';

		f.SearchVal2[0].selected = true;
		f.SearchVal3[0].selected = true;
   }
   else if(f.SearchKey[3].selected == true) 
   {
		SearchKey11.style.display	= 'none';
		SearchKey22.style.display	= 'block';
		SearchKey33.style.display	= 'none';	 
		f.SearchVal1.value='';
		f.SearchVal3[0].selected = true;
   }
   else if(f.SearchKey[4].selected == true) 
   {
		SearchKey11.style.display	= 'none';
		SearchKey22.style.display	= 'none';
		SearchKey33.style.display	= 'block';
		f.SearchVal1.value='';
		f.SearchVal2[0].selected = true;
   }
   else
   {
		SearchKey11.style.display	= 'none';
		SearchKey22.style.display	= 'none';
		SearchKey33.style.display	= 'none';
		f.SearchVal1.value='';
		f.SearchVal2[0].selected = true;
		f.SearchVal3[0].selected = true;
   }
}

function setIframeSrc(url, width, height) 
{
	var iframePopup = document.getElementById('iframePopup');
	iframePopup.src = url;
	iframePopup.width = width;
	iframePopup.height = height;
}

setDisplaySearchVal();
//setDisplaySearchVal2();


	//adminGb('1');
	window.onload=new Function("adminGb('1')");



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

