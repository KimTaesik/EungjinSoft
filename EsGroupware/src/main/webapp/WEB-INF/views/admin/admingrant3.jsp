<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@page import="java.util.logging.SimpleFormatter"%>
<%@page import="java.util.Date"%>
<%@page import="com.groupware.dto.Position"%>
<%@page import="com.groupware.dto.Dept"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


			<table width="100%"  border="0" cellspacing="0" cellpadding="0" class="table4">
			
			<col width="10%" class="overf"></col>
			<col width="15%" class="overf"></col>
			<col width="15%" class="overf"></col>
			<col width="15%" class="overf"></col>
			<col width="30%" class="overf"></col>
			<col width="15%" class="overf"></col>
			
			<tr id="approvalListTable">
	            <c:forEach var="approvals2" items="${ approvalAdmins2 }" varStatus="status">
	            <tr id="tr${ approvals2.id }">
	             	<td class='txt_ce'>
						<div>
							<nobr>
								${ status.index }
							</nobr>
						</div>
					</td>
					<td class='txt_ce'>
						<div>
							<nobr>
								${ approvals2.id }
							</nobr>
						</div>
					</td>
					<td class='txt_ce'>
						<div>
							<nobr>
								<c:forEach var="position" items="${ positions }">
									<c:if test="${ approvals2.positionNo ==  position.positionNo }">
										${ position.positionName }										
									</c:if>
		                		</c:forEach>
							</nobr>
						</div>
					</td>
					<td class='txt_ce'>
						<div>
							<nobr>
								${ approvals2.name }
							</nobr>
						</div>
					</td>
					<td class='txt_ce'>
						<div>
							<nobr>
								${ approvals2.name }
							</nobr>
						</div>
					</td>
					<td class='txt_ce'>
						<div>
							<nobr>
									<!-- <a href='#blank-link' onclick="javascript:"><img src='http://static.whoisdesk.net/Src/Img/Renewal/icon_modify.gif' class='vm' title=' 수정' /></a>&nbsp;&nbsp; -->
									<a href='${ approvals2.id }' class="deleteApprovalAdmin"><img src='http://static.whoisdesk.net/Src/Img/Renewal/icon_x.gif' title='삭제' /></a>
							</nobr>
						</div>
					</td>
				</tr>
	            </c:forEach>
		    </tr>
		    </table>
			