<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="f" method="post" action="./fileupok.do" enctype="multipart/form-data">
업로드 : <input type="file" name="mfile" multiple="multiple"><br>
<input type="button" value="전송" onclick="abc()">
</form>
</body>
<script>
function abc(){
	f.submit();
}
</script>
</html>