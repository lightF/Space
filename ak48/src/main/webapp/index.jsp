<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./admin/css/admin_css.css?v=2023090212">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<title>관리자 페이지</title>
</head>
<body>
	<div class="adbody">
		<div class="adtitle">ADMINISTRATOR</div>
		<div class="admoom">
			<form action="${contextPath}/Login.do" method="post">
				<div class="intotal">
					<div class="adin1">
						<input type="text" name="id" id="id" class="loginid" value=""placeholder="아이디">
					</div>
					<div class="adin2">
						<input type="password" name="password" id="password" class="password" value="" placeholder="패스워드">
					</div>
				</div>
				<div class="adbt">
					<button type="submit" class="loginbt1" onclick="return validateLoginForm()">로그인</button>
					<button type="button" class="loginbt2" onclick="location.href='/Register.do'">회원가입</button>
				</div>
				<!-- 추가: 로그인 실패 메시지 표시 -->
				<%
				if (request.getAttribute("msgType") != null && request.getAttribute("msg") != null) {
				%>
				<p>${request.getAttribute("msg")}</p>
				<%
				}
				%>
			</form>
		</div>
</body>
<!-- 스크립트 추가 -->
<!-- 입력 유효성 검사 함수 -->
</html>