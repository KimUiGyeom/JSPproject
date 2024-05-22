<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Uigyeomi restaurant</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.small-img {
	width: 300px;
	height: auto;
	display: block;
	margin-left: auto;
	margin-right: auto;
}

.welcome-message {
	text-align: center;
	padding: 20px;
}
</style>
</head>
<body class="bg-light">
	<%@ include file="header.jsp"%>

	<div class="container text-center my-4">
		<img src="<%=request.getContextPath()%>/images/img1.jpg"
			class="img-fluid small-img" alt="음식">
		<p class="welcome-message">Welcome to Uigyeomi restaurant!</p>
	</div>

	<%@ include file="footer.jsp"%>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
