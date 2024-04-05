<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%><!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
<meta charset="utf-8" />
<title>Simply Amazed HTML Template by Tooplate</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
   href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@300;400&display=swap"
   rel="stylesheet">
<link rel="stylesheet" href="resources/css/bootstrap.min.css"
   type="text/css" />
<link rel="stylesheet" href="resources/fontawesome/css/all.min.css"
   type="text/css" />
<link rel="stylesheet" href="resources/css/slick.css" type="text/css" />
<link rel="stylesheet" href="resources/css/tooplate-simply-amazed.css"
   type="text/css" />
<style>
/* 기본 버튼 스타일 */
.btn-1 {
   background-color: gray; /* 버튼 배경색 */
   border: 0; /* 테두리 없음 */
   color: white; /* 텍스트 색상 */
   padding: 10px 20px; /* 안쪽 여백 */
   text-align: center; /* 텍스트 중앙 정렬 */
   text-decoration: none; /* 텍스트에 밑줄 없음 */
   display: inline-block; /* 인라인 요소로 표시 */
   font-size: 16px; /* 폰트 크기 */
   margin: 4px 2px; /* 바깥쪽 여백 */
   cursor: pointer; /* 커서 스타일 */
   border-radius: 20px; /* 버튼 모서리 둥글게 */
   margin-right: 100px;
   margin-left: 100px;
   width: 300px; /* 버튼의 너비 */
   height: 100px; /* 버튼의 높이 */
   font-size: 20px;
   font-weight: bold;
   margin-top: 100px;
}

.btn-2 {
   background-color: #597C45; /* 버튼 배경색 */
   border: 0; /* 테두리 없음 */
   color: white; /* 텍스트 색상 */
   padding: 10px 20px; /* 안쪽 여백 */
   text-align: center; /* 텍스트 중앙 정렬 */
   text-decoration: none; /* 텍스트에 밑줄 없음 */
   display: inline-block; /* 인라인 요소로 표시 */
   font-size: 16px; /* 폰트 크기 */
   margin: 4px 2px; /* 바깥쪽 여백 */
   cursor: pointer; /* 커서 스타일 */
   border-radius: 20px; /* 버튼 모서리 둥글게 */
   margin-right: 100px;
   margin-left: 100px;
   width: 500px; /* 버튼의 너비 */
   height: 100px; /* 버튼의 높이 */
   font-size: 24px;
   font-weight: bold;
   margin-top: 50px;
}

/* 호버 효과 */
.btn-2:hover {
   background-color: #3E7648; /* 호버 시 배경색 변경 */
   color: black;
}

.gallery-section {
   background-color: #f8f9fa;
}

.btn-1:hover {
   background-color: lightgreen;
   color: black;
}

.parallax-window {
   background: #393f45;
   padding: 0px;
}

.body {
   background-color: #393f45;
}

h1 {
   font-weight: bold;
}

h3 {
   color: white;
   margin-top: 50px;
   font-weight: bold;
   text-align: left;
}

#content-box {
   top: 0;
   left: 0;
   width: 100%;
   z-index: 1000;
}

td {
   color: white;
}

th {
   color: white;
}

body {
   font-family: Arial, sans-serif;
   margin: 0;
   padding: 0;
   background-color: #f2f2f2;
}

.container {
   max-width: 1200px;
   margin: 20px auto;
   padding: 20px;
   background-color: #393f45;
   border-radius: 10px;
}

/* 탭과 컨테이너 스타일 */
.tab-container {
   display: flex;
   flex-direction: column;
}

.tabs {
   display: flex;
   border-bottom: 1px solid #ddd;
}

.tab {
   flex: 1;
   height: 120px;
   background-color: #3E7648;
   border-right: 1px solid #ddd;
   cursor: pointer;
   display: flex;
   justify-content: center;
   align-items: center;
   font-weight: bold;
   text-transform: uppercase;
   transition: background-color 0.3s;
   color: #F3F3F3;
}

a {
   text-decoration: none;
   color: #fff;
}

.tab:hover {
   background-color: #333333; /* 더 어두운 회색 */
}

.tab:last-child {
   border-right: none;
}

