<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.Statement, java.sql.ResultSet, java.sql.SQLException"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

        <c:forEach items="${m_list}" var="m" varStatus="status">
            <tr>
                <td>${m.menu_name}</td>
                <td>${m.menu_price}원</td>
                <td>
                    <div class="checkbox-container">
                        <input type="checkbox" class="soldout-checkbox" data-menu-name="${m.menu_name}"
                            data-menu-soldout="${m.menu_soldout}">
                    </div>
                </td>
            </tr>
        </c:forEach>
    </table>
    <button onclick="updateSoldout()">수정하기</button>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
const checkboxes = document.querySelectorAll('.soldout-checkbox');

checkboxes.forEach(checkbox => {
    checkbox.addEventListener('change', function() {
        var menuName = this.getAttribute('data-menu-name');
        var menuSoldout = this.getAttribute('data-menu-soldout');
        
        if (this.checked) {
        	menuSoldout = 'y';
            console.log(menuName + ' 메뉴가 매진되었습니다.' + menuSoldout);
            
        } else {
        	menuSoldout = 'n';
            console.log(menuName + ' 메뉴가 매진 상태가 해제되었습니다.' + menuSoldout);
            
        } 
		
            $.ajax({
                url: "updateSoldout",
                method: "get",
                data: {
                    "menuName": menuName,
                    "menuSoldout": menuSoldout
                },
                success: function () {
                	
                    console.log('품절 상태가 업데이트되었습니다.');
                },
                error: function () {
                    console.log('품절 상태 업데이트에 실패했습니다.');
                }
            });
        });
    });

    function updateSoldout() {
        console.log('수정하기 버튼이 클릭되었습니다.');
    }
</script>

    </script>
</body>
</html>
