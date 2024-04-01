<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.smhrd.entity.Order" %>    
<%@ page import="java.util.List" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
        				<p class="order-number" data-order-id="${ol.order_idx}" onclick="orderDetailClick()">주문번호<span>${ol.order_idx}</span>번</p>
        				<p>주문 금액: <span>${ol.order_total_amount}</span>원</p>
   					 </li>
				</c:forEach>				
            </ul>
        </div>
        
        <!-- order detail 표시-->
        <div class="div2_tag">
            <!-- 내용을 여기에 추가할 수 있습니다. -->
            <!-- order 내용-->
            <div>
                <p>주문번호 <span>000</span>번</p>
                <p>메뉴<span>0</span>개</p>
                <p><span>0,000</span>원</p>
            </div>
            <!-- order detail 내용  반복 예정 -->
            <div>
                
                <div>
                    <p>메뉴명: <span>소떡소떡</span></p>
                    <p>갯수: <span>0</span>개</p>
                    <p>요구사항: <span>000해주세요</span></p>
                    <br>
                </div>
                <div>
                    <p>메뉴명: <span>소떡소떡</span></p>
                    <p>갯수: <span>0</span>개</p>
                    <p>요구사항: <span>000해주세요</span></p>
                    <br>
                </div>
                <div>
                    <p>메뉴명: <span>소떡소떡</span></p>
                    <p>갯수: <span>0</span>개</p>
                    <p>요구사항: <span>000해주세요</span></p>
                    <br>
                </div>

            </div>
            <div>
                <p><span>000</span>분 후 픽업</p>
                <button> 준비 완료 </button>
            </div>

        </div>
    </div>

    <button onclick="showAlert()">조리완료</button>

    <script type="text/javascript">

        function showAlert() {
            alert("완료되었습니다!");
        }

        
       
            function orderDetailClick() {
                $.ajax({
                    url: "order_Detail_Select", // 서버의 엔드포인트 주소
                    method: "GET",
                    success: function(res) {
                        // 서버에서 받아온 데이터를 사용하여 주문 상세 내역을 추가
                       console.log(res);
                        
                        
                        
                        
                        
                        
                    },
                    error: function() {
                        console.error("실패");
                    }
                });
            }

            // 주문 상세 내역을 추가하는 함수
            function addOrderDetail(menuName, quantity, requirements) {
                var detailDiv = document.createElement("div");
                detailDiv.innerHTML = `
                    <p>메뉴명: <span>${menuName}</span></p>
                    <p>갯수: <span>${quantity}</span>개</p>
                    <p>요구사항: <span>${requirements}</span></p>
                    <br>
                `;
                document.querySelector(".div2_tag > div:nth-child(2)").appendChild(detailDiv);
            }

            // 페이지 로드 시 주문 상세 내역을 비동기로 추가
            addOrderDetailFromServer();
        
    </script>
    
    <script src="resources/assets/js/vender/jquery-2.2.4.min.js"></script>
</body>

</html>