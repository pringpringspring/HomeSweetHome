<%@page import="community.model.dto.KnowhowTheme"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.util.List"%>
<%@page import="community.model.dto.KnowhowExt"%>
 <%@ include file="/WEB-INF/views/common/header.jsp" %>
 <%@ include file="/WEB-INF/views/common/communitysubmenu.jsp" %>
 <%
KnowhowExt list = (KnowhowExt) request.getAttribute("list");
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
<section id="notice-container">

<form
	name="knowhowEnrollFrm"
	action="<%=request.getContextPath() %>/knowhow/knowhowEnroll"
	method="post"
	enctype="multipart/form-data">
	<table id="tbl-board-view">
	<tr>
		<th>제 목</th>
		<td><input type="text" name="title" required></td>
	</tr>
	<tr>
	<%-- 		<input type="number" name="theme" value="<%=list.getCategoryNo() %>" /> --%>
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
<label for="categoryNo" >테마선택 </label>
<select name="categoryNo"  id="categoryNo" >
<option selected>선택</option>
<option value="15">수납</option>
<option value="16">꾸미기팁</option>
<option value="17">생활정보</option>
</select>

</form>
</section>


<script>
categoryNo.addEventListener('change',(e)=>{
	const{value}  = e.target;
	console.log(value);
});
</script>
 <%@ include file="/WEB-INF/views/common/footer.jsp" %>