<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>회원가입</title>
</head>
<body>
	<div class="container py-4">
		<div class="card">
			<div class="card-body">
				<h2 class="card-title">회원가입</h2>
				<form method="post" action="processAddMember.jsp">
					<div class="mb-3">
						<label for="id" class="form-label">아이디</label> <input type="text"
							name="id" id="id" class="form-control" required>
					</div>
					<div class="mb-3">
						<label for="password" class="form-label">비밀번호</label> <input
							type="password" name="password" id="password"
							class="form-control" required>
					</div>
					<div class="mb-3">
						<label for="name" class="form-label">이름</label> <input type="text"
							name="name" id="name" class="form-control" required>
					</div>
					<div class="mb-3">
						<label for="gender" class="form-label">성별</label> <select
							name="gender" id="gender" class="form-select">
							<option value="male">남성</option>
							<option value="female">여성</option>
						</select>
					</div>
					<div class="mb-3">
						<label for="birth" class="form-label">생일</label> <input
							type="date" name="birth" id="birth" class="form-control">
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
					<div class="mb-3">
						<input type="submit" value="등록" class="btn btn-primary">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
