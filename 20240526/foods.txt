<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.ArrayList" import="dto.Food"
	import="dao.FoodRepository"%>
<jsp:useBean id="foodDAO" class="dao.FoodRepository" scope="application" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>음식 목록</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
.carousel-item {
	padding: 20px;
}

.food-item {
	border: 1px solid #ddd;
	padding: 10px;
	border-radius: 5px;
	margin-bottom: 10px;
	text-align: center;
}

.food-item h3 {
	margin: 0;
	padding: 0;
}

.food-item p {
	margin: 5px 0;
}

.carousel-control-prev, .carousel-control-next {
	width: 50px !important;
	height: 50px !important;
	background-color: rgba(0, 0, 0, 0.5) !important;
	border-radius: 50% !important;
	display: flex !important;
	justify-content: center !important;
	align-items: center !important;
}

.carousel-control-prev-icon, .carousel-control-next-icon {
	width: 20px !important;
	height: 20px !important;
	background-size: 100%, 100% !important;
}

.carousel-control-prev-icon {
	background-image:
		url('https://image.flaticon.com/icons/svg/271/271220.svg') !important;
}

.carousel-control-next-icon {
	background-image:
		url('https://image.flaticon.com/icons/svg/271/271228.svg') !important;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container">
		<h1>음식 목록</h1>

		<%
		ArrayList<Food> generalFoods = foodDAO.getGeneralFoods();
		ArrayList<Food> seasonalFoods = foodDAO.getSeasonalFoods();
		ArrayList<Food> otherFoods = foodDAO.getOtherFoods();
		%>

		<h2>일반음식</h2>
		<div id="generalFoodCarousel" class="carousel slide"
			data-ride="carousel">
			<ul class="carousel-indicators">
				<li data-target="#generalFoodCarousel" data-slide-to="0"
					class="active"></li>
				<li data-target="#generalFoodCarousel" data-slide-to="1"></li>
				<li data-target="#generalFoodCarousel" data-slide-to="2"></li>
			</ul>
			<div class="carousel-inner">
				<%
				int totalGeneralFoods = generalFoods.size();
				int itemsPerSlide = 3;
				int generalSlides = (int) Math.ceil((double) totalGeneralFoods / itemsPerSlide);
				for (int i = 0; i < generalSlides; i++) {
				%>
				<div class="carousel-item <%=(i == 0) ? "active" : ""%>">
					<div class="row">
						<%
						for (int j = 0; j < itemsPerSlide; j++) {
							int index = i * itemsPerSlide + j;
							if (index < totalGeneralFoods) {
								Food food = generalFoods.get(index);
						%>
						<div class="col-md-4">
							<div class="food-item">
								<h3><%=food.getName()%></h3>
								<p>
									가격:
									<%=food.getUnitPrice()%>원
								</p>
								<p>
									<a href="./foodDetail.jsp?id=<%=food.getFoodID()%>"
										class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
								</p>
							</div>
						</div>
						<%
						}
						}
						%>
					</div>
				</div>
				<%
				}
				%>
			</div>
			<a class="carousel-control-prev" href="#generalFoodCarousel"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#generalFoodCarousel"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>

		<h2>계절음식</h2>
		<div id="seasonalFoodCarousel" class="carousel slide"
			data-ride="carousel">
			<ul class="carousel-indicators">
				<li data-target="#seasonalFoodCarousel" data-slide-to="0"
					class="active"></li>
				<li data-target="#seasonalFoodCarousel" data-slide-to="1"></li>
				<li data-target="#seasonalFoodCarousel" data-slide-to="2"></li>
			</ul>
			<div class="carousel-inner">
				<%
				int totalSeasonalFoods = seasonalFoods.size();
				int seasonalSlides = (int) Math.ceil((double) totalSeasonalFoods / itemsPerSlide);
				for (int i = 0; i < seasonalSlides; i++) {
				%>
				<div class="carousel-item <%=(i == 0) ? "active" : ""%>">
					<div class="row">
						<%
						for (int j = 0; j < itemsPerSlide; j++) {
							int index = i * itemsPerSlide + j;
							if (index < totalSeasonalFoods) {
								Food food = seasonalFoods.get(index);
						%>
						<div class="col-md-4">
							<div class="food-item">
								<h3><%=food.getName()%></h3>
								<p>
									가격:
									<%=food.getUnitPrice()%>원
								</p>
								<p>
									<a href="./foodDetail.jsp?id=<%=food.getFoodID()%>"
										class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
								</p>
							</div>
						</div>
						<%
						}
						}
						%>
					</div>
				</div>
				<%
				}
				%>
			</div>
			<a class="carousel-control-prev" href="#seasonalFoodCarousel"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#seasonalFoodCarousel"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>

		<h2>기타</h2>
		<div id="otherFoodCarousel" class="carousel slide"
			data-ride="carousel">
			<ul class="carousel-indicators">
				<li data-target="#otherFoodCarousel" data-slide-to="0"
					class="active"></li>
				<li data-target="#otherFoodCarousel" data-slide-to="1"></li>
				<li data-target="#otherFoodCarousel" data-slide-to="2"></li>
			</ul>
			<div class="carousel-inner">
				<%
				int totalOtherFoods = otherFoods.size();
				int otherSlides = (int) Math.ceil((double) totalOtherFoods / itemsPerSlide);
				for (int i = 0; i < otherSlides; i++) {
				%>
				<div class="carousel-item <%=(i == 0) ? "active" : ""%>">
					<div class="row">
						<%
						for (int j = 0; j < itemsPerSlide; j++) {
							int index = i * itemsPerSlide + j;
							if (index < totalOtherFoods) {
								Food food = otherFoods.get(index);
						%>
						<div class="col-md-4">
							<div class="food-item">
								<h3><%=food.getName()%></h3>
								<p>
									가격:
									<%=food.getUnitPrice()%>원
								</p>
								<p>
									<a href="./foodDetail.jsp?id=<%=food.getFoodID()%>"
										class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
								</p>
							</div>
						</div>
						<%
						}
						}
						%>
					</div>
				</div>
				<%
				}
				%>
			</div>
			<a class="carousel-control-prev" href="#otherFoodCarousel"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#otherFoodCarousel"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
