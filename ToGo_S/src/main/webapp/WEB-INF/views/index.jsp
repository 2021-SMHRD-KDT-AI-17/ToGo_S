<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Simply Amazed HTML Template by Tooplate</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@300;400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="resources/fontawesome/css/all.min.css" type="text/css" /> 
    <link rel="stylesheet" href="resources/css/slick.css" type="text/css" />   
    <link rel="stylesheet" href="resources/css/tooplate-simply-amazed.css" type="text/css" />
<!--

Tooplate 2123 Simply Amazed

https://www.tooplate.com/view/2123-simply-amazed

-->
</head>

<body>
    <div id="outer">
        <header class="header order-last" id="tm-header">
            <nav class="navbar">
                <div class="collapse navbar-collapse single-page-nav">
                <form action="adminLogout">
                	<input type="submit" value = "로그아웃">
                </form>
                
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="#section-1"><span class="icn"><i class="fas fa-2x fa-air-freshener"></i></span> 주문관리</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#section-2"><span class="icn"><i class="fab fa-2x fa-battle-net"></i></span>예약관리</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#section-3"><span class="icn"><i class="far fa-2x fa-images"></i></span> 메뉴관리</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#section-4"><span class="icn"><i class="far fa-2x fa-comments"></i></span>메출 관리</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        
        
        <!-- 헤드 끝 --------------------------------------------------------------------------------------------------------------------------------                        -->
        <button class="navbar-button collapsed" type="button">
            <span class="menu_icon">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </span>
        </button>
        <!-- 하단바 버튼------------------------------------------------------------------------------- -->
        <main id="content-box" class="order-first">
            <div class="banner-section section parallax-window" data-parallax="scroll"  id="section-1">
                <div class="container">
                    <div class="item">
                        <div class="item1">
                        <h3 class="h33">주문관리</h3>
                            <div class="tm1">
                            
                            <div class="item2">
                            
                            <div class="tm2">
                            
                                <div class="i2"></div>
                                <h3 class="h22">준비중</h3>
                                <div class="item4">
                            <div class="tm4">
                                <div class="i4"</div>
                                <h3 class="h22">조리중</h3>
                                
                                <p></p>
                                 
                            </div>
                            
                        </div>
                             
                            </div>                      
                                <p></p>
                                  
                            </div>
                        </div>
                        
                        <div class="item2">
                            <div class="tm3">
                                <div class="i3"</div>
                                <h3 class="h22">완료</h3>
                                <p></p>
                            </div>
                        </div>
                                <div class="i1"></div>
                                
                                
                              
                        </div>
                        
                    </div>
                    
                </div>
                        
                    </div>
                </div>
            </div>
            
        
        <!-- 주문관리------------------------------------------------------------------------------------ -->
            <section class="work-section section" id="section-2">
                <div class="banner-section section parallax-window" data-parallax="scroll"  id="section-1">
                <div class="container">
                    <div class="item">
                        <div class="item1">
                        <h3 class="h33">예약관리</h3>
                            <div class="tm1">
                            
                            <div class="item2">
                            
                            <div class="tm2">
                                <div class="i2"></div>
                                <h3 class="h44">처리중</h3>
                                <div class="item4">
                            <div class="tm4">
                                <div class="i4"</div>
                                <h3 class="h44">예약 주문</h3>
                                <p></p>
                            </div>
                        </div>
                             
                            </div>                        
                                <p></p>
                                  
                            </div>
                        </div>
                        
                        <div class="item2">
                            <div class="tm3">
                                <div class="i3"</div>
                                <h3 class="h44">완료</h3>
                                <p></p>
                            </div>
                        </div>
                                <div class="i1"></div>
                                
                                
                              
                        </div>
                        
                    </div>
                    
                </div>
                        
                    </div>
                </div>
            </div>
            </section>

       <!-- 예약 관리------------------------------------------------------------------------------------ -->
			<section class="gallery-section section parallax-window"
				data-parallax="scroll"
				data-image-src="resources/img/section-3-bg.jpg" id="section-3">
				<div class="container">
					<div class="title text-right">
						<h2>메뉴 관리</h2>

						<table style="border: 1px solid black;">
							<tr>
								<th>번호</th>
								<th>이름</th>
								<th>가격</th>
								<th>설명</th>
							</tr>

							<c:forEach items="${m_list}" var="m" varStatus="status">
								<tr data-bs-toggle="modal" data-bs-target="#exampleModal"
									onclick="detailMenu(${m.menu_idx },'${m.menu_name}', ${m.menu_price },'${m.menu_desc}', '${m.menu_soldout }', '${m.menu_img }')">
									<td>${status.count }</td>
									<td>${m.menu_name}</td>
									<td>${m.menu_price}</td>
									<td>${m.menu_desc}</td>
								</tr>
							</c:forEach>
						</table>

					</div>
					<div class="mx-auto gallery-slider">
						<button data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="addmenu()">추가하기</button>

					</div>
				</div>
			</section>
       <!-- 메뉴관리------------------------------------------------------------------------------------ -->
            <section class="contact-section section" id="section-4">
                <div class="container">
                    <div class="title">
                    
                        <h1>매출 관리</h1>
                    </div>
                   <div class="wrap">
                
               
                            <a href="goOrderToday"><button class="btn-1">오늘 매출 확인</button></a>
                        
                            <a href="goOrderYesterday"><button class="btn-1">어제 매출 확인</button></a> 
                       
                            <a href="goOrderMonth"><button class="btn-1">월간 매출 확인</button></a>
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
        margin-right: 50px;
    }

    /* 호버 효과 */
    .btn-1:hover {
        background-color: lightgreen; /* 호버 시 배경색 변경 */
        color : black;
        
    }
    
    .parallax-window { background: #393f45; }
    
    
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
        border-radius: 10px; /* 버튼 모서리 둥글게 */
        margin-top: 30px;
         position: fixed; 
    bottom: 180px; /* 하단 여백 */
    right: 650px; /* 우측 여백 */
    z-index: 999; /* 다른 요소 위에 표시되도록 설정 */
}
        
    }

    /* 호버 효과 */
    .btn-2:hover {
        background-color: gray; /* 호버 시 배경색 변경 */
        color : black;
        
    }
    
    
    .item1 {
    background-color:#393f45;
    color: #333;
    width: 900px; 
    height: 700px;
    text-align: center; 
    
    
    font-size: 18px; 
    
    
   
  
}
.work-section {
  padding-top: 90px;
  padding-bottom: 90px;
  min-height: 850px;
  background-color: #393f45;
}

