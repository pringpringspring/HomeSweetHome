<%@page import="store.controller.StoreMainServlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/storeCategory.css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>

<!-- 구글 로그인용 -->

</head>
	
<body>
<body>
	<div id="menu">
	<div style = "float: left">
		<ul class="M01">
		
			<li><a href="/homesweethome/store/storeBest">베스트</a>
				<ul class="M02">
					<li><a href="#">실시간베스트</a>
	                </li>
					<li><a href="#">역대 베스트</a>
	                </li>
				</ul>
			</li>
			<li><a href="/homesweethome/store/storeCategory">카테고리</a>
				<ul class="M02">
					<li><a href="#">수납</a>
						<ul class="M03">
							<li><a href="#">2단소메뉴1</a></li>
							<li><a href="#">2단소메뉴2</a></li>
							<li><a href="#">2단소메뉴3</a></li>
						</ul>
	        		</li>
					<li><a href="#">조명</a>
						<ul class="M03">
							<li><a href="#">2단소메뉴1</a></li>
							<li><a href="#">2단소메뉴2</a></li>
							<li><a href="#">2단소메뉴3</a></li>
						</ul>
	                </li>
					<li><a href="#">생활용품</a>
						<ul class="M03">
							<li><a href="#">2단소메뉴1</a></li>
							<li><a href="#">2단소메뉴2</a></li>
							<li><a href="#">2단소메뉴3</a></li>
						</ul>
					</li>
					<li><a href="#">가구</a>
						<ul class="M03">
							<li><a href="#">2단소메뉴1</a></li>
							<li><a href="#">2단소메뉴2</a></li>
							<li><a href="#">2단소메뉴3</a></li>
						</ul>
					</li>
					<li><a href="#">가전제품</a>
						<ul class="M03">
							<li><a href="#">2단소메뉴1</a></li>
							<li><a href="#">2단소메뉴2</a></li>
							<li><a href="#">2단소메뉴3</a></li>
						</ul>
					</li>
				</ul>
			</li>

			<li><a href="/homesweethome/store/storeTodayDeal">오늘의 딜</a>
				<ul class="M02">
					<li><a href="#">당일특가</a>
	                </li>
					<li><a href="#">리퍼마켓</a>
	                </li>
					<li><a href="#">빠른배송</a>
	                </li>
				</ul>
			</li>
			<li><a href="/homesweethome/store/storeEvent">기획전</a>
				<ul class="M02">
					<li><a href="#">이벤트 상품</a>
	                </li>
				</ul>
			</li>
		</ul>
	</div>

    
</body>
	<section id="content">