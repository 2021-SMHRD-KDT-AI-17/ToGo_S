<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="kr.smhrd.mapper.OrderMapper"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 매출 내역</title>

<style>

body{
	background: #C5C6BD;
	text-align: center;

}

h2{
	font-size: 30px;
}

table {
    border-collapse: collapse;
    width: 100%;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
}

th {
    background-color: #343a40;
    color: #ffffff;
    font-weight: bold;
    padding: 15px 10px;
    text-align: center;
    border-bottom: 2px solid #dee2e6;
}

td {
    padding: 15px 10px;
    border-bottom: 1px solid #dee2e6;
    font-weight: bold;
}

tr:nth-child(even) {
    background-color: #f8f9fa;
}

tr:nth-child(odd) {
    background-color: #ffffff;
}

tr:hover {
    background-color: #e9ecef;
}

.total-price {
    font-weight: bold;
    font-size: 24px;
    color: black;
    margin-top: 24px;
    margin-bottom: 10px;
    padding-top:10px;
    text-align: right;
}

.go-back-button {
    padding: 10px 20px;
    font-size:22px;
    font-weight:bold;
    margin-left:30px;
    background-color: #3498db;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
    float: right;
}

.overflow-scroll {
    overflow-y: scroll;
    max-height: 400px; 
}
.container-title{
	background: #597C45;
	height: 60px;
	padding-top:15px;
	margin-top:100px;
	border-radius: 10px;
	color: #FAFAFA;
	
}

</style>

</head>
<body style="margin: 0 auto; max-width: 700px;">

	<%
	int totalPrice = 0; // 총 가격을 저장할 변수 초기화
	%>

	<h1 class="container-title">오늘 매출 확인</h1>

	<table>
		<tr>
			<th>날짜</th>
			<th>주문 번호</th>
			<th>가격</th>
		</tr>

		<%
		ResultSet rs = null;
		try {
			rs = OrderMapper.getSalesData();
			while (rs.next()) {
		%>
		<!-- 여기에 데이터 출력 코드를 작성합니다 -->
		<tr>
			<td><%=rs.getString("ordered_at")%></td>
			<td><%=rs.getString("order_idx")%></td>
			<td><%=rs.getInt("order_total_amount")%></td>
		</tr>
		<%
		// 각 주문의 가격을 총 가격에 더합니다.
		totalPrice += rs.getInt("order_total_amount");
		}
		} catch (SQLException e) {
		e.printStackTrace();
		} finally {
		if (rs != null) {
		try {
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		}
		}
		%>
	</table>

	<h2 class="total-price">
		총 매출 :
		<%=totalPrice%>원 <a href="goMoney"><button
				class="go-back-button">뒤로가기</button></a>
	</h2>


</body>
</html>
