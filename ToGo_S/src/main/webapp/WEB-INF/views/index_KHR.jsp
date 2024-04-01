<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8" />
    <title>Simply Amazed HTML Template by Tooplate</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@300;400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="resources/fontawesome/css/all.min.css" type="text/css" /> 
    <link rel="stylesheet" href="resources/css/slick.css" type="text/css" />   
    <link rel="stylesheet" href="resources/css/tooplate-simply-amazed.css" type="text/css" />
<title>Insert title here</title>
<style>
    .order-first{
    background-color: #393f45;
    }
    
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
    
</style>
</head>
<body>
    <main id="content-box" class="order-first">
        <div class="banner" data-parallax="scroll" id="section-1">
            <div class="container">
                <a href="goOrderToday"><button class="btn-1">주문관리</button></a> 
                <a href="goOrderYesterday"><button class="btn-1">주문완료</button></a> 
                <a href="goOrderMonth"><button class="btn-1">메뉴관리</button></a> 
                <a href="#section-4"><button class="btn-1">매출관리</button></a>
            </div>
        </div>
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
        
    </main>
</body>
</html>
