<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="community.model.dto.KnowhowExt"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%
ArrayList<KnowhowExt> volist = (ArrayList<KnowhowExt>) request.getAttribute("productVolist");
int startPage = (int) request.getAttribute("startPage");
int endPage = (int) request.getAttribute("endPage");
int pageCount = (int) request.getAttribute("pageCount");
int catenum = (int) request.getAttribute("catenum");
%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/communitysubmenu.jsp" %>

<input type="button" value="전체" id="btn-storage" name="btn-go"
	class="btn-go"
	onclick="location.href='<%=request.getContextPath()%>/community/knowhow';" />
<input type="button" value="수납" id="btn-storage" name="btn-go"
	class="btn-go"
	onclick="location.href='<%=request.getContextPath()%>/knowhow/knowhowView?catenum=<%=15%>';" />
<input type="button" value="꾸미기팁" id="btn-deco" name="btn-go"
	class="btn-go"
	onclick="location.href='<%=request.getContextPath()%>/knowhow/knowhowView?catenum=<%=16%>';" />
<input type="button" value="생활정보" id="btn-tip" name="btn-go"
	class="btn-go"
	onclick="location.href='<%=request.getContextPath()%>/knowhow/knowhowView?catenum=<%=17%>';" />
	
	
	
<div class="category">
<h2>여기가 카테고리별로 보이는 곳</h2>

			<%
		if (volist == null || volist.isEmpty()) {
		%>
		<td>등록된 노하우가 없습니다.</td>
		
		<%
		} else {
		for (KnowhowExt kh : volist) {
		%>
		
		<a href="<%=request.getContextPath()%>/knowhow/knowhowListView?no=<%=kh.getNo()%>" class="thumbnail">
		<img src="<%=request.getContextPath()%>/upload/knowhow/<%=kh.getCoverPhoto()%>" class="thumb_nail" >
		<b><%=kh.getTitle()%></b>

		<p><%=kh.getNickName()%> ·
		조회수 <%=kh.getReadCount() %></p>
		</a>
		<%}} %>
</div>

<br>




<%@ include file="/WEB-INF/views/common/footer.jsp"%>