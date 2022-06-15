<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/community/mainhome.css" />
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"/>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>


<nav class="navbar">
 <img src="<%= request.getContextPath() %>/images/community/main.png" id="navbarimg">
<div class="img-text">감각적인 셀렉 편집샵 바이어의 안목이 돋보이는 집
<button class= "btn-go"  type="button" onclick="gotoBoard();">보러가기</button>
</div>
<a href="<%= request.getContextPath() %>/event/eventApplyList" >
<img src="<%= request.getContextPath() %>/images/community/s3.JPG"  class="navimg" height="535px"></a>
</nav>


<div class="items">
<div class="lists">
<a href="<%= request.getContextPath() %>/#">
<img src= "<%= request.getContextPath() %>/images/community/drawer.png" class="list_img">
</a>
<h3>수납정리</h3>
</div>

<div class="lists">
<a href="<%= request.getContextPath() %>/#">
<img src= "<%= request.getContextPath() %>/images/community/lamp.png" class="list_img">
</a>
<h3>조명</h3>
</div>

<div class="lists">
<a href="<%= request.getContextPath() %>/#">
<img src= "<%= request.getContextPath() %>/images/community/wipes.png" class="list_img">
</a>
<h3>생활용품</h3>
</div>

<div class="lists">
<a href="<%= request.getContextPath() %>/#">
<img src= "<%= request.getContextPath() %>/images/community/furniture.png" class="list_img">
</a>
<h3>가구</h3>
</div>

<div class="lists">
<a href="<%= request.getContextPath() %>/#">
<img src= "<%= request.getContextPath() %>/images/community/washing-machine.png" class="list_img">
</a>
<h3>가전제품</h3>
</div>
</div>

<script>
const gotoBoard = ()=>{
	location.href = "<%= request.getContextPath() %>/community/picture";
}
</script>

<script>
var slides = document.querySelectorAll('#slides > img');
var prev = document.getElementById("prev");
var next = document.getElementById("next");

var current = 0;

showSlides(current);
prev.onclick = prevSlide;
next.onclick = nextSlide;

function showSlides(n) {
    for(let i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slides[n].style.display = "block";      
}

function prevSlide() {
    if(current > 0) current -= 1;
    else current = slides.length -1;
        showSlides(current);
}

function nextSlide() {
    if(current < slides.length -1) current += 1;
    else current = 0;
       showSlides(current);
}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>