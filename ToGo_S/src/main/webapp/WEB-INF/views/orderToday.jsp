<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.smhrd.mapper.OrderMapper" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>오늘 매출 내역</title>
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

<h2>오늘 매출 내역</h2>

<table>
    <tr>
        <th>날짜</th>
        <th>상품명</th>
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
                <td><%= rs.getString("ordered_at") %></td>
                <td><%= rs.getString("mb_id") %></td>
                <td><%= rs.getInt("order_total_amount") %></td>
            </tr> 
    <%
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