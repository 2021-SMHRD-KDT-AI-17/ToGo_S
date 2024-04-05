<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="kr.smhrd.entity.Order"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<script src="resources/assets/jquery-2.2.4.min.js"></script>
<script src="https://www.gstatic.com/firebasejs/7.2/firebase.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

/* 전체 스타일 */
/* 전체 스타일 */
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
   background-color: #fff;
   border: 1px solid #ddd;
   border-radius: 10px;
   box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
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
   color: #fff;
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
   width: 37.5%;
   height: 681px;
   background-color: #4a4a4a;
   overflow-y: auto;
   padding: 20px;
   color: #fff;
   box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
   position: relative;
   z-index: 999;
   border-bottom: 2px solid black;
}

.right-content {
   
   width: 100%;
   height : 490px; 
   background-color: lightgray;
   overflow-y: auto;
   padding: 20px;
   border-left: 1px solid #ddd;
   font-weight: bold;
   position: relative;
   z-index: 3;
   height: 500px;
}

.first-null-page {
   width: 100%;
   height: 680px; /* 높이 값은 필요에 따라 조정 */
   background-color: lightgray;
   overflow-y: auto;
   padding: 20px;
   border-left: 1px solid #ddd;
   font-weight: bold;
   position: absolute;
   z-index: 4;
}

.order-idx-box {
   background: lightgray;
   border-bottom: 2px solid black;
   font-size: 22px;
   font-weight: bold;
   padding-left: 20px;
}

.title-content-button {
   width: 100%;
}

/* 주문 목록 스타일 */
.left-content ul {
   padding: 0;
   list-style: none;
   margin-top: 0;
}

.left-content ul li {
   padding: 15px;
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

.btn-1 {
   background-color: gray; 
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
   width: 200px; /* 버튼의 너비 */
   height: 60px; /* 버튼의 높이 */
   font-size: 16px;
   font-weight: bold;
   margin-top: 20px;
}

.fa-solid {
   font-size: 20px;
}

.home-tag {
   background: #1C7D80;
}

#detail {
   overflow-y: hidden;
}

.pick-up-box {
   display: flex;
   justify-content: center;
   background: ##AED5C4;
   border-bottom: 2px solid black;
}

.give-padding1 {
   padding-right: 100px;
   padding-top: 5px;
   font-size: 30px;
   font-weight: bold;
}

.give-padding2 {
   padding-left: 30px;
}

.a-tag-font-size{
   font-size: 22px;
}

.page-name-box {
   height: 40px;
   background-color: #181818;
   color: #E1E1E1;
   font-size: 30px;
   font-weight: bold;
   padding-left: 30px;
   padding-top: 15px;
   padding: 15px 0px 20px 30px;
}

.order-number{
	font-size: 22px;
}
</style>
</head>

<body>
   <div class="tabs">

      <div class="tab home-tag" onclick="openTab(0)" id="tab1">
         <a href="goIndex"><i class="fa-solid fa-house"></i></a>
      </div>

      <div class="tab" onclick="openTab(1)" id="tab1">
         <a href="goStoreOrder" class="a-tag-font-size">주문관리</a>
      </div>

      <div class="tab" onclick="openTab(2)" id="tab2">
         <a href="goReservation" class="a-tag-font-size">예약관리</a>
      </div>

      <div class="tab" onclick="openTab(3)" id="tab3">
         <a href="goConMenu" class="a-tag-font-size">메뉴관리</a>
      </div>

      <div class="tab" onclick="openTab(4)" id="tab4">
         <a href="goMoney" class="a-tag-font-size">매출관리</a>
      </div>
   </div>
   <div class="page-name-box">주문 관리 페이지</div>

   <div class="content-container">
      <!-- 주문 목록 list-->

      <div id="leftContent" class="left-content">
         <div id="items">
            <ul id="object">
            </ul>
         </div>
      </div>
      <div class="title-content-button"
         style="display: flex; flex-direction: column;">
         <div id="" class="first-null-page"></div>
         <div class="order-idx-box  div_tag">
            <p class="a-tag-font-size">
               주문번호 <span id="id_order_idx"></span>번
            </p>
         </div>
         <div>
            <div id="rightContent" class="right-content  div_tag">

               <!-- 내용을 여기에 추가할 수 있습니다. -->
               <div class="div2_tag">
                  <!-- 내용을 여기에 추가할 수 있습니다. -->
                  <!-- order 내용-->

                  <!-- order detail 내용  반복 예정 -->
                  <div id="detail"></div>

               </div>
            </div>
         </div>
         <div class="pick-up-box  div_tag">
            <p class="give-padding1">
               <span id = "id_pick_up_time"></span>분 후 픽업
            </p>
            <button onclick="removeElement()" class="btn-1">준비 완료</button>
         </div>
      </div>
</body>
<script src="https://kit.fontawesome.com/d97bdf4abd.js"
   crossorigin="anonymous"></script>
