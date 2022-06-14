<%@page import="member.model.dto.MemberRole"%>
<%@page import="member.model.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member loginMember = (Member) session.getAttribute("loginMember");
	String msg = (String) session.getAttribute("msg");
	if(msg != null)
		session.removeAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Dongle:wght@300;400;700&family=Gamja+Flower&family=Jua&family=Nanum+Myeongjo:wght@400;700;800&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&family=Oleo+Script:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css" />
<script src="https://accounts.google.com/gsi/client" async defer></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.1.js" charset="utf-8"></script>
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
<title>Home Sweet Home</title>

<script>
window.onload = () => {
<% if(msg != null){ %>
	alert("<%= msg %>");
<% } %>
}

showAdminSubMenu = () =>{
	let changeVal = document.querySelector(".admin-menu-val").value;
	if(changeVal == 0){
		document.querySelector(".admin-menu-title").style.display = "block";
		document.querySelector(".admin-menu-val").value = 1;
	}
	else{
		document.querySelector(".admin-menu-title").style.display = "none";
		document.querySelector(".admin-menu-val").value = 0;
	}
};

showSubMenu = () => {
	let changeVal = document.querySelector(".member-sub-menu-val").value;
	if(changeVal == 0){
		document.querySelector(".member-sub-menu").style.visibility = "visible";
		document.querySelector(".member-sub-menu-val").value = 1;
	}
	else{
		document.querySelector(".member-sub-menu").style.visibility = "hidden";
		document.querySelector(".member-sub-menu-val").value = 0;
	}
};

//네이버 로그인
const naverLogOut = new naver.LoginWithNaverId({
			clientId: "pEzgO6fzteyhuwakBpZd",	
			} );
naverLogOut.init(); 


<% if(loginMember != null){ 
		String socialType = loginMember.getSocialType();
		System.out.println("socialType = "  + loginMember.getSocialType());
		%>
			
		
function signOut() {
	const memberSocialType = "<%= socialType %>";	
	const kakao = "kakao";
	const google = "google";
	const naver = "naver";
	
	//카카오로그아웃  
	if(kakao === memberSocialType){
		console.log(memberSocialType);
		//logoutWithKakao();			
	}
	else if(google === memberSocialType){
		console.log(memberSocialType);
		//  google.accounts.id.disableAutoSelect();
	}
	else if(naver === memberSocialType){
		naverLogOut.logout();
		open("http://nid.naver.com/nidlogin.logout", "popup", "width=700, height=850, top=300, left=200");	 
	}

	location.href="<%= request.getContextPath() %>/member/signout";
}
	<% } %>
// 카카오 로그아웃
function logoutWithKakao() {
 	if (Kakao.Auth.getAccessToken()) {
	    Kakao.API.request({
	      url: '/v1/user/unlink',
	      success: function (response) {
	      	console.log(response)
	      },
	      fail: function (error) {
	        console.log(error)
	      },
	    })
	    Kakao.Auth.setAccessToken(undefined)
	  } 
}  

</script>
</head>
	
