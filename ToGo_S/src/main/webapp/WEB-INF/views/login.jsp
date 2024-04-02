<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
body {
   font-family: Arial, sans-serif;
   background-color: #f4f4f4;
   margin: 0;
   padding: 0;
}

.login-container {
   max-width: 400px;
   margin: 100px auto;
   background-color: #fff;
   border-radius: 8px;
   padding: 20px;
   box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
   text-align: center;
   font-size: 100px;
   margin-bottom: 20px;
   font-weight: bold;
}

.form-group {
   margin-bottom: 20px;
}

label {
   display: block;
   margin-bottom: 5px;
   margin-left: 20px;
   font-weight: bold;
}

input[type="text"], input[type="password"] {
   width: 100%;
   padding: 10px;
   border-radius: 5px;
   border: 1px solid #ccc;
   margin-left: 20px;
   margin-right: 20px;
}

button {
   width: 100%;
   padding: 10px;
   border: none;
   background-color: #393f45;
   color: #fff;
   border-radius: 5px;
   cursor: pointer;
   transition: background-color 0.3s ease;
   margin-left: 20px;
}

button:hover {
   background-color: lightgray;
}

button:focus {
   outline: none;
}
</style>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="styles.css">
</head>

<body>
   <div id="home_div" class="text-center">

      <div class="col-lg-5 col-md-6 mb-4 contact-form">
         <div class="form tm-contact-item-inner">
            <h2>To Go</h2>
            <form action="storeLogin" method="POST">
               <div class="form-group">
                  <label for="username">아이디:</label> <input name="store_id"
                     type="text" class="form-control" placeholder=" 발급된 아이디를 입력하세요">
               </div>
               <div class="form-group">
                  <label for="password">비밀번호:</label> <input name="store_pw"
                     type="password" class="form-control"
                     placeholder="발급된 비밀번호를 입력하세요">
               </div>
               <div class="form-group text-center">
                  <button type="submit">Login</button>
               </div>
            </form>


         </div>
      </div>
</body>
</html>