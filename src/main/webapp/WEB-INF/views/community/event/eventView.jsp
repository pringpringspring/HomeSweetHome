<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ page import="member.model.dto.Member"%>
<%@page import="community.model.dto.EventExt"%>
<%@page import="community.model.dto.EventAttachment"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
body{font-family: 'Noto Sans KR', sans-serif;}
#board-container{margin-bottom: 1rem;}
.top{margin-top :3rem;margin-left: 41rem;}
.content{margin-left:29.2rem;}
input#btn-partgo{background-color:#35C5F0;height:4.7rem;width: 25.2rem;border:0;
outline: none; text-align :center;font-size: 21px;color:white;font-weight: bold;border-radius: 8px;}
input#btn-part{background-color:#AB77FF;height:4.7rem;width: 25.2rem;border:0;outline: none; text-align :center;
font-size: 21px;color:white;font-weight: bold;border-radius: 8px;}
.contest-participate{margin-left : 38.2rem;}
.contest-participatego{margin-left : 38.2rem;}
#btn-part:hover,#btn-partgo:hover{cursor: pointer;}
.btn-updel{float:right; margin-right: 27.5rem; margin-top: 1rem;}
.btn-upd{border: 1px solid #35c5f0;border-radius: 0.25rem;cursor: pointer;color: #35c5f0;font-size: 1rem;
font-weight:bold; background: white;width: 5.8rem; height: 2.7rem; margin-right:0.52rem;}
.btn-del{border: 1px solid #35c5f0;border-radius: 0.25rem;cursor: pointer;color: #35c5f0;font-size: 1rem;
font-weight:bold; background: white;width: 5.8rem; height: 2.7rem;}
</style>

<%
EventExt event = (EventExt) request.getAttribute("event");
 boolean canEdit = ( (loginMember != null) 
&& loginMember.getMemberRole() == MemberRole.A);
%>

<section id="board-container">
<div class="top">
<h2><%=event.getEventTitle() %></h2>
<h4><%=event.getEventContent() %></h4>
</div>
		<% 
			List<EventAttachment> attach = event.getAttachments();
			if(attach != null && !attach.isEmpty()){
				for(EventAttachment att : attach){
		%>
<div class="content">
<img src="<%=request.getContextPath()%>/upload/community/event/<%=att.getRenamed_filename()%>">
</div>
		<%
				}
			}
		%>
 		<div class="contest-participate">
	<input type="button" value="챌린지 참여하기" id="btn-part" name="btn-part"
		onclick="location.href='<%=request.getContextPath()%>/event/eventApplyEnroll';"/></div>
		 		<div class="contest-participatego">
	<input type="button" value="참여작 보러가기" id="btn-partgo" name="btn-partgo"
		onclick="location.href='<%=request.getContextPath()%>/event/eventApplyList';"/>
</div>
				<% if(canEdit){ %>
				<div class="btn-updel">
				<input type="button"  class="btn-upd" value="수정하기" onclick="updateBoard();">
				<input type="button" class= "btn-del" value="삭제하기" onclick="deleteBoard();">
				</div>
 		<% } %>
 		
</section>

<%if(canEdit) {%>
<form action="<%= request.getContextPath() %>/event/eventDelete" name="boardDeleteFrm" method="POST">
	<input type="hidden" name="no" value="<%= event.getNo() %>" />
</form>
<script>
const deleteBoard = () =>{
	if(confirm("정말 이 게시글을 삭제하시겠습니까?"))
		document.boardDeleteFrm.submit();
}
const updateBoard= () =>{
	location.href = "<%= request.getContextPath() %>/event/eventUpdate?no=<%=event.getNo()%>";
}


</script>
<%} %>

     <a style="display:scroll;position:fixed;bottom:92px; right:45px;" rel="nofollow"
     href="#" >
     <img src="<%=request.getContextPath()%>/images/top_button.png" width=20px></a>

     <a style="display:scroll;position:fixed;bottom:55px; right:45px;" rel="nofollow"
     href="#scrollbottom" ><img src="<%=request.getContextPath()%>/images/bot_button.png" width=20px></a>
     <div id="scrollbottom"></div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>