<body>
	<div id="container">
	<header>
			<div class="sticky-container">
				<div class="main-nav-container-wrapper">
					<div class="main-nav-container">
						<div class="main-nav-wrapper1">
							<a class="home-menu" href="<%= request.getContextPath() %>">Home Sweet Home</a>
						</div>
						<div class="main-nav-wrapper2">
							<a class="community-menu" href="<%= request.getContextPath() %>/community/communityMain"> 
							<span class="main-nav-community">커뮤니티</span>
							</a> 
							<a class="store-menu" href="<%= request.getContextPath() %>/sotre/storeMain"> 
							<span class="main-nav-store">스토어</span>
							</a>
						</div>
						<div class="search-member-container">
							<div class="search-member-wrapper">
								<div class="search-container">
									<div id="global-search-combobox" role="combobox" aria-expanded="false" aria-haspopup="listbox" class="css-7whenc">
										<div class="search-wrapper">
											<span class="icon-finder">
												<image class="finder-icon" src= "<%=request.getContextPath() %>/images/magnifying-glass.png;">
											</span> 
											<input type="text" value="" placeholder="Home Sweet Home 통합검색" autocomplete="off" aria-autocomplete="list" class="input-find-value">
										</div>
									</div>
								</div>
								<div class="member-menu-container">
								<% if(loginMember == null) { %>
									<div class="member-menu-wrapper">
										<a class="cart-wrapper" href="/member/cartList"> 
											<image class="common-cart-btn" src= "<%=request.getContextPath() %>/images/cart.png;">
										</a>
										<a class="member-menu" href="<%= request.getContextPath() %>/member/SignInPage">로그인</a>
										<a class="member-menu" href="<%= request.getContextPath() %>/member/signUpPage">회원가입</a> 
										<a class="member-menu" href="<%= request.getContextPath() %>/customerCenter/main">고객센터</a>
									</div>
								<% } else if(loginMember != null && loginMember.getMemberRole() == MemberRole.A) { %>
									<div class="login-admin-menu-wrapper">
										<div class="admin-menu-title-text"><button type="button" onclick="showAdminSubMenu();">관리자 메뉴</button>
										<input type="hidden" class="admin-menu-val" value="0" />
											<ul class="admin-menu-title">
												<li class="admin-sub-menu">
													<a class="admin-sub-menu-text" href="<%= request.getContextPath() %>/admin/memberList">회원목록</a>
												</li>
												<li class="admin-sub-menu">
													<a class="admin-sub-menu-text" href="<%= request.getContextPath() %>/admin/manageProduct">상품관리</a> 
												</li>
												<li class="admin-sub-menu">
													<a class="admin-sub-menu-text" href="<%= request.getContextPath() %>/admin/statistics">통계확인</a>
												</li>
												<li class="admin-sub-menu">
													<a class="admin-sub-menu-text" href="<%= request.getContextPath() %>/admin/productManagement">상품 재고관리</a>
												</li>
												<li class="admin-sub-menu">
													<a class="admin-sub-menu-text" href="<%= request.getContextPath() %>/admin/eventManagement">이벤트관리</a>
												</li>
												<li class="admin-sub-menu">
													<a class="admin-sub-menu-text" href="<%= request.getContextPath() %>/admin/announcement">공지사항</a>
												</li>
											</ul>
										</div> 
										<div>
											<a class="admin-menu-signout" href="<%= request.getContextPath() %>/member/signout">로그아웃</a>
										</div>
									</div>
								<% } else { %>
									<div class="login-member-menu-wrapper">
										<a class="member-menu" href="<%= request.getContextPath() %>/member/adminChat">
											<img class="scrap-btn" src= "<%=request.getContextPath() %>/images/bookmark-white.png;" />
										</a>
										<a class="member-menu" href="<%= request.getContextPath() %>/member/notification">
											<img class="notification-btn" src= "<%=request.getContextPath() %>/images/notification.png;" />
										</a> 
										<a class="member-menu" href="<%= request.getContextPath() %>/member/cart">
											<img class="member-cart-btn" src= "<%=request.getContextPath() %>/images/cart.png;">
										</a>
										<div class="member-menu-cont">
											<div class="member-menu-cont-wrapper">
												<button type="button" id="btn-my-submenu" onclick="showSubMenu();">
													<img class="mypage-btn-img" src= "<%=request.getContextPath() %>/images/user.png;"/>
												</button>
												<input type="hidden" class="member-sub-menu-val" value="0" />
												<div class="member-sub-menu">
													<a class="member-menu" href="<%= request.getContextPath() %>/member/mypage">마이 페이지</a>
													<a class="member-menu" href="javascript:signOut()">로그아웃</a>
												</div>
											</div> 	
											<span class="btn-write-container">
												<button type="button" class="btn-write-menu">
													<span class="member-write">글쓰기 V</span> 
													<span class="down-arrow">
													</span>
												</button>
											</span>
										</div>
									</div>
									<% } %>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="sticky-container2">
				<div class="submenu-container">
					<div class="submenu-nav-wrapper">
						<div class="community-menu-container">
							<div class="community-menu-wrapper">
									<a index="0" class="community-home-menu" href="<%= request.getContextPath() %>/community/home">
										<div class="home-wrapper">
												<p class="home-text">홈</p>
										</div>
									</a>
									<a index="1" class="community-picture-menu" href="<%= request.getContextPath() %>/community/picture">
										<div class="picture-wrapper">
											<p class="picture-text">사진</p>
										</div>
									</a> 
									<a index="2" class="community-knowhow-menu" href="<%= request.getContextPath() %>/community/knowhow">
										<div class="knowhow-wrapper">
											<p class="knowhow-text">노하우</p>
										</div>
									</a> 
									<a index="3" class="community-qna-menu" href="<%= request.getContextPath() %>/community/qna">
										<div class="qna-wrapper">
											<p class="qna-text">질문과답변</p>
										</div> 
									</a> 
									<a index="4" class="community-event-menu" href="<%= request.getContextPath() %>/community/eventList">
										<div class="event-wrapper">
											<p class="event-text">이벤트</p>
										</div>
									</a>
							</div>
						</div>
						<div class = store-menu-container>
							<div class="store-menu-wrapper">
									<a index="0" class="store-home-menu" href="<%= request.getContextPath() %>/store/home">
										<div class="store-home-wrapper">
												<p class="home-text">홈</p>
										</div>
									</a>
									<a index="1" class="store-category-menu" href="<%= request.getContextPath() %>/store/category">
										<div class="category-wrapper">
											<p class="category-text">카테고리</p>
										</div>
									</a> 
									<a index="2" class="store-best-menu" href="<%= request.getContextPath() %>/store/bestProduct">
										<div class="best-wrapper">
											<p class="best-text">베스트</p>
										</div>
									</a> 
									<a index="3" class="store-todaydeal-menu" href="<%= request.getContextPath() %>/store/todayDeal">
										<div class="todaydeal-wrapper">
											<p class="todaydeal-text">오늘의딜</p>
										</div> 
									</a> 
									<a index="4" class="store-picture-menu" href="<%= request.getContextPath() %>/store/storeEventList">
										<div class="store-event-wrapper">
											<p class="store-event-text">기획전</p>
										</div>
									</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
	</div>
	<section id="content">