.active-tab {
   background-color: #3498db;
   color: #fff;
   box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

.content-container {
   display: flex;
}

.left-content {
   width: 39%;
   height: 315.72px;
   background-color: #4a4a4a;
   overflow-y: auto;
   padding: 20px;
   color: #fff;
   box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
   position: relative;
   z-index: 999;
}

.right-content {
   width: 60%;
   background-color: lightgray;
   overflow-y: auto;
   padding: 20px;
   border-left: 1px solid #ddd;
   font-weight: bold;
   position: relative;
   z-index: 3;
}

.first-null-page {
   width: 2000px;
   height: 315.72px;
   background-color: lightgray;
   overflow-y: auto;
   padding: 20px;
   border-left: 1px solid #ddd;
   right: 25px;
   position: absolute;
   z-index: 4;
}

/* 주문 목록 스타일 */
.left-content ul {
   padding: 0;
   list-style: none;
   margin-top: 0;
}

.left-content ul li {
   padding: 13px;
   border-bottom: 1px solid #ddd;
   cursor: pointer;
   transition: background-color 0.3s;
   font-weight: bold;
}

.left-content ul li:hover {
   background-color: #333333; /* 더 어두운 회색 */
}

.left-content ul li:last-child {
   border-bottom: none;
}

/* 주문 내용 스타일 */
.order-info p {
   margin: 5px 0;
}

.order-info span {
   font-weight: bold;
   margin-left: 5px;
}

/* 버튼 스타일 */
button {
   padding: 10px 20px;
   background-color: #3498db;
   color: #fff;
   border: none;
   border-radius: 5px;
   cursor: pointer;
   transition: background-color 0.3s;
}

button:hover {
   background-color: #2980b9;
}

.fa-solid {
   font-size: 20px;
}

.home-tag {
   background: #1F1F77;
}

#detail {
   overflow-y: hidden;
}

.page-name-box {
   height: 75px;
   background-color: #181818;
   color: #E1E1E1;
   font-size: 30px;
   font-weight: bold;
   padding-left: 30px;
   padding-top: 15px;
   padding: 15px 0px 20px 30px;
}

.a-tag-font-size{
   font-size: 22px;
}

.home-tag{
   background:  #1C7D80;
}
</style>
</head>
<body>

   <div class="tabs">
      <div class="tab home-tag" onclick="openTab(0)" id="tab1">
         <a href="goIndex"><i class="fa-solid fa-house"></i></a>
      </div>

      <div class="tab" onclick="openTab(1)" id="tab1">
         <a href="goStoreOrder" class="a-tag-font-size">주문 관리</a>
      </div>

      <div class="tab" onclick="openTab(2)" id="tab2">
         <a href="goReservation" class="a-tag-font-size">완료주문관리</a>
      </div>

      <div class="tab" onclick="openTab(3)" id="tab3">
         <a href="goConMenu" class="a-tag-font-size">메뉴 관리</a>
      </div>

      <div class="tab" onclick="openTab(4)" id="tab4">
         <a href="goMoney" class="a-tag-font-size">매출 관리</a>
      </div>
   </div>
   <div class="page-name-box">매출 관리 페이지</div>

   <section class="gallery-section section parallax-window" id="section-4"
      style="text-align: center;">
      <div class="container" style="margin-bottom: 300px;">
         <div class="wrap">
            <a href="goOrderToday"><button class="btn-2">오늘 매출 확인</button></a><br>
            <a href="goOrderYesterday"><button class="btn-2">어제 매출
                  확인</button></a> <br> <a href="goOrderMonth"><button class="btn-2">월간
                  매출 확인</button></a>
         </div>
      </div>
   </section>

   <!-- 매출관리------------------------------------------------------------------------------------ -->

   <script src="resources/js/jquery-3.3.1.min.js"></script>
   <script src="resources/js/bootstrap.bundle.min.js"></script>
   <script src="resources/js/jquery.singlePageNav.min.js"></script>
   <script src="resources/js/slick.js"></script>
   <script src="resources/js/parallax.min.js"></script>
   <script src="resources/js/templatemo-script.js"></script>
   <script src="https://kit.fontawesome.com/d97bdf4abd.js"
      crossorigin="anonymous"></script>

</body>
</html>