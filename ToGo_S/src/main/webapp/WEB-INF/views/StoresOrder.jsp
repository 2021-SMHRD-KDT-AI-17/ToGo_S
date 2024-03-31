<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

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
                <li>
                    <p>주문번호<span>000</span>번</p>
                    <p>주문 금액: <span>000</span>원</p>
                </li>
                <li>
                    <p>주문번호<span>001</span>번</p>
                    <p>주문 금액</p>
                </li>
                <li>
                    <p>주문번호<span>002</span>번</p>
                    <p>주문 금액</p>
                </li>
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

    </script>
</body>

</html>