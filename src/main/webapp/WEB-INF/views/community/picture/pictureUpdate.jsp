<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="community.model.dto.PictureAttachment"%>
<%@page import="community.model.dto.PictureExt"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
 <%
 PictureExt picture = (PictureExt) request.getAttribute("picture");
%>

<section id="board-up-container">
<form 
	name="boardUpdateFrm" 
	action="<%=request.getContextPath() %>/picture/pictureUpdate" 
	method="post"
	enctype="multipart/form-data">
	<input type="hidden" name="no" value="<%= picture.getImgNo() %>" />
	<table id="tbl-board-view">
	<tr>
		<th>제 목</th>
		<td><input type="text" name="title" value="<%= picture.getTitle() %>" required></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>
			<input type="hidden" name="memberId" value="<%= picture.getMemberId() %>" readonly/>
			<input type="text" name="nickName" value="<%= picture.getNickName() %>" readonly/>
		</td>
	</tr>
	
	<tr>
		<th>첨부파일</th>
		<td >
	<%
		List<PictureAttachment> attachments = picture.getAttachments();
		if(attachments != null && !attachments.isEmpty()){
			for(int i = 0; i < attachments.size(); i++){
				PictureAttachment attach = attachments.get(i);
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
			<input type="file" name="upFile3" value="">
		</td>
	</tr>
	<tr>
		<th>내 용</th>
		<td>
			<textarea rows="5" cols="40" name="content"><%= picture.getContent() %></textarea>
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