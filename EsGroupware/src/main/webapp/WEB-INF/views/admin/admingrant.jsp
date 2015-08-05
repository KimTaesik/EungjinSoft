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

	<link type="text/css" href="http://css.whoisdesk.net/Src/WebCommon/Jquery/Jquery_ui_1_7_2/blitzer/jquery-ui-1.7.2.custom.css" rel="stylesheet" />

	<script src="/groupware/resources/styles/script/jquery.js"></script>
	<script src="/groupware/resources/styles/script/jquery-ui.js"></script>

	<script type="text/javascript">
	$(function() {
		$("#searchAdmin").click(function(event) {
			/* alert($(":radio[name='AdminGb']:checked").val()); */
			$.ajax({
				url : "/groupware/admin/searchDeptAdmin.action",
				async : true,
				data : { "option": $("option:selected").val(), "radio" : $(":radio[name='AdminGb']:checked").val() },
				method : "post",
				success : function(result, status, xhr) {

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
			var radio = $(":radio[name='AdminGb']:checked").val()
			$.ajax({
				url : "/groupware/admin/registerAdmin.action",
				async : true,
				data : { "id": $(".idoption:selected").val(), "radio" : $(":radio[name='AdminGb']:checked").val() },
				method : "post",
				success : function(result, status, xhr) {
						if(radio == "8") {
							$(".table1").html(result);
						}
						else if (radio == "1") {
							$(".table4").html(result);
						}
						
						$(".deleteApprovalAdmin").click(function(event) {
							var id = $(this).attr("href");
							$.ajax({			
								url : "/groupware/admin/deleteApprovalAdmin.action",
								async : true,
								data : { "id": id},
								method : "post",
								success : function(result, status, xhr) {
														
									var ids = "#tr" + id;

									$(ids).remove();
									
								},
								error : function(xhr, status, ex) {
									alert(status + ex);
								}
							})		
							event.preventDefault();//원래 요쇼의 이벤트에 대한 기본 동작 수행 막는 코드
						})
				},
				error : function(xhr, status, ex) {
				}
			})		
			event.preventDefault();//원래 요쇼의 이벤트에 대한 기본 동작 수행 막는 코드
		})
		
		$(".deleteApprovalAdmin").click(function(event) {
			var id = $(this).attr("href");
			$.ajax({			
				url : "/groupware/admin/deleteApprovalAdmin.action",
				async : true,
				data : { "id": id},
				method : "post",
				success : function(result, status, xhr) {
										
					var ids = "#tr" + id;

					$(ids).remove();
					
				},
				error : function(xhr, status, ex) {
					alert(status + ex);
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

	<div class="toparea" style="height: 10px;"> 
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
							관리자 추가						
						</nobr>
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

		</span> 
	</div>

	<div id="admintable" class="under"></div>

		<table width="100%"  border="0" cellspacing="0" cellpadding="0" class="table">
			
			<col width="10%" class="overf"></col>
			<col width="15%" class="overf"></col>
			<col width="15%" class="overf"></col>
			<col width="15%" class="overf"></col>
			<col width="30%" class="overf"></col>
			<col width="15%" class="overf"></col>

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
			
			<table width="100%"  border="0" cellspacing="0" cellpadding="0" class="table4">
			
			<col width="10%" class="overf"></col>
			<col width="15%" class="overf"></col>
			<col width="15%" class="overf"></col>
			<col width="15%" class="overf"></col>
			<col width="30%" class="overf"></col>
			<col width="15%" class="overf"></col>
			
			<tr id="approvalListTable">
	            <c:forEach var="approvals2" items="${ approvalAdmins2 }" varStatus="status">
	            <tr id="tr${ approvals2.id }">
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
								${ approvals2.id }
							</nobr>
						</div>
					</td>
					<td class='txt_ce'>
						<div>
							<nobr>
								<c:forEach var="position" items="${ positions }">
									<c:if test="${ approvals2.positionNo ==  position.positionNo }">
										${ position.positionName }										
									</c:if>
		                		</c:forEach>
							</nobr>
						</div>
					</td>
					<td class='txt_ce'>
						<div>
							<nobr>
								${ approvals2.name }
							</nobr>
						</div>
					</td>
					<td class='txt_ce'>
						<div>
							<nobr>
								${ approvals2.name }
							</nobr>
						</div>
					</td>
					<td class='txt_ce'>
						<div>
							<nobr>
									<!-- <a href='#blank-link' onclick="javascript:"><img src='http://static.whoisdesk.net/Src/Img/Renewal/icon_modify.gif' class='vm' title=' 수정' /></a>&nbsp;&nbsp; -->
									<a href='${ approvals2.id }' class="deleteApprovalAdmin"><img src='http://static.whoisdesk.net/Src/Img/Renewal/icon_x.gif' title='삭제' /></a>
							</nobr>
						</div>
					</td>
				</tr>
	            </c:forEach>
		    </tr>
		    </table>
		    
		    <tr height='20'>
				<td colspan='6' style='border-bottom:0px;'>&nbsp;</td>
			</tr>
		    </table>
		    
			<table width="100%"  border="0" cellspacing="0" cellpadding="0" class="table2">
					
				<col width="10%" class="overf"></col>
				<col width="15%" class="overf"></col>
				<col width="15%" class="overf"></col>
				<col width="15%" class="overf"></col>
				<col width="30%" class="overf"></col>
				<col width="15%" class="overf"></col>
	
				<thead>
	
				</thead>
		
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
			
			<col width="10%" class="overf"></col>
			<col width="15%" class="overf"></col>
			<col width="15%" class="overf"></col>
			<col width="15%" class="overf"></col>
			<col width="30%" class="overf"></col>
			<col width="15%" class="overf"></col>
			
			<tr id="approvalListTable">
	            <c:forEach var="approvals" items="${ approvalAdmins }" varStatus="status">
	            <tr id="tr${ approvals.id }">
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
								<a href='${ approvals.id }' class="deleteApprovalAdmin"><img src='http://static.whoisdesk.net/Src/Img/Renewal/icon_x.gif' title='삭제' /></a>
							</nobr>
						</div>
					</td>
				</tr>
	            </c:forEach>
		    </tr>
		    </table>
			
			</tbody>

		</table>

		<hr />

	</div>


</div> 

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

</body>
</html>