.h44 {
   color: black;
   font-size:20px;
   font-weight: 1000;
}

.h33 {
   color:white;
   
   font-size:30px;
   font-weight: 1000;

   
}

.h22 {
   
   font-size:20px;
   font-weight: 1000;
}
 .item2 {
   background-color: lightgray;
    color: #333; 
    width: 160px;
    height: 270px; 
    text-align: left; 
    margin-top:50px;
    font-size: 18px; 
    padding: 20px;
    border-radius: 10px; 
    box-shadow: 0 4px 8px rgba(0, 0, 0, 1);
    
}

 
 .item4 {
   background-color: lightgray; 
    color: #333; 
    width: 820px; 
    height: 500px; 
    text-align: left; 
    margin-left:170px;
   
    font-size: 18px; 
    padding: 20px; 
    border-radius: 10px; 
    box-shadow: 0 4px 8px rgba(0, 0, 0, 1); 
    
    
}
</style>
                      
                
              </div>
                             <!-- 팝업창을 제외한 나머지 body 영역 어두어지는 효과 -->
               <div class="overlay"></div>


					<!-- Modal--------------------------------------------------------------------------------------------------------------------------- -->

					<div class="modal fade" id="exampleModal" tabindex="-1"aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div
							class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
							<div class="modal-content">
								<form action="updateMenu" method= "post">
								<input type = "hidden" name = "menu_idx" id="menu_idx">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="exampleModalLabel">메뉴 상세</h1>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="menu-modal-box modal-body">
										<div class="menu-modal-box-wrap" style="display: flex; justify-content: space-between; padding: 10px; box-sizing: border-box;">

											<div class="menu-img" style="height: 200px; width: 150px; background: #999;">
												<p name="product">
													<input id="menu_img" type="file" name = "menu_img">
												</p>


											</div>
											<div class="menu-detail"
												style="height: 200px; width: 300px; background: #777;">
												<article>
													<p name="product">
														메뉴 이름 <input type="text" id="menu_name"name = "menu_name">
													</p>

													<p>
														메뉴 가격<input type="text" placeholder="메뉴가격" id="menu_price" name = "menu_price">원
													</p>
												</article>

												<section class="menu-count"
													style="background: #555; height: 35px; width: 100%; display: flex;">
													<div class="menu-count-left"
														style="margin-left: 15px; margin-right: 15px;">
														<div class="form-check form-switch">
															<span>판매여부</span> 
															<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" name="menu_soldout" onchange="toggleValue(this)">
															<label class="form-check-label" for="flexSwitchCheckChecked">매진</label>
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
												class="desc-text-box" id="menu_desc" name = "menu_desc"></textarea>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">닫기</button>
										<input type="submit" class="btn btn-primary" value="수정하기" id = "btn">
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