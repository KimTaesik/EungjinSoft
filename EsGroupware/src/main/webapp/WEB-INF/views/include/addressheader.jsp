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
		
		$('.addressbook').click(function(event) {
			var classify = $(this).attr("id");
			
			$.ajax({
				url : "addresslist.action",
				method : 'get',
				data : {"classify" : classify},
				success: function(result, status, xhr) {
				
					$('.frame').html(result);	
					
					$('.addform').click(function(event) {
						var classify = $(this).attr("id");
						//alert(classify);
						$.ajax({
							url : "addressbookadd.action?classify="+classify,
							method : 'get',
							data : {},
							success: function(result, status, xhr) {
								$(".frame").html(result);
							}
						});
						event.preventDefault();
					})
				}
			});
			event.preventDefault();

		/* 	 한 번 수행뒤, 다시 '주소추가'누르면, 실행안되서 이걸 또 넣어봣는데 안됨...
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
			}) */
			
		})
		
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		$('.addform').click(function(event) {
			var classify = $(this).attr("id");
		
			$.ajax({
				url : "addressbookadd.action?classify="+classify,
				method : 'get',
				data : {},
				success: function(result, status, xhr) {
					
					$(".frame").html(result);
						
				
					
					
					 $('#showlist').click(function(event) {
						
							parent.location.reload(true);
							
					/* 	$.ajax({
							url : "addresslist.action?classify="+classify,
							method : 'get',
							data : {},
							success: function(result, status, xhr) {
								$(".frame").html(result);
							
								
							},
							error : function(xhr, status, er) {
								alert(status + " / " + er)
							}
						}) */
					}) 
				}
			});
			event.preventDefault();
		})
		
		
		$('.editaddress').click(function(event) {
			
			var classify = "${classify}"
			var addressNo = $(this).attr("tag");
			alert(classify)
			/* $.ajax({
				url : "addressedit.action",
				method : 'get',
				data : {
					addressNo:addressNo,
					classify : classify
				},
				success: function(result, status, xhr) {
					
					$(".frame").html(result);
					
				}
			}); */
			var url = "addressedit.action?classify="+ classify + "&addressNo"+ addressNo;
			$(location).attr("href",url)
			event.preventDefault();
			
			 $('#showlist').click(function(event) {
					
					parent.location.reload(true);
		
			}) 
		})
		
	})
	</script>
</head>
<body>
<div class="left_menu" style="background-color: #D5D5D5">
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