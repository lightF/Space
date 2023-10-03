<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
<script>
$(document).ready(function(){
	loadList();    	 
 });  
 function loadList(){
	// 서버와 통신 : 게시판 리스트 가져오기
	$.ajax({
		url : "회원/all",
		type : "get",
		dataType : "json",
		success : makeView,
		error : function(){ alert("error");  }    		
	});
 }                        //     
</script>
</html>