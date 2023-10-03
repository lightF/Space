<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JAVASCRIPT NODE</title>
</head>
<body>
<ul id="list">
	<li>윤보미</li>
	<li>박초롱</li>
</ul>
<input type="button" value="노드 앞에 추가" onclick="a()">
<input type="button" value="노드 뒤에 추가" onclick="b()">
<input type="button" value="노드 중간에 추가" onclick="c()">
<input type="button" value="노드 뒤에 삭제" onclick="d()">
<input type="button" value="노드개수" onclick="e()">
<input type="button" value="강제생성" onclick="f()">
</body>
<script>
var code = document.getElementById("list");

function a() {
	var a = document.createElement("li");
	var text = document.createTextNode("정은지");
	a.appendChild(text);
	code.insertBefore(a, code.childNodes[0]);
}

function b() {
	var a = document.createElement("li"); 
	var text = document.createTextNode("김남주"); 
	a.appendChild(text); 
	code.append(a);
}

function c() {
	var a = document.createElement("li"); 
	var text = document.createTextNode("김남주"); 
	a.appendChild(text); 
	code.insertBefore(a, code.children[1]);
}

function d() {
	if (code.children.length > 0) {
		code.removeChild(code.lastChild);
	}
}

function e() {
	var nodeCount = code.children.length;
	console.log("노드 개수: " + nodeCount);
}

function f() {
	var data = ["정", "오", "김"];
	var w = 0;
	do {
		var a = document.createElement("li");
		var text = document.createTextNode(data[w]);
		a.appendChild(text);
		code.append(a);
		w++;
	} while (w < data.length);
}
</script>
</html>
