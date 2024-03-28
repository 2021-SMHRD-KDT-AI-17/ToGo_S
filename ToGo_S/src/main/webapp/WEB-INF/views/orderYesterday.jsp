<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>매출 내역</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: center;
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
        <th>총 매출</th>
    </tr>
    <tr>
        <td>2024-03-27</td>
        <td>상품 A</td>
        
        <td>10000</td>
        <td>100000</td>
    </tr>
    <tr>
        <td>2024-03-27</td>
        <td>상품 B</td>
        
        <td>15000</td>
        <td>225000</td>
    </tr>
    <tr>
        <td>2024-03-27</td>
        <td>상품 C</td>
        
        <td>15000</td>
        <td>225000</td>
    </tr>
    <!-- 추가적인 매출 내역을 원하는 만큼 여기에 추가 -->
</table>

</body>
</html>