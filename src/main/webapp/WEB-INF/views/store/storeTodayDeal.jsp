<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/storeItem.css" />

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
    src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 
<style>
.hbox-menu {
    margin-top:15px;
    width:70%;
    border-top:1px solid #615C55;
    border-bottom:1px solid #615C55;
    display: inline-block;
    overflow: hidden;
  	text-align: center;
  	display: inline-block
}

.hbox-menu li {
    float: left;
    width:20%; 
  	text-align: center;
  	display: inline-block
}

.hbox-menu a {
    display: block;
    text-align:center;
    height: 50px;
    line-height: 50px;
    background-color: white;
    color: #34C5F0;
    font-weight:bold;    
}

.hbox-menu li:last-child a { 
    border-right: 50%;
}
</style>
	
</head>	
<body>
<div>
    <ul class="hbox-menu">
    <li><a onclick= href="<%= request.getContextPath() %>/store/storeMain">스토어 홈</a></li>
    <li><a onclick= href="<%= request.getContextPath() %>/store/storeCategory">카테고리</a></li>
    <li><a onclick= href="<%= request.getContextPath() %>/store/storeBest">베스트</a></li>
    <li><a onclick= href="<%= request.getContextPath() %>/store/storeTodayDeal">오늘의 딜</a></li>
    <li><a onclick= href="<%= request.getContextPath() %>/store/storeEvent">기획전</a></li> 
    </ul>
</div>

    
	<h2 align="left" style="margin-top:60px; margin-left:20%;"> 오늘의 딜! </h2>	
	<h5 align="left" style="margin-left:20%;">매일 새로운 특가상품!</h5>
		


<div class="list con">
    <ul class="row">
        <li class="cell">
            <div class="img-box"><img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/164455726167952635.jpg?gif=1&w=640&h=640&c=c" alt="first"></div>
            <div class="product-name">샘플용</div>
            <div class="product-price">1000 </div>
        </li>
        <li class="cell">
            <div class="img-box"><img src="<%= request.getContextPath()%>/images/1.png" alt="first"></div>
            <div class="product-name">1번째줄 테스트</div>
            <div class="product-price">가격 </div>
        </li>
        <li class="cell">
            <div class="img-box"><img src="<%= request.getContextPath()%>/images/1.png" alt="first"></div>
            <div class="product-name">1번째줄 테스트</div>
            <div class="product-price">가격 </div>
        </li>
        <li class="cell">
            <div class="img-box"><img src="<%= request.getContextPath()%>/images/1.png" alt="first"></div>
            <div class="product-name">1번째줄 테스트</div>
            <div class="product-price">가격 </div>
        </li>
        <li class="cell">
            <div class="img-box"><img src="<%= request.getContextPath()%>/images/2.png" alt="second"></div>
            <div class="product-name">2번째줄 테스트</div>
            <div class="product-price">가격 </div>
        </li>
        <li class="cell">
            <div class="img-box"><img src="<%= request.getContextPath()%>/images/2.png" alt="second"></div>
            <div class="product-name">2번째줄 테스트</div>
            <div class="product-price">가격 </div>
        </li>
        <li class="cell">
            <div class="img-box"><img src="<%= request.getContextPath()%>/images/2.png" alt="second"></div>
            <div class="product-name">2번째줄 테스트</div>
            <div class="product-price">가격 </div>
        </li>
        <li class="cell">
            <div class="img-box"><img src="<%= request.getContextPath()%>/images/2.png" alt="second"></div>
            <div class="product-name">2번째줄 테스트</div>
            <div class="product-price">가격 </div>
        </li>
        <li class="cell">
            <div class="img-box"><img src="<%= request.getContextPath()%>/images/3.png" alt="second"></div>
            <div class="product-name">3번째줄 테스트</div>
            <div class="product-price">가격 </div>
        </li>
        <li class="cell">
            <div class="img-box"><img src="<%= request.getContextPath()%>/images/3.png" alt="second"></div>
            <div class="product-name">3번째줄 테스트</div>
            <div class="product-price">가격 </div>
        </li>
        <li class="cell">
            <div class="img-box"><img src="<%= request.getContextPath()%>/images/3.png" alt="second"></div>
            <div class="product-name">3번째줄 테스트</div>
            <div class="product-price">가격 </div>
        </li>
        <li class="cell">
            <div class="img-box"><img src="<%= request.getContextPath()%>/images/3.png" alt="second"></div>
            <div class="product-name">3번째줄 테스트</div>
            <div class="product-price">가격 </div>
        </li>
    </ul>
</div>
    
    
    
</body>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>