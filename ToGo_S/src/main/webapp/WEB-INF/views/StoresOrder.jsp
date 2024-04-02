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


.tab-container {
	width: 800px;
	height: 800px;
	border: 1px solid #ccc;
	overflow: hidden;
	display: flex;
	flex-direction: column;
}

.tabs {
	display: flex;
}

.tab {
	flex: 1;
	height: 100px;
	background-color: lightgray;
	border: 1px solid #aaa;
	cursor: pointer;
	display: flex;
	justify-content: center;
	align-items: center;
}

.active-tab {
	background-color: lightgreen;
}

.inactive-tab {
	background-color: lightgray;
}

.content-container {
	display: flex;
	height: 700px;
}

.left-content {
	width: 40%;
	background-color: lightblue;
	overflow-y: auto;
}

.right-content {
	width: 60%;
	background-color: lightgreen;
	overflow-y: auto;
}

.active {
	background-color: lightblue;
}

.active-content {
	display: block;
}

.hidden {
	display: none;
}

.left-content ul {
	padding: 0;
	list-style: none;
}

.left-content ul li {
	height: 30px;
	line-height: 30px;
	padding-left: 10px;
	border-bottom: 1px solid #ccc;
	cursor: pointer;
	padding: 10px;
}

.left-content ul li:hover {
	background-color: #f0f0f0;
}


</style>

</head>

<body>
<<<<<<< HEAD
    <div class="container">
        <!-- 주문 목록 list-->
        <div class="div_tag">
            <!-- 내용을 여기에 추가할 수 있습니다. -->
            <ul>
            	<c:forEach items="${order_list}" var="ol" varStatus="status">
    				<li>
        				<p class="order-number" data-order-id="${ol.order_idx}" onclick="orderDetailClick()">주문번호
        				<span>${ol.order_idx}</span>번</p>
        				<p>주문 금액: <span>${ol.order_total_amount}</span>원</p>
   					 </li>
				</c:forEach>				
            </ul>
=======
	<div class="tabs">
		<div class="tab" onclick="openTab(1)" id="tab1">Tab 1</div>
		<div class="tab" onclick="openTab(2)" id="tab2">Tab 2</div>
		<div class="tab" onclick="openTab(3)" id="tab3">Tab 3</div>
		<div class="tab" onclick="openTab(4)" id="tab4">Tab 4</div>
	</div>

	<div class="content-container">
		<!-- 주문 목록 list-->

		<div id="leftContent" class="left-content">
			<div id="items">
				<ul>
					<c:forEach items="${order_list}" var="ol" varStatus="status">
						<li onclick="orderDetailClick(${ol.order_idx})">
							<div>
								<p class="order-number" data-order-id="${ol.order_idx}">
							</div>
							<span>주문번호</span>&nbsp;<span>${ol.order_idx}</span>번
							</p>
							<p style="margin: 0px;">
								주문 금액: <span>${ol.order_total_amount}</span>원
							</p>
							
						</li>
					</c:forEach>
				</ul>
			</div>
>>>>>>> branch 'main' of https://github.com/2021-SMHRD-KDT-AI-17/ToGo_S.git
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


		<button onclick="showAlert()">조리완료</button>
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