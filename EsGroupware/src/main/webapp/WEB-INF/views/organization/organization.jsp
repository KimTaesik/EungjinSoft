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
<link rel="stylesheet" href="/groupware/resources/styles/approval.css">
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
    $('.get').click(function (event) {
    	var id = $('#id').val();
        $.ajax({
            url:"infomation.action?employeeid="+id,
            type: 'get',
            dataType: 'text',
            success: function (data) {
            	alert('성공');
             $('#di').val(data)
            
            },
          
        });
        event.preventDefault();
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
							<div ><a class="get" href="#">
									<img src='/groupware/resources/image/re.gif' />&nbsp; 
									${employee.position.positionName}&nbsp;&nbsp;${employee.name}</a></div><br />
						<input id="id" type="hidden" width="10px" value="${ employee.id }">
						</c:if>
					</c:forEach>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<div id="getid" style="float: right ; border: 1px solid;">
<% pageContext.include("/WEB-INF/views/organization/personalinfo.jsp"); %>
</div>
</body>
</html>