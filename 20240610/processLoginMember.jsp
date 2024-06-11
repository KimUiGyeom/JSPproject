<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String id = request.getParameter("id");
String password = request.getParameter("password");
session.setAttribute("sessionId", null);
%>

<sql:setDataSource var="dataSource"
    url="jdbc:mysql://localhost:3306/jspdb"
    driver="com.mysql.cj.jdbc.Driver" user="root" password="1234" />

<sql:query dataSource="${dataSource}" var="result">
    SELECT * FROM member WHERE id = ? AND password = ?
    <sql:param value="<%=id %>" />
    <sql:param value="<%=password %>" />
</sql:query>

<c:choose>
    <c:when test="${not empty result.rows}">
        <c:set var="sessionId" value="${param.id}" scope="session" />
        <c:redirect url="main.jsp" />
    </c:when>
    <c:otherwise>
        <c:redirect url="loginMember.jsp?error=true" />
    </c:otherwise>
</c:choose>
