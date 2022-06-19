<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@page import="java.util.List"%>
<%@page import="community.model.dto.QnaBoardExt"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/community/qnaboard.css" />
<%
List<QnaBoardExt> list = (List<QnaBoardExt>) request.getAttribute("list");
%>
<section id="board-container">
<div class="no-search-result" >
			<%
			if (list == null || list.isEmpty()) {
			%>

			<h1>찾으시는 결과가 없습니다.</h1>
</div>	
			<%
			} else {
			for (QnaBoardExt board : list) {
			%>
<div class="qna-list">
				<h1> 검색결과 </h1><br><br>
				<a
					href="<%=request.getContextPath()%>/qna/qnaBoardView?no=<%=board.getNo()%>"><%=board.getTitle()%></a>
					<%
					if (board.getAttachCount() > 0) {
					%> <img id="thumb_file"
					src="<%=request.getContextPath()%>/images/file.png" alt="" /> <%
 }
 %>			
				<br><%=board.getNickName()%>&nbsp;&nbsp; 
				<%=board.getRegDate() %>
<%-- 				댓글 
				<% if ( board.getCommentCount()  > 0 )  {   
				System.out.println(board.getCommentCount());
				%>
				
				<%=board.getCommentCount() %> 
				<%} %> --%>
				
				· 조회 <%=board.getReadCount()%>	

			<%
			}
			}
			%>
</div>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>