<%@page import="product.model.dto.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/productsManage.css" />
<%
	List<Product> productsList = (List<Product>) request.getAttribute("productsList");
	String pagebar = (String) request.getAttribute("pagebar");
	
	String searchType = request.getParameter("searchType");
	String searchKeyword = request.getParameter("searchKeyword");

%>
<section id="product-manage-container">
	<div id="title-wrapper">
		<h2 id="cont-title"> 상품 관리</h2>	
	</div>
	<div id="search-container">
    	<label for="searchType">검색타입 :</label> 
        <select id="searchType">
            <option value="product_id" <%="product_id".equals(searchType) ? "selected" : ""%>>상품아이디</option>		
			<option value="product_name" <%="product_name".equals(searchType)?"selected":""%>>상품명</option>
            <option value="product_main_category" <%="product_main_category".equals(searchType)?"selected":""%>>대분류</option>		
			<option value="product_sub_category" <%="product_sub_category".equals(searchType)?"selected":""%>>소분류</option>
            <option value="product_brand_name" <%="product_brand_name".equals(searchType)?"selected":""%>>브랜드명</option>		
			<option value="product_enroll_date" <%="product_enroll_date".equals(searchType)?"selected":""%>>등록일</option>
        </select>
        <div id="search-productId" class="search-type">
            <form class="search-frm" action="<%=request.getContextPath()%>/admin/productFinder">
                <input type="hidden" name="searchType" value="product_id"/>
                <input type="text" class="input-val" name="searchKeyword"  size="25" placeholder="검색할 제품 아이디를 입력하세요." value="<%= "product_id".equals(searchType) ? searchKeyword : "" %>"/>
                <button type="submit" class="btn-finder">검색</button>			
            </form>	
        </div>
        <div id="search-productName" class="search-type">
            <form class="search-frm" action="<%=request.getContextPath()%>/admin/productFinder">
                <input type="hidden" name="searchType" value="product_name"/>
                <input type="text" class="input-val" name="searchKeyword" size="25" placeholder="검색할 상품명을 입력하세요." value="<%= "product_name".equals(searchType) ? searchKeyword : "" %>"/>
                <button type="submit" class="btn-finder">검색</button>			
            </form>	
        </div>
        <div id="search-productMainCategory" class="search-type">
            <form class="search-frm" action="<%=request.getContextPath()%>/admin/productFinder">
                <input type="hidden" name="searchType" value="product_main_category"/>
                <input type="text" class="input-val" name="searchKeyword" size="25" placeholder="검색할 대분류명을 입력하세요." value="<%= "product_main_category".equals(searchType) ? searchKeyword : "" %>"/>
                <button type="submit" class="btn-finder">검색</button>			
            </form>	
        </div>
        <div id="search-productSubCategory" class="search-type">
            <form class="search-frm" action="<%=request.getContextPath()%>/admin/productFinder">
                <input type="hidden" name="searchType" value="product_sub_category"/>
                <input type="text" class="input-val" name="searchKeyword" size="25" placeholder="검색할 소분류명을 입력하세요." value="<%= "product_sub_category".equals(searchType) ? searchKeyword : "" %>"/>
                <button type="submit" class="btn-finder">검색</button>			
            </form>	
        </div>
        <div id="search-productBrandName" class="search-type">
            <form class="search-frm" action="<%=request.getContextPath()%>/admin/productFinder">
                <input type="hidden" name="searchType" value="product_brand_name"/>
                <input type="text" class="input-val" name="searchKeyword" size="25" placeholder="검색할 브랜드명을 입력하세요." value="<%= "product_brand_name".equals(searchType) ? searchKeyword : "" %>"/>
                <button type="submit" class="btn-finder">검색</button>			
            </form>	
        </div>
        <div id="search-productEnrollDate" class="search-type">
            <form class="search-frm" action="<%=request.getContextPath()%>/admin/productFinder">
                <input type="hidden" name="searchType" value="product_enroll_date"/>
                <input type="text" class="input-val" name="searchKeyword" size="25" placeholder="검색할 상품명을 입력하세요." value="<%= "product_enroll_date".equals(searchType) ? searchKeyword : "" %>"/>
                <button type="submit" class="btn-finder">검색</button>			
            </form>	
        </div>
    </div>
	        <hr class="hr1" />	
	<table id="tbl-product-manage">
		<thead>
			<tr>
				<th>상품 아이디</th>
				<th>상품명</th>
				<th>대분류</th>
				<th>소분류</th>
				<th>브랜드명</th>
				<th>높이</th>
				<th>너비</th>
				<th>깊이</th>
				<th>색상</th>
				<th>가격</th>
				<th>상품등록일</th>
				<th>상품정보수정</th>
				<th>상품삭제</th>
			</tr>
		</thead>
		<tbody>
