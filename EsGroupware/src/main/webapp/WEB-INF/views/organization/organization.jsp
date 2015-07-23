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
<link rel="stylesheet" href="/groupware/resources/styles/organizaion.css">
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
    	var id = $(this).attr('id');
        $.ajax({
            url:"infomation.action?employeeid="+id,
            method: 'get',
            data:{},
            dataType: 'text',
            success: function (result,status,xhr) {
            	
            	eval("var r="+result);
            	
             $('#infoid').text(r.id);
             $('#infoname').text(r.name);
             $('#infosex').text(r.sex);
             $('#infobirth').text(r.birthdate);
             $('#infophone').text(r.phoneNumber);
             $('#infoemail').text(r.email);
             $('#infoaddress').text(r.address);
             $('#infopartName').text(r.dept.partName);
             $('#infopositionName').text(r.position.positionName);
             $('#infodirectLine').text(r.directLine);
             $('#infojoinDate').text(r.joinDate);
             
            },
            error : function(xhr,status,ex) {
				$('#result').text(status +"/" + ex );
		}
          
        });
        event.preventDefault();
    });
    
});

</script>

</head>
<body>
<nav>
<div >
	<div id="accordion" >
		<c:forEach var="dept" items="${depts}">
			<div class="group">
				<h3>${dept.partName}</h3>
				<div>
					<c:forEach var="employee" items="${employees}">
						<c:if test="${dept.deptNo eq employee.deptNo}">
							<div ><a id="${ employee.id }" class="get" href="#">
									<img src='/groupware/resources/image/re.gif' />&nbsp; 
									${employee.position.positionName}&nbsp;&nbsp;${employee.name}</a></div><br />
						
						</c:if>
					</c:forEach>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
</nav>
<div id="getid" style="float: right ; border: 1px solid; width: 84%">
<c:import url="/WEB-INF/views/organization/personalinfo.jsp" />
			
</div>
</body>
</html>