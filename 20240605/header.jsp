<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Header</title>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="<%=request.getContextPath()%>/main.jsp">Uigyeomi</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/main.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#">소식</a></li>
                <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/foods.jsp">메뉴</a></li>
                <li class="nav-item"><a class="nav-link" href="#">리뷰</a></li>
                <li class="nav-item"><a class="nav-link" href="#">사진</a></li>
                <li class="nav-item"><a href="./addFood.jsp" class="nav-link">신메뉴 등록</a></li>
            </ul>
        </div>
    </nav>

    <header class="pb-3 mb-4 border-bottom">
        <div class="container">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                <a href="./main.jsp" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
                        <path d="M8.707 1.5l6.647 5.5.646-.5.146-.5-.5-.5L8.707 1.5zM1.293 7L8 1.586l.5-.5.5.5 6.707 5.414-1 .25-1-.25-.646-.5L8.707 2.207 2.5 7.5 1.293 7zm2.5.5h-.5v7H4v-4h8v4h1v-7H3.793z"/>
                    </svg>
                    <span class="fs-4">Home</span>
                </a>
                <ul class="nav nav-pills">
                    <li class="nav-item"><a href="./foods.jsp" class="nav-link">음식 목록</a></li>
                    <li class="nav-item"><a href="./addFood.jsp" class="nav-link">음식 등록</a></li>
                    <li class="nav-item"><a href="./editFood.jsp?edit=update" class="nav-link">음식 수정</a></li>
                    <li class="nav-item"><a href="./editFood.jsp?edit=delete" class="nav-link">음식 삭제</a></li>
                </ul>
            </div>
        </div>
    </header>
</body>
</html>
