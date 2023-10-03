<%@page import="batis.datavo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--
	1. DB -> DTO -> Array 1차원 -> return -> Array 2차원
	현재 방식
	2. DB -> VO -> Array 1차원 -> Viewpage
-->

<%
	List<datavo> rv = (List<datavo>)request.getAttribute("data");
	int total = Integer.parseInt((String)request.getAttribute("ct"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 목록 리스트</title>
</head>
<body>
	<table border="1">
		<thead>
			<tr>
				<th>고객명</th>
				<th>리뷰내용</th>
				<th>등록일</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<%
				int w = 0;
				do{
			%>
			<tr>
				<th><%=rv.get(w).getRname()%></th>
				<th><%=rv.get(w).getRtext()%></th>
				<th><%=rv.get(w).getRindate().substring(0, 10)%></th>
				<th><input type="button" value="수정" onclick="modify_review(<%=rv.get(w).getRidx()%>)"></th>
				<th><input type="button" value="삭제" onclick="delete_review(<%=rv.get(w).getRidx()%>)"></th>
			</tr>
			<%
				w++;
				}while(w < rv.size());
			%>
		</tbody>
	</table>
	<table border="1">
		<tr>
			<%
				int pg = (int) Math.ceil(total / 2f);
				int ww = 1;
				while(ww <= pg){
			%>
			<td><a href="./review_list.do?ridx=<%=ww%>"><%=ww%></a></td>
			<%
				ww++;
				}
			%>
		</tr>
	</table>
	<form id="f" method="get" action="">
	검색 : <input type="text" name="search" value="<%%>">
	<input type="submit" value="검색"> 
	</form>
</body>
<script>
	document.querySelector("#f").addEventListenr("submit",function(a){
		a.preventDefault();
		if(f.search.value==""){
			location.href='./review_list.do';
		}
		else{
			f.submit();
		}
	});

	function delete_review(no) {
		if(confirm("해당 내용 삭제 시 데이터 복구되지 않습니다.")){
			location.href='./review_delete.do?ridx='+no;
		}
	}
	
	function modify_review(no) {
		location.href='./review_modify.do?ridx='+no;
	}
</script>
</html>