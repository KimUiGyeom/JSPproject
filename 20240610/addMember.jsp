<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<title>회원가입</title>
</head>
<body>
	<div class="container py-4">
	<form method="post" action="processAddMember.jsp">
		<p>아이디 : <input type="text" name="id" required></p>
		<p>비밀번호 : <input type="password" name="password" required></p>
		<p>이름 : <input type="text" name="name" required></p>
		<p>성별 : 
			<select name="gender">
				<option value="male">남성</option>
				<option value="female">여성</option>
			</select>
		</p>
		<p>생일 : <input type="date" name="birth"></p>
		<p>이메일 : <input type="email" name="mail"></p>
		<p>핸드폰번호 : <input type="tel" name="phone"></p>
		<p>주소 : <input type="text" name="address"></p>
		<p><input type="submit" value="등록"></p>
	</form>
	</div>
</body>
</html>
