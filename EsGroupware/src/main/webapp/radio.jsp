<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title> 
<link rel="stylesheet"href="/groupware/resources/styles/jquery/jquery-ui.css">
<script src="/groupware/resources/styles/script/jquery.js"></script>
<script src="/groupware/resources/styles/script/jquery-ui.js"></script>
<link rel="stylesheet" href="/groupware/resources/styles/approval.css">
<script type="text/javascript">
$(function() {
		
$("#dialog-form2").dialog({
			resizable : false,
			autoOpen : false,
			buttons: {
			             "결재 하기": function() {
			                
			             },
			             "닫기": function() {
			                 $( this ).dialog( "close" );
			             }
			    	 },
			create : function(event, ui) {},
			open : function(event, ui) {},
			close : function() {},
			cancle : function() {}
		});

$('#approveCheck').click(function() { 
	$("#dialog-form2").dialog("open");
}); 
});
</script>
</head>
<body>

	<button id="approveCheck">결재</button>
	<div id="dialog-form2" title="직원 리스트">
		<input name="regState" type="radio" value="결재"> 결재
		<input name="regState" type="radio" value="전결"> 전결
		<input name="regState" type="radio" value="보류"> 보류
		<input name="regState" type="radio" value="기각"> 기각
	</div>

	<div></div>

</body>
</html>