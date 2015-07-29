<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<link rel="stylesheet"
	href="/groupware/resources/styles/jquery/jquery-ui.css">
<script src="/groupware/resources/styles/script/jquery.js"></script>
<script src="/groupware/resources/styles/script/jquery-ui.js"></script>
<link rel="stylesheet" href="/groupware/resources/styles/approval.css">

<script type="text/javascript">
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
	$(function() {
		$("#accordion2").accordion({
			header : "> div > h3"
		}).sortable({
			axis : "y",
			handle : "h3",
			stop : function(event, ui) {

				ui.item.children("h3").triggerHandler("focusout");
				$(this).accordion("refresh");
			}
		});
		$(".form").click(function() {
				
				var form_No=$(this).attr('id');
				var form_Name=$(".formName").attr('value');
			$.ajax({
				url : "approvalwrite.action?form_No="+form_No,
				method : 'post',
				data : {},
				dataType : 'text',
				success : function(result, status, xhr) {

					eval("var r=" + result);

					$('#formname').text(r.form_Name);
					$('#fixeddate').text(r.fixedDate);
					$('#formexplain').text(r.form_Explain);
					$('button').click(function(){
						$("#frame").load("approvalform.action",{form_No:form_No,form_Name:form_Name});
						
					});
				},
				error : function(xhr, status, ex) {
					$('#result').text(status + "/" + ex);
				}

			});
			event.preventDefault();
		});
	});
</script>


<body>

	<div id="frame"
		style="width: 90%; height: 630px; float: right; margin-left: 10px; border: 1px solid;">
		<!--  검색 버튼 영역 -->


		<div id="title"
			style="border-bottom: 1px solid #D5D5D5; text-align: center">
			<h2>
				<span>결재문서 작성</span>

			</h2>

		</div>
		<div style="clear: both;"></div>
		<h2>
			<div style="float: left; width: 50%; height: 20%;">결재문서양식</div>
			<div style="float: left; width: 50%; height: 20%;">결재양식정보</div>
		</h2>
		<div id="accordion2" style="clear: both; float: left; width: 50%;">
			<c:forEach var="approvalform" items="${approvalforms}">
				<div class="group">
					<h3>${approvalform.form_Name}</h3>
					<div>
						<div>
							<a id="${approvalform.form_No}" class="form" href="#"> 
							<img src='/groupware/resources/image/re.gif' />
							<input type="hidden" value="${approvalform.form_Name}" class="formName" >
							&nbsp;
								${approvalform.form_No}&nbsp;&nbsp;&nbsp;${approvalform.form_Name}
							</a>
						</div>
						<br />
					</div>
				</div>
			</c:forEach>
			
		</div>
		<div style="float: right; width: 50%">

			<table id="form1" border="1px solid" cellspacing="1" cellpadding="2"
				class="table_layout"
				style='width: 100%; height: 150px; border-top: 1px solid #D5D5D5; border-bottom: 1px solid #D5D5D5'>
				<col width="30%"></col>
				<col width="70%"></col>
				<tbody>

					<tr>
						<th>
							<div>
								<nobr> 문서명 </nobr>
							</div>
						</th>
						<td class="bdr_none">
							<div id="formname">
								<nobr> </nobr>
							</div>
						</td>
					</tr>
					<tr>
						<th>
							<div>
								<nobr> 등록일 </nobr>
							</div>
						</th>
						<td class="bdr_none">
							<div id="fixeddate">
								<nobr> </nobr>
							</div>
						</td>
					</tr>
					<tr>
						<th>
							<div>
								<nobr> 문서설명 </nobr>
							</div>
						</th>
						<td class="bdr_none">
							<div id="formexplain">
								<nobr> </nobr>
							</div>
						</td>
					</tr>
				</tbody>
			</table>

		</div>
		<div
			style="width: 100%; margin-top: 530px; border-top: 1px solid #D5D5D5;">
			<button id="approvalwrite"
				style="margin-left: 730px; margin-top: 10px; height: 30px; width: 100px">결재문서
				작성</button>
		</div>
	</div>

</body>

