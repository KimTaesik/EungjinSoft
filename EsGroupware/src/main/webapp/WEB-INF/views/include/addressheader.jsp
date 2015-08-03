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
  	
  	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  	
  	<!--  이 두 스타일을 넣주면, 뭔가 겹치는거 같은디.... 그래서 '주소추가'라는 글씨가 사라짐. 하지만, 옆은 말짱해짐 -->
<!--   <link rel='Stylesheet' href='/groupware/resources/styles/input.css' /> 
	<link rel="Stylesheet" href="/groupware/resources/styles/admin.css" />  
 -->
	 <link rel="Stylesheet" href="/groupware/resources/styles/addressframe.css" />  
	 
	 
  	<script>
	$(function() {	
	    $( "#accordion" ).accordion();	
		//*헤더에서 ,주소 리스트부분을 받아오는거. 
		//반복할라면, 여기에 한번 더써줘야한다.?
		$('.addressbook').click(function(event) {
			var classify = $(this).attr("id");
			
			$.ajax({
				url : "addresslist.action",
				method : 'get',
				data : {"classify" : classify },
				success: function(result, status, xhr) {
				
					$('.frame').html(result);	
					
					//주소 추가 이벤트
					$('.addform').click(function(event) {
						var classify = $(this).attr("id");
						//alert(classify);
						$.ajax({
							url : "addressbookadd.action?classify="+classify,
							method : 'get',
							data : {},
							success: function(result, status, xhr) {
								$(".frame").html(result);
								
								//%%%%%%%%%%  목록보여주는거 여기에 추가해야하나????
								$('#showlist').click(function(event) {
								alert(alalalalalal)
								location.reload(true);
			
								}) 		
										
										
							}
						});
						event.preventDefault();
					})
					
			//주소 수정 이벤트 (이거는 addressbooklist.jsp에서 수정(이미지)버튼 누르면, 수정창(addressbookedit.jsp)로 넘어가는 것.)
					$('.editaddress').click(function(event) {
				
						var classify = ${classify}
						var addressNo = $(this).attr("onchange");
						var url = "addressedit.action?classify="+ classify + "&addressNo="+ addressNo;
						$(location).attr("href",url)
						event.preventDefault();
						
					/* 	 $('#showlist').click(function(event) {
								alert(alalalalalal)
								location.reload(true);
			
						})  */
					})
					
			    }
		});
			event.preventDefault();
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
						
					location.reload(true);
							
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
		
		
		//////////////////////////////////////////////////////////////////////
			//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ (addressbookedit.jsp)수정창에서 '수정'버튼을 누르면, id = "updateaddress" 
					
			$('.updateaddress').click(function(event) {
			var classify = "${ classify }"
			var addressNo = $(this).attr("tag");
			alert(classify)
			var url = "addressedit.action?addressno=" + addressNo + "&classify" + classify ;
			$(location).attr("href",url)
			event.preventDefault();
			
			
		 	$('#showlist').click(function(event) {
					
			parent.location.reload(true);
		
			}) 
			
		})
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		$('.editaddress').click(function(event) {
			
			var classify = "${classify}"
			var addressNo = $(this).attr("tag");
			//alert(classify)
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
			var url = "addressedit.action?classify="+ classify + "&addressNo="+ addressNo;
			$(location).attr("href",url)
			event.preventDefault();
			
			 $('#showlist').click(function(event) {
					
					parent.location.reload(true);
		
			}) 
		})
		
		
		//////////////////////////////////////////////////////////////////////
		//(addressbookedit.jsp)수정창에서 '수정'버튼을 누르면, id = "updateaddress" 
		
		$('.updateaddress').click(function(event) {
			var classify = "${ classify }"
			var addressNo = $(this).attr("onchange");
			alert(classify)
			var url = "addressedit.action?addressno=" + addressNO + "&classify" + classify ;
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
<div class="left_menu"  style="background-color: #D5D5D5">
	<div id="accordion" style="font-size: 9pt; width: 136px;">
	<h3>주소록</h3>
	<ul>
        <li><a href="#" id="1" class="addressbook">개인 주소록</a></li>
        <br />
        <li><a href="#" id="2" class="addressbook">공용 주소록</a></li>
        <br />
 <!--   <li><a href="#" id="3" class="getidcard">명함철</a></li> -->
    </ul>
	
	</div>
</div>
<div class="frame" id="${classify}">

		<c:import url="/WEB-INF/views/addressbook/addressbooklist.jsp" />
</div>


</body>