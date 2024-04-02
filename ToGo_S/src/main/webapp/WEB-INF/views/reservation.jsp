<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.smhrd.entity.Order"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<script src="resources/assets/jquery-2.2.4.min.js"></script>
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
	height: 60px;
	background-color: #4a4a4a;
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
	width: 40%;
	background-color: #4a4a4a;
	overflow-y: auto;
	padding: 20px;
	color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

.right-content {
	width: 60%;
	background-color: lightgray;
	overflow-y: auto;
	padding: 20px;
	border-left: 1px solid #ddd;
	font-weight: bold;
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
</style>
</head>

<body>
	<div class="tabs">
		<div class="tab" onclick="openTab(1)" id="tab1">
		<a href="goStoreOrder">주문관리</a></div>
		
		<div class="tab" onclick="openTab(2)" id="tab2">
		<a href="goReservation">예약관리</a></div>
		
		<div class="tab" onclick="openTab(3)" id="tab3">
		<a href="goConMenu">메뉴관리</a></div>
			
		<div class="tab" onclick="openTab(4)" id="tab4">
		<a href="goMoney">매출관리</a></div>
	</div>

	<div class="content-container">
		<!-- 주문 목록 list-->

		<div id="leftContent" class="left-content">
			<div id="items">
				<ul>
					<c:forEach items="${order_list}" var="ol" varStatus="status">
						<li onclick="orderDetailClick(${ol.order_idx})">
							<div>
								<p class="order-number" data-order-id="${ol.order_idx}"></p>
							</div> 주문번호 &nbsp;<span>${ol.order_idx}</span>번
							</p>
							<p>
								주문 금액: <span>${ol.order_total_amount}</span>원
							</p>

						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div id="rightContent" class="right-content">
			<div class="div_tag">
				<!-- 내용을 여기에 추가할 수 있습니다. -->
				<div class="div2_tag">
					<!-- 내용을 여기에 추가할 수 있습니다. -->
					<!-- order 내용-->
					<div>
						<p>
							주문번호 <span id="id_order_idx"></span>번
						</p>
					</div>
					<!-- order detail 내용  반복 예정 -->
					<div id="detail"></div>
					<div>
						<p>
							<span>000</span>분 후 픽업
						</p>
						<button>준비 완료</button>
					</div>
				</div>
			</div>
		</div>
</body>

<script type="text/javascript">
	function showAlert() {
		alert("완료되었습니다!");
	}

	function orderDetailMenu(menu_idx, callback) {
	    $.ajax({
	        url: "getMenu",
	        method: "POST",
	        data: { menu_idx: menu_idx },
	        success: function(menu) {
	            console.log("메뉴 정보 가져오기 성공");
	            console.log(menu); // 받은 메뉴 정보를 콘솔에 출력
	            // 받은 메뉴 정보를 활용하여 필요한 작업을 수행할 수 있습니다.
	            callback(menu.menu_name);
	        },
	        error: function() {
	            console.log("메뉴 정보 가져오기 실패");
	        }
	    });
	}

	function orderDetailClick(order_idx) {
	    $.ajax({
	        url: "order_Detail_Select",
	        method: "POST",
	        data: { order_idx: order_idx },
	        success: function(response) {
	            console.log("성공");
	            document.getElementById("id_order_idx").innerText = order_idx;
	            response.forEach(function(menu) {
	                orderDetailMenu(menu.menu_idx, function(menu_name) {
	                    createMenu(menu, menu_name);
	                });
	            });
	        },
	        error: function() {
	            console.log("실패");
	        }
	    });
	}

	function createMenu(menu, menu_name) {
	    console.log("함수임");
	    console.log(menu);
	    var detailDiv = document.getElementById('detail');
	    detailDiv.innerHTML = ""; // 기존 내용 초기화
	    // 새로운 div 요소 생성
	    var div = document.createElement('div');

	    // p 요소 생성 및 내용 설정
	    var menuName = document.createElement('p');
	    menuName.innerText = '메뉴명: ';
	    var menuNameSpan = document.createElement('span');
	    menuNameSpan.innerText = menu_name;
	    menuName.appendChild(menuNameSpan);

	    var menuCount = document.createElement('p');
	    menuCount.innerText = '갯수: ';
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



</script>

</html>
