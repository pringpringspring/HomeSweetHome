<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/storeCategory.css" />
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/storesubmenu.jsp" %>
<%@ include file="/WEB-INF/views/store/storeMenuLeft.jsp" %>

<body>
<div style ="margin-left: 15% ">
<article>
	<div class="main-visual-wrap" id="main-visual">
		<div class="main-visual">
			<div class="bx-wrapper">
				<div class="bx-viewport">
					<ul class="slider-box">
						<li class="visual" id="visual-image1" style="background-image: url(<%= request.getContextPath() %>/images/store/carousel5.png);"></li>
						<li class="visual" id="visual-image2" style="background-image: url(<%= request.getContextPath() %>/images/store/carousel1.png);"></li>
						<li class="visual" id="visual-image3" style="background-image: url(<%= request.getContextPath() %>/images/store/carousel2.png);"></li>
						<li class="visual" id="visual-image4" style="background-image: url(<%= request.getContextPath() %>/images/store/carousel3.png);"></li>
						<li class="visual" id="visual-image5" style="background-image: url(<%= request.getContextPath() %>/images/store/carousel4.png);"></li>
					</ul>	
				 </div>
			</div>
		</div>
		<div class="bx-controls">
			<button type="button" class="bx-prev" style="background-image: url(<%= request.getContextPath() %>/images/store/next.png);"></button>
			<div class="paginations"></div>
			<button type="button" class="bx-next" style="background-image: url(<%= request.getContextPath() %>/images/store/next.png);"></button>
		</div> 
	</div>
