<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="dto.Food, dao.FoodRepository"%>
<jsp:useBean id="foodDAO" class="dao.FoodRepository" scope="session" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>음식 상세 정보</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container py-4">
		<%@ include file="header.jsp"%>

		<%
		String id = request.getParameter("id");
		Food food = foodDAO.getFoodById(id);
		%>

		<div class="p-5 mb-4 bg-light rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">음식 상세 정보</h1>
				<p class="col-md-8 fs-4">여기에서 음식의 상세 정보를 확인할 수 있습니다.</p>
			</div>
		</div>

		<div class="row align-items-md-stretch">
			<div class="col-md-12">
				<h3>
					<b><%=food.getName()%></b>
				</h3>
				<p><%=food.getDescription()%></p>
				<p>
					<b>음식 코드:</b> <span class="badge bg-secondary"><%=food.getFoodID()%></span>
				</p>
				<p>
					<b>원산지:</b>
					<%=food.getCoo()%></p>
				<p>
					<b>칼로리:</b>
					<%=food.getCal()%>
					kcal
				</p>
				<h4>
					가격:
					<%=food.getUnitPrice()%>
					원
				</h4>
				<p>
					<a href="#" class="btn btn-info">음식 주문 &raquo;</a> <a
						href="./foods.jsp" class="btn btn-secondary">목록 &raquo;</a>
				</p>
			</div>
		</div>

		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>
