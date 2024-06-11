<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 처리</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
</head>
<body>
	<div class="container mt-5">
		<%
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String mail = request.getParameter("mail");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		%>
		<sql:setDataSource var="dataSource"
			url="jdbc:mysql://localhost:3306/jspdb"
			driver="com.mysql.jdbc.Driver" user="root" password="1234" />

		<sql:update dataSource="${dataSource}" var="resultSet">
			UPDATE member SET password=?, mail=?, phone=?, address=? WHERE id=? AND name=?
			<sql:param value="<%=password%>" />
			<sql:param value="<%=mail%>" />
			<sql:param value="<%=phone%>" />
			<sql:param value="<%=address%>" />
			<sql:param value="<%=id%>" />
			<sql:param value="<%=name%>" />
		</sql:update>
		<c:import var="url" url="member.jsp" />
		${url}
	</div>
</body>
</html>
