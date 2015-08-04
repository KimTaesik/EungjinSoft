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
	$(document).ready(function () {
		$("#delete").click(function() {
			var yes = confirm("삭제할까요");
			if (yes) {
				location.href = 'employeedelete.action?id=' + id;
			}
		})
		
		$("#employeeexcel").click(function(event) {
			/* alert($(":radio[name='AdminGb']:checked").val()); */
			$(location).attr("href","/groupware/log/employeeexcel.action");
			event.preventDefault();//원래 요쇼의 이벤트에 대한 기본 동작 수행 막는 코드
		})
	})
	
	
	</script>
	

</head>

<body>

<script type="text/javascript" src="http://gw.whoisdesk.kr/Src/WebCommon/Script/addTab.js"></script>

<div id="sub">
	<!-- 버튼 영역 -->
	
	<div id="title">
		<h2>
					<!-- 가입된 회원 리스트 -->
			<span class="join">가입된 회원 리스트</span>
		</h2>
		
	</div>
	
	<div class="toparea">

		<span class="rightarea">
			<!-- 퇴사자 회원 리스트 -->
			<span class="btn">
				<a href="#blank-list" onclick="javascript:pageMove(3);">
					<img src="http://static.whoisdesk.net/Src/Img/Renewal/icon/icon_memberout.gif" alt="" align="absmiddle" />
					퇴사자 회원 리스트
				</a>
			</span>
			<!-- 엑셀 파일로 저장 -->
			<span class="btn">
				<a href="#" id="employeeexcel">
					<img src="http://static.whoisdesk.net/Src/Img/Renewal/icon_file.gif" alt="" align="absmiddle" />
					엑셀 파일로 저장
				</a>
			</span>
			<!-- 전체 접속 통계 -->
			<span class="btn">
				<a href="#blank-list" onclick="javascript:try { parent.Ext.Msg.alert('Groupware Demo','<span style=color:#C8C9CA;><br />데모 체험하기는 글쓰기 등록 및 수정이 제한되어 있습니다. <br /><br />이점 양해해주시기 바랍니다.</span>');return false; } catch(e) { try { parent.parent.Ext.Msg.alert('Groupware Demo','<span style=color:#C8C9CA;><br />데모 체험하기는 글쓰기 등록 및 수정이 제한되어 있습니다. <br /><br />이점 양해해주시기 바랍니다.</span>');return false; } catch(e) { alert('그룹웨어 데모에서는 사용하실 수 없습니다.');return false; } }OpenUserLoginInfo('');">
					<img src="http://static.whoisdesk.net/Src/Img/Renewal/icon_list.gif" alt="" align="absmiddle" />
					전체 접속 통계
				</a>
			</span>
		</span>
	</div>
		<!--  //버튼 영역 -->
	
	<!--  테이블 영역 -->
	<div class="table">
		<table width="100%"  border="0" cellspacing="0" cellpadding="0" class="table_layout">
			<col width="5%"  class="overf"></col>
			<col width="15%" class="overf"></col>
			<col width="20%" class="overf"></col>
			<col width="10%" class="overf"></col>
			<col class="overf"></col>
			<col width="15%" class="overf"></col>
			<col width="10%" class="overf"></col>
			<col width="15%" class="overf"></col>

			<thead>
				<tr>
					<!-- NO -->
					<th class="nobr text_overf">NO</th>
					
					<!-- 아이디 -->
					<th class="nobr text_overf">
						아이디
						<a href='employeelist.action?lineup=id&sort=ASC&pageno=${ pageno }' >
						<img src="http://static.whoisdesk.net/Src/Img/Renewal/Prop/icon_box_up.gif" class="vm cursor" alt="" title="오름차순 정렬 보기" onclick="goFieldSort(1);" />
						</a>
						<a href='employeelist.action?lineup=id&sort=DESC&pageno=${ pageno }' >
						<img src="http://static.whoisdesk.net/Src/Img/Renewal/Prop/icon_box_down.gif" class="vm cursor" alt="" title="내림차순 정렬 보기" onclick="goFieldSort(2, '15' );" />
						</a>
					</th>
					
					<!-- 부서 -->
					<th class="nobr text_overf">
						부서
						<a href='employeelist.action?lineup=dept&sort=ASC&pageno=${ pageno }' >
						<img src="http://static.whoisdesk.net/Src/Img/Renewal/Prop/icon_box_up.gif" class="vm cursor" alt="" title="오름차순 정렬 보기" onclick="goFieldSort(3);" />
						</a>
						<a href='employeelist.action?lineup=dept&sort=DESC&pageno=${ pageno }' >
						<img src="http://static.whoisdesk.net/Src/Img/Renewal/Prop/icon_box_down.gif" class="vm cursor" alt="" title="내림차순 정렬 보기" onclick="goFieldSort(4);" />
						</a>
					</th>
					
					<!-- 직급 -->
					<th class="nobr text_overf">
						직급
						<a href='employeelist.action?lineup=position&sort=ASC&pageno=${ pageno }' >
						<img src="http://static.whoisdesk.net/Src/Img/Renewal/Prop/icon_box_up.gif" class="vm cursor" alt="" title="오름차순 정렬 보기" onclick="goFieldSort(5);" />
						</a>
						<a href='employeelist.action?lineup=position&sort=DESC&pageno=${ pageno }' >
						<img src="http://static.whoisdesk.net/Src/Img/Renewal/Prop/icon_box_down.gif" class="vm cursor" alt="" title="내림차순 정렬 보기" onclick="goFieldSort(6);" />
						</a>
					</th>
					
					<!-- 이름 -->
					<th class="nobr text_overf">
						이름
						<a href='employeelist.action?lineup=name&sort=ASC&pageno=${ pageno }' >
						<img src="http://static.whoisdesk.net/Src/Img/Renewal/Prop/icon_box_up.gif" class="vm cursor" alt="" title="오름차순 정렬 보기" onclick="goFieldSort(7);" />
						</a>
						<a href='employeelist.action?lineup=name&sort=DESC&pageno=${ pageno }' >
						<img src="http://static.whoisdesk.net/Src/Img/Renewal/Prop/icon_box_down.gif" class="vm cursor" alt="" title="내림차순 정렬 보기" onclick="goFieldSort(8);" />
						</a>
					</th>
					
					<!-- 전화번호 -->
					<th class="nobr text_overf">전화번호</th>
				
					<!-- 입사일 -->
					<th class="nobr text_overf">
						입사일
						<a href='employeelist.action?lineup=joindate&sort=ASC&pageno=${ pageno }' >
						<img src="http://static.whoisdesk.net/Src/Img/Renewal/Prop/icon_box_up.gif" class="vm cursor" alt="" title="오름차순 정렬 보기" onclick="goFieldSort(9);" />
						</a>
						<a href='employeelist.action?lineup=joindate&sort=DESC&pageno=${ pageno }' >
						<img src="http://static.whoisdesk.net/Src/Img/Renewal/Prop/icon_box_down.gif" class="vm cursor" alt="" title="내림차순 정렬 보기" onclick="goFieldSort(10);" />
						</a>
					</th>
					<!-- 관리 -->
					<th class="nobr text_overf">관리</th>
				</tr>
			</thead>
			
			<tbody>
			
			<c:choose>
				<c:when test="${ employees != null && employees.size() > 0 }">
				<c:set var="i" value="0"/>
					<c:forEach var="employee" items="${ employees }">
						<tr style="height:30px;text-align:left;border-bottom: 2px #000000 solid;">
							<td class='nobr text_overf txt_ce'>
							<c:set var="i" value="${ i + 1 }"/>
								${ i }
							</td>
							<td class='nobr text_overf txt_ce'>${ employee.id }</td>
							
							<c:forEach var="dept" items="${ depts }">
								<c:choose>
									<c:when test="${ employee.deptNo.equals(dept.deptNo) }">
										<td class='nobr text_overf txt_ce'>${ dept.partName }</td>
									</c:when>
									<c:otherwise></c:otherwise>
								</c:choose>
							</c:forEach>
							<c:forEach var="position" items="${ positions }">
								<c:choose>
									<c:when test="${ employee.positionNo.equals(position.positionNo) }">
										<td class='nobr text_overf txt_ce'>${ position.positionName }</td>
									</c:when>
									<c:otherwise></c:otherwise>
								</c:choose>
							</c:forEach>
							<td class='nobr text_overf txt_ce'>${ employee.name }</td>
							<td class='nobr text_overf txt_ce'>${ employee.phoneNumber }</td>
							<td class='nobr text_overf txt_ce'>
							<fmt:formatDate pattern="yyyy-MM-dd" value="${ employee.joinDatetype }"/>
							</td>
								
							<td class='nobr text_overf txt_ce'>
										
								<!-- 가입된 회원 리스트 -->
