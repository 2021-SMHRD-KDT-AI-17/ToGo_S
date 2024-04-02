<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body>
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
			<button data-bs-toggle="modal" data-bs-target="#exampleModal"
				onclick="addmenu()">추가하기</button>
		</div>
	</div>


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
												name="menu_soldout" onchange="toggleValue(this)"> <label
												class="form-check-label" for="flexSwitchCheckChecked">매진</label>
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
						<input type="submit" class="btn btn-primary" value="수정하기" id="btn">
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