<script type="text/javascript">
var pick_up_time;
   function removeElement(elementId) {
      let order_idx = document.getElementById("id_order_idx").innerText;
      var element = document.getElementById("orderIdx_" + order_idx);
      if (element && element.parentNode) {
         element.parentNode.removeChild(element); // 부모 노드에서 해당 요소를 제거합니다.
         $(".div_tag").hide();
      }
      $.ajax({
         url : "comOrder",
         data : {
            order_idx : order_idx
         },
         success : function() {
         },
         error : function() {
         }
      })
   }

   // 파이어베이스
   const firebaseConfig = {
      apiKey : "AIzaSyDEWh-0Au3One8fsVTYatJyCaGCs8vmbj4",
      authDomain : "webtest-a87c0.firebaseapp.com",
      databaseURL : "https://webtest-a87c0-default-rtdb.firebaseio.com/",
      projectId : "webtest-a87c0",
      storageBucket : "webtest-a87c0.appspot.com",
      messagingSenderId : "976815392508",
      appId : "1:976815392508:web:c5cba683cfc72a0c167979",
      measurementId : "G-8ZR2Z98ZS5"
   };
   // Initialize Firebase
   firebase.initializeApp(firebaseConfig);
   var preObject = document.getElementById("object");
   var dbRef = firebase.database().ref().child("object");
   dbRef.on('value', function(snapshot) {
      // 주문 정보 데이터 가져오기
      var orderData = snapshot.val();

      // 주문 정보가 있는 경우에만 HTML 요소를 생성하고 추가
      if (orderData) {
         var orderId = orderData.order_idx;
         var orderAmount = orderData.total_price;
         pick_up_time = orderData.pick_up_time;

         // 주문 정보를 기반으로 li 요소 생성
         var orderListItem = createOrderListItem(orderId, orderAmount);

         // "object" id를 가진 ul 태그에 추가
         var ulElement = document.getElementById("object");
         ulElement.appendChild(orderListItem);
      }
   })

   function createOrderListItem(orderId, orderAmount) {
	   document.getElementById("id_pick_up_time").innerText = pick_up_time;
      var liElement = document.createElement("li");
      liElement.setAttribute("onclick", "orderDetailClick(" + orderId + ")");

      var divElement = document.createElement("div");
      liElement.id = "orderIdx_" + orderId; // 원하는 id 값을 넣으세요

      var pElement = document.createElement("p");
      pElement.classList.add("order-number");
      pElement.dataset.orderId = orderId;
      divElement.appendChild(pElement);

      var spanElement1 = document.createElement("span");
      spanElement1.textContent = "주문번호";
      var spanElement2 = document.createElement("span");
      spanElement2.textContent = orderId + "번";
      pElement.appendChild(spanElement1);
      pElement.appendChild(document.createTextNode("\u00A0")); // 공백
      pElement.appendChild(spanElement2);

      var pElement2 = document.createElement("p");
      pElement2.style.margin = "0px";
      pElement2.innerHTML = "주문 금액: <span>" + orderAmount + "</span>원";

      liElement.appendChild(divElement);
      liElement.appendChild(pElement2);

      return liElement;
   }

   function orderDetailMenu(menu_idx, callback) {
      $(".div_tag").show();
      $.ajax({
         url : "getMenu",
         method : "POST",
         data : {
            menu_idx : menu_idx
         },
         success : function(menu) {
            console.log("메뉴 정보 가져오기 성공");
            console.log(menu); // 받은 메뉴 정보를 콘솔에 출력
            // 받은 메뉴 정보를 활용하여 필요한 작업을 수행할 수 있습니다.
            callback(menu.menu_name);
         },
         error : function() {
            console.log("메뉴 정보 가져오기 실패");
         }
      });
   }

   function orderDetailClick(order_idx) {

      $.ajax({
         url : "order_Detail_Select",
         method : "POST",
         data : {
            order_idx : order_idx
         },
         success : function(response) {
            console.log("성공");
            console.log(response);
            var detailDiv = document.getElementById('detail');
            detailDiv.innerHTML = ""; // 기존 내용 초기화
            document.getElementById("id_order_idx").innerText = order_idx;
            response.forEach(function(menu) {
               // 각 메뉴에 대해 orderDetailMenu() 호출
               orderDetailMenu(menu.menu_idx, function(menu_name) {
                  // orderDetailMenu() 함수가 완료된 후에 createMenu() 호출
                  createMenu(menu, menu_name);
               });
            });
         },
         error : function() {
            console.log("실패");
         }
      });
   }

   function createMenu(menu, menu_name) {
      console.log("함수임");
      console.log(menu);
      var detailDiv = document.getElementById('detail');
      // 새로운 div 요소 생성
      var div = document.createElement('div');

      // p 요소 생성 및 내용 설정
      var menuName = document.createElement('p');
      menuName.innerText = '메뉴명: ';
      var menuNameSpan = document.createElement('span');
      menuNameSpan.innerText = menu_name;
      menuName.appendChild(menuNameSpan);

      var menuCount = document.createElement('p');
      menuCount.innerText = '개수: ';
      var menuCountSpan = document.createElement('span');
      menuCountSpan.innerText = menu.order_cnt; // 수정된 부분
      menuCount.appendChild(menuCountSpan);

      var menuRequirement = document.createElement('p');
      menuRequirement.innerText = '요구사항: ';
      var menuRequirementSpan = document.createElement('span');
      menuRequirementSpan.innerText = menu.order_request;
      menuRequirement.appendChild(menuRequirementSpan);

      // div에 p 요소들 추가
      div.appendChild(menuName);
      div.appendChild(menuCount);
      div.appendChild(menuRequirement);

      // 빈 줄 추가
      var lineBreak = document.createElement('br');
      div.appendChild(lineBreak);

      // 생성된 div를 detail이라는 id를 가진 div에 추가
      detailDiv.appendChild(div);
   }

   document.addEventListener("DOMContentLoaded", function() {
      // 왼쪽 콘텐츠 영역을 클릭했을 때
      document.getElementById("leftContent").addEventListener(
            "click",
            function() {
               // .first-null-page를 찾아서 숨김
               var firstNullPage = document
                     .querySelector(".first-null-page");
               if (firstNullPage) {
                  firstNullPage.style.display = "none";
               }
            });
   });
</script>

</html>
