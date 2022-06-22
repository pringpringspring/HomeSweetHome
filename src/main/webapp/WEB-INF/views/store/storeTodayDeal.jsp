<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/storesubmenu.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/storeItem.css" />


<article>
<div style="margin-left:20%; margin-right:20%; display:inline-block; vertical-align: middle; flex-wrap: wrap; width:1400px; float:left;">
	<section class="store-today-deal-list-section" >
		<header class="store-index-today-deal-list-header">
			<h1 class="store-index-today-deal-list-title" style="margin-left: 0rem">오늘의딜</h1>
		</header>
		<div class="store-today-deal-list-content" >
			<div class="today-deal-item-cont">
				<div class="today-deal-item-wrapper">
					<article class="today-deal-item">
						<a class="today-deal-item-overlay" href="/productions/340007/selling?affect_type=StoreHomeDeal&amp;affect_id=1"></a>
						<div class="today-deal-item-image">
							<div class="today-deal-item-image-item">
								<div class="production-item-image">
									<img class="product-image" alt="" src="<%= request.getContextPath() %>/images/store/deal/candle-warmer.png">
								</div>
							</div>
						</div>
						<div class="today-deal-item-content">
							<div class="today-deal-item-content-wrap">
								<h1 class="today-deal-item-header">
									<span class="today-deal-item-header-brand">오아 </span>
									<span class="today-deal-item-header-name">무드등 타이머 높이조절 캔들워머</span>
								</h1>
								<span class="production-item-price">
									<span class="production-item-price-rate">33<span class="percentage">% </span></span>
									<span class="production-item-price-price">39,990</span>
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
									<img class="product-image" alt="" src="<%= request.getContextPath() %>/images/store/deal/hotel-bed.png">
								</div>
							</div>
						</div>
						<div class="today-deal-item-content">
							<div class="today-deal-item-content-wrap">
								<h1 class="today-deal-item-header">
									<span class="today-deal-item-header-brand">삼익가구 </span>
									<span class="today-deal-item-header-name">델루나 LED 프리미엄 수납 호텔 침대</span>
								</h1>
								<span class="production-item-price">
									<span class="production-item-price-rate">41<span class="percentage">% </span></span>
									<span class="production-item-price-price">359,000</span>
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
									<img class="product-image" alt="" src="<%= request.getContextPath() %>/images/store/deal/hotel-towel.png">									
								</div>
							</div>
						</div>
						<div class="today-deal-item-content">
							<div class="today-deal-item-content-wrap">
								<h1 class="today-deal-item-header">
									<span class="today-deal-item-header-brand">코튼 리빙 </span>
									<span class="today-deal-item-header-name">코마사 40수 수건 10장</span>
								</h1>
								<span class="production-item-price">
									<span class="production-item-price-rate">61<span class="percentage">% </span></span>
									<span class="production-item-price-price">27,900</span>
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
									<img class="product-image" alt="" src="<%= request.getContextPath() %>/images/store/deal/non-slip-hanger.png">
								</div>
							</div>
						</div>
						<div class="today-deal-item-content">
							<div class="today-deal-item-content-wrap">
								<h1 class="today-deal-item-header">
									<span class="today-deal-item-header-brand">디얼리빙 </span>
									<span class="today-deal-item-header-name">논슬립 바지걸이 20개 </span>
								</h1>
								<span class="production-item-price">
									<span class="production-item-price-rate">61<span class="percentage">% </span></span>
									<span class="production-item-price-price">8,900</span>
								</span>
							</div>
						</div>
					</article>
				</div>
			</div>
		</div>
			
	
	<div class="store-today-deal-list-content" >
			<div class="today-deal-item-cont">
				<div class="today-deal-item-wrapper">
					<article class="today-deal-item">
						<a class="today-deal-item-overlay" href="/productions/340007/selling?affect_type=StoreHomeDeal&amp;affect_id=1"></a>
						<div class="today-deal-item-image">
							<div class="today-deal-item-image-item">
								<div class="production-item-image">
									<img class="product-image" alt="" src="<%= request.getContextPath() %>/images/store/deal/candle-warmer.png">
								</div>
							</div>
						</div>
						<div class="today-deal-item-content">
							<div class="today-deal-item-content-wrap">
								<h1 class="today-deal-item-header">
									<span class="today-deal-item-header-brand">오아 </span>
									<span class="today-deal-item-header-name">무드등 타이머 높이조절 캔들워머</span>
								</h1>
								<span class="production-item-price">
									<span class="production-item-price-rate">33<span class="percentage">% </span></span>
									<span class="production-item-price-price">39,990</span>
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
									<img class="product-image" alt="" src="<%= request.getContextPath() %>/images/store/deal/hotel-bed.png">
								</div>
							</div>
						</div>
						<div class="today-deal-item-content">
							<div class="today-deal-item-content-wrap">
								<h1 class="today-deal-item-header">
									<span class="today-deal-item-header-brand">삼익가구 </span>
									<span class="today-deal-item-header-name">델루나 LED 프리미엄 수납 호텔 침대</span>
								</h1>
								<span class="production-item-price">
									<span class="production-item-price-rate">41<span class="percentage">% </span></span>
									<span class="production-item-price-price">359,000</span>
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
									<img class="product-image" alt="" src="<%= request.getContextPath() %>/images/store/deal/hotel-towel.png">									
								</div>
							</div>
						</div>
						<div class="today-deal-item-content">
							<div class="today-deal-item-content-wrap">
								<h1 class="today-deal-item-header">
									<span class="today-deal-item-header-brand">코튼 리빙 </span>
									<span class="today-deal-item-header-name">코마사 40수 수건 10장</span>
								</h1>
								<span class="production-item-price">
									<span class="production-item-price-rate">61<span class="percentage">% </span></span>
									<span class="production-item-price-price">27,900</span>
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
									<img class="product-image" alt="" src="<%= request.getContextPath() %>/images/store/deal/non-slip-hanger.png">
								</div>
							</div>
						</div>
						<div class="today-deal-item-content">
							<div class="today-deal-item-content-wrap">
								<h1 class="today-deal-item-header">
									<span class="today-deal-item-header-brand">디얼리빙 </span>
									<span class="today-deal-item-header-name">논슬립 바지걸이 20개 </span>
								</h1>
								<span class="production-item-price">
									<span class="production-item-price-rate">61<span class="percentage">% </span></span>
									<span class="production-item-price-price">8,900</span>
								</span>
							</div>
						</div>
					</article>
				</div>
			</div>
		</div>
	
	<div class="store-today-deal-list-content" >
			<div class="today-deal-item-cont">
				<div class="today-deal-item-wrapper">
					<article class="today-deal-item">
						<a class="today-deal-item-overlay" href="/productions/340007/selling?affect_type=StoreHomeDeal&amp;affect_id=1"></a>
						<div class="today-deal-item-image">
							<div class="today-deal-item-image-item">
								<div class="production-item-image">
									<img class="product-image" alt="" src="<%= request.getContextPath() %>/images/store/deal/candle-warmer.png">
								</div>
							</div>
						</div>
						<div class="today-deal-item-content">
							<div class="today-deal-item-content-wrap">
								<h1 class="today-deal-item-header">
									<span class="today-deal-item-header-brand">오아 </span>
									<span class="today-deal-item-header-name">무드등 타이머 높이조절 캔들워머</span>
								</h1>
								<span class="production-item-price">
									<span class="production-item-price-rate">33<span class="percentage">% </span></span>
									<span class="production-item-price-price">39,990</span>
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
									<img class="product-image" alt="" src="<%= request.getContextPath() %>/images/store/deal/hotel-bed.png">
								</div>
							</div>
						</div>
						<div class="today-deal-item-content">
							<div class="today-deal-item-content-wrap">
								<h1 class="today-deal-item-header">
									<span class="today-deal-item-header-brand">삼익가구 </span>
									<span class="today-deal-item-header-name">델루나 LED 프리미엄 수납 호텔 침대</span>
								</h1>
								<span class="production-item-price">
									<span class="production-item-price-rate">41<span class="percentage">% </span></span>
									<span class="production-item-price-price">359,000</span>
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
									<img class="product-image" alt="" src="<%= request.getContextPath() %>/images/store/deal/hotel-towel.png">									
								</div>
							</div>
						</div>
						<div class="today-deal-item-content">
							<div class="today-deal-item-content-wrap">
								<h1 class="today-deal-item-header">
									<span class="today-deal-item-header-brand">코튼 리빙 </span>
									<span class="today-deal-item-header-name">코마사 40수 수건 10장</span>
								</h1>
								<span class="production-item-price">
									<span class="production-item-price-rate">61<span class="percentage">% </span></span>
									<span class="production-item-price-price">27,900</span>
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
									<img class="product-image" alt="" src="<%= request.getContextPath() %>/images/store/deal/non-slip-hanger.png">
								</div>
							</div>
						</div>
						<div class="today-deal-item-content">
							<div class="today-deal-item-content-wrap">
								<h1 class="today-deal-item-header">
									<span class="today-deal-item-header-brand">디얼리빙 </span>
									<span class="today-deal-item-header-name">논슬립 바지걸이 20개 </span>
								</h1>
								<span class="production-item-price">
									<span class="production-item-price-rate">61<span class="percentage">% </span></span>
									<span class="production-item-price-price">8,900</span>
								</span>
							</div>
						</div>
					</article>
				</div>
			</div>
		</div>
	
	<div class="store-today-deal-list-content" >
			<div class="today-deal-item-cont">
				<div class="today-deal-item-wrapper">
					<article class="today-deal-item">
						<a class="today-deal-item-overlay" href="/productions/340007/selling?affect_type=StoreHomeDeal&amp;affect_id=1"></a>
						<div class="today-deal-item-image">
							<div class="today-deal-item-image-item">
								<div class="production-item-image">
									<img class="product-image" alt="" src="<%= request.getContextPath() %>/images/store/deal/candle-warmer.png">
								</div>
							</div>
						</div>
						<div class="today-deal-item-content">
							<div class="today-deal-item-content-wrap">
								<h1 class="today-deal-item-header">
									<span class="today-deal-item-header-brand">오아 </span>
									<span class="today-deal-item-header-name">무드등 타이머 높이조절 캔들워머</span>
								</h1>
								<span class="production-item-price">
									<span class="production-item-price-rate">33<span class="percentage">% </span></span>
									<span class="production-item-price-price">39,990</span>
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
									<img class="product-image" alt="" src="<%= request.getContextPath() %>/images/store/deal/hotel-bed.png">
								</div>
							</div>
						</div>
						<div class="today-deal-item-content">
							<div class="today-deal-item-content-wrap">
								<h1 class="today-deal-item-header">
									<span class="today-deal-item-header-brand">삼익가구 </span>
									<span class="today-deal-item-header-name">델루나 LED 프리미엄 수납 호텔 침대</span>
								</h1>
								<span class="production-item-price">
									<span class="production-item-price-rate">41<span class="percentage">% </span></span>
									<span class="production-item-price-price">359,000</span>
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
									<img class="product-image" alt="" src="<%= request.getContextPath() %>/images/store/deal/hotel-towel.png">									
								</div>
							</div>
						</div>
						<div class="today-deal-item-content">
							<div class="today-deal-item-content-wrap">
								<h1 class="today-deal-item-header">
									<span class="today-deal-item-header-brand">코튼 리빙 </span>
									<span class="today-deal-item-header-name">코마사 40수 수건 10장</span>
								</h1>
								<span class="production-item-price">
									<span class="production-item-price-rate">61<span class="percentage">% </span></span>
									<span class="production-item-price-price">27,900</span>
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
									<img class="product-image" alt="" src="<%= request.getContextPath() %>/images/store/deal/non-slip-hanger.png">
								</div>
							</div>
						</div>
						<div class="today-deal-item-content">
							<div class="today-deal-item-content-wrap">
								<h1 class="today-deal-item-header">
									<span class="today-deal-item-header-brand">디얼리빙 </span>
									<span class="today-deal-item-header-name">논슬립 바지걸이 20개 </span>
								</h1>
								<span class="production-item-price">
									<span class="production-item-price-rate">61<span class="percentage">% </span></span>
									<span class="production-item-price-price">8,900</span>
								</span>
							</div>
						</div>
					</article>
				</div>
			</div>
		</div>
	</section>
</div>
</article>
    

<%@ include file="/WEB-INF/views/common/footer.jsp" %>