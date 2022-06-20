<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/community/pictureList.css" />
<%@page import="community.model.dto.PictureExt"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<%
ArrayList<PictureExt> list = (ArrayList<PictureExt>) request.getAttribute("productList");
int startPage = (int) request.getAttribute("startPage");
int endPage = (int) request.getAttribute("endPage");
int pageCount = (int) request.getAttribute("pageCount");
int space = (int) request.getAttribute("space");
int shape = (int) request.getAttribute("shape");
%>


<nav id="board_top">
	<h2>사진</h2>
		<div class="select-type">
		<div>
			<div>
				<select name="selectType"  class="selectType" id="shapecategory" required>
					<option selected>주거형태</option>
					<option value="<%=request.getContextPath()%>/picture/pictureViewByTheme?shape=<%=46%>">원룸&오피스텔</option>
					<option value="<%=request.getContextPath()%>/picture/pictureViewByTheme?shape=<%=47%>" >아파트</option>
				</select>
				<select name="selectType" class="selectType" id="spacecategory" required>
					<option selected>평수</option>
					<option value="<%=request.getContextPath()%>/picture/pictureViewByTheme?space=<%=36%>">10~20평대</option>
					<option value="<%=request.getContextPath()%>/picture/pictureViewByTheme?space=<%=37%>" >30~40평대</option>
				</select>
			</div>
		</div>
	</div>
</nav>

	

<div class="category">
			<%
		if (list == null || list.isEmpty()) {
		%>
		<td>등록된 사진이 없습니다.</td>
		
		<%
		} else {
		for (PictureExt pic : list) {
		%>
		
		<a href="<%=request.getContextPath()%>/picture/pictureView?no=<%=pic.getImgNo()%>" class="thumbnail">
		<img src="<%=request.getContextPath()%>/upload/community/picture/<%=pic.getCoverPhoto()%>" class="thumb_nail" >
		<b><%=pic.getTitle()%></b>

		<p><%=pic.getNickName()%> ·
		조회수 <%=pic.getReadCount() %></p>
		</a>
		<%}} %>
</div>

<br>

<script>
function getList(shapecategory,spacecategory) {
	/*
	 * pageNum, opt, keyword
	 * 값이 없으면 초기값 사용.
	 * 값이 있으면 입력받은 값 사용.
	 */
	
	var shapecategory = !shapecategory ? '0': shapecategory
	var spacecategory = ! spacecategory ? '0' : spacecategory
	var oData = {
		shapecategory : shapecategory,
		spacecategory :spacecategory

	};
		
		console.log(oData);
	$.ajax({
		url : '/main/api/homemain',
		type : 'GET',
		data : oData,
		dataType : 'JSON',
		success : function(data) {
			appendList(data.list); //화면에 뿌려주기 위함
		},
		error : function(error) {
			console.log(error);
		}
	});
}

</script>





<%@ include file="/WEB-INF/views/common/footer.jsp"%>