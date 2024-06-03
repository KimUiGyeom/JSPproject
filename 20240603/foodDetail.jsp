<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ page import="dto.Food, dao.FoodRepository"%>
<%@ page errorPage="exceptionNoFoodId.jsp"%>
<jsp:useBean id="foodDAO" class="dao.FoodRepository" scope="application" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식 상세 정보</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function addToCart() {
		if (confirm("음식을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>
<style>
.food-img {
	width: 300px;
	height: 300px;
}
</style>
</head>
<body>
	<%
	String id = request.getParameter("id");
	FoodRepository dao = (FoodRepository) application.getAttribute("foodDAO");
	Food food = dao.getFoodById(id);

	if (food == null) {
		RequestDispatcher dispatcher = request.getRequestDispatcher("exceptionNoFoodId.jsp");
		dispatcher.forward(request, response);
		return;
	}
	%>
	<div class="container py-4">
		<jsp:include page="header.jsp" />

		<div class="p-5 mb-4 bg-light rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">음식 상세 정보</h1>
				<p class="col-md-8 fs-4">여기에서 음식의 상세 정보를 확인할 수 있습니다.</p>
			</div>
		</div>

		<div class="row align-items-md-stretch">
			<div class="col-md-12">
				<p>
					<img
						src="<%=request.getContextPath()%>/images/<%=food.getFoodImage()%>"
						alt="<%=food.getName()%>" class="food-img">
				</p>
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
					<%=food.getUnitPrice()%>원
				</h4>
				<form name="addForm" action="./addCart.jsp?id=<%=food.getFoodID()%>"
					method="post">
					<a href="#" class="btn btn-info" onclick="addToCart()">음식 주문 &raquo;</a> 
					<a href="./cart.jsp" class="btn btn-warning">장바구니	&raquo;</a>
					<a href="./foods.jsp" class="btn btn-secondary">음식 목록	&raquo;</a>
				</form>
				<br>
				<div>
					<form action="processDeleteFood.jsp" method="post"
						style="display: inline;">
						<input type="hidden" name="foodID" value="<%=food.getFoodID()%>" />
						<input type="submit" class="btn btn-danger" value="삭제" />
					</form>
				</div>
			</div>
		</div>

		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
