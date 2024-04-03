<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.text-center {
	width: 700px;
	height: 700px;
}

h2 {
	text-align: center;
	font-size: 50px;
	margin-bottom: 40px;
	font-weight: bold;
}

.form-group {
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 10px;
	margin-left: 150px;
	font-weight: bold;
}

input[type="text"], input[type="password"] {
	width: 400px;
	height: 30px;
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #ccc;
	margin-left: auto;
	margin-right: auto;
	display: block;
}

button {
	width: 400px;
	height: 70px;
	padding: 10px;
	border: none;
	background-color: #393f45;
	color: #fff;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
	margin-left: auto;
	margin-right: auto;
	display: block;
}

.button-group {
	text-align: center;
	
}

button:hover {
	background-color: lightgray;
}

button:focus {
	outline: none;
}
</style>


</head>

<body>
	<div id="home_div" class="text-center">

		<div class="col-lg-5 col-md-6 mb-4 contact-form">
			<div class="form tm-contact-item-inner">
				<h2>To Go</h2>
				<form action="storeLogin" method="POST">
					<div class="form-group">
						<label for="username">아이디</label> <input name="store_id"
							type="text" class="form-control" placeholder=" 발급된 아이디를 입력하세요">
					</div>
					<div class="form-group">
						<label for="password">비밀번호</label> <input name="store_pw"
							type="password" class="form-control"
							placeholder="발급된 비밀번호를 입력하세요">
					</div>
					<div class="form-group button-group">
						<button type="submit">Login</button>
					</div>
				</form>


			</div>
		</div>
</body>
</html>
