<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="java.util.List"%>
<%@ page import="member.model.dto.Member"%>
<%@page import="community.model.dto.EventAppExt"%>
<%@page import="community.model.dto.EventAppAtt"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	EventAppExt event = (EventAppExt) request.getAttribute("event");

	boolean canEdit = loginMember != null 
			&& (loginMember.getMemberId().equals(event.getMemberId()) 
					|| loginMember.getMemberRole() == MemberRole.A);	
%>
<style>
.img_logo{margin-left:26rem;}
.title-view{font-weight: bold;}
#board-container{margin-left:35rem; margin-top:5rem;}
.title-view{margin-left:7.5rem; font-size:17px;}
</style>

<section id="board-container">
<table id="tbl-board-view">
<div class="title-view">
<%=event.getContent() %><br>
</div>
<%=event.getNickName() %>

<div class="content">
<% 
			List<EventAppAtt> attachments = event.getAttachments();
			if(attachments != null && !attachments.isEmpty()){
				for(EventAppAtt attach : attachments){
%>
	<img src="<%=request.getContextPath() %>/upload/event/<%=attach.getRenamedFilename() %>" width=500px><br>
<%} %>
<% } %>		
</div>

</section>


<% if(canEdit){ %>
	<input type="button" value="수정하기" onclick="updateBoard()">
	<input type="button" value="삭제하기" onclick="deleteBoard()">

<form action="<%= request.getContextPath() %>/event/eventApplyDelete" name="boardDeleteFrm" method="POST">
	<input type="hidden" name="no" value="<%= event.getNo() %>" />
</form>
<script>
const deleteBoard = () => {
	if(confirm("정말 이 게시글을 삭제하시겠습니까?"))
		document.boardDeleteFrm.submit();
};	
const updateBoard = () => {
	location.href = "<%= request.getContextPath() %>/event/eventApplyUpdate?no=<%= event.getNo() %>";
}

</script>


<%} %>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
