<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/storeCategory.css" />
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/store/storeMenuLeft.jsp" %>

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
.carousel-inner img {
    width: 100%;
    height: 100%;
}
.carousel-item {
  height: 500px;;
  min-height: 200px;
  background: no-repeat center center scroll;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}

</style>


<head>


	<h2 align="center" style="margin-top:100px;"> 카테고리 페이지 입니다.</h2>	
	
</head>	
<body>
	<div style="width: 100%" class="container">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <ul class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ul>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <a href="#"><img src="<%= request.getContextPath()%>/images/11.jpg" alt="first" width="1000" height="500"></a>
                </div>
                <div class="carousel-item">
                    <a href="#"><img src="<%= request.getContextPath()%>/images/22.jpg" alt="second" width="700" height="500"></a>
                </div>
                <div class="carousel-item">
                    <a href="#"><img src="<%= request.getContextPath()%>/images/33.jpg" alt="thrid" width="700" height="500"></a>
                </div>
            </div>
            <!-- 좌우 화살표, 방향키 -->
            <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#myCarousel" data-slide="next"> 
                <span class="carousel-control-next-icon"></span>
            </a>
        </div>
    </div>

    
	<h2 align="center" style="margin-top:100px;"> 공간별 가구찾기 </h2>	
		
	<div align="center">
	 	<a href="#"><img alt="first" src="<%= request.getContextPath()%>/images/livingroom.png" width="100" height="100" /></a>
 		<a href="#"><img alt="second" src="<%= request.getContextPath()%>/images/kitchen.jpg" width="100" height="100" /></a>
		<a href="#"><img alt="third" src="<%= request.getContextPath()%>/images/room.png" width="100" height="100" /></a>
	</div>
    
    
    
</body>
			


			

<%@ include file="/WEB-INF/views/common/footer.jsp" %>