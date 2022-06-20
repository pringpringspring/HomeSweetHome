<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/community/pictureList.css" />
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@page import="java.util.List"%>
<%@page import="community.model.dto.PictureExt"%>
<%
List<PictureExt> list = (List<PictureExt>) request.getAttribute("list");
%>
<script>
/* showSpaceMenu = () =>{
	let changeVal = document.querySelector(".picture-menu-val").value;
	if(changeVal == 0){
		document.querySelector(".picture-menu-title").style.display = "block";
		document.querySelector(".picture-menu-val").value = 1;
	}
	else{
		document.querySelector(".picture-menu-title").style.display = "none";
		document.querySelector(".picture-menu-val").value = 0;
	}
};
 */

</script>


<nav id="board_top">
	<h2>사진</h2>

<h5>
<a href="<%=request.getContextPath()%>/community/picture">최신순 |</a>
<a href="<%=request.getContextPath()%>/community/picture/sortByLike">인기순 |</a>
<a href="<%=request.getContextPath()%>/community/picture/sortByRead">조회수순</a>
</h5>

<!-- 카테고리들어갈부분-->
</nav>



<div class="write-btn">
	<input type="button" value="사진 올리기" id="btn-write" name="btn-write"
		class="btn-write"
		onclick="location.href='<%=request.getContextPath()%>/picture/pictureEnroll';" />
</div>


<div class="category">
	<%
	if (list == null || list.isEmpty()) {
	%>
	<td>등록된 사진이 없습니다.</td>

	<%
	} else {
	for (PictureExt pic : list) {
	%>
	<a
		href="<%=request.getContextPath()%>/picture/pictureView?no=<%=pic.getImgNo()%>"
		class="thumbnail"> <img
		src="<%=request.getContextPath()%>/upload/community/picture/<%=pic.getCoverPhoto()%>"
		class="thumb_nail"> <b><%=pic.getTitle()%></b>

		<p><%=pic.getNickName()%>
			· 조회수
			<%=pic.getReadCount()%>· <img
				src="<%=request.getContextPath()%>/images/like.png" width="17px">
			<%=pic.getLikeCount()%></p>
	</a>
	<%
	}
	}
	%>
</div>

<br>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>