</article>
	<section class="store-category-list-cont" style="margin-bottom: 2rem; margin-left:1rem;">
		<h1 class="store-category-list-title">공간별 가구찾기</h1>
		<div class="category-list-wrap" >
			<div class="category-list-fold" style="transition-duration: 0ms; transform: translateX(0%); margin-left: 10rem;">
				<div class="category-item-wrap">
					<a href="/store/category?category=0&amp;order=popular&amp;affect_type=StoreHomeCategory&amp;affect_id=1">
						<div class="category-item">
								<img class="category-item-image" src="<%= request.getContextPath() %>/images/store/bedroom.png" width="300px" height="300px">
						</div>
					</a>
				</div>
				<div class="category-item-wrap">
					<a href="/store/category?category=0&amp;order=popular&amp;affect_type=StoreHomeCategory&amp;affect_id=1">
						<div class="category-item" style="margin-left:20px">
								<img class="category-item-image" src="<%= request.getContextPath() %>/images/store/livingroom.png" width="300px" height="300px">
						</div>
					</a>
				</div>
				<div class="category-item-wrap">
					<a href="/store/category?category=0&amp;order=popular&amp;affect_type=StoreHomeCategory&amp;affect_id=1">
						<div class="category-item" style="margin-right:7px">
								<img class="category-item-image" src="<%= request.getContextPath() %>/images/store/kitchen.png" width="300px" height="300px">
						</div>
					</a>
				</div>
				<div class="category-item-wrap">
					<a href="/store/category?category=0&amp;order=popular&amp;affect_type=StoreHomeCategory&amp;affect_id=1">
						<div class="category-item" style="margin-top:8px">
								<img class="category-item-image" src="<%= request.getContextPath() %>/images/store/studyroom.png" width="300px" height="300px">
						</div>
					</a>
				</div>
			</div>
		</div>
	</section>
	<section class="store-today-deal-list-section" >
		<header class="store-index-today-deal-list-header" style="margin-left:1rem;">
			<h1 class="store-index-today-deal-list-title" >#지금은 할인중</h1>
			<a class="store-index-today-deal-list-detail-link" href="/store/todayDeal">더보기</a>
		</header>
		<div class="store-today-deal-list-content">
			<div class="today-deal-item-cont">
				<div class="today-deal-item-wrapper">
					<article class="today-deal-item">
						<a class="today-deal-item-overlay" href="/productions/340007/selling?affect_type=StoreHomeDeal&amp;affect_id=1"></a>
						<div class="today-deal-item-image">
							<div class="today-deal-item-image-item">
								<div class="production-item-image">
									<img class="product-image" alt="" src="<%= request.getContextPath() %>/images/store/deal/microwave.png">
								</div>
							</div>
						</div>
						<div class="today-deal-item-content">
							<div class="today-deal-item-content-wrap">
								<h1 class="today-deal-item-header">
									<span class="today-deal-item-header-brand">가구레시피 </span>
									<span class="today-deal-item-header-name"> 국내생산 조립식 렌지대/선반</span>
								</h1>
								<span class="production-item-price">
									<span class="production-item-price-rate">40<span class="percentage">% </span></span>
									<span class="production-item-price-price">17,900</span>
								</span>
							</div>
						</div>
					</article>
				</div>
			</div>
			<div class="today-deal-item-cont">
				<div class="today-deal-item-wrapper">
					<article class="today-deal-item">
						<a class="today-deal-item-overlay" href="/productions/340007/selling?affect_type=StoreHomeDeal&amp;affect_id=1"></a>
						<div class="today-deal-item-image">
							<div class="today-deal-item-image-item">
								<div class="production-item-image">
									<img class="product-image" alt="" src="<%= request.getContextPath() %>/images/store/deal/furnitureset.png">
								</div>
							</div>
						</div>
						<div class="today-deal-item-content">
							<div class="today-deal-item-content-wrap">
								<h1 class="today-deal-item-header">
									<span class="today-deal-item-header-brand">오트밀하우스 </span>
									<span class="today-deal-item-header-name">인기 소파/식탁/서랍/옷장/거울</span>
								</h1>
								<span class="production-item-price">
									<span class="production-item-price-rate">47<span class="percentage">% </span></span>
									<span class="production-item-price-price">155,000</span>
								</span>
							</div>
						</div>
					</article>
				</div>
			</div>
			<div class="today-deal-item-cont">
				<div class="today-deal-item-wrapper">
					<article class="today-deal-item">
						<a class="today-deal-item-overlay" href="/productions/340007/selling?affect_type=StoreHomeDeal&amp;affect_id=1"></a>
						<div class="today-deal-item-image">
							<div class="today-deal-item-image-item">
								<div class="production-item-image">
									<img class="product-image" alt="" src="<%= request.getContextPath() %>/images/store/deal/foldingchair.png">									
								</div>
							</div>
						</div>
						<div class="today-deal-item-content">
							<div class="today-deal-item-content-wrap">
								<h1 class="today-deal-item-header">
									<span class="today-deal-item-header-brand">룸플러스 </span>
									<span class="today-deal-item-header-name">미드센츄리 투명 폴딩체어</span>
								</h1>
								<span class="production-item-price">
									<span class="production-item-price-rate">64<span class="percentage">% </span></span>
									<span class="production-item-price-price">35,400</span>
								</span>
							</div>
						</div>
					</article>
				</div>
			</div>
			<div class="today-deal-item-cont">
				<div class="today-deal-item-wrapper">
					<article class="today-deal-item">
						<a class="today-deal-item-overlay" href="/productions/340007/selling?affect_type=StoreHomeDeal&amp;affect_id=1"></a>
						<div class="today-deal-item-image">
							<div class="today-deal-item-image-item">
								<div class="production-item-image">
									<img class="product-image" alt="" src="<%= request.getContextPath() %>/images/store/deal/acebed.png">
								</div>
							</div>
						</div>
						<div class="today-deal-item-content">
							<div class="today-deal-item-content-wrap">
								<h1 class="today-deal-item-header">
									<span class="today-deal-item-header-brand">에이스침대 </span>
									<span class="today-deal-item-header-name">에이스침대 메트리스 모음 </span>
								</h1>
								<span class="production-item-price">
									<span class="production-item-price-rate">16<span class="percentage">% </span></span>
									<span class="production-item-price-price">340,200</span>
								</span>
							</div>
						</div>
					</article>
				</div>
			</div>
			<div class="today-deal-item-cont">
				<div class="today-deal-item-wrapper">
					<article class="today-deal-item">
						<a class="today-deal-item-overlay" href="/productions/340007/selling?affect_type=StoreHomeDeal&amp;affect_id=1"></a>
						<div class="today-deal-item-image">
							<div class="today-deal-item-image-item">
								<div class="production-item-image">
									<img class="product-image" alt="" src="<%= request.getContextPath() %>/images/store/deal/recyclebag.png">									
								</div>
							</div>
						</div>
						<div class="today-deal-item-content">
							<div class="today-deal-item-content-wrap">
								<h1 class="today-deal-item-header">
									<span class="today-deal-item-header-brand">네이쳐리빙 </span>
									<span class="today-deal-item-header-name">재활용 분리수거함</span>
								</h1>
								<span class="production-item-price">
									<span class="production-item-price-rate">58<span class="percentage">% </span></span>
									<span class="production-item-price-price">7,500</span>
								</span>
							</div>
						</div>
					</article>
				</div>
			</div>
		</div>
	</section>
	
	
