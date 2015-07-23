<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

	$(document).ready(function() {
		$('#get').click(function() {

			$.ajax({
				url : "infomation.action?employeeid=" + id,
				type : 'get',                                                                                          
				dataType : 'text',
				success : function(data) {
					$('#output').val(data);
				}
			});
		});
	});
</script>
	<div id="accordion">
		<div >
			<h3>전자결재 메인</h3>
			<div>
				<table>
					<tr>
						<td>전자결재 메인</td>
					</tr>
				</table>
			</div>
		</div>
		<div>
			<h3>결재문서 작성</h3>
			<div>
				<table>
					<tr>
						<td>결재문서 작성</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="group">
			<h3>결재할 문서함</h3>
			<div>
				<table>
					<tr>
						<td>미결재 문서</td>
					</tr>
					<tr>
						<td>결재완료 문서</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="group">
			<h3>개인 문서함</h3>
			<div >
				<table >
					<tr>
						<td >상신 문서</td>
					</tr>
					<tr>
						<td>임시 저장</td>
					</tr>
					<tr>
						<td>반려 문서</td>
					</tr>
					<tr>
						<td>결재 완료</td>
					</tr>
					<tr>
						<td>상신 취소</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="group">
			<h3>협조 문서함</h3>
			<div>
				<table>
					<tr>
						<td>미결재 문서</td>
					</tr>
					<tr>
						<td>결재완료 문서</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="group">
			<h3>부서 수신함</h3>
			<div>
				<table>
					<tr>
						<td>부서 수신함</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="group">
			<h3>참조 문서함</h3>
			<div>
				<table>
					<tr>
						<td>참조 문서함</td>
					</tr>
				</table>
			</div>
		</div>
	</div>