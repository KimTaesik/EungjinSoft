<%@page import="com.groupware.dto.Dept"%>
<%@page import="java.util.List"%>
<%@page import="com.groupware.dto.Employee"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="Stylesheet"
	href="/groupware/resources/styles/organization.css" />
<title>안대건</title>
</head>
<body>

	<script language="javascript">
		var old_menu = '';
		var old_cell = '';

		function menuclick(i, cellbar) {
			var submenu = document.getElementById('submenu' + i);
			if (old_menu != submenu) {

				submenu.style.display = 'block';
				cellbar.src = '/groupware/resources/image/club_minus.gif';
				old_menu = submenu;
				old_cell = cellbar;

			} else {
				
				submenu.style.display = 'none';
				cellbar.src = '/groupware/resources/image/club_plus.gif';
				old_menu = '';
				old_cell = '';
			}

		}
function link(id){
			
			
			location.href = "infomation.action?employeeid="+id;
			
		}
	
	</script>

	
	<table width="200" cellspacing="0" cellpadding="0"
		style="padding-left: 10px; padding-top: 0px">
		<!--  첫번째 메뉴 부분 -->
		<!--  본 메뉴,  본메뉴를 추가할 경우 menuclick(submenu1,bar1)의 숫자 1과 IMG name=bar1의 숫자 1 그리고 서브메뉴의 SPAN id=submenu1의 1 일치시켜야 함-->

		<tr>
			<td bgcolor="white" align="center" colspan="2"
				style="font-size: 20px; font-weight: bolder;">부서 목록</td>
		</tr>
		<c:forEach var="dept" items="${depts}">
			<tr height="22">
				<td bgcolor="white" style="CURSOR: hand" colspan="2"
					onMouseOver="this.style.backgroundColor = 'gray'"
					onMouseOut="this.style.backgroundColor='gray'"
					onclick="menuclick(${dept.deptNo},bar${dept.deptNo})">&nbsp;&nbsp;<IMG
					name=bar${dept.getDeptNo()}
					src="/groupware/resources/image/club_plus.gif" width="11"
					height="11">&nbsp;&nbsp;<font color='#000000'>${dept.partName}</font></td>
			</tr>

			<!--  서브 메뉴: 본메뉴를 클릭할 경우 나타나는 하위 메뉴 -->
			<tr>
				<td><SPAN id=submenu${dept.deptNo}
					style="DISPLAY: none; MARGIN-LEFT: 0px; CURSOR: hand">
						<table id="dis"width="190" cellspacing="0" cellpadding="10">

							<c:forEach var="employee" items="${employees}">
								<c:if test="${dept.deptNo eq employee.deptNo}">
									<tr>
										<td bgcolor='white'></td>
										<td id ="dis" style="font-size: 10px;" bgcolor='#fff7da' class="text"
											onMouseOver="this.style.backgroundColor = '#ffffff'"
											onMouseOut="this.style.backgroundColor='white'"
											align="left"><img
											src='/groupware/resources/image/re.gif' />&nbsp;
											 <a href="javascript:link('${employee.id}');">${employee.position.positionName}&nbsp;&nbsp;${employee.name}</a> 
											<%-- <a href="javascript:gettimestring('${employee.id}');">${employee.position.positionName}&nbsp;&nbsp;${employee.name}</a> --%>
										</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
				</span></td>
		</c:forEach>



	</table>



	<div></div>

</body>
</html>