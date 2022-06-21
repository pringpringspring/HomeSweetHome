<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
 <%@page import="community.model.dto.EventAppExt"%>
 <%@page import="community.model.dto.EventAppAtt"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	EventAppExt eventapp = (EventAppExt) request.getAttribute("eventapp");
%>
<style> 
#update-eventApply{margin-left:37rem; margin-top: 5.2rem;}
.btn-modi:hover,.btn-no:hover{cursor:pointer;}
#eventNo:focus,.title:focus,.nickname:focus,.content:focus{border: 1px solid #35C5F0; outline:none;}
#eventNo:hover,.title:hover,.nickname:hover,.content:hover{border: 1px solid #36C4F2; outline:none;}
 .eventNo{margin-right: 1rem;}
 #eventNo{border: 1px solid #D5D5D5; margin-top:1rem; margin-bottom: 3rem;}
.title{border: 1px solid #D5D5D5; margin-bottom: 1rem; height:2rem; width:15.2rem;margin-left: 0.2rem;}
.nickname{border: 1px solid #D5D5D5; margin-bottom: 1rem; height:1.5rem;}
.content{border: 1px solid #D5D5D5; margin-bottom: 1rem; margin-top: 1.2rem;}
.btn-modi{border: 1px solid #35c5f0;border-radius: 0.25rem; color: #35c5f0; font-size: 1rem;
font-weight:bold; background: white;width: 6.1rem; height: 2.2rem; margin-right:0.52rem;}  
.btn-no{border: 1px solid #35c5f0;border-radius: 0.25rem; color: #35c5f0; font-size: 1rem;
font-weight:bold; background: white;width: 3.1rem; height: 2.2rem; margin-right:0.52rem;}    
</style>

<section id="update-eventApply">
<form 
	name="boardUpdateFrm" 
	action="<%=request.getContextPath() %>/event/eventApplyUpdate" 
	method="post"
	enctype="multipart/form-data">
<input type="hidden" name="no" value="<%= eventapp.getNo() %>" />
<table id="tbl-board-view">

	<tr>
		<th>이벤트 제목</th>
		<td><input type="text" name="eventapplyCode" class="title" value="<%=eventapp.getEventapplyCode()%>" required></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>
			<input type="hidden" name="memberId" value="<%= eventapp.getMemberId() %>" readonly/>
			<input type="text" name="nickName"  class="nickname" value="<%= eventapp.getNickName()%>" readonly/>
		</td>
	</tr>
	
<tr>
		<th>첨부파일</th>
		<td >
	<%
		List<EventAppAtt> attachments = eventapp.getAttachments();
		if(attachments != null && !attachments.isEmpty()){
			for(int i = 0; i < attachments.size(); i++){
				EventAppAtt attach = attachments.get(i);
	%>
			<img src="<%=request.getContextPath() %>/images/file.png" width="16px">
			<%=attach.getOriginalFilename()%>
			<input type="checkbox" name="delFile" id="delFile<%= i + 1 %>" value="<%= attach.getNo() %>"/>
			<label for="delFile<%= i + 1 %>">삭제</label>
			<br />
	<%
			}
		}
	%>
			<input type="file" name="upFile1" value="">
			<input type="file" name="upFile2" value="">
		</td>
	</tr>

	<tr>
		<th>내 용</th>
		<td>
			<textarea rows="5" cols="40" name="content" class="content"><%= eventapp.getContent() %></textarea>
		</td>
	</tr>
	
	<label for="eventNo"  class="eventNo"><b>이벤트 선택</b></label>
<select name="eventNo"  id="eventNo" >
<option>---이벤트번호 변경 불가---</option>
<option value="102"  selected>꽃테리어 콘테스트 (진행중)</option>
<option value="101">핸드메이드 콘테스트 (종료)</option>
<option value="81">정리챌린지 (종료)</option>
</select>
	<tr>
		<th colspan="2">
			<input type="submit"  class="btn-modi" value="수정하기"/>
			<input type="button"  class="btn-no"value="취소" onclick="history.go(-1);"/>
		</th>
	</tr>
</table>
</form>
</section>


<script>
eventNo.addEventListener('change',(e)=>{
	const{value}  = e.target;
	console.log(value);
});
</script>

<script>
/**
 * 업로드 가능한 첨부파일 수 제한하기
 */
const len = document.querySelectorAll("[name=delFile]").length
for(let i = 0; i < len; i++)
	document.querySelectorAll("input[type=file]")[i].style.display = "none";
	
/**
 * [name=delFile] 체크/체크해제시 input[type=file] 노출/감춤처리
 */
document.querySelectorAll("[name=delFile]").forEach((delFile) => {
	delFile.onchange = (e) => {
		const {id, checked} = e.target;
		// console.log(id, checked);
		const n = id.replaceAll(/[^0-9]/g, "");
		const file = document.querySelector(`[name=upFile\${n}]`);
		file.style.display = checked ? "inline" : "none"; // 노출/감춤 처리
		checked || (file.value = ""); // 지정한 파일을 제거 
	};
});


document.boardUpdateFrm.onsubmit = (e) => {
	//내용을 작성하지 않은 경우 폼제출할 수 없음.
	const contentVal = frm.content.value.trim();
	if(!/^(.|\n)+$/.test(contentVal)){
		alert("내용을 작성해주세요.");
		frm.content.select();
		return false;
	}
}
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>