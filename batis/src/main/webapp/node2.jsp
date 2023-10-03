<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JAVASCRIPT NODE2 (각종 입력 사항)</title>
</head>
<body>
<div id="filediv">
파일첨부 : <input type="file" name="mfile">
</div>
<input type="button" value="파일첨부 추가" onclick="plus()">
</body>
<script>
var code = document.getElementById("filediv");
function plus(){
	var ea = code.children.length;
	if(ea < 3 ){
		var html = document.createElement("input");
		html.type="file"; //type설정시 필요
		html.name="file"; //name값 설정 
		//html.value
		html.className ="filecss";
		code.append(html);
	}
}
</script>
</html>
