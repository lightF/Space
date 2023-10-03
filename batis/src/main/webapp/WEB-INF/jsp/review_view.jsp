<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리뷰 수정 페이지</title>
</head>
<body>
	<form id="d" method="post" action="./data_modify.do">
	<input type="hidden" name="ridx" value="${one.get(0)}">
	고객명 : <input type="text" name="rname" value="${one.get(1)}"><br>
	패스워드 : <input type="password" name="rpass" value="${one.get(2)}"><br>
	리뷰내용 : <textarea cols="200" rows="4" name="rtext">${one.get(3)}</textarea><br>
	<input type="submit" value="리뷰수정">
	</form>
</body>
<script>
	const ori_pw = "${one.get(2)}";	//DB에 저장된 패스워드
	document.querySelector("#d").addEventListener("submit", function(s) {
		s.preventDefault();
		if(d.rpass.value == ""){
			alert("패스워드를 입력하세요.");
		}
		else{
			//최초 입력된 패스워드와 변경할 내용에 대한 패스워드가 동일할 경우
			if(d.rpass.value == ori_pw){
				d.submit();
			}
			else{
				alert("패스워드가 올바르지 않습니다.");
			}
		}
	});
</script>
</html>
