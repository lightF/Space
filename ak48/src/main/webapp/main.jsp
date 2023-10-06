<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html>
<html lang="en">
<head>
<title>Spring MVC02</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
     $(document).ready(function(){
    	loadList();    	 
     });  
     function loadList(){
    	// 서버와 통신 : 게시판 리스트 가져오기
    	$.ajax({
    		url : "ak/all",
    		type : "get",
    		dataType : "json",
    		success : makeView,
    		error : function(){ alert("error");  }    		
    	});
     } 
     function registerCheck(){
         var memID=$("#memID").val();
         $.ajax({
      	   url : "${contextPath}/memRegisterCheck.do",
      	   type : "get",
      	   data : { "memID" : memID},
      	   success : function(result){
      		   // 중복유무 출력(result=1 : 사용할수있는 아이디, 0 : 사용할수없는 아이디)
      		   if(result==1){
      			  $("#checkMessage").html("사용할 수 있는 아이디입니다.");
      			  $("#checkType").attr("class","modal-content panel-success");
      		   }else{
      			  $("#checkMessage").html("사용할 수 없는 아이디입니다."); 
      			  $("#checkType").attr("class","modal-content panel-warning");
      		   }
      		   $("#myModal").modal("show");
      	   },    	   
      	   error : function(){ alert("error"); }    	   
         });    	
      }  
  </script>
</head>
<body>
</body>
</html>