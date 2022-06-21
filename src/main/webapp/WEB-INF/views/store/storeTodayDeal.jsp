<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/storesubmenu.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/storeItem.css" />

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


	
</head>	
<body>


    
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