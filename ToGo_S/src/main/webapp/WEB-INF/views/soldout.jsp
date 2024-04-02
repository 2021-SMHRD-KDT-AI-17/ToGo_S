<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.sql.Connection, java.sql.DriverManager, java.sql.Statement, java.sql.ResultSet, java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>품절상품 관리</title>
</head>
<style>
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
	text-align: left;
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

button {
	padding: 10px 20px;
	background-color: #3498db;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
	float: right;
}

.checkbox-container {
    display: inline-block;
    margin-right: 10px;
}

.checkbox-container input[type="checkbox"] {
    width: 25px; 
    height: 25px;
    margin-right: 5px; 
}

button:hover {
	background-color: #2980b9;
}
</style>

<body>

	<h2>품절상품 관리</h2>

	<table border="1">
		<tr>
			<th>메뉴명</th>
			<th>가격</th>
			<th>품절여부</th>
		</tr>

		<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    try {
        // 데이터베이스 연결
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://project-db-campus.smhrd.com:3307/campus_23K_AI17_p2_3";
        String username = "campus_23K_AI17_p2_3";
        String password = "smhrd3";
        conn = DriverManager.getConnection(url, username, password);
        
        // 쿼리 실행
        String query = "SELECT * FROM menus";
        stmt = conn.createStatement();
        rs = stmt.executeQuery(query);
        
        // 결과 출력
        while (rs.next()) {
%>
		<tr>
			<td><%= rs.getString("menu_name") %></td>
			<td><%= rs.getString("menu_price") %></td>
			<td>
			<div class="checkbox-container">
                <input type="checkbox">
            </div>
            </td>
		</tr>
		<%

        }
    } catch (SQLException e) {
        e.printStackTrace();
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } finally {
        // 자원 해제
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
	</table>
	<button>수정하기</button>

</body>
</html>
