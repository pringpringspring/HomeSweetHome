<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="community.model.dto.EventApplicants"%>
<%@page import="community.model.dto.EventAppExt"%>
 <%@ include file="/WEB-INF/views/common/header.jsp" %>
 <%
EventAppExt event = (EventAppExt) request.getAttribute("event");
 %>
 
 <script>
 window.onload = () => {	
		document.eventpartEnrollFrm.onsubmit = (e) => {
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
	name="eventpartEnrollFrm"
	action="<%=request.getContextPath()%>/event/eventApplyEnroll"
	method="post"
	enctype="multipart/form-data">
	
	<table id="tbl-board-view">
			<tr>
		<th>이벤트 참가코드</th>
		<td><input type="text" name="eventapplycode" ></td>
	</tr>
	
 	<%-- <input type="hidden" name="eventNo"  value="<%=event.getEventNo()%>" /> --%>
	<tr>
		<th>작성자</th>
		<td>
			<input type="hidden" name="memberId" value="<%= loginMember.getMemberId()%>" />
			<input type="text" name="nickName" value="<%= loginMember.getNickname()%>" readonly/>
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
 </form>
 </section>

 
 <%@ include file="/WEB-INF/views/common/footer.jsp" %>
