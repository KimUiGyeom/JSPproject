<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>로그인</title>
</head>
<body>
    <div class="container mt-5">
        <h2>로그인</h2>

        <c:if test="${param.error == 'true'}">
            <div class="alert alert-danger" role="alert">
                로그인에 실패했습니다. 아이디와 비밀번호를 확인해주세요.
            </div>
        </c:if>

        <form method="post" action="processLoginMember.jsp">
            <div class="form-group">
                <label for="id">아이디</label> 
                <input type="text" class="form-control" id="id" name="id" required>
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label> 
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary">로그인</button>
        </form>
    </div>
</body>
</html>
