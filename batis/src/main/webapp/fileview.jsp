<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 목록</title> <!-- 페이지 제목을 수정했습니다 -->
</head>
<body>
<h1>파일 목록</h1> <!-- 테이블 위에 제목을 추가했습니다 -->
 <form id="f" method="post" action="./fileview.do" enctype="multipart/form-data">
 <table border="1">
<thead>
<tr>
<th>파일명</th> 
</tr>
</thead>
<tbody id="datalist">
</tbody>
<tr>
<td>파일1.txt</td>
</tr>
<tr>
<td>파일2.png</td> 
</tr>
</table>
<!-- 파일 업로드 필드 추가 -->
<input type="file" name="uploadedFile" id="uploadedFile">
<input type="submit" value="파일 업로드">
</form>
</body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- jQuery 라이브러리 추가 -->
<script>
//표현식 코드는 자바스크립트 주석으로 사용하더라도 작동됨
//JSTL 먼저 작동,, JAVASCRIPT 작동후 이후 작동
//Java ->JSP ->JAVASCRIPT ->HTML
var data = Number("${data.size()}"); // JSTL로 전달된 데이터를 그대로 가져옵니다
var ea0 = "${data.get[0].getFname()}";
var ea1 = "${data.get[0].getFname()}";
var w = 0;
var html = document.getElementById("datalist");

while(w < data){
	var filenm = eval("ea"+w);
	var spnm = filenm.split(",");
	console.log(spnm);
	var aa = document.createElement("tr");
	var bb = document.createElement("td");
	
	for(var f=0; f<spnm.length; f++){
		bb.innerHTML = "a< href='#'></a>";
	}
	
	bb.append(cc);
	aa.append(bb);
	html.append(aa);
	w++;
}


</script>
</html>