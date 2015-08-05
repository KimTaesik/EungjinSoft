<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<!DOCTYPE>
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	

	 <link rel="Stylesheet" href="/groupware/resources/styles/addressframe.css" />  
	 
	 
  	<script>
	$(function() {	
	    $( "#accordion" ).accordion();	
	/* 	
	    $("#shareaddressbook").click(function() {
			$("#frame").load("addressbooklist.action"); */

		

		$('.addressbook').click(function(event) {
			var classify = $(this).attr("id");
			
			$.ajax({
				url : "addresslist.action",
				method : 'get',
				data : {"classify" : classify},
				/* dataType : 'json', */
				success: function(result, status, xhr) {
				
					$('.frame').html(result);	
					
					$('.addform').click(function(event) {
						var classify = $(this).attr("id");
						alert(classify);
						$.ajax({
							url : "addressbookadd.action?classify="+classify,
							method : 'get',
							data : {},
							success: function(result, status, xhr) {
								//alert(result);
								$(".frame").html(result);
							}
						});
						event.preventDefault();
					})
/* 					var index=result.length;
					
				alert(index);
				//("#menubar tbody")
				$.each(result,function(index,item){
					var html = "<tr><td>"+ item.name + "</td></tr>";
							   "<tr><td>"+ item.email + "</td></tr>";
							   "<tr><td>"+ item.phonenumber + "</td></tr>";
							   "<tr><td>"+ item.homenumber + "</td></tr>";
							   "<tr><td>"+ item.fax + "</td></tr>";
					
					$(".address tbody").append($(html));
				});
				 */
			
				/* eval("var r=" + result);
				for(var i=0;i<=r.length;i++){
				 $("#name").text(result[i].name);
				 $("#email").text(r[i].email);
				 $("#phonenumber").text(r[i].phonenumber);
				 $("#homenumber").text(r[i].homenumber);
				 $("#fax").text(r[i].fax);
				} */
				}
			});
			event.preventDefault();
		})
		

		$('.addform').click(function(event) {
			var classify = $(this).attr("id");
			
			//window.open("addressbookadd.action?classify="+classify);
			//return ;
			$.ajax({
				url : "addressbookadd.action?classify="+classify,
				method : 'get',
				data : {},
				success: function(result, status, xhr) {
					
					$(".frame").html(result);
									
					$('#showlist').click(function(event) {
						
						$.ajax({
							url : "addresslist.action?classify="+classify,
							method : 'get',
							data : {},
							success: function(result, status, xhr) {
								
							
								$(".frame").html(result);
							},
							error : function(xhr, status, er) {
								alert(status + " / " + er)
							}
						})
					})
				}
			});
			event.preventDefault();
		})
		
	})
	</script>
</head>
<body>
<div class="left_menu" style="background-color: #88cbff">
	<div id="accordion" style="font-size: 10pt;width: 100pt;">
	<h3>주소록</h3>
	<ul>
        <li><a href="#" id="1" class="addressbook">개인 주소록</a></li>
        <br />
        <li><a href="#" id="2" class="addressbook">공용 주소록</a></li>
        <br />
        <li><a href="#" id="3" class="getidcard">명함철</a></li>
    </ul>
	
	</div>
</div>
<div class="frame" id="${classify}">

		<c:import url="/WEB-INF/views/addressbook/addressbooklist.jsp" />
</div>

</body>