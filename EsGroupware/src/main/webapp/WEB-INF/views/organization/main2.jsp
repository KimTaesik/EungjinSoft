<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet"
	href="/groupware/resources/styles/jquery/jquery-ui.css">
<script src="/groupware/resources/styles/script/jquery.js"></script>
<script src="/groupware/resources/styles/script/jquery-ui.js"></script>
<link rel="stylesheet" href="/groupware/resources/styles/style.css">
<style>
/* IE has layout issues when sorting (see #5413) */
.group {
	zoom: 1
}
</style>

<script>
	$(function() {
		$("#accordion").accordion({
			header : "> div > h3"
		}).sortable({
			axis : "y",
			handle : "h3",
			stop : function(event, ui) {

				ui.item.children("h3").triggerHandler("focusout");
				$(this).accordion("refresh");
			}
		});
	});
	

$(document).ready(function () {
    $('#get').click(function () {
        $.ajax({
            url: 'infomation.html?employeeid="+id',
            type: 'get',
            dataType: 'text',
            success: function (data) {
                $('#output').val(data);
            }
        });
    });
});
</script>

</head>
<body>
<div style="float: left; border: 1px solid;">
	<div id="accordion">
		<c:forEach var="dept" items="${depts}">
			<div class="group">
				<h3>${dept.partName}</h3>
				<div>
					<c:forEach var="employee" items="${employees}">
						<c:if test="${dept.deptNo eq employee.deptNo}">
							<div id="get">
									<img src='/groupware/resources/image/re.gif' />&nbsp; 
									${employee.position.positionName}&nbsp;&nbsp;${employee.name}</div><br />
							
						</c:if>
					</c:forEach>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<div style="float:left">
	<div style="float: left; margin-left: 20px ;margin-top: 20px">
	전자결재 메인
	</div>
	<div style="clear:both;">
		<hr>
	</div>
	<div style="clear:both; float: left; margin-left: 20px; margin-top: 30px">
	결재할 문서함
		<table>
			<tr>
				<td>미결재</td><td>3건</td>
			</tr>
			<tr>
				<td>결재</td><td>5건</td>
			</tr>
		</table>
	</div>
	
	<div style="float: left; margin-left: 20px; margin-top: 30px">
	개인문서함                                                                                                                
		<table>
			<tr>
				<td>상신문서</td><td>11건</td> <td>반려문서</td><td>3건</td> 
			</tr>
			<tr>
				<td>임시저장</td><td>5건</td><td>결재완료</td><td>3건</td>
			</tr>
			<tr>
			<td>상신취소</td><td>3건</td>
			</tr>
		</table>
	</div>
	<div style="float: left;margin-left: 20px; margin-top: 30px">
	개인문서함                                                                                                                
		<table>
			<tr>
				<td>상신문서</td><td>11건</td> <td>반려문서</td><td>3건</td> 
			</tr>
			<tr>
				<td>임시저장</td><td>5건</td><td>결재완료</td><td>3건</td>
			</tr>
			<tr>
			<td>상신취소</td><td>3건</td>
			</tr>
		</table>
	</div>
	<div style="float: left; margin-left: 20px; margin-top: 30px">
	개인문서함                                                                                                                
		<table>
			<tr>
				<td>상신문서</td><td>11건</td> <td>반려문서</td><td>3건</td> 
			</tr>
			<tr>
				<td>임시저장</td><td>5건</td><td>결재완료</td><td>3건</td>
			</tr>
			<tr>
			<td>상신취소</td><td>3건</td>
			</tr>
		</table>
	</div>
	<div style="clear:both;"></div>
	<div style="clear:both; margin-top:20px">
		<hr>
	</div>
	<div style="clear:both; margin-left:20px; margin-top: 20px">
		결재할 문서함 > 미결재 문서
	</div>
</div>
</body>
</html>