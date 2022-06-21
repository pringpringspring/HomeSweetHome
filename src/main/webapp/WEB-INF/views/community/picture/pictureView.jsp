<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="member.model.dto.Member"%>
<%@page import="java.util.List"%>
<%@page import="community.model.dao.PictureDao"%>
<%@page import="community.model.dto.LikeDTO"%>
<%@page import="community.model.dto.PictureAttachment"%>
<%@page import="community.model.dto.Picture"%>
<%@page import="community.model.dto.PictureExt"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/community/pictureList.css" />
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
int no = Integer.parseInt(request.getParameter("no"));
String member_id = request.getParameter("member_id");
PictureExt picture = (PictureExt) request.getAttribute("picture");
boolean canEdit = loginMember != null
		&& (loginMember.getMemberId().equals(picture.getMemberId()) || loginMember.getMemberRole() == MemberRole.A);
boolean canLike = loginMember != null;

%>
<script>
	$(function(){
		$(".cancel_love").click(function(){
			location.href="NoLike.do?no=<%=no%>";
		});
		$(".plus_love").click(function(){
			location.href="Like.do?no=<%=no%>";
		});
	});
</script>

<section id="board-view-container">
	<table id="tbl-board-view">

		<div class="title-view">
			<h1><%=picture.getTitle()%></h1>
			<h3><%=picture.getNickName()%></h3>
			<h3><%=picture.getRegDate()%></h3>
		</div>

		<div class="content-view">
			<%=picture.getContent()%><br>
			<%
			List<PictureAttachment> attachments = picture.getAttachments();
			if (attachments != null && !attachments.isEmpty()) {
				for (PictureAttachment attach : attachments) {
			%>
			<img
				src="<%=request.getContextPath()%>/upload/community/picture/<%=attach.getRenamedFilename()%>"
				width=450px>
			
			<%
			}

			}
			%>
			<div class="view-end">
				<br> No.<%=picture.getImgNo()%>&nbsp;&nbsp; 조회
				<c><%=picture.getReadCount()%></c>
				&nbsp;&nbsp;
			</div>
		
		<div class="love-box">
				<% if(canLike) { %> 
						<% PictureDao pd = new PictureDao(); 
						LikeDTO likedto = new LikeDTO();

						boolean like_check= pd.like_search(member_id, no);

						if(like_check){
						%>
					<button class="love-btn cancel_love">
					<img class="heart" alt="cancel_love" src="<%=request.getContextPath()%>/images/like.png" width="20px">

					</button>
					<%} else{ %>
						<button class="love-btn plus_love">
					<img class="heart" alt="plus_love" src="<%=request.getContextPath()%>/images/dislike.png"width="20px">
				
		<%-- 	<%=pd.likecount(no)%> --%>
				</button>
					<%} %>	

<% 
   }
%>
		</div>
			
			</div>
			<%
			if (canEdit) {
			%>
			<%-- 작성자와 관리자만 마지막행 수정/삭제버튼이 보일수 있게 할 것 --%>
			<input type="button" class="btn-upd" value="수정하기"
				onclick="updateBoard()"> <input type="button"
				class="btn-del" value="삭제하기" onclick="deleteBoard()">
			<%
			}
			%>
		
	</table>
</section>

<%
if (canEdit) {
%>
<form action="<%=request.getContextPath()%>/picture/pictureDelete"
	name="boardDeleteFrm" method="POST">
	<input type="hidden" name="no" value="<%=picture.getImgNo()%>" />
</form>
<script>
const deleteBoard = () => {
	if(confirm("정말 이 게시글을 삭제하시겠습니까?"))
		document.boardDeleteFrm.submit();
};	

const updateBoard = () => {
	location.href = "<%=request.getContextPath()%>/picture/pictureUpdate?no=<%=picture.getImgNo()%>";
}
</script>
<%
}
%>

<script>
<%-- const LikeBtn = (e) => {
	   const likeItBtn = document.querySelector("#btn-like");
	   let likeItBtnSrc = likeItBtn.lastElementChild.src;
	   if(likeItBtnSrc == "like.png"){
		   
	      $.ajax({
	         url : "<%= request.getContextPath() %>/picture/pictureView",
	         data : {
	            no : <%= picture.getImgNo()%>,
	            memberId : "<%= loginMember.getMemberId() %>"
	         },
	         success(resp){
	        	 likeItBtn.lastElementChild.src = "<%= request.getContextPath() %>/images/dislike.png";
	         },
	         error : 
	        	 alert("통신오류")
	      });
} else {
   $.ajax({
      url : "<%= request.getContextPath() %>/picture/pictureView",
      data : {
         no : <%= picture.getImgNo() %>,
         memberId : "<%= loginMember.getMemberId() %>"
      },
      success(resp){
    	  likeItBtn.lastElementChild.src = "<%= request.getContextPath() %>/images/like.png";
      },
      error : 
    	  alert("통신오류")
   });
}
}; --%>


</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>