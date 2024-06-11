<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<style>
    .section {
        border: 1px solid #000;
        padding: 10px;
        margin-bottom: 10px;
    }
</style>
</head>
<body>
    <h2>회원 정보 수정</h2>
    <form method="post" action="processUpdateMember.jsp">
        <div class="section">
            <p>아이디: <input type="text" name="id"></p>
            <p>이름: <input type="text" name="name"></p>
        </div>
        <div class="section">
            <p>비밀번호: <input type="password" name="password"></p>
            <p>이메일: <input type="email" name="mail"></p>
            <p>핸드폰번호: <input type="tel" name="phone"></p>
            <p>주소: <input type="text" name="address"></p>
        </div>
        <p><input type="submit" value="수정"></p>
    </form>
</body>
</html>