</body>



<script>

// 캐러셀
	const list = document.querySelector('.slider-box');
	const items = document.querySelectorAll('.visual');
	const btnPrev = document.querySelector('.bx-prev');
	const btnNext = document.querySelector('.bx-next');
	const paginations = document.querySelector('.paginations');
	const lastIndex = items.length - 1;
	let selected = 0;
	let interval;
	
	
	const setTransition = (value) => {
	  list.style.transition = value;
	};
	
	const setTranslate = ({ index, reset }) => {
	  if (reset) {
	    list.style.transform = `translate(-\${list.clientWidth}px, 0)`;
	  }
	  else {
	    list.style.transform = `translate(-\${(index + 1) * list.clientWidth}px, 0)`;
	  }  
	};
	
	const activePagination = (index) => {
	  [...paginations.children].forEach((pagination) => {
	    pagination.classList.remove('active');
	  });
	  paginations.children[index].classList.add('active');
	};
	
	const handlePagination = (e) => {
	  if (e.target.dataset.num) {
	    selected = parseInt(e.target.dataset.num);
	    setTransition('all 0.3s linear');
	    setTranslate({ index: selected });
	    activePagination(selected);
	  }
	};
	
	const makePagination = () => {
	  if (items.length > 1) {
	    for (let i = 0; i < items.length; i++) {
	      const button = document.createElement('li');
	      button.dataset.num = i;
	      button.style.backgroundImage = "url(<%= request.getContextPath() %>/images/store/circle.png)";
	      button.classList.add('pagination');
	      if (i === 0) {
	        button.classList.add('active');
	      }
	      paginations.appendChild(button);
	      paginations.addEventListener('click', handlePagination);
	    }
	  }
	};
	
	
	const handlePrev = () => {
	  selected -= 1;
	  setTransition('transform 0.3s linear');
	  setTranslate({ index: selected });
	  if (selected < 0) {
	    selected = lastIndex;
	    setTimeout(() => {
	      setTransition('');
	      setTranslate({ index: selected });
	    }, 300);
	  }
	  if (selected >= 0) activePagination(selected);
	};
	
	const handleNext = () => {
	  console.log(selected);
	  selected += 1;
	  setTransition('transform 0.3s linear');
	  setTranslate({ index: selected });
	  if (selected > lastIndex) {
	    selected = 0;
	    setTimeout(() => {
	      setTransition('');
	      setTranslate({ index: selected });
	    }, 300);
	  }
	  if (selected <= lastIndex) activePagination(selected);
	};
	
	const clickButton = () => {
	  if (items.length > 1) {
	    btnPrev.addEventListener('click', handlePrev);
	    btnNext.addEventListener('click', handleNext);
	  }
	};
	
	
	const cloneElement = () => {
	  list.prepend(items[lastIndex].cloneNode(true));
	  list.append(items[0].cloneNode(true));
	  setTranslate({ reset: true });
	};
	
	
	const autoplayIterator = () => {
	  selected += 1;
	  setTransition('all 0.3s linear');
	  setTranslate({ index: selected });
	  if (selected > lastIndex) {
	    activePagination(0);
	    clearInterval(interval);
	    setTimeout(() => {
	      selected = 0;
	      setTransition('');
	      setTranslate({ reset: true });
	      autoplay({ duration: 4000 });
	    }, 300);
	  }
	  if (selected <= lastIndex) activePagination(selected);
	};
	
	const autoplay = ({ duration }) => {
	  interval = setInterval(autoplayIterator, duration);
	};
	    
	const render = () => {
	  clickButton();
	  makePagination();
	  cloneElement();
	  autoplay({ duration: 4000 });
	};
	render();
</script>
			

<%@ include file="/WEB-INF/views/common/footer.jsp" %>