<%
		if(productsList != null && !productsList.isEmpty()){
			for(Product product : productsList){
%>			
			<tr>
				<td><%= product.getProductId() %></td>
				<td><%= product.getProductName() %></td>
				<td><%= product.getMainCode() %></td>
				<td><%= product.getSubCode() %></td>
				<td><%= product.getBrandId() %></td>
				<td><%= product.getProductHeight() %></td>
				<td><%= product.getProductWidth() %></td>
				<td><%= product.getProductDepth() %></td>
				<td><%= product.getProductColor() %></td>
				<td><%= product.getProductPrice() %></td>
				<td><%= product.getRegDate() %></td>
				<td><button type="button" id="btn-product-update" class="<%= product.getProductId() %>" name="<%= product.getProductName() %>">상품정보 변경</button></td>
				<td><button type="button" id="btn-product-delete" class="<%= product.getProductId() %>" name="<%= product.getProductName() %>">상품 삭제</button> </td>
			</tr>			
<%
			}
		}
		else {
%>			
			<tr>
				<td colspan="13">조회된 상품이 없습니다.</td>
			</tr>
<%
		}
%>		
		</tbody>
	</table>        
	<hr class="hr1" />
	<div class="btn-enroll-wrapper">
		<button id="enrollProduct" type="button" onclick="enrollProduct();">상품 등록</button>
	</div>	
	<div id="pagebar">
		<%= pagebar %>
	</div>
<form 
	action="<%= request.getContextPath() %>/product/productUpdate" 
	name="productUpdateFrm"
	method="GET">
	<input type="hidden" name="productId" />
</form>
<form 
	action="<%= request.getContextPath() %>/product/productDelete" 
	name="productDeleteFrm"
	method="POST">
	<input type="hidden" name="productId" />
</form>
</section>
<script>
window.onload = () => {
	document.querySelectorAll(".search-type").forEach((div) => {
		div.style.display = "none";
	});
	document.querySelector("#search-productId").style.display = "inline-block";
}; 


const enrollProduct = () => {
	location.href="<%= request.getContextPath() %>/product/enrollProduct"
}

 document.querySelector("#btn-product-update").addEventListener('click', (e) => {
		const productId = $("#btn-product-update").attr('class');
		const productName = $("#btn-product-update").attr('name');
	if(confirm(`정말로 [\${productId} : \${productName}] 상품의 정보를 변경하시겠습니까?`)){
	 	const frm = document.productUpdateFrm;
		frm.productId.value = $("#btn-product-update").attr('class');
		frm.submit();
	}
});

document.querySelector("#btn-product-delete").addEventListener('click', (e) => {
	const productName = $("#btn-product-update").attr('name');
	const productId = $("#btn-product-update").attr('class');

	if(confirm(`정말로 [\${productId} : \${productName}] 상품을 삭제하시겠습니까?`)){
	 	const frm = document.productDeleteFrm;
		frm.productId.value = productId;
		frm.submit();
	}
});	 


searchType.addEventListener('change', (e) => {
	const {value} = e.target;  
	
	document.querySelectorAll(".search-type").forEach((div) => {
		div.style.display = "none";
	});
	
	let id = "";
	switch(value){
		case "product_id": id = "search-productId"; break; 
		case "product_name": id = "search-productName"; break; 
		case "product_main_category": id = "search-productMainCategory"; break; 
		case "product_sub_category": id = "search-productSubCategory"; break; 
		case "product_brand_name": id = "search-productBrandName"; break; 
		case "product_enroll_date": id = "search-productEnrollDate"; break; 
 
	}
	document.querySelector(`#\${id}`).style.display = "inline-block";
});
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>