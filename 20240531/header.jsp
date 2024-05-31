<%@ page language="java" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="<%=request.getContextPath()%>/main.jsp">Uigyeomi</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNav" aria-controls="navbarNav"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav ml-auto">
			<li class="nav-item active"><a class="nav-link"
				href="<%=request.getContextPath()%>/main.jsp">Home</a></li>
			<li class="nav-item"><a class="nav-link" href="#">소식</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/foods.jsp">메뉴</a></li>
			<li class="nav-item"><a class="nav-link" href="#">리뷰</a></li>
			<li class="nav-item"><a class="nav-link" href="#">사진</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/addFood.jsp">신메뉴 등록</a></li>
		</ul>
	</div>
</nav>