<%-- 								<!-- 접속로그 통계 -->
								<a href='#blank-list' onclick="try { parent.Ext.Msg.alert('Groupware Demo','<span style=color:#C8C9CA;><br />데모 체험하기는 글쓰기 등록 및 수정이 제한되어 있습니다. <br /><br />이점 양해해주시기 바랍니다.</span>');return false; } catch(e) { try { parent.parent.Ext.Msg.alert('Groupware Demo','<span style=color:#C8C9CA;><br />데모 체험하기는 글쓰기 등록 및 수정이 제한되어 있습니다. <br /><br />이점 양해해주시기 바랍니다.</span>');return false; } catch(e) { alert('그룹웨어 데모에서는 사용하실 수 없습니다.');return false; } }OpenUserLoginInfo('desk09');">
									<img src='http://static.whoisdesk.net/Src/Img/Renewal/icon_list.gif' align='absmiddle' title='접속로그 통계'/>
								</a> --%>
								<!-- 수정 -->
								<a style='text-decoration:none;font-weight: bold' href='employeeview.action?id=${ employee.id }' >
									<img src='http://static.whoisdesk.net/Src/Img/Renewal/icon_modify.gif' align='absmiddle' title='수정' />
								</a>
								<!-- 삭제 -->
								<a href='#blank-list' id="delete">
									<img src='http://static.whoisdesk.net/Src/Img/Renewal/icon_x.gif' align='absmiddle' title='삭제' />
								</a>
