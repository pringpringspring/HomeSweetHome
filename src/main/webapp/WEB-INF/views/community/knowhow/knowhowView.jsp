<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="community.model.dto.Attachment"%>
<%@ page import="member.model.dto.Member"%>
<%@page import="community.model.dto.KnowhowExt"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
#board-container{margin-top:5rem;}
h1{font-size:21px;}
h3{font-size:17px;}
.title-view{margin-left:23rem;}
.content-view{margin-left:22.5rem;}
</style>
<%
	KnowhowExt knowhow = (KnowhowExt) request.getAttribute("knowhow");

	boolean canEdit = loginMember != null 
			&& (loginMember.getMemberId().equals(knowhow.getMemberId()) 
					|| loginMember.getMemberRole() == MemberRole.A);		
%>
<section id="board-container">
	<table id="tbl-board-view">
	
	<div class="title-view">
<h1><%= knowhow.getTitle() %></h1>
<h3><%= knowhow.getNickName() %></h3>
<h3><%=knowhow.getRegDate() %></h3>
</div>

<div class="content-view">
<%=knowhow.getContent() %><br>
		<% 
			List<Attachment> attachments = knowhow.getAttachments();
			if(attachments != null && !attachments.isEmpty()){
				for(Attachment attach : attachments){					
		%>
<img src="<%=request.getContextPath() %>/upload/knowhow/<%=attach.getRenamedFilename() %>" width=450px>
				<%-- 첨부파일이 있을경우만, 이미지와 함께 original파일명 표시 --%>
<h5>첨부파일
				<img alt="첨부파일" src="<%=request.getContextPath() %>/images/file.png" width=13px>
				<a href="<%= request.getContextPath() %>/board/fileDownload?no=<%= attach.getNo() %>"><%= attach.getOriginalFilename() %></a>
</h5>
		<%
				}
				
			}
		%>
<div class="view-end">
<br>
 No.<%= knowhow.getNo() %>&nbsp;&nbsp;
조회 <c><%= knowhow.getReadCount() %></c>
좋아요 <c><%= knowhow.getLikeCount() %></c>
</div>
</div>
		<% if(canEdit){ %>

			<%-- 작성자와 관리자만 마지막행 수정/삭제버튼이 보일수 있게 할 것 --%>
				<input type="button"  class="btn-upd" value="수정하기" onclick="updateBoard()">
				<input type="button" class= "btn-del" value="삭제하기" onclick="deleteBoard()">
		<% } %>
	</table>
</section>
<% if(canEdit){ %>
<form action="<%= request.getContextPath() %>/knowhow/knowhowDelete" name="boardDeleteFrm" method="POST">
	<input type="hidden" name="no" value="<%= knowhow.getNo() %>" />
</form>
<script>
const deleteBoard = () => {
	if(confirm("정말 이 게시글을 삭제하시겠습니까?"))
		document.boardDeleteFrm.submit();
};	

const updateBoard = () => {
	location.href = "<%= request.getContextPath() %>/knowhow/knowhowUpdate?no=<%= knowhow.getNo() %>";
}
</script>
<% } %>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>