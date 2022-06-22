<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
			<div class="sticky-container2">
				<div class="submenu-container">
					<div class="submenu-nav-wrapper">
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
			</div>