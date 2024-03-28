<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.smhrd.mapper.OrderMapper" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>어제 매출 내역</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
            font-weight: bold;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

<h2>어제 매출 내역</h2>

<table>
    <tr>
        <th>날짜</th>
        <th>상품명</th>
        <th>가격</th>
    </tr>
   
   <%
ResultSet rs = null;
try {
    rs = OrderMapper.getYesterdaySalesData();
    while (rs.next()) {
        // 데이터 처리
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
</body>
</html>