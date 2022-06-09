<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="community.model.dto.EventExt"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
List<EventExt> list = (List<EventExt>) request.getAttribute("list");

%>
<style>
#event{
margin-top:3.2rem;
}
.event-list{
margin-left:31.7rem;
} 

img{
width:57%;
height:23%;
transform:scale(1.0);        
}
img:hover{
 transform: scale(1.07);
  -webkit-transform: scale(1.07);
  -moz-transform: scale(1.07);
  -ms-transform: scale(1.07);
  -o-transform: scale(1.07);
  }
</style>


<div id="event">


<%
	if (list == null || list.isEmpty()) {
	%>
	<td colspan="6">조회된 이벤트가 없습니다.</td>
</div>
	<%
	} else {

 	for (EventExt event : list)  {
	%>

<div class="event-list">
<a href="<%=request.getContextPath()%>/community/eventView?no=<%=event.getNo()%>">
<img src="<%=request.getContextPath()%>/upload/event/<%=event.getTitlefileName()%>"/>
</a>

</div>


	<%
	}
	}
	%>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>    