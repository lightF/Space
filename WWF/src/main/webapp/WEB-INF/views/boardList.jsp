<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!-- jsp파일 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<title>Board List</title>
</head>
<body>
<h1>Board List</h1>
<c:forEach var="board" items="${boardList}">
    <div class="board-item">
        <h3>${board.title}</h3>
        <p>${board.content}</p>
        <p>${board.writer}</p>
        <p>${board.indate}</p>
    </div>
</c:forEach>
</body>
</html> 