<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <link rel="stylesheet" href="<%=request.getContextPath() %>/css/signin.css" />  보류 -->
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
 %>
</script>
					<article class="signin">
						<br><br><br>
						<div class="signinTtitle">
							<h3>로그인</h3>
							<br><br><br>
								<form id="loginFrm" name="loginFrm" method="POST" class="form-area" action="<%= request.getContextPath() %>/member/signin">
									<div class="input-wrapper">
										<div class="input-container" id="id-container">
											<input id="input-user-id" type="text" name="input-user-id" placeholder="아이디" required>
										</div>
									</div>
									<div class="input-wrapper">
										<div class="input-container" id="pw-container">
											<input id="input-password" type="password"  name="input-password"  placeholder="비밀번호" required>
										</div>
									</div>
									<div class="btn-wrapper">
										<button id="btn-login">로그인</button>
									</div>
								</form>
								<div class="row">
									<div class="openBtn">
										<button type="button" class="openButton" onclick="location.href='<%= request.getContextPath() %>/member/findId'">아이디 찾기</button>
										<button type="button" class="openButton" onclick="location.href='<%= request.getContextPath() %>/member/resetPasswordCert'">비밀번호 찾기</button>
									</div>
								</div>
								<br>
								<div class="social-login">
									<p>SNS계정으로 간편 로그인/회원가입</p>	
									<div class="social-site">
										<div id="GgCustomLogin"><a href="javascript:void(0)"><img id="google-icon" src="<%=request.getContextPath() %>/images/google.png" alt="카카오 아이콘" /></div>
										<div id="kakaoLogin""><img id="kakao-icon" src="<%=request.getContextPath() %>/images/kakaotalk.png" alt="구글 아이콘" /></div>
									</div>								
								</div>
								<hr />
								<div class="non-member-order-view">
									<div id="btn-order-finder-wrapper">
										<div class="btn-wrapper">
											<button type="button" id="btn-non-member-order" onclick="showOrderFinder()">비회원 주문 조회하기</button>
										</div>
										<input type="hidden" id="btnValid" value="0" />
									</div>
									<div id="order-finder-wrapper">
										<form name="non-member-order-finderFrm" id="non-member-order-finderFrm" action="<%=request.getContextPath()%>/member/nonMemberOrderFinder">
											<div class="input-wrapper">
												<div class="input-container">
													<input id="input-order-no" type="text" name="orderno" placeholder="주문번호">
												</div>
											</div>
											<div class="input-wrapper">
												<div class="input-container">
													<input id="input-email" name="email" type="email" placeholder="이메일">
												</div>
											</div>
											<div class="btn-wrapper">
												<button id="btn-non-member-finder">주문조회</button>	
											</div>
										</form>
									</div>
								</div>
							</div>
						</article>
						
<script>

</script>
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>