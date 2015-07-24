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
	});
</script>


<body>
	
	<div  id="frame" style="width: 83%; height: 630px; float: right; margin-left: 10px; border: 1px solid;">
		<!--  검색 버튼 영역 -->
		
				
		<div id="title" style="border: 1px solid;">
			<h2>
				<span>결재문서 작성</span>
			
				</h2>
				
		</div>
		<div style="clear: both;"></div>
				<h2>
				<div style="float:left;width:50%; height: 20%;" >결재문서양식</div>
				<div style="float:left;width:50%;  height: 20%;">결재양식정보</div>
				</h2>
		<div id="accordion2" style="clear:both; float:left; width: 50%;"  >
					
			<div >
				
				<h3 >기안서</h3>
				<div>
					<table>
						<tr>
							<td>기안서</td>
						</tr>
					</table>
				</div>
			</div>
			<div>
				<h3>품의서</h3>
				<div>
					<table>
						<tr>
							<td>품의서</td>
						</tr>
					</table>
				</div>
			</div>
			<div>
				<h3>지출 결의서</h3>
				<div>
					<table>
						<tr>
							<td>지출 결의서</td>
						</tr>
					</table>
				</div>
			</div>
			<div>
				<h3>휴가계</h3>
				<div>
					<table>
						<tr>
							<td>휴가계</td>
						</tr>
					</table>
				</div>
			</div>
			<div>
				<h3>회의록</h3>
				<div>
					<table>
						<tr>
							<td>회의록</td>
						</tr>
					</table>
				</div>
			</div>
			<div>
				<h3>발주서</h3>
				<div>
					<table>
						<tr>
							<td>발주서</td>
						</tr>
					</table>
				</div>
			</div>
			<div>
				<h3>출장계</h3>
				<div>
					<table>
						<tr>
							<td>출장계</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div style="float:right; width: 50%">
			
			<table id="form1"  border="1px solid" cellspacing="1" cellpadding="2" class="table_layout" style='width:100%; height:150px; border-top:1px solid #D5D5D5; border-bottom: 1px solid #D5D5D5'>
				<col width="30%"></col>
				<col width="70%" ></col>
				<tbody>
				<tr >
					<th >
						<div >
							<nobr>
								카테고리
							</nobr>
						</div>
					</th>
					<td > 
						<div>
							<nobr>
								<span class="left">기안서 </span>
							</nobr>
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div>
							<nobr>
								문서명
							</nobr>
						</div>				
					</th>
					<td class="bdr_none">
						<div>
							<nobr>
								기안서
							</nobr>
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div>
							<nobr>
								등록일
							</nobr>
						</div>								
					</th>
					<td class="bdr_none">
						<div>
							<nobr>
								2008.04.01
							</nobr>
						</div>								
					</td>
				</tr>
				<tr>
					<th>
						<div>
							<nobr>
								문서설명
							</nobr>
						</div>									
					</th>
					<td class="bdr_none">
						<div>
							<nobr>					
								기안서 일반 양식입니다.
							</nobr>
						</div>
					</td>
				</tr>
				</tbody>
			
			</div>
			
	</div>

</body>

