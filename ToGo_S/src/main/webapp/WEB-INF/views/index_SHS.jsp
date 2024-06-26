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
<!--

Tooplate 2123 Simply Amazed

https://www.tooplate.com/view/2123-simply-amazed

-->
</head>

<body>




	<!-- 헤드 끝 --------------------------------------------------------------------------------------------------------------------------------                        -->

	<!-- 하단바 버튼------------------------------------------------------------------------------- -->
	<main id="content-box" class="order-first">
		<div class="banner-section section parallax-window"
			data-parallax="scroll" id="section-1">
			<div class="container">
				<h1>환영합니다 ___ 님</h1>
				<div>
					<a href="goStoresOrder"><button class="btn-1">주문관리</button></a> <a
						href="#"><button class="btn-1">주문완료</button></a><br>  <a
						href="#section-3"><button class="btn-1">메뉴관리</button></a> <a
						href="#section-4"><button class="btn-1">매출관리</button></a>

				</div>
			</div>
		</div>



		<!-- 주문관리------------------------------------------------------------------------------------ -->


		<!-- 예약 관리------------------------------------------------------------------------------------ -->
		<section class="gallery-section section parallax-window" data-parallax="scroll" data-image-src="resources/img/section-3-bg.jpg" id="section-3">
    <div class="container">
        <div class="title text-center mb-4">
            <h3>메뉴 관리</h3>
        </div>
        <div class="row row-cols-1 row-cols-md-2 g-4">
            <c:forEach items="${m_list}" var="m" varStatus="status">
                <div class="col">
    <div class="card h-100">
        <!-- 이미지 추가 -->
        <img src="resources/img/KakaoTalk_20240313_215409039.jpg" class="card-img-top" alt="카드 이미지">
        <div class="card-body">
            <h5 class="card-title">${m.menu_name}</h5>
            <h6 class="card-subtitle mb-2 text-muted">${m.menu_price}원</h6>
            <p class="card-text">${m.menu_desc}</p>
        </div>
        <div class="card-footer">
            <button class="btn btn-primary w-100" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="detailMenu(${m.menu_idx },'${m.menu_name}', ${m.menu_price },'${m.menu_desc}', '${m.menu_soldout }', '${m.menu_img }')">수정하기</button>
        </div>
    </div>
</div>
            </c:forEach>
        </div>
        <div class="text-center mt-4">
            <button class="btn btn-success btn-lg" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="addmenu()">메뉴 추가하기</button>
            <a href="gosoldout"><button class="btn btn-success btn-lg" data-bs-toggle="modal" data-bs-target="#exampleModal" >품절 상품 관리</button></a>
        </div>
    </div>
</section>


		<!-- 메뉴관리------------------------------------------------------------------------------------ -->
		<section class="contact-section section" id="section-4">
			<div class="container">
				<div class="title">

					<h3>매출 관리</h3>
				</div>
				<div class="wrap">


					<a href="goOrderToday"><button class="btn-2">오늘 매출 확인</button></a><br>

					<a href="goOrderYesterday"><button class="btn-2">어제 매출
							확인</button></a> <br> 
							<a href="goOrderMonth"><button class="btn-2">월간
							매출 확인</button></a>
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
	margin-left:100px;
	width: 300px; /* 버튼의 너비 */
	height: 100px; /* 버튼의 높이 */
	font-size: 20px;
	font-weight: bold;
	margin-top: 100px;
}

.btn-2 {
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
	margin-left:100px;
	width: 350px; /* 버튼의 너비 */
	height: 100px; /* 버튼의 높이 */
	font-size: 20px;
	font-weight: bold;
	margin-top: 50px;
}

/* 호버 효과 */
.btn-2:hover {
	background-color: lightgreen; /* 호버 시 배경색 변경 */
	color: black;
}


.gallery-section {
    padding: 100px 0;
    background-color: #f8f9fa; 
}





.card {
    border: none; 
    transition: all 0.3s ease; 
    
    width: 400px; /* 카드의 너비 */
    height: 300px; /* 카드의 높이 */
    position: relative; /* 상대 위치 지정 */
}


.card-img-top {
    width: 180px; /* 이미지의 너비 조절 */
    height: 110px; /* 이미지의 높이 조절 */
    object-fit: cover; /* 이미지가 카드에 꽉 차게 조절 */
    position: absolute; /* 절대 위치 지정 */
    top: 0; /* 카드의 상단에 위치 */
    right: 0; /* 카드의 우측에 위치 */
    margin-right: 16px;
   
}
.card:hover {
    transform: translateY(-5px); 
}

.card-title {
    color: #343a40; 
    font-size: 16px;
    font-weight: bold;
}

.card-subtitle {
    color: #6c757d; 
    font-size: 14px;
}

.card-text {
    color: #6c757d;
    font-size: 14PX;
}

/* 버튼 스타일 */
.btn-primary {
    background-color: #007bff; 
    border-color: #007bff; 
    color: #fff; 
}

.btn-primary:hover {
    background-color: #0056b3;
    border-color: #0056b3; 
}

.btn-success {
    background-color: #007bff; 
    border-color: #007bff; 
    color: #fff; 
    font-size: 16px;
    margin-right: 50px;
}

.btn-success:hover {
    background-color: #0056b3; 
    border-color:#0056b3; 
}


.modal-content {
    background-color: #fff; 
    border-radius: 10px; 
}

.modal-title {
    color: #343a40; 
    font-size: 24px;
    font-weight: bold;
}

.modal-body {
    color: #6c757d; 
}

.modal-footer {
    justify-content: center;
}

.form-check-input:checked {
    background-color: #007bff; 
    border-color: #007bff; 
}

