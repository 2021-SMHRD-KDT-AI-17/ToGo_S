<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
			<tr>
				<th>처리중 </th>
				<th>완료</th>
			</tr>
			<tr>
				<td>1건</td>
				<td>1건</td>
				
			</tr>
			<tr>
				<th>신규 1건 </th>
			</tr>
		</table>


		<p>주문번호 348 번</p>
		<p>소떡소떡</p>
		
		<br>
		<br>

		<p>주문번호 348 번</p>
		<p>메뉴 1개 - 결제 금액 5000원</p>
		<br>
		<br>
		<p>메뉴 정보</p>
		
		<table>
			<ul>결제 방식 - 카드방식</ul>
			<ul>결제 완료</ul>
		</table>
		
		
		<button onclick="showAlert()">조리완료</button>
		
		<script type="text/javascript">
		
			function showAlert(){
				alert("완료되었습니다!");
			}
		
		
		</script>
</body>
</html>