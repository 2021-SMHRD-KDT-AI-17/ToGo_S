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
.container {
	display: flex;
}

.div_tag {
	width: 30%;
	/* 너비 */
	height: 800px;
	/* 높이 */
	background-color: aquamarine;
}

.div2_tag {
	width: 70%;
	height: 800px;
	background-color: blueviolet;
}
</style>
</head>

<body>
	<div class="container">
		<!-- 주문 목록 list-->
		<div class="div_tag">
			<!-- 내용을 여기에 추가할 수 있습니다. -->
			<ul>
				<c:forEach items="${order_list}" var="ol" varStatus="status">
					<li>
						<p class="order-number" data-order-id="${ol.order_idx}"
							onclick="orderDetailClick(${ol.order_idx})">
							주문번호<span>${ol.order_idx}</span>번
						</p>
						<p>
							주문 금액: <span>${ol.order_total_amount}</span>원
						</p>
					</li>
				</c:forEach>
			</ul>
		</div>

		<!-- order detail 표시-->
		<div class="div2_tag">
			<!-- 내용을 여기에 추가할 수 있습니다. -->
			<!-- order 내용-->
			<div>
				<p>
					주문번호 <span id="id_order_idx"></span>번
				</p>
			</div>
			<!-- order detail 내용  반복 예정 -->
			<div id="detail">

			</div>
			<div>
				<p>
					<span>000</span>분 후 픽업
				</p>
				<button>준비 완료</button>
			</div>

		</div>
	</div>

	<button onclick="showAlert()">조리완료</button>
</body>

<script type="text/javascript">
	function showAlert() {
		alert("완료되었습니다!");
	}

	function orderDetailClick(order_idx) {
	    $.ajax({
	        url: "order_Detail_Select",
	        method: "POST",
	        data: { order_idx: order_idx },
	        success: function(response) {
	            console.log("성공");
	            // 서버로부터 받은 데이터 처리
	            document.getElementById("id_order_idx").innerText = order_idx;
	            // response의 각 항목에 대해 createMenu 호출
	            response.forEach(function(menu) {
	                createMenu(menu);
	            });
	        },
	        error: function() {
	            console.log("실패");
	        }
	    });
	}

	
	function createMenu(menu) {
	    console.log("함수임")
	    console.log(menu);
	    var detailDiv = document.getElementById('detail');
	    detailDiv.innerHTML = ""; // 기존 내용 초기화
	    // 새로운 div 요소 생성
	    var div = document.createElement('div');
	    
	    let menu_name = orderDetailMenu(menu.menu_idx);
	    console.log("받아온 메뉴 이름 " + menu_name);

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
	
	function orderDetailMenu(menu_idx) {
	    let menu_name;
	    $.ajax({
	        url: "getMenu",
	        method: "POST",
	        data: { menu_idx: menu_idx },
	        success: function(menu) {
	            console.log("메뉴 정보 가져오기 성공");
	            console.log(menu); // 받은 메뉴 정보를 콘솔에 출력
	            // 받은 메뉴 정보를 활용하여 필요한 작업을 수행할 수 있습니다.
	            menu_name = menu.menu_name;
	            console.log(menu_name);

	        },
	        error: function() {
	            console.log("메뉴 정보 가져오기 실패");
	        }
	    });
	}


</script>

</html>