.form-check-input:checked:focus {
    box-shadow: none; 
}


.btn-1:hover {
	background-color: lightgreen; 
	color: black;
}


.parallax-window {
	background: #393f45;
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
</style>


				</div>
				
				<div class="overlay"></div>


				<!-- Modal--------------------------------------------------------------------------------------------------------------------------- -->

				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div
						class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
						<div class="modal-content">
							<form action="updateMenu" method="post">
								<input type="hidden" name="menu_idx" id="menu_idx">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="exampleModalLabel">메뉴 상세</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="menu-modal-box modal-body">
									<div class="menu-modal-box-wrap"
										style="display: flex; justify-content: space-between; padding: 10px; box-sizing: border-box;">

										<div class="menu-img"
											style="height: 200px; width: 150px; background: #999;">
											<p name="product">
												<input id="menu_img" type="file" name="menu_img">
											</p>


										</div>
										<div class="menu-detail"
											style="height: 200px; width: 300px; background: #777;">
											<article>
												<p name="product">
													메뉴 이름 <input type="text" id="menu_name" name="menu_name">
												</p>

												<p>
													메뉴 가격<input type="text" placeholder="메뉴가격" id="menu_price"
														name="menu_price">원
												</p>
											</article>

											<section class="menu-count"
												style="background: #555; height: 35px; width: 100%; display: flex;">
												<div class="menu-count-left"
													style="margin-left: 15px; margin-right: 15px;">
													<div class="form-check form-switch">
														<span>판매여부</span> <input class="form-check-input"
															type="checkbox" role="switch" id="flexSwitchCheckChecked"
															name="menu_soldout" onchange="toggleValue(this)">
														<label class="form-check-label"
															for="flexSwitchCheckChecked">매진</label>
													</div>
												</div>
											</section>
										</div>
									</div>
								</div>
								<div class="desc">
									<div style="height: 80px; width: 100%;">
										<p>메뉴 설명</p>
										<textarea style="width: 100%; height: 100%;"
											class="desc-text-box" id="menu_desc" name="menu_desc"></textarea>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">닫기</button>
									<input type="submit" class="btn btn-primary" value="수정하기"
										id="btn">
								</div>
							</form>
						</div>
					</div>
				</div>

				<!-- modal 창   -->
				<script
					src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
					integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
					crossorigin="anonymous">
            		</script>






				<footer class="footer container container-2"> </footer>
		</section>

		<!-- 매출관리------------------------------------------------------------------------------------ -->
	</main>
	</div>
	<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script src="resources/js/bootstrap.bundle.min.js"></script>
	<script src="resources/js/jquery.singlePageNav.min.js"></script>
	<script src="resources/js/slick.js"></script>
	<script src="resources/js/parallax.min.js"></script>
	<script src="resources/js/templatemo-script.js"></script>

	<script type="text/javascript">
    
       const tabList = document.querySelectorAll('.tab_menu .list li');
       for (var i = 0; i < tabList.length; i++) {
          tabList[i].querySelector('.btn').addEventListener('click',
                function(e) {
                   e.preventDefault();
                   for (var j = 0; j < tabList.length; j++) {
                      tabList[j].classList.remove('is_on');
                   }
                   this.parentNode.classList.add('is_on');
                });
       }
   
       document.getElementById("trigger").addEventListener("click",
             function() {
                var popup = document.getElementById("popup");
                var overlay = document.querySelector(".overlay");
                var body = document.body;
   
                popup.style.display = "block";
                overlay.style.display = "block";
                body.classList.add("blur");
                body.style.overflow = "hidden";
   
                // 서서히 나타나는 애니메이션 적용
                setTimeout(function() {
                   popup.style.opacity = "1";
                }, 50); // 약간의 지연 추가
             });
   
       function closePopup() {
          var popup = document.getElementById("popup");
          var overlay = document.querySelector(".overlay");
          var body = document.body;
   
          // 서서히 사라지는 애니메이션 적용
          popup.style.opacity = "0";
   
          // 애니메이션 시간만큼의 지연 추가
          setTimeout(function() {
             popup.style.display = "none";
             overlay.style.display = "none";
             body.classList.remove("blur");
             body.style.overflow = "";
          }, 300);
       }
       // modal 온클릭 
       function detailMenu(idx,name, price, desc, soldout,img){

          // menuName 메뉴 이름
          document.getElementById("menu_name").setAttribute("value", name);
          // menuPrice 메뉴 가격
          document.getElementById("menu_price").setAttribute("value", price);
          //menuImg 메뉴 이미지
          document.getElementById("menu_img").setAttribute("value", img);
          // 메뉴 설명
          document.getElementById("menu_desc").setAttribute("value", desc);
          document.getElementById("menu_idx").setAttribute("value", idx);
          document.getElementById("btn").setAttribute("value","수정하기");
          // soldout 아직 안함

       }
       
       // 추가하기 onclick
       function addmenu(){
    	   document.getElementById("menu_name").setAttribute("value","");
           // menuPrice 메뉴 가격
           document.getElementById("menu_price").setAttribute("value",0);
           //menuImg 메뉴 이미지
           document.getElementById("menu_img").setAttribute("value","");
           // 메뉴 설명
           document.getElementById("menu_desc").setAttribute("value","");
           document.getElementById("menu_idx").setAttribute("value",0);
           document.getElementById("btn").setAttribute("value","추가하기");
           
       }
       
       
       // 라디오 y,n 설정
       function toggleValue(checkbox) {
    	    if (checkbox.checked) {
    	        checkbox.value = "y";
    	    } else {
    	        checkbox.value = "n";
    	    }
    	}
    </script>
</body>
</html>