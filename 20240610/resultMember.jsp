<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
</head>
<body>
	<h2>회원가입이 성공적으로 완료되었습니다!</h2>
	<p>아래 정보를 확인해 주세요:</p>
	<ul>
		<li>아이디: ${param.id}</li>
		<li>이름: ${param.name}</li>
		<li>성별: ${param.gender}</li>
		<li>생일: ${param.birth}</li>
		<li>이메일: ${param.mail}</li>
		<li>핸드폰번호: ${param.phone}</li>
		<li>주소: ${param.address}</li>
		<li>등록일: ${param.regist_day}</li>
	</ul>
	<p>
		<a href="loginMember.jsp">로그인하기</a>
	</p>
</body>
</html>
