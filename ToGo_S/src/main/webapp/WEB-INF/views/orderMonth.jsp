<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>월매출 확인</h1>
	<input type="date">
	

	
	<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%
    // 데이터 생성 (예: 월별 판매량)
    List<Integer> salesData = new ArrayList<>();
    salesData.add(100); // 1월 판매량
    salesData.add(150); // 2월 판매량
    salesData.add(170); // 3월 판매량
    salesData.add(350); // 4월 판매량
    salesData.add(250); // 5월 판매량
    salesData.add(230); // 6월 판매량
    salesData.add(330); // 7월 판매량
    salesData.add(320); // 8월 판매량
    salesData.add(220); // 9월 판매량
    salesData.add(300); // 10월 판매량
    salesData.add(200); // 11월 판매량
    salesData.add(350); // 12월 판매량
   
    
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>막대 그래프 예제</title>
    <!-- Chart.js CDN 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>

<body>
    <!-- 막대 그래프를 표시할 Canvas 요소 -->
    <canvas id="barChart" width="100" ></canvas>

    <!-- Chart.js를 사용하여 막대 그래프 생성하는 스크립트 -->
    <script>
        // 막대 그래프 데이터 정의
        var salesData = [<% for (Integer sale : salesData) { %> <%= sale %>, <% } %>];

        // Canvas 요소 가져오기
        var ctx = document.getElementById('barChart').getContext('2d');

        // 막대 그래프 생성
        var barChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['1월', '2월', '3월', '4월', '5월','7월','8월',
                	'9월','10월','11월','12월'],
                datasets: [{
                    label: '월별 판매량',
                    data: salesData,
                    backgroundColor: 'rgba(54, 162, 235, 0.5)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
    </script>
    
</body>
</html>