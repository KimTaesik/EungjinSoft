<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<!DOCTYPE>
<html>
<head>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  	<link rel="Stylesheet" href="/groupware/resources/styles/addressframe.css" />
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>


  	<link rel="Stylesheet" href="/groupware/resources/styles/admin.css" />
  	
  	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  	  
	 
  	<script type="text/javascript">

	$(function() {	

	    $( "#accordion" ).accordion();	
		//*헤더에서 ,주소 리스트부분을 받아오는거. 
		//반복할라면, 여기에 한번 더써줘야한다.?
		
		$('.addressbookx').click(function(event) {
			var classify = $(this).attr("id");
			
			$.ajax({
				url : "addresslist.action",
				method : 'get',
				data : {"classify" : classify },
				success: function(result, status, xhr) {
				
					$('.frame').html(result);	
					
					//주소 추가 이벤트
					/* $('.addform').click(function(event) {
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
					}) */
					
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
				
				}) 
			}
		});
		event.preventDefault();
	})
	
	
		//////////////////////////////////////////////////////////////////////
		//$$$$$ (addressbookedit.jsp)수정창에서 '수정'버튼을 누르면, id = "updateaddress" 

/*			
 	$('.updateaddress').click(function(event) {
		var classify = ${ classify }
		var addressNo = ${ addressNo }
		//alert(classify);
		var url = "addressedit.action?addressno=" + addressNo + "&classify" + classify ;
		$(location).attr("href",url)
		
		
		
	 	$('#showlist').click(function(event) {
				
		parent.location.reload(true);
	
		}) 
		event.preventDefault();
	}) 
	
*/





	/////////////////////////////////////////////////////////////////
	
	
	 $('.editaddress').click(function(event) {
		
		var classify = ${ classify }
		var addressNo = $(this).attr("id");
		//alert(addressNo);
		
		$.ajax({
			url : "addressedit.action",
			method : 'get',
			data : {"classify": classify, "addressNo" : addressNo},
			success: function(result, status, xhr) {
				
				$(".frame").html(result);
				
				$('#showlist').click(function(event) {
					
				location.reload(true);
				
				})
				
				$('.updateaddress').click(function(event) {
					var classify = ${ classify }
					
					$.ajax({
						url : "addressedit.action",
						method : 'post',
						data : {"classify": classify, "addressNo" : addressNo},
						success: function(result, status, xhr) {
							
							location.reload(true);
						}
						
						});
				})
			}
		});
		event.preventDefault();
		
		
		
	}) 
	 
	
	
	
	
	
	//////////////////////////////////////////////////////////////////////
	//(addressbookedit.jsp)수정창에서 '수정'버튼을 누르면, id = "updateaddress" 
	//위에 이문장 똑같은 거 있음.
 		
	
	/*
	
	$('#updateaddress').click(function(event) {
		var classify = ${ classify }
		var addressNo = $(this).attr("onchange");
		alert(classify)
		var url = "addressedit.action?addressno=" + addressNO + "&classify" + classify ;
		$(location).attr("href",url)
		event.preventDefault();
		
		
	 	$('#showlist').click(function(event) {
				
		parent.location.reload(true);
	
		}) 
		
	})		 
	
	
	
	*/
	
	
	//********* 엑셀로 내보내기.
	
		$("#logexcel").click(function(event) {
			var classify = ${ classify }
			
			//alert(classify);
			$(location).attr("href","/groupware/address/addressexcel.action?classify="+classify); 
			event.preventDefault();//원래 요쇼의 이벤트에 대한 기본 동작 수행 막는 코드
	})
	


   //********* type별로 검색하기.
	$("#searchaddress").click(function(event) {
		var type = $('#type')
		var search = $('#search')
		if(type.val()!='1' && search.val().length==0){
			alert("검색어를 입력하세요");
			search.focus();
			return ;
		}
		var url = "addresslist.action?type="+type.val()+"&search="+search.val()+'&classify=${classify}';
		$(location).attr("href",url)
		event.preventDefault();
	})  

	
		
})
	</script>
</head>
<body>
<nav>
<div id="accordion" style="font-size: 10pt">
	<h3>주소록</h3>
	<ul>
        <li><a href="addresslist.action?classify=1" id="1" class="addressbook">개인 주소록</a></li>
        <br />
        <li><a href="addresslist.action?classify=2" id="2" class="addressbook">공용 주소록</a></li>
        <br />
 <!--   <li><a href="#" id="3" class="getidcard">명함철</a></li> -->
    </ul>
	
</div>
</nav>
<div class="frame" id="${classify}">

		<c:import url="/WEB-INF/views/addressbook/addressbooklist.jsp" />
</div>

</body>