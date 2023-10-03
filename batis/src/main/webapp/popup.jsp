<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팝업창</title>
</head>
<body>
데이터 출력 리스트
<span onclick="datacall()">java</span>
</body>
<script>
function datacall(){
	window.opener.f.m.value = "ak";
	self.close();
}
</script>
</html>