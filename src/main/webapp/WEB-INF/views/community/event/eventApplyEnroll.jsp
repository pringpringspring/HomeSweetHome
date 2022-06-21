<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="community.model.dto.EventApplicants"%>
<%@page import="community.model.dto.EventAppExt"%>
 <%@ include file="/WEB-INF/views/common/header.jsp" %>
 <%
EventAppExt event = (EventAppExt) request.getAttribute("event");
 %>
 <style>
 #eventNo:focus,.eventapplycode:focus,.nickname:focus,.content:focus{border: 1px solid #35C5F0; outline:none;}
 .enrollevent:hover{cursor:pointer;}
 #eventNo:hover,.eventapplycode:hover,.nickname:hover,.content:hover{border: 1px solid #36C4F2; outline:none;}
 #board-container{margin-left:27rem; margin-top: 5.2rem;}
 .eventNo{margin-right: 1rem;}
 #eventNo{border: 1px solid #D5D5D5; margin-top:1rem; margin-bottom: 3rem;}
 .eventapplycode{border: 1px solid #D5D5D5; margin-bottom: 1rem; height:2rem; width:15.2rem;}
 .nickname{border: 1px solid #D5D5D5; margin-bottom: 1rem; height:1.5rem; }
 .content{border: 1px solid #D5D5D5; margin-bottom: 1rem; margin-top: 1.2rem;}
.enrollevent{border: 1px solid #35c5f0;border-radius: 0.25rem;cursor: pointer;color: #35c5f0;font-size: 1rem;
font-weight:bold; background: white;width: 5.8rem; height: 2.7rem;}

 </style>
 
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
	<label for="eventNo"  class="eventNo"><b>이벤트 선택</b></label>
<select name="eventNo"  id="eventNo" >
<option selected>------필수선택------</option>
<option value="102">꽃테리어 콘테스트 (진행중)</option>
<option value="101">핸드메이드 콘테스트 (종료)</option>
<option value="81">정리챌린지 (종료)</option>

</select>
			<tr>
		<th>제목</th>
		<td><input type="text" name="eventapplycode"  class="eventapplycode"></td>
	</tr>
	
 	<%-- <input type="hidden" name="eventNo"  value="<%=event.getEventNo()%>" /> --%>
	<tr>
		<th>작성자</th>
		<td>
			<input type="hidden" name="memberId" value="<%= loginMember.getMemberId()%>" />
			<input type="text" name="nickName"  class="nickname" value="<%= loginMember.getNickname()%>" readonly/>
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
		<td><textarea rows="5" cols="40" name="content" class="content"></textarea></td>
	</tr>
	<tr>
		<th colspan="2">
			<input type="submit" value="등록하기" class="enrollevent"> 
		</th>
	</tr>
</table>

 </form>
 </section>

 
<script>
eventNo.addEventListener('change', (e) => {
	const{value}  = e.target;
	console.log(value);
});
</script>
 <%@ include file="/WEB-INF/views/common/footer.jsp" %>
