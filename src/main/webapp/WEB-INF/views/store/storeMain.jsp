<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/storeCategory.css" />

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
    height: 60%;
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


	<!-- Start of Container -->
	<div id="container">
	<!-- Start of Carousel -->
	<div id="demo" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ul class="carousel-indicators">
		  <li data-target="#demo" data-slide-to="0" class="active"></li>
		  <li data-target="#demo" data-slide-to="1"></li>
		  <li data-target="#demo" data-slide-to="2"></li>
		</ul>
        
		<!-- The slideshow -->
		<div class="carousel-inner">
                <div class="carousel-item active">
                    <a href="#"><img src="<%= request.getContextPath()%>/images/11.jpg" alt="first" width="1000" height="300"></a>
                </div>
                <div class="carousel-item">
                    <a href="#"><img src="<%= request.getContextPath()%>/images/22.jpg" alt="second" width="1000" height="300"></a>
                </div>
                <div class="carousel-item">
                    <a href="#"><img src="<%= request.getContextPath()%>/images/33.jpg" alt="thrid" width="1000" height="300"></a>
                </div>
            </div>
        
	     <!-- Left and right controls -->
	     <a class="carousel-control-prev" href="#demo" data-slide="prev">
	       <span class="carousel-control-prev-icon"></span>
	     </a>
	     <a class="carousel-control-next" href="#demo" data-slide="next">
	       <span class="carousel-control-next-icon"></span>
	     </a>
     </div>
     <!-- End of Carousel -->



<%@ include file="/WEB-INF/views/common/footer.jsp" %>