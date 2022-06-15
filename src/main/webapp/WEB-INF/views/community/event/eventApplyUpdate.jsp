<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
 <%@page import="community.model.dto.EventAppExt"%>
 <%@page import="community.model.dto.EventAppAtt"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	EventAppExt event = (EventAppExt) request.getAttribute("event");
%>

<section id="update-eventApply">
<form 
	name="boardUpdateFrm" 
	action="<%=request.getContextPath() %>/event/eventApplyUpdate" 
	method="post"
	enctype="multipart/form-data">
<input type="hidden" name="no" value="<%= event.getNo() %>" />
<table id="tbl-board-view">
	<tr>
		<th>이벤트 참가코드</th>
		<td><input type="text" name="eventapplyCode" value="<%=event.getEventapplyCode()%>" required></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>
			<input type="text" name="memberId" value="<%= event.getMemberId() %>" readonly/>
		</td>
	</tr>
	
	<tr>
		<th>첨부파일</th>
		<td >
	<%
		List<EventAppAtt> attachments = event.getAttachments();
		if(attachments != null && !attachments.isEmpty()){
			for(int i = 0; i < attachments.size(); i++){
				EventAppAtt attach = attachments.get(i);
	%>
			<img src="<%= request.getContextPath() %>/images/file.png" width="16px">
			<%= attach.getOriginalFilename()%>
			<input type="checkbox" name="delFile" id="delFile<%= i + 1 %>" value="<%= attach.getNo() %>"/>
			<label for="delFile<%= i + 1 %>">삭제</label>
			<br />
	<%
			}
		}
	%>
			<input type="file" name="upFile1" value="">
			<input type="file" name="upFile2" value="">
		</td>
	</tr>
	<tr>
		<th>내 용</th>
		<td>
			<textarea rows="5" cols="40" name="content"><%= event.getContent() %></textarea>
		</td>
	</tr>
	<tr>
		<th colspan="2">
			<input type="submit" value="수정하기"/>
			<input type="button" value="취소" onclick="history.go(-1);"/>
		</th>
	</tr>
</table>
</form>

</section>






<%@ include file="/WEB-INF/views/common/footer.jsp" %>