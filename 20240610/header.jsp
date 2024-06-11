<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String sessionId = (String) session.getAttribute("sessionId");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>헤더</title>
</head>
<body>
    <header class="pb-3 mb-4 border-bottom">
        <div class="container">
            <div
                class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                <a href="./main.jsp"
                    class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32"
                        fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
                        <path
                            d="M8.707 1.5l6.647 5.5.646-.5.146-.5-.5-.5L8.707 1.5zM1.293 7L8 1.586l.5-.5.5.5 6.707 5.414-1 .25-1-.25-.646-.5L8.707 2.207 2.5 7.5 1.293 7zm2.5.5h-.5v7H4v-4h8v4h1v-7H3.793z" />
                    </svg> <span class="fs-4">Home</span>
                </a>
                <ul class="nav nav-pills">
                    <c:choose>
                        <c:when test="${empty sessionId}">
                            <li class="nav-item"><a class="nav-link"
                                href="<c:url value='/loginMember.jsp'/>">로그인</a></li>
                            <li class="nav-item"><a class="nav-link"
                                href="<c:url value='/addMember.jsp'/>">회원 가입</a></li>
                        </c:when>
                        <c:otherwise>
                            <li style="padding-top: 7px; color: black;">[<%=sessionId%>님]</li>
                            <li class="nav-item"><a class="nav-link"
                                href="<c:url value='/logoutMember.jsp'/>">로그아웃</a></li>
                            <li class="nav-item"><a class="nav-link"
                                href="<c:url value='/updateMember.jsp'/>">회원 수정</a></li>
                            <li class="nav-item"><a class="nav-link text-danger"
                                href="<c:url value='/deleteMember.jsp'/>">회원 탈퇴</a></li>
                        </c:otherwise>
                    </c:choose>
                    <li class="nav-item"><a class="nav-link"
                        href="<c:url value='/foods.jsp'/>">전체 음식</a></li>
                    <li class="nav-item"><a class="nav-link"
                        href="<c:url value='/addFood.jsp'/>">음식 등록</a></li>
                    <li class="nav-item"><a class="nav-link"
                        href="<c:url value='/editFood.jsp'/>">음식 수정</a></li>
                    <li class="nav-item"><a class="nav-link"
                        href="<c:url value='/deleteFood.jsp'/>">음식 삭제</a></li>
                </ul>
            </div>
        </div>
    </header>
</body>
</html>
