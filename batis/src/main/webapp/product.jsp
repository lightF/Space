<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품리스트 출력 </title>
</head>
<body>
<form id="f">
<input type="text" name="m" id="m"><br>
<input type="button" value="추가상품" onclick="popup()">
</form>
</body>
<script>
function popup(){
	window.open("http://192.168.110.221:8080/batis/popup.jsp","","width=500");
}
</script>
</html>