<%-- 								<!-- 퇴사 -->
								<a href='#blank-list' onclick="try { parent.Ext.Msg.alert('Groupware Demo','<span style=color:#C8C9CA;><br />데모 체험하기는 글쓰기 등록 및 수정이 제한되어 있습니다. <br /><br />이점 양해해주시기 바랍니다.</span>');return false; } catch(e) { try { parent.parent.Ext.Msg.alert('Groupware Demo','<span style=color:#C8C9CA;><br />데모 체험하기는 글쓰기 등록 및 수정이 제한되어 있습니다. <br /><br />이점 양해해주시기 바랍니다.</span>');return false; } catch(e) { alert('그룹웨어 데모에서는 사용하실 수 없습니다.');return false; } }setRetirePrc('desk09');">
									<img src='http://static.whoisdesk.net/Src/Img/Renewal/icon/icon_memberout.gif' align='absmiddle' title='퇴사' />
								</a> --%>
																
							</td>							
						</tr>
					</c:forEach>

			<br/><br/>					
				</c:when>
				<c:otherwise>
					<h3 style='text-align:center'>등록된 사용자가 없습니다.</h3>
				</c:otherwise>
			</c:choose>

			</tbody>
		</table>
	</div>
	<!--  //테이블 영역 -->
	<br />
	<div class="paging" align="center">
			 ${ pager.toString() }
	</div>	
	
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

