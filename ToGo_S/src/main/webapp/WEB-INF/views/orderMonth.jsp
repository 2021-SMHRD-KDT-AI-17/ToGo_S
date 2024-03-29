<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>월 매출 확인</title>
    <!-- Chart.js CDN 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <h1>월 매출 확인</h1>
    
    <%-- 데이터베이스 연결 및 데이터 가져오기 --%>
    <%@ page import="kr.smhrd.mapper.OrderMapper" %>
    <%
        List<Integer> salesData = new ArrayList<>();
        List<String> monthLabels = new ArrayList<>();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            conn = OrderMapper.getConnection1();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT SUM(order_total_amount) AS monthly_sales, MONTH(ordered_at) AS order_month FROM orders GROUP BY MONTH(ordered_at);");
            while (rs.next()) {
                int monthlySales = rs.getInt("monthly_sales");
                String orderMonth = rs.getString("order_month");
                salesData.add(monthlySales);
                monthLabels.add(orderMonth);
            }
        } catch (SQLException | ClassNotFoundException e) {
            out.println("오류 발생: " + e.getMessage());
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
            if (stmt != null) {
                try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
            if (conn != null) {
                try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        }
    %>
    
    <!-- 막대 그래프를 표시할 Canvas 요소 -->
    <canvas id="barChart" width="400" ></canvas>

    <!-- Chart.js를 사용하여 막대 그래프 생성하는 스크립트 -->
    <script>
        // 막대 그래프 데이터 정의
        var salesData = [
            <% for (Integer sale : salesData) { %>
                <%= sale %>,
            <% } %>
        ];

        var monthLabels = [
            <% for (String label : monthLabels) { %>
                '<%= label %>',
            <% } %>
        ];

        // Canvas 요소 가져오기
        var ctx = document.getElementById('barChart').getContext('2d');

        // 막대 그래프 생성
        var barChart = new Chart(ctx, {
        	 type: 'bar',
             data: {
                 labels: ['3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월','1월', '2월'],
                datasets: [{
                    label: '월별 매출',
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
                },
                legend: {
                    display: false // 범례 숨기기
                },
                title: {
                    display: true,
                    text: '월별 매출 현황', // 그래프 제목
                    fontSize: 20 // 제목 폰트 크기
                }
            }
        });
    </script>
</body>
</html>
