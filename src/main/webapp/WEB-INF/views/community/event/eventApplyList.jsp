<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="java.util.List"%>
  <%@page import="community.model.dto.EventAppExt"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
List<EventAppExt> list = (List<EventAppExt>) request.getAttribute("list");
%>

<style>
.img_logo{margin-left:26rem;}
.title-view>h2{margin-left:43rem; margin-bottom:2rem;}
a{text-decoration: none;  color: black; font-weight:bold;}
.main{margin-top:4rem; margin-left:42rem;}
</style>
<section id="board-container">
<div class="title-view">
<h2>참여작</h2>
 <img src="<%=request.getContextPath()%>/upload/event/e3.jpg" class="img_logo">
 </div>
 <div class="main">
<%
	if (list == null || list.isEmpty()) {
	%>
	<td colspan="6">조회된 이벤트가 없습니다.</td>
	<%}
	else{ 
		for(EventAppExt eventapp : list){
	%>
	<%=eventapp.getNickName()%>님의 참여작<br>
	 	🌼<a href="<%=request.getContextPath()%>/event/eventApplyView?no=<%=eventapp.getNo()%>">
	<%=eventapp.getEventapplyCode() %></a>🌼<br><br>
	
	<%} }%>
 </div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

