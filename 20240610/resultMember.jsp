<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
</head>
<body>
	<div class="container mt-5">
		<div class="card">
			<div class="card-body">
				<h2 class="card-title">회원가입이 성공적으로 완료되었습니다!</h2>
				<p class="card-text">아래 정보를 확인해 주세요:</p>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">아이디: ${param.id}</li>
					<li class="list-group-item">이름: ${param.name}</li>
					<li class="list-group-item">성별: ${param.gender}</li>
					<li class="list-group-item">생일: ${param.birth}</li>
					<li class="list-group-item">이메일: ${param.mail}</li>
					<li class="list-group-item">핸드폰번호: ${param.phone}</li>
					<li class="list-group-item">주소: ${param.address}</li>
					<li class="list-group-item">등록일: ${param.regist_day}</li>
				</ul>
				<p class="mt-3">
					<a href="loginMember.jsp" class="btn btn-primary">로그인하기</a>
				</p>
			</div>
		</div>
	</div>
</body>
</html>
