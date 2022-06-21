<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="community.model.dto.PictureExt"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/communitysubmenu.jsp" %>
<%
PictureExt list = (PictureExt) request.getAttribute("list");
%>
<script>
window.onload = () => {	
	document.knowhowEnrollFrm.onsubmit = (e) => {
		const frm = e.target;
		//제목을 작성하지 않은 경우 폼제출할 수 없음.
		const titleVal = frm.title.value.trim(); // 좌우공백
		if(!/^.+$/.test(titleVal)){
			alert("제목을 작성해주세요.");
			frm.title.select();
			return false;
		}		
						   
		//내용을 작성하지 않은 경우 폼제출할 수 없음.
		const contentVal = frm.content.value.trim();
		if(!/^(.|\n)+$/.test(contentVal)){
			alert("내용을 작성해주세요.");
			frm.content.select();
			return false;
		}
	}
}
</script>

<section id="board-container">

<form
	name="pictureEnrollFrm"
	action="<%=request.getContextPath() %>/picture/pictureEnroll"
	method="post"
	enctype="multipart/form-data">
	<table id="tbl-board-view">
	<tr>
		<th>제 목</th>
		<td><input type="text" name="title" required></td>
	</tr>
	<tr>

		<th>작성자</th>
		<td>
			<input type="hidden" name="memberId" value="<%=loginMember.getMemberId() %>" />
			<input type="text" name="nickName" value="<%=loginMember.getNickname() %>" readonly/>
		</td>
	</tr>
	
	<tr>
		<th>썸네일파일</th>
		<td>			
			<input type="text" name="coverPhoto">
		</td>
	</tr>
	
	<tr>
		<th>첨부파일</th>
		<td>			
			<input type="file" name="upFile1">
			<br>
			<input type="file" name="upFile2">
			<br>
			<input type="file" name="upFile3">
		</td>
	</tr>

	<tr>
		<th>내 용</th>
		<td><textarea rows="5" cols="40" name="content"></textarea></td>
	</tr>
	
	<tr>
		<th colspan="2">
			<input type="submit" value="등록하기">
		</th>
	</tr>
</table>
<label for="categorySpace" >평수선택</label>
<select name="categorySpace"  id="categorySpace" >
<option selected>평수</option>
<option value="36">10-20평</option>
<option value="37">30-40평</option>
</select>

<label for="categoryShape" >주거형태</label>
<select name="categoryShape"  id="categoryShape" >
<option selected>주거형태</option>
<option value="46">원룸/오피스텔</option>
<option value="47">아파트</option>
</select>



</form>
</section>


<script>
categorySpace.addEventListener('change',(e)=>{
	const{value}  = e.target;
	console.log(value);
});

categoryShape.addEventListener('change',(e)=>{
	const{value}  = e.target;
	console.log(value);
});
</script>





<%@ include file="/WEB-INF/views/common/footer.jsp"%>