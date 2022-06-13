<%@page import="java.util.List"%>
<%@ page import="member.model.dto.Member, java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script>
<% 
String saveId = null; 
Cookie[] cookies = request.getCookies();
if(cookies != null){
	for(Cookie cookie : cookies){
		if("saveId".equals(cookie.getName())){
			saveId = cookie.getValue();
		}
	}
}
else {
}

String memberId = loginMember.getMemberId();
String memberName = loginMember.getMemberName();
String nickname = loginMember.getNickname();
String email = loginMember.getEmail() != null ? loginMember.getEmail() : "";
String phone = loginMember.getPhone();
String gender = loginMember.getGender() != null ? loginMember.getGender() : "";

 %>
</script>
<article class="memberInfo">
	<fieldset id="memberUpdateField">
        <input type="button" value="비밀번호수정" onclick="location.href='<%= request.getContextPath() %>/member/memberPassword';"/>
	<h2>회원 정보</h2>
	<form name="memberUpdateFrm" method="post" action="<%= request.getContextPath() %>/member/memberUpdate">
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="memberId" id="memberId" value="<%= memberId %>" readonly>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>	
				<input type="text"  name="memberName" id="memberName" value="<%= memberName %>"  required><br>
				</td>
			</tr>
			<tr>
				<th>별명</th>
				<td>	
				<input type="text"  name="memberNickname" id="memberNickname" value="<%= nickname %>"  required><br>
				<input type="hidden" id="nickValid" value="0" />
				</td>
				<td>
				<button type="button" onclick="openCheckNick();" class="btn-nick-check">중복확인</button>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>	
				<input type="text"  name="memberEmail" id="memberEmail" value="<%= email %>"  required><br>
				<input type="hidden" id="emailValid" value="0" />
				</td>
				<td>
				<button type="button" onclick="openCheckEmail();" class="btn-nick-check">중복확인</button>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>	
				<input type="text"  name="memberPhone" id="memberPhone" value="<%= phone %>"  required><br>
				</td>
			</tr>
			<tr>
				<th>성별 </th>
				<td>
			       		 <input type="radio" name="gender" id="gender0" value="M" <%= "M".equals(gender) ? "checked" : "" %>>
						 <label for="gender0">남</label>
						 <input type="radio" name="gender" id="gender1" value="F" <%= "F".equals(gender) ? "checked" : "" %>>
						 <label for="gender1">여</label>
				</td>
			</tr>
			</table>
		<input type="submit" value="정보수정"/>
        <input type="button" onclick="deleteMember();" value="탈퇴"/>
        </form>
        </fieldset>
<form name="nickCheckFrm" id="nickCheckFrm" action="<%= request.getContextPath() %>/member/nickCheck">
	<input type="hidden" name="memberNickname" />
</form>
<form name="EmailCheckFrm" action="<%= request.getContextPath() %>/member/EmailCheck">
	<input type="hidden" name="memberEmail" />
</form>
<form 
	name="memberDelFrm" 
	action="<%= request.getContextPath() %>/member/memberDelete" 
	method="POST">
	<input type="hidden" name="memberId" value="<%= loginMember.getMemberId() %>" />
</form>
</article>
						
<script>
// 닉네임 중복검사
const openCheckNick = () => {
	const userNickVal = document.querySelector("#memberNickname").value;
	if(!userNickVal) {
		alert("닉네임이 입력되지 않았습니다.");
	      return false;
    }
	const title = "MemberNickCheckPopup";
	const spec = "width=510px, height=330px";
	const popup = open("", title, spec);
	
	const frm = document.nickCheckFrm;
	console.log("frm = " + frm);
	console.log("frm.target = " + frm.target);
	
	frm.target = title; // 해당팝업에서 폼을 제출!
	frm.memberNickname.value = userNickVal;
	frm.submit();
};

//이메일 중복검사
const openCheckEmail = () => {
	const userEmailVal = document.querySelector("#memberEmail").value;
	if(!userEmailVal) {
		alert("이메일이 입력되지 않았습니다.");
	      return false;
 	}
    if(!/^[a-z0-9]{4,12}[@].+[.][a-zA-Z]{2,3}$/i.test(userEmailVal)){
        alert('이메일은 @가 포함되어야 하며, 아이디의 길이는 4~12자리이어야 합니다.');
        return false;
    }
	const title = "MemberNickCheckPopup";
	const spec = "width=510px, height=330px";
	const popup = open("", title, spec);
	
	const frm = document.EmailCheckFrm;
	console.log("frm = " + frm);
	console.log("frm.target = " + frm.target);
	
	frm.target = title; // 해당팝업에서 폼을 제출!
	frm.memberEmail.value = userEmailVal;
	frm.submit();
};

/**
 * 맴버수정폼 유효성 검사
 */
document.memberUpdateFrm.onsubmit = () => {
	    const usernameVal = document.querySelector("#memberName").value;
	    const usernicknameVal = document.querySelector("#memberNickname").value;
	    const useremailVal = document.querySelector("#memberEmail").value;
	    const userphoneVal = document.querySelector("#memberPhone").value;
	    const usergenderVal = document.querySelector("#gender").value;
	  
	    if(!usernameVal) {
	      alert("이름을 작성해주세요.");
	      return false;
	    }
	    if(!usernicknameVal) {
	      alert("별명을 작성해주세요.");
	      return false;
	    }
	    if(!useremailVal) {
	      alert("이메일을 작성해주세요.");
	      return false;
	    }
	    if(!userphoneVal) {
	      alert("전화번호를 작성해주세요.");
	      return false;
	    }
	    if(!usergenderVal) {
	      alert("전화번호를 작성해주세요.");
	      return false;
	    }

	    //1.이름검사 : 한글2글자 이상만 허용. 
	    // 한글 검사
	    if(!/^[가-힣]{2,}$/.test(usernameVal)){
	        alert('이름에는 2글자 이상의 한글만 사용할 수 있습니다.');
	        return false;
	    }

	    //2. 휴대폰 번호 검사
	    // 01x 시작, 총 10~11자리
	    // 숫자 여부 검사
	    
	    if(!/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/.test(userphoneVal)){
	        alert('전화번호에는 숫자만 입력해야 합니다.');
	        return false;
	    }

	    //3.이메일 검사
	    if(!/^[a-z0-9]{4,12}[@].+[.][a-zA-Z]{2,3}$/i.test(useremailVal)){
	        alert('이메일은 @가 포함되어야 하며, 아이디의 길이는 4~12자리이어야 합니다.');
	        return false;
	    }
	}

// 탈퇴
const deleteMember = () => {
	if(confirm("정말로 탈퇴하시겠습니까?")){
		document.memberDelFrm.submit();
	}
}

</script>	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>