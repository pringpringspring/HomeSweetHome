<%@page import="java.util.List"%>
<%@ page import="member.model.dto.Member, java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<section id=enroll-container>
		<h2>비밀번호 변경</h2>
		<form 
			name="passwordUpdateFrm" 
			action="<%=request.getContextPath()%>/member/passwordUpdate" 
			method="post" >
			<table>
				<tr>
					<th>현재 비밀번호</th>
					<td><input type="password" name="oldPassword" id="oldPassword" required></td>
				</tr>
				<tr>
					<th>변경할 비밀번호</th>
					<td>
						<input type="password" name="newPassword" id="newPassword" required>
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>	
						<input type="password" id="newPasswordCheck" required><br>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<input type="submit"  value="변경" />
					</td>
				</tr>
			</table>
			<input type="hidden" name="memberId" value="<%= loginMember.getMemberId() %>" />
		</form>
	</section>
	<script>
	newPasswordCheck.onblur = () => {
		if(newPassword.value !== newPasswordCheck.value){
			alert("두 비밀번호가 일치하지 않습니다.");
			return false;
		}
		return true;
	};
	document.passwordUpdateFrm.onsubmit = () => {
		// oldPassword 숫자/문자/특수문자 포함 형태의 8~16자리 이내의 암호 정규식 
		if(!/(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%&*])[a-z0-9!@#$%&*]{8,16}/i.test(oldPassword.value)){
			alert("규칙에 맞게 비밀번호를 8-16자 사이의 영문, 숫자, 특수문자를 포함시켜 만들어 주세요.");
			return false;
		}
		// newPassword 숫자/문자/특수문자 포함 형태의 8~16자리 이내의 암호 정규식 
		if(!/(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%&*])[a-z0-9!@#$%&*]{8,16}/i.test(newPassword.value)){
			alert("규칙에 맞게 비밀번호를 8-16자 사이의 영문, 숫자, 특수문자를 포함시켜 만들어 주세요.");
			return false;
		}
	    //비밀번호일치여부 검사
	    if(!(newPassword.value === newPasswordCheck.value)){
	        alert('비밀번호가 비밀번호 재입력에 입력된 값과 일치하지 않습니다. 다시 입력해주세요.');
	        return false;
	    }
		if(!newPasswordCheck.onblur()){
			return false; // 폼 제출을 방지
		}
	};
	</script>
	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>