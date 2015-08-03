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
	<script type="text/javascript" src="/groupware/resources/styles/script/jquery.js"></script>
	<script type="text/javascript" src="/groupware/resources/styles/script/jquery-ui.js"></script>
	<script type="text/javascript" src="/groupware/resources/styles/script/jquery.DOMWindow.js"></script>

 	<script type="text/javascript" src="http://js.whoisdesk.net/Src/WebCommon/Jquery/jquery.js"></script>
	<script type="text/javascript" src="http://js.whoisdesk.net/Src/WebCommon/Jquery/Plugin/jquery.DOMWindow.js"></script>

	<script type="text/javascript">
		$(function() {
			$("#menuchange").click(function(event) {
				/* alert($(":checkbox[class='checkmenu']:checked").val());  */
				/* alert("clicked"); */

				var checkbox = "";
				$("input[class='checkmenu']:checked").each(function() {
					checkbox += $(this).val();
					checkbox += ",";
		        });
				
				/* alert(checkbox);	 */			
				/* jQuery.ajaxSettings.traditional = true; */
				$.ajax({
					url : "/groupware/admin/menuchange.action",
					async : true,
					data : { "checkbox" : checkbox },
					method : "post",
					success : function(result, status, xhr) {
						location.href = result;
					},
					error : function(xhr, status, ex) {
						alert("xhr :" + xhr, "status :" + status, "ex :" + ex);
					}
				})		
				event.preventDefault();//원래 요쇼의 이벤트에 대한 기본 동작 수행 막는 코드 
			})
		});
	</script>
	
	<script type="text/javascript">
		/* opener.document.location.reload(true); */
		/* top.frame.window.opener.location.reload(true); */
		/* top.frame.window.opener.location.reload(true); */
		parent.window.opener.location.reload(true);
	</script>

</head>

<body>



<style type="text/css">
.menuBox{
	float:left;
	padding:5px;
	width: 75px;
	margin:10px 0px 5px 10px;
}

.menuBox img {
	width:55px;
	height:57px;	
	float:left;
}

.menuCheck{
	width:10px;
	float:left;
	margin-left:5px;
}

.tabsIcon{
	float:left;
	width:64px;
}

#topBar{
	margin:25px 0px 30px 0px;
	width:100%;
	height:22px;
	background-color:#2b2b2b;
	border:1px solid #363636;
	overflow:hidden;
}

#topBar a{
	float:left;
	display:block;
	text-indent:-400px;
	overflow:hidden;
	background-position:top;
}

#topBar a:hover{
	background-position:bottom;	
}

#sortable{
	/* float:left;
	height:80px; */
}

</style>

<script type="text/javascript" src="http://gw.whoisdesk.kr/Src/WebCommon/Jquery/Jquery_ui_1_7_2/jquery-ui-1.7.2.custom.min.js"></script>

<div id="sub"> 
    

    <div id="title"> 
        <h2><span class="cate">메뉴 설정</span></h2> 
	</div> 
 
    <!-- 버튼영역 --> 
    <div class="toparea mar10t"> 
		<span class="rightarea"> 
			<span class="btn"><a href="" id="menuchange" ><img src="http://static.whoisdesk.net/Src/Img/Renewal/icon_pencil.gif" alt="" align="absmiddle" /> 저장</a></span>  
		</span> 
	</div> 
    <!--  //버튼 영역 --> 
	
	<!-- 공지영역 -->
	<p class="pad10">
		직원들이 사용할 수 있는 메뉴를 설정할 수 있으며, 사용하는 메뉴에 해당 아이콘을 체크 하시면 해당 메뉴를 사용하실 수 있습니다.	</p>
	<!-- //공지영역 -->
	
    <!-- 컨텐츠 --> 
	<form name="form" action='' method="post">
	<input type='hidden' name='code' value=''>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table mar20b"> 
		<col width="10">
		<col width="47%">
		<col>
		<col width="47%">
		<col width="10">
		<thead>
		<tr>			
			<td></td>
			<th style="border:1px solid #D3D3D5;border-bottom:0px;">
				<div>
					<nobr>
						전체 메뉴					</nobr>
				</div>
			</th>
			<td></td>
<!-- 			<th style="border:1px solid #D3D3D5;border-bottom:0px;">
				<div>
					<nobr>
						사용하는 메뉴					</nobr>
				</div>
			</th>
			<td></td> -->
		</tr>
		</thead>
		<tbody>
		<tr>
			<td style="border-bottom:0px;"></td>
			<td style="border-left:1px solid #EFEFEF; border-right:1px solid #EFEFEF;" class="vt">
