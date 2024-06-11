<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<style>
.section {
	border: 1px solid #000;
	padding: 10px;
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<div class="container py-4">
		<div class="card">
			<div class="card-body">
				<h2 class="card-title">회원 정보 수정</h2>
				<form method="post" action="processUpdateMember.jsp">
					<div class="section">
						<div class="mb-3">
							<label for="id" class="form-label">아이디</label> <input type="text"
								name="id" id="id" class="form-control">
						</div>
						<div class="mb-3">
							<label for="name" class="form-label">이름</label> <input
								type="text" name="name" id="name" class="form-control">
						</div>
					</div>
					<div class="section">
						<div class="mb-3">
							<label for="password" class="form-label">비밀번호</label> <input
								type="password" name="password" id="password"
								class="form-control">
						</div>
						<div class="mb-3">
							<label for="mail" class="form-label">이메일</label> <input
								type="email" name="mail" id="mail" class="form-control">
						</div>
						<div class="mb-3">
							<label for="phone" class="form-label">핸드폰번호</label> <input
								type="tel" name="phone" id="phone" class="form-control">
						</div>
						<div class="mb-3">
							<label for="address" class="form-label">주소</label> <input
								type="text" name="address" id="address" class="form-control">
						</div>
					</div>
					<div class="mb-3">
						<input type="submit" value="수정" class="btn btn-primary">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
