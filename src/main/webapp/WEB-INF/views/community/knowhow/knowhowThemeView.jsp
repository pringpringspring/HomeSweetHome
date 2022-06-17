<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="community.model.dto.KnowhowExt"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/community/knowhowList.css" />
<%

List<KnowhowExt> list = (List<KnowhowExt>) request.getAttribute("list"); 
%>


<nav id="board_top">
<h2>여기가 카테고리별로 분류하는 곳</h2>
<input type="button" value="전체" id="btn-storage" name="btn-go" class="btn-go"
		onclick="location.href='<%=request.getContextPath()%>/community/knowhow';"/>
<input type="button" value="수납" id="btn-storage" name="btn-go" class="btn-go"
		onclick="location.href='<%=request.getContextPath()%>/knowhow/knowhowView?theme=15';"/>
		<input type="button" value="꾸미기팁" id="btn-deco" name="btn-go" class="btn-go"
		onclick="location.href='<%=request.getContextPath()%>/knowhow/knowhowView?theme=16';"/>
		<input type="button" value="생활정보" id="btn-tip" name="btn-go" class="btn-go"
		onclick="location.href='<%=request.getContextPath()%>/knowhow/knowhowView?theme=17';"/>




</nav>
<div class="write-btn">
<input type="button" value="노하우 작성하기" id="btn-write" name="btn-write" class="btn-write"
		onclick="location.href='<%=request.getContextPath()%>/knowhow/knowhowEnroll';"/>
</div>
<div class="category">

			<%
		if (   (list == null || list.isEmpty() )   ) {
		%>
		<td>등록된 노하우가 없습니다.</td>
		
		<%
		}  
		{
		for (KnowhowExt kh : list) {
		%>
	
		
			<h2>생활정보</h2>
		<a href="<%=request.getContextPath()%>/knowhow/knowhowListView?theme=<%=kh.getCategoryNo() %>&no=<%=kh.getNo()%>" class="thumbnail">
		<img src="<%=request.getContextPath()%>/upload/knowhow/<%=kh.getCoverPhoto()%>" class="thumb_nail" >
		<b><%=kh.getTitle()%></b>

		<p><%=kh.getNickName()%> ·
		조회수 <%=kh.getReadCount() %></p>
		</a>

			
				
						<h2>꾸미기팁</h2>
		<a href="<%=request.getContextPath()%>/knowhow/knowhowListView?theme=<%=kh.getCategoryNo() %>&no=<%=kh.getNo()%>" class="thumbnail">
		<img src="<%=request.getContextPath()%>/upload/knowhow/<%=kh.getCoverPhoto()%>" class="thumb_nail" >
		<b><%=kh.getTitle()%></b>

		<p><%=kh.getNickName()%> ·
		조회수 <%=kh.getReadCount() %></p>
		</a>

			

						<h2>수납</h2>
		<a href="<%=request.getContextPath()%>/knowhow/knowhowListView?theme=<%=kh.getCategoryNo() %>&no=<%=kh.getNo()%>" class="thumbnail">
		<img src="<%=request.getContextPath()%>/upload/knowhow/<%=kh.getCoverPhoto()%>" class="thumb_nail" >
		<b><%=kh.getTitle()%></b>

		<p><%=kh.getNickName()%> ·
		조회수 <%=kh.getReadCount() %></p>
		</a>

	<%	}}%>

</div>

<br>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>