<!-- 				<div class="pad10" style="height:25px;">
					<img src="http://static.whoisdesk.net/Src/Img/Renewal/Admin/btn_menu_allcheck.gif" class="cursor" onclick="checkAllSelect()"/> 
					<img src="http://static.whoisdesk.net/Src/Img/Renewal/Admin/btn_menu_allcancel.gif" class="cursor" onclick="checkAllDeselect();"/>					
				</div> -->
					<span class="menuBox">
						<img src="/groupware/resources/image/admin/admin.png" title="관리자" id="image19" onclick="checkItImage(this,'0','')" class="cursor" />
						<div class="menuCheck">
						<input type="checkbox" class='checkmenu' title="관리자" name="check19" value="1" onclick="checkIt(this)"
						${ menus[0].use == 1 ? 'checked' : ''} />
						</div>
					&nbsp;&nbsp;관리자	
					</span>
									
					<span class="menuBox">
						<img src="/groupware/resources/image/admin/assiduity.png" title="근태현황" id="image3" onclick="checkItImage(this,'0','')" class="cursor" />
						<div class="menuCheck"><input type="checkbox" class='checkmenu' title="근태현황" name="check3" value="2" onclick="checkIt(this)"  ${ menus[1].use == 1 ? 'checked' : ''}  /></div>
					&nbsp;&nbsp;근태현황
					</span>
					<span class="menuBox">
						<img src="/groupware/resources/image/admin/community.png" title="커뮤니티" id="image4" onclick="checkItImage(this,'0','')" class="cursor" />
						<div class="menuCheck"><input type="checkbox" class='checkmenu' title="커뮤니티" name="check4" value="3" onclick="checkIt(this)"  ${ menus[2].use == 1 ? 'checked' : ''}  /></div>
					&nbsp;&nbsp;커뮤니티
					</span>
					<span class="menuBox">
						<img src="/groupware/resources/image/admin/organization.png" title="조직도" id="image5" onclick="checkItImage(this,'0','')" class="cursor" />
						<div class="menuCheck"><input type="checkbox" class='checkmenu' title="조직도" name="check5" value="4" onclick="checkIt(this)"  ${ menus[3].use == 1 ? 'checked' : ''}  /></div>
					&nbsp;&nbsp;조직도
					</span>
					<span class="menuBox">
						<img src="/groupware/resources/image/admin/home.png" title="주소록" id="image5" onclick="checkItImage(this,'0','')" class="cursor" />
						<div class="menuCheck"><input type="checkbox" class='checkmenu' title="주소록" name="check5" value="5" onclick="checkIt(this)"  ${ menus[4].use == 1 ? 'checked' : ''}  /></div>
					&nbsp;&nbsp;주소록
					</span>
					<span class="menuBox">
						<img src="/groupware/resources/image/admin/assiduity.png" title="일정관리" id="image5" onclick="checkItImage(this,'0','')" class="cursor" />
						<div class="menuCheck"><input type="checkbox" class='checkmenu' title="일정관리" name="check5" value="6" onclick="checkIt(this)"  ${ menus[5].use == 1 ? 'checked' : ''}  /></div>
					&nbsp;&nbsp;일정관리
					</span>
					<span class="menuBox">
						<img src="/groupware/resources/image/admin/organization.png" title="전자결재" id="image5" onclick="checkItImage(this,'0','')" class="cursor" />
						<div class="menuCheck"><input type="checkbox" class='checkmenu' title="전자결재" name="check5" value="7" onclick="checkIt(this)"  ${ menus[6].use == 1 ? 'checked' : ''}  /></div>
					&nbsp;&nbsp;전자결재
					</span>
					
			</td>
			<!-- <td style="border-bottom:0px;"></td>
			<td style="border-left:1px solid #EFEFEF; border-right:1px solid #EFEFEF;" class="vt">
				<div class="pad10" style="height:25px;">
					※ 해당 아이콘이 바탕화면에 적용됩니다. 아래메뉴를 드래그 하시면 메뉴 정렬을 설정하실 수 있습니다.				</div>
				<div id="sortable">
						<span class="menuBox" id="li18">
							<img src="/groupware/resources/image/admin/admin.png" class="handle" />
						
						</span>
						<span class="menuBox" id="li3">
							<img src="/groupware/resources/image/admin/organization.png" class="handle" />
						
						</span>
						<span class="menuBox" id="li4">
							<img src="/groupware/resources/image/admin/home.png" class="handle" />
						
						</span>
						<span class="menuBox" id="li5">
							<img src="/groupware/resources/image/admin/organization.png" class="handle" />
						
						</span>
				</div>
			</td> -->
			<td style="border-bottom:0px;"></td>
		</tr>
		</tbody>
	</table>
	</form>
 
    <!-- 버튼영역 --> 
    <div class="btmarea"> 
		<span class="rightarea"> 
			<span class="btn"><a href="#blank-link" ><img src="http://static.whoisdesk.net/Src/Img/Renewal/icon_pencil.gif" alt="" align="absmiddle" /> 저장</a></span> 
		</span> 
	</div> 
    <!-- //버튼영역 -->
	
 
    <!-- //컨텐츠 --> 
 

	<!--  하단 도움말 영역 -->
	<!--div id="help_btm">
		<div class="txt_ce"><a href="javascript:setHelpBoxDisplay();" onfocus="this.blur();"><img src="http://static.whoisdesk.net/Src/Img/Renewal/help_btm_question.gif" alt="도움말" class="vb" /></a></div>
		<div id="help_box_display" class="help_box" style="display:none;">
				<ul>
					<li></li>
					<li></li>
					<li></li>
				</ul>
		</div>
	</div-->
	<!--  //하단 도움말 영역 -->

 
</div> 

 
<script language="javascript"> 
<!--
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
//-->
</script>




</body>
</html>

