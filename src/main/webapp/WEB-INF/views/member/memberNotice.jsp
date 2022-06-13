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
<div class="">
	<h1 class="">내 소식</h1>
		<div style="padding-top: 0px; padding-bottom: 0px; transform: translateY(0px);">
			<div style="">
				<div class="">
					<a class="" href="/users/2">
						<img class="" alt="" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1512439280629_knGlCsma.jpg?gif=1&amp;w=40&amp;h=40&amp;c=c" srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1512439280629_knGlCsma.jpg?gif=1&amp;w=72&amp;h=72&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1512439280629_knGlCsma.jpg?gif=1&amp;w=80&amp;h=80&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/users/profile_images/1512439280629_knGlCsma.jpg?gif=1&amp;w=144&amp;h=144&amp;c=c 3x">
					</a>
					<a class="css-11vwntr e13wrs5c4" href="/advices/1541">
						<div class="css-16snpk5 e13wrs5c3">
							<span class="css-1jtmhk9 e13wrs5c2">일상에서 발견하는 예쁜 인테리어, 소품 사진을 공유해주세요. 인기 사진으로 선정되면 포인트를 적립해 드려요.</span>
							<span class="css-jhahzo e13wrs5c1">1주</span>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>