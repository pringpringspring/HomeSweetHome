<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.sql.Date"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <style>
 #board-container{margin-left:27rem; margin-top: 5.2rem;}
 </style>
<script>
/**
* boardEnrollFrm 유효성 검사
*/
window.onload = () => {	
	document.eventEnrollFrm.onsubmit = (e) => {
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

	<form name="eventEnrollFrm"
		action="<%=request.getContextPath()%>/event/eventEnroll"
		method="post" enctype="multipart/form-data">
		<table id="tbl-board-view">
			<tr>
				<th>이벤트 아이디</th>
				<td><input type="text" name="eventId" required></td>
			</tr>
			<tr>
				<th>제 목</th>
				<td><input type="text" name="title" required></td>
			</tr>

			<tr>
				<th>첨부파일</th>
				<td><input type="file" name="upFile1"></td>
			</tr>
			<tr>
				<th>내 용</th>
				<td><textarea rows="5" cols="40" name="content"></textarea></td>
			</tr>

			<tr>
				<th>이벤트 썸네일 파일명 작성</th>
				<td><input type="text" name="titlefileName" placeholder="ex) a.jpg , b.png ..."></td>
			</tr>

			<tr>
				<th>시작날짜</th>
				<td><input type="text" name="sdate" placeholder="ex)2022-01-01"></td>
			</tr>

			<tr>
				<th>종료날짜</th>
				<td><input type="text" name="edate" placeholder="ex)2022-01-01"></td>
			</tr>

			<tr>
				<th colspan="2"><input type="submit" value="등록하기"></th>
			</tr>
		</table>
	</form>
</section>

<script>

</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
