<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ page import="member.model.dto.Member"%>
<%@page import="community.model.dto.EventExt"%>
<%@page import="community.model.dto.EventAttachment"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
body{
font-family: 'Noto Sans KR', sans-serif;
}
#board-container{
margin-left : 24.2rem;
margin-top : 4.2rem;
}
.content{
margin-left: 14rem;
}

input#btn-part{
	background-color:#AB77FF;
	height:4.7rem;
	width: 25.2rem;
	border:0;
	outline: none; 
	text-align :center;
	font-size: 21px;
	color:white;
	font-weight: bold;
	border-radius: 8px;
}
.contest-participate{
margin-left : 9.2rem;
}
</style>

<%
EventExt event = (EventExt) request.getAttribute("event");
boolean canEdit = ( (loginMember != null) 
&& loginMember.getMemberRole() == MemberRole.A);	
%>

<section id="board-container">
		<% 
			List<EventAttachment> attach = event.getAttachments();
			if(attach != null && !attach.isEmpty()){
				for(EventAttachment att : attach){
		%>
<img src="<%=request.getContextPath()%>/upload/event/<%=att.getOriginal_filename()%>">
<div class="content">

</div>
<div class="contest-participate">
	<input type="button" value="챌린지 참여하기" id="btn-part" name="btn-part"
		onclick="location.href='<%=request.getContextPath()%>/event/eventEnroll';" />
</div>
		<%
				}
			}
		%>
				<% if(canEdit){ %>

			<%-- 관리자만 마지막행 수정/삭제버튼이 보일수 있게 할 것 --%>
				<input type="button"  class="btn-upd" value="수정하기" onclick="updateBoard()">
				<input type="button" class= "btn-del" value="삭제하기" onclick="deleteBoard()">
		<% } %>
</section>


     <a style="display:scroll;position:fixed;bottom:92px; right:45px;" rel="nofollow"
     href="#" >
     <img src="<%=request.getContextPath()%>/images/top_button.png" width=20px></a>

     <a style="display:scroll;position:fixed;bottom:55px; right:45px;" rel="nofollow"
     href="#scrollbottom" ><img src="<%=request.getContextPath()%>/images/bot_button.png" width=20px></a>
     <div id="scrollbottom"></div>
     <div id="scrollbottom"></div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>