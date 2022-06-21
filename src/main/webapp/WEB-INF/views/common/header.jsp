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
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>	
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.1.js" charset="utf-8"></script>
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
<link rel="icon" href="<%=request.getContextPath() %>/images/hshlogo.JPG">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-jp.css' rel='stylesheet' type='text/css'>
<title>Home Sweet Home</title>
<!-- 고두현 css 시작 -->
<style>
.nav-counter {
 position:absolute;
 top: -1px;
 right: -0.5rem;
 min-width: 8px;
 height: 20px;
 line-height: 20px;
 margin-top: -11px;
 padding: 0 6px;
 font-weight: normal;
 font-size: small;
 color: white;
 text-align: center;
 text-shadow: 0 1px rgba(0, 0, 0, 0.2);
 background: #e23442;
 border: 1px solid #911f28;
 border-radius: 11px;
 background-image: -webkit-linear-gradient(top, #e8616c, #dd202f);
 background-image: -moz-linear-gradient(top, #e8616c, #dd202f);
 background-image: -o-linear-gradient(top, #e8616c, #dd202f);
 background-image: linear-gradient(to bottom, #e8616c, #dd202f);
 -webkit-box-shadow: inset 0 0 1px 1px rgba(255, 255, 255, 0.1), 0 1px rgba(0, 0, 0, 0.12);
 box-shadow: inset 0 0 1px 1px rgba(255, 255, 255, 0.1), 0 1px rgba(0, 0, 0, 0.12);
}
</style>
<!-- 고두현 css 끝 -->
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

<% if(loginMember != null){ 
	String socialType = loginMember.getSocialType();
	System.out.println("socialType = "  + loginMember.getSocialType());
%>

//구글
  window.onload = function() {
    google.accounts.id.initialize({
      client_id: "876270899044-a3f5488k6dks11e8h33suurud5ov5am7.apps.googleusercontent.com",
      callback: handleCredentialResponse
    });
}

//네이버 로그인
const naverLogOut = new naver.LoginWithNaverId({
			clientId: "pEzgO6fzteyhuwakBpZd",	
			} );
naverLogOut.init(); 

			
Kakao.init('e8297c1ed4b33061177ef12c15580963'); 		
function signOut() {
	const memberSocialType = "<%= socialType %>";	
	const kakao = "kakao";
	const google = "google";
	const naver = "naver";
	
	//카카오로그아웃  
	if(kakao === memberSocialType){
		console.log(memberSocialType);
		logoutWithKakao();			
	}
	else if(google === memberSocialType){
		console.log(memberSocialType);
		location.href = "https://mail.google.com/mail/u/0/?logout&hl=en";
	}
	else if(naver === memberSocialType){
		naverLogOut.logout();
		location.href = "http://nid.naver.com/nidlogin.logout";	 

	}

	 location.href="<%= request.getContextPath() %>/member/signout"; 
}

// 카카오 로그아웃
function logoutWithKakao() {
	 Kakao.API.request({
		    url: '/v1/user/access_token_info',
		    success: function (response) {
				Kakao.Auth.logout();
		    },
		    fail: function (error) {
                console.log(error)
              }
	 });
}  
<% } %>
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
							<a class="community-menu" href="<%= request.getContextPath() %>/community/home"> 
							<span class="main-nav-community">커뮤니티</span>
							</a> 
							<a class="store-menu" href="<%= request.getContextPath() %>/store/storeMain"> 
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
										<a class="member-menu" href="<%= request.getContextPath() %>/customerservice/cscenter">고객센터</a>
										<a class="member-menu" href="<%= request.getContextPath() %>/member/signUpPage">회원가입</a> 
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
													<a class="admin-sub-menu-text" href="<%= request.getContextPath() %>/admin/productIOManagement">상품 재고관리</a>
												</li>
												<li class="admin-sub-menu">
													<a class="admin-sub-menu-text" href="<%= request.getContextPath() %>/admin/eventManagement">이벤트관리</a>
												</li>
												<li class="admin-sub-menu">
													<a class="admin-sub-menu-text" href="<%= request.getContextPath() %>/admin/announcement">공지사항</a>
												</li>
												<li class="admin-sub-menu">
													<a class="admin-sub-menu-text" href="<%= request.getContextPath() %>/customerservice/cscenter">고객센터</a>
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
													<span class="nav-counter">2</span>
										</a>
										<a class="member-menu" href="<%= request.getContextPath() %>/member/notification">
											<img class="notification-btn" src= "<%=request.getContextPath() %>/images/notification.png;" />
													<span class="nav-counter">1</span>
										</a> 
										<a class="member-menu" href="<%= request.getContextPath() %>/member/cart">
												<img class="member-cart-btn" src= "<%=request.getContextPath() %>/images/cart.png;">
													<span class="nav-counter">3</span>
										</a>
										<div class="member-menu-cont">
											<div class="member-menu-cont-wrapper">
												<button type="button" id="btn-my-submenu" onclick="showSubMenu();" style="margin: 0;">
													<img class="mypage-btn-img" src= "<%=request.getContextPath() %>/images/user.png;"/>
												</button>
												<input type="hidden" class="member-sub-menu-val" value="0" />
												<div class="member-sub-menu">
													<a class="member-menu" href="<%= request.getContextPath() %>/member/mypage">마이 페이지</a>
													<a class="member-menu" href="<%= request.getContextPath() %>/customerservice/cscenter">고객센터</a>
													<a class="member-menu" href="javascript:signOut()">로그아웃</a>
												</div>
											</div> 	
											<span class="btn-write-container">
												<button type="button" class="btn-write-menu"  style="margin: 0; padding: 0;">
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
			
			<div id="skyScraper">
		<div class="myView">
			<div class="myViewTit"><a href="javascript:;">장바구니<span class="count">3</span></a></div>
			<div class="itemList myCart" style="display: none; height: 241px;">
				<ul>
					<li>
						<a href="http://www.e-himart.co.kr/app/goods/goodsDetail?goodsNo=0017880739">
							<img src="http://static1.e-himart.co.kr/contents/goods/00/17/88/07/39/0017880739__SIF-BZ10R__M_70_70.jpg" alt="상품이미지" width="70" height="70" onerror="this.src='http://static1.e-himart.co.kr/resources/layout/images/default/70.jpg'">
								<span class="mOverWrap" style="display: none;">
								<span class="mOverTxtArea">
									<span class="mOverTit">신일&nbsp;BLDC 스탠드형 무소음 에어 서큘레이터 SIF-BZ10R</span>
									<span class="mOverPrc"><span class="fontMont">179,000</span>원</span>
								</span>
							</span>
						</a>
					</li>
					
					<li>
						<a href="http://www.e-himart.co.kr/app/goods/goodsDetail?goodsNo=0014800487">
							<img src="http://static2.e-himart.co.kr/contents/goods/00/14/80/04/87/0014800487__ST4000VN008___M_70_70.jpg" alt="상품이미지" width="70" height="70" onerror="this.src='http://static2.e-himart.co.kr/resources/layout/images/default/70.jpg'">
								<span class="mOverWrap" style="display: none;">
								<span class="mOverTxtArea">
									<span class="mOverTit">씨게이트&nbsp;씨게이트 아이언울프 NAS용 하드디스크 4TB</span>
									<span class="mOverPrc"><span class="fontMont">159,000</span>원</span>
								</span>
							</span>
						</a>
					</li>
					
					<li>
						<a href="http://www.e-himart.co.kr/app/goods/goodsDetail?goodsNo=0000226480">
							<img src="http://static1.e-himart.co.kr/contents/goods/00/00/22/64/80/0000226480__BL-811DKR__M_70_70.jpg" alt="상품이미지" width="70" height="70" onerror="this.src='http://static1.e-himart.co.kr/resources/layout/images/default/70.jpg'">
								<span class="mOverWrap" style="display: none;">
								<span class="mOverTxtArea">
									<span class="mOverTit">테팔&nbsp;초고속 블렌더 BL-811DKR (2L, 3가지 자동모드, 속도조절, 순간작동)</span>
									<span class="mOverPrc"><span class="fontMont">109,000</span>원</span>
								</span>
							</span>
						</a>
					</li>
					
					</ul>
				<div class="skyBtnArea" style="display: none;">
					<!-- <a href="javascript:;" class="prev"><img src="/resources/layout/images/btn/arrPrevShadow.png" alt="prev"></a>
					<div class="pager"><span class="current">1</span>/<span class="total"></span></div>
					<a href="javascript:;" class="next"><img src="/resources/layout/images/btn/arrNextShadow.png" alt="next"></a> -->
				</div>
				<a href="javascript:void(0);" onclick="javascript:goCart();" class="goCart">바로가기</a>
			</div>
		</div>
		<ul class="directLink">
			<li class="talk">
				<div class= "talk-img-cont">
					<span class="talk-img-wrapper">1:1</span>
					<span class="talk-img-wrapper"><img src="<%= request.getContextPath() %>/images/header/sweet-talk.gif" alt="sweettalk" /></span> 
	 				<a href="javascript:goTalk();" class="btnRed" id="sweet-talk-btn">Sweet Talk</a>			
				</div>
				<div class= "cs-talk-wrapper">
					<a class="cs-talk-inner" href="javascript: openChat();" style="padding: 0;">
						<span id="cs-talt-text"> 고객센터 톡</span>
						<span id="cs-talk-img-wrapper"><img id="cs-talk-img" src="<%= request.getContextPath() %>/images/header/customer-support.png" alt="" /> </span>
					</a>
				</div>
			</li>			
		</ul>
</div>
<% if(loginMember != null) {%>
<div>
	<form name="sweetTalkFrm">
			<input type="hidden" name="loginMemberId" id="loginMemberId" value = <%= loginMember.getMemberId() %>/>
	</form>
</div>
<% } %>
		</header>
	</div>
	<script>
	window.onload = () =>{
		
		
	}
	
	// 커뮤티니 메뉴와 스토어 메뉴 전환 자바스크립트
	const styleShow = {"display" : "block"}
	const styleHide = {"display" : "none"}

	$(".community-menu").click = (e) => {
		console.log(e);
		//	$(this).css(styleShow);  
		//	$(this).parent().children().eq(1).css(styleHide);  
	}; 
	
	$(".store-menu").click = (e) => {
		console.log($(this));
			//$(this).css(styleShow);  
		//	$(this).parent().children().eq(0).css(styleHide);  
	}; 
	
	//장바구니 바로가기
	function goCart(){
//		location.href="";
	}


	function delGoods(goodsNo){
		var newGoods = "";
		var cookieGoods = $.cookie("himartGoods");
		if(cookieGoods != null && cookieGoods != ""){
			goodsArray = cookieGoods.split(":");
			for(var i = 0 ; i < goodsArray.length ; i++){
				if(goodsArray[i] == goodsNo){
					continue;
				}
				if(goodsArray[i] != ""){
					newGoods += goodsArray[i] + ":";
				}
			}
			common.setCookie("himartGoods", newGoods);
		}
	}

	// 고객센터 1:1채팅 Sweet Talk
	const openChat = () => {
		const title = "SweetTalkPopup";
		const spec = "width=720px, height=660px";
		const addr = "<%= request.getContextPath() %>/customerservice/sweettalk";
	/* 	const frm = document.sweetTalkFrm;
		 frm.submit(); */
		const popup = open(addr, title, spec);
		
		
	}
	</script>
	<section id="content">
	<%-- <div class="sticky-container2" style="padding: 0;">
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
						<div class="store-menu-container">
							<div class="store-menu-wrapper">
									<a index="0" class="store-home-menu" href="<%= request.getContextPath() %>/store/storeMain">
										<div class="store-home-wrapper">
												<p class="home-text">홈</p>
										</div>
									</a>
									<a index="1" class="store-category-menu" href="<%= request.getContextPath() %>/store/storeCategory">
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
			</div> --%>