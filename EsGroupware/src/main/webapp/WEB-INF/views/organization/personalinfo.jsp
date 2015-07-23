<%@page import="com.groupware.dto.Employee"%>
<%@page import="java.util.List"%>
<%@page import="com.groupware.dto.Dept"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="Stylesheet" href="/groupware/resources/styles/organization.css" />

<title></title>
<script language="javascript">

$(document).ready(function () {
    $('#get').click(function () {
        $.ajax({
            url: "infomation.action?employeeid="+id,
            type: 'get',
            dataType: 'text',
            success: function (data) {
            }
        });
    });
});
	
</script>
</head>
<body >
	<div id="result" style="padding-left: 20px;">
	<h4 >직원 신상정보</h4>

				<table   style='background-color: white;' width="160px"  height="400px" border='1' cellspacing="10" cellpadding="0">
					<tr >
						<td width="500px" >
							<div align=center 
								style='width: 130; height: 144; border: 1x solid #595959; vertical-align: middle;'>
								<a href='http://gw.whoisdesk.kr/File/User/1371072280.jpg'
									target='_blank'><img
									src='/groupware/resources/image/noimage.jpg' border=0
									width='200' height='210' style='border: 1x solid #595959;'
									align='absmiddle'></a>
							</div>
						</td>

						<td style="width: 500px; " >
							<div style="vertical-align: top; " >
								<table width="630px" border='0'  cellspacing="1" cellpadding="0"
									>
									
									<c:set var="info" value="${info}"></c:set>
									<tr>
										<th style="background-color: white; ">
											<div >
												<nobr> ID </nobr>
											</div>
										</th>
										<td >
											<div style='width: 300px;'>
												<nobr>
													<span >${info.id}</span>
													<!--a href="#blank-link" onclick="javascript:try { parent.Ext.Msg.alert('Groupware Demo','<span style=color:#C8C9CA;><br />데모 체험하기는 글쓰기 등록 및 수정이 제한되어 있습니다. <br /><br />이점 양해해주시기 바랍니다.</span>');return false; } catch(e) { try { parent.parent.Ext.Msg.alert('Groupware Demo','<span style=color:#C8C9CA;><br />데모 체험하기는 글쓰기 등록 및 수정이 제한되어 있습니다. <br /><br />이점 양해해주시기 바랍니다.</span>');return false; } catch(e) { alert('그룹웨어 데모에서는 사용하실 수 없습니다.');return false; } }ServiceGate('2','한상준| |desk02@whoisdesk.kr');" ><span><img src="http://static.whoisdesk.net/Src/Img/Renewal/icon_sticky-note-pin.gif" /> 쪽지</span></a-->

												</nobr>
											</div>
										</td>
									</tr>

									<tbody>
										<tr>
											<th style="background-color: white;">
												<div >
													<nobr> 이름 </nobr>
												</div>
											</th>
											<td>
												<div id="di">
													<nobr>${info.name} </nobr>
												</div>
											</td>
										</tr>
										<tr>
											<th style="background-color: white;">
												<div >
													<nobr> 성별 </nobr>
												</div>
											</th>
											<td>
												<div>
													<nobr>${info.sex} </nobr>
												</div>
											</td>
										</tr>
										<tr>
											<th style="background-color: white;">
												<div >
													<nobr> 생년월일 </nobr>
												</div>
											</th>
											<td>
												<div>
												
													<nobr>${info.birthDate.substring(0,10)} </nobr>
												</div>
											</td>
										</tr>
										<tr>
											<th style="background-color: white;">
												<div >
													<nobr> 핸드폰 </nobr>
												</div>
											</th>
											<td>
												<div>
													<nobr>${info.phoneNumber} </nobr>
												</div>
											</td>
										</tr>
										<tr>
											<th style="background-color: white;">
												<div >
													<nobr> 이메일</nobr>
												</div>
											</th>
											<td>
												<div>
													<nobr>${info.email} </nobr>
												</div>
											</td>
										</tr>
										<tr>
											<th style="background-color: white;">
												<div >
													<nobr> 주소 </nobr>
												</div>
											</th>
											<td>
												<div>
													<nobr>${info.address} </nobr>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="3" class="vt">
							<div>
								<table width="100%" border="0" cellspacing="1" cellpadding="0">
									<col width="100px"></col>
									<col width=""></col>
									<tr>
										<th style="background-color: white;">소속부서</th>
										<td>${info.dept.partName}</td>
									</tr>
									<tbody>
										<tr>
											<th style="background-color: white;">직급</th>
											<td>${info.position.positionName}</td>
										</tr>

									</tbody>
										<tr>
											<th style="background-color: white;">직통전화</th>
											<td>${info.directLine}</td>
										</tr>
										<tr>
											<th style="background-color: white;">입사일자</th>
											<td>${info.joinDate.substring(0, 10)}</td>
											
										</tr>
								</table>
							</div>
						</td>
					</tr>


				</table>
				</div>
				<br/>	<br/>	<br/>	<br/>
				
	
</body>
</html>

