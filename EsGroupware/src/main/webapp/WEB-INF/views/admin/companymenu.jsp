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
<script type="text/javascript">
<!--
// 타 자바스크립트 라이브러리를 사용하기 위해
// 아래와 같이 jquery 변수 수정.
var $jquery = jQuery.noConflict();


function checkAllSelect()
{

	var frm = document.getElementsByTagName('input');

	for(var i=0;i<frm.length;i++) {
		if(frm[i].type == "checkbox" && !frm[i].checked && !frm[i].disabled)
		{
			frm[i].checked = true;			
			checkIt(frm[i]);
		}
	}	
}

function checkAllDeselect()
{
	var frm = document.getElementsByTagName('input');

	for(var i=0;i<frm.length;i++) {
		if( frm[i].type == "checkbox" && frm[i].checked && !frm[i].disabled && frm[i].value != 18 &&  frm[i].value != 19)
		{
			frm[i].checked = false;
			checkIt(frm[i]);
		}
	}
}

function checkItImage(el,menuCode,usable)
{
	if(menuCode!=0 && !usable)
	{
		alert("유료서비스입니다. 서비스 신청 후 설정하실 수 있습니다.");
	}
	else
	{
		var idx = String(el.id.replace("image",""));
		var frm = document.getElementsByTagName('input');
		for(var i=0;i<frm.length;i++) {
			if(frm[i].type == "checkbox" && frm[i].value == idx)
			{
				var bool = frm[i].checked;
				frm[i].checked = !bool ;
				checkIt(frm[i]);
			}
		}	
	}
}

function checkIt(el)
{

	var idx = el.value;
	var image = document.getElementById('image'+idx);
	var imageSrc = image.src;

	if(idx == 18 || idx == 19)
	{
		el.checked = true;
		alert("기본메뉴는 변경하실 수 없습니다.");
	} 
	else
	{
		if(!el.checked)
		{
			var newImageSrc = imageSrc.replace('_on','_off');
			image.src = newImageSrc;
			$jquery('#li'+idx).remove();		
		}
		else 
		{
			var newImageSrc = imageSrc.replace('_off','_on'); 
			image.src = newImageSrc;

			$jquery("#sortable").append('<span id="li'+idx+'" class="menuBox"><img src="'+newImageSrc+'" class="handle" /></span>');
			$jquery("#sortable").sortable( 'refresh' )
		}
	}
}

function serial()
{
	var s = $jquery("#sortable").sortable('toArray');
	
	var newArr = new Array();
	
	for(var i=0;i<s.length;i++)
	{
		s[i]=s[i].replace('li','');

		newArr.push({
			id:s[i],
			position:newArr.length 
		});
	}
	
	return newArr;
}

function getSortable()
{
	var dateObj = new Date();
	var dummy = dateObj.getTime();

	var dat = serial();

	if( !dat.length )
	{
		alert('메뉴를 선택해주세요.');
		return;
	}

	var str = new Array();
	for(var i = 0; i < dat.length; i++)
	{
		str[i]= dat[i].id;
	}
	
	var tmp = str.join("&");

	if( !tmp ) return;

	var f = document.form;
	f.code.value = '';

	if( confirm('메뉴를 설정하시겠습니까 ?') )
	{
		f.code.value = tmp;
		f.action = 'prc.php?dummy='+dummy;
		f.submit();
	}
}

var sweepChecks=true;
$jquery(document).ready(function() {

	if(sweepChecks)
	{
		var i=0;
		while(document.getElementById('check'+i))
		{
			$jquery('#check'+i).attr('checked',false);
			i++;
		}
	}
	else if(tabs.length)
	{
		var i=0;
		while(document.getElementById('check'+i))
		{
			if(!tabs[i])
			{
				$jquery('#check'+i).attr('checked',false);
				i++;
				continue;
			}
			
			$jquery('#check'+i).attr('checked',true);
			
			i++;
		}
	}

  $jquery("#sortable").sortable({ 
    handle : '.handle',
	//axis:'x',
	containment: 'document'
  });  
  	

});


//-->
</script>


<div id="sub"> 
    

    <div id="title"> 
        <h2><span class="cate">메뉴 설정</span></h2> 
	</div> 
 

    <!-- 버튼영역 --> 
    <div class="toparea mar10t"> 
		<span class="rightarea"> 
			<span class="btn"><a href="#blank-link" ><img src="http://static.whoisdesk.net/Src/Img/Renewal/icon_pencil.gif" alt="" align="absmiddle" /> 저장</a></span>  
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
			<th style="border:1px solid #D3D3D5;border-bottom:0px;">
				<div>
					<nobr>
						사용하는 메뉴					</nobr>
				</div>
			</th>
			<td></td>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td style="border-bottom:0px;"></td>
			<td style="border-left:1px solid #EFEFEF; border-right:1px solid #EFEFEF;" class="vt">
				<div class="pad10" style="height:25px;">
					<img src="http://static.whoisdesk.net/Src/Img/Renewal/Admin/btn_menu_allcheck.gif" class="cursor" onclick="checkAllSelect()"/> 
					<img src="http://static.whoisdesk.net/Src/Img/Renewal/Admin/btn_menu_allcancel.gif" class="cursor" onclick="checkAllDeselect();"/>					
				</div>
					<span class="menuBox">
						<img src="/groupware/resources/image/admin/assiduity.png" title="관리자" id="image19" onclick="checkItImage(this,'0','')" class="cursor" />
						<div class="menuCheck"><input type="checkbox" title="관리자" name="check19" value="19" onclick="checkIt(this)"  checked  /><!-- id="check19" --></div>
					&nbsp;&nbsp;근태현황
					</span>
									
					<span class="menuBox">
						<img src="/groupware/resources/image/admin/organization.png" title="전자결재" id="image3" onclick="checkItImage(this,'0','')" class="cursor" />
						<div class="menuCheck"><input type="checkbox" title="전자결재" name="check3" value="3" onclick="checkIt(this)"  checked  /></div>
					&nbsp;&nbsp;커뮤니티
					</span>
					<span class="menuBox">
						<img src="/groupware/resources/image/admin/home.png" title="일정관리" id="image4" onclick="checkItImage(this,'0','')" class="cursor" />
						<div class="menuCheck"><input type="checkbox" title="일정관리" name="check4" value="4" onclick="checkIt(this)"  checked  /></div>
					&nbsp;&nbsp;조직도
					</span>
					<span class="menuBox">
						<img src="/groupware/resources/image/admin/organization.png" title="프로젝트" id="image5" onclick="checkItImage(this,'0','')" class="cursor" />
						<div class="menuCheck"><input type="checkbox" title="프로젝트" name="check5" value="5" onclick="checkIt(this)"  checked  /></div>
					&nbsp;&nbsp;주소록
					</span>
					
			</td>
			<td style="border-bottom:0px;"></td>
			<td style="border-left:1px solid #EFEFEF; border-right:1px solid #EFEFEF;" class="vt">
				<div class="pad10" style="height:25px;">
					※ 해당 아이콘이 바탕화면에 적용됩니다. 아래메뉴를 드래그 하시면 메뉴 정렬을 설정하실 수 있습니다.				</div>
				<div id="sortable">
						<span class="menuBox" id="li18">
							<img src="/groupware/resources/image/admin/assiduity.png" class="handle" />
						
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
			</td>
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

