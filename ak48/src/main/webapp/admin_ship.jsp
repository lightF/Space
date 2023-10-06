<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="javax.xml.crypto.Data"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Date today = new Date();
	SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");	
	String v = df.format(today);
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./admin/css/admin_css.css?v=<%=v%>">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<title>Insert title here</title>
</head>
<form id="frm" name="adm" method="post" action="/Register.do">
        <div class="membody">
           <div class="adtitle">ADMINISTRATOR MEMBERSHIP</div>
           <div class="memoutline" >
              <div class="memsel1">
                <ul class="memu">
                    <li class="memfont">소속 및 부서선택</li>
                    <li class="memlisel1">
                        <select id="membership" class="kosel">
                            <option value="">소속선택</option>
                            <option value="본사">본사</option>
                            <option value="경기도">경기도</option>
                            <option value="인천">인천</option>
                            <option value="대전">대전</option>
                            <option value="세종">세종</option>
                            <option value="광주">광주</option>
                            <option value="대구">대구</option>
                            <option value="울산">울산</option>
                            <option value="전라남도">전라남도</option>
                            <option value="전라북도">전라북도</option>
                            <option value="충청남도">충청남도</option>
                            <option value="충청북도">충청북도</option>
                            <option value="경상남도">경상남도</option>
                            <option value="경상북도">경상북도</option>
                            <option value="제주도">제주도</option>                            
                        </select>
                    </li>
                </ul>
                <ul class="memu">
                    <li class="memlisel1">
                        <select id="dept" class="kosel">
                            <option value="">부서선택</option>
                            <option value="임원">임원</option>
                            <option value="회계팀">회계팀</option>
                            <option value="영업팀">영업팀</option>
                            <option value="전산팀">전산팀</option>
                            <option value="디자인팀">디자인팀</option>
                            <option value="MD팀">MD팀</option>
                            <option value="고객관리팀">고객관리팀</option>
                        </select>
                    </li>
                  </ul>
              </div>
              <div class="memsel1">
                <ul class="memu">
                    <li class="memfont">이름</li>
                    <li><input type="text" class="admamber1" id="name" name="name" placeholder="이름을 입력해 주세요"></li>
                    <li class="memfont1">직책</li>
                    <li>
                        <select id="name" class="kosel">
                            <option value="">임원</option>
                            <option value="실장">실장</option>
                            <option value="팀장">팀장</option>
                            <option value="부장">부장</option>
                            <option value="차장">차장</option>
                            <option value="과장">과장</option>
                            <option value="대리">대리</option>
                            <option value="주임">주임</option>
                            <option value="사원">사원</option>
                            <option value="전체 관리자">전체 관리자</option>
                        </select>
                    </li>
                </ul>
              </div>
             <div class="memsel2">
                <ul>
                    <li class="memfont">아이디</li>
                    <li><input type="text" class="admamber2" id="id" name="id" placeholder="아이디를 입력해 주세요"></li>
   				    <li><button class="idcheck" onclick="checkDuplicate()">중복체크</button></li>
                </ul>    
              </div>
              <div class="memsel2">
                <ul>
                    <li class="memfont">패스워드</li>
                    <li><input type="password" class="admamber1" id="password1" name="password1" onkeyup="passwordCheck()" value="" placeholder="패스워드를 입력해 주세요"></li>
                    <li class="memfont">패스워드확인</li>
                    <li><input type="password" class="admamber4" id="password2" name="password2" onkeyup="passwordCheck()" value="" placeholder="동일한 패스워드를 입력해 주세요"></li>
                </ul>    
              </div>
              <div class="memsel3">
                <ul>
                    <li class="memfont">이메일</li>
                    <li><input type="text" class="admamber3" id="email" name="email" placeholder="이메일을 입력해 주세요"></li>
                </ul>    
              </div>
              <div class="memsel4">
                <ul>
                    <li class="memfont">연락처</li>
                    <li>
                        <select class="adnumber" name="phone" id="phone">
                            <option value="010">010</option>
                            <option value="011">011</option>
                        </select>
                    </li>
                    <li class="ad_number">-</li>
                    <li><input type="text" class="adnumber" id="phone1" name="phone1" maxlength="4"></li>
                    <li class="ad_number">-</li>
                    <li><input type="text" class="adnumber" id="phone2" name="phone3" maxlength="4"></li>
                </ul>    
              </div> 
              
           </div>
        </div>
       <div class="admembt">
         <ul>
           <li><button type="submit" class="admembt_ok" id="adm_ok" onclick="goInsert()">>신청하기</button></li>
           <li><button type="submit" class="admembt_no" id="adm_cancel" onclick="goInsert()">취소하기</button></li>
        </ul>
       </div>
    </form> 
</body>
<script src="./admin/js/adm_btn.js?v=2"></script>
</html>