<%@page import="store.controller.StoreMainServlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/storeMenuLeft.css" />
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta charset="UTF-8">

<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
<script src="<%= request.getContextPath() %>/js/storeMenuLeft.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
  <link href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" rel="stylesheet">

<style>
.sidebar{
	position:sticky;
	top:0px;
	height:500px;
}


aside{width:30px; background:white}
</style>

</head>



<aside>
  <div id="w" class="sidebar" align="left" style="width:30%">
    <nav>
      <ul id="nav">
        <li><a href="/store/storeBest">베스트</a>
          <ul>
            <li><a class="sidemenu2" href="<%= request.getContextPath() %>/store/storeBest">실시간</a></li>
            <li><a class="sidemenu2" href="#">역대</a></li>
          </ul>
        </li>
        <li><a href="/store/storeTodayDeal">오늘의 딜</a>
          <ul>
            <li><a class="sidemenu2" href="<%= request.getContextPath() %>/store/storeTodayDeal">리퍼</a></li>
            <li><a class="sidemenu2" href="#">빠른</a></li>
          </ul>
        </li>
        <li><a href="<%= request.getContextPath() %>/store/storeStorage">수납정리</a>
          <ul>
            <li><a class="sidemenu2" href="<%= request.getContextPath() %>/store/storeStorage">추가</a></li>
            <li><a class="sidemenu2" href="#">추가</a></li>
            <li><a class="sidemenu2" href="#">추가</a></li>
          </ul>
        </li>
        <li><a href="<%= request.getContextPath() %>/store/storeLight">조명</a>
          <ul>
            <li><a href="<%= request.getContextPath() %>/store/storeLight">추가</a></li>
            <li><a href="#">추가</a></li>
            <li><a href="#">추가</a></li>
          </ul>
        </li>
        <li><a href="<%= request.getContextPath() %>/store/storeHouseHold">생활용품</a>
          <ul>
            <li><a href="<%= request.getContextPath() %>/store/storeHouseHold">추가</a></li>
            <li><a href="#">추가</a></li>
            <li><a href="#">추가</a></li>
          </ul>
        </li>
        <li><a href="<%= request.getContextPath() %>/store/storeFurnature">가구</a>
          <ul>
            <li><a href="<%= request.getContextPath() %>/store/storeFurnature">추가</a></li>
            <li><a href="#">추가</a></li>
            <li><a href="#">추가</a></li>
          </ul>
        </li>
        <li><a href="<%= request.getContextPath() %>/store/storeElectronics">가전제품</a>
          <ul>
            <li><a href="<%= request.getContextPath() %>/store/storeElectronics">추가</a></li>
            <li><a href="#">추가</a></li>
            <li><a href="#">추가</a></li>
          </ul>
        </li>
      </ul>
    </nav>
  </div>
  </aside>
  
</html>