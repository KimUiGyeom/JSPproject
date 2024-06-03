<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>음식아이디 오류</title>
</head>
<body>
	<div class="container py-4">
		<%@include file="header.jsp"%>

		<div class="container-fluid py-5">
			<h1 class="alert alert-danger">해당 음식이 존재하지 않습니다.</h1>
		</div>

		<div class="row align-items-md-stretch">
			<div class="col-md-12">
				<div class="h-100 p-5">
					<p>
						<a href="foods.jsp" class="btn btn-secondary">음식 목록 &raquo;</a>
					</p>
				</div>
			</div>
		</div>

		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>
