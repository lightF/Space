<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html xmlns:c="http://java.sun.com/jsp/jstl/core">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./admin/css/page_default.css?v=<?php echo $daterecall?>">
<link rel="stylesheet" href="./admin/css/admin_css.css?v=<?php echo $daterecall?>">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<title>관리자 페이지</title>
</head>
<body>
	<nav>
		<div class="menusize">
			<ul id="menus">
				<li class="topmenu1">ADMINISTRATOR</li>
				<li class="topmenu2">환경설정</li>
				<li class="topmenu2">회원관리</li>
				<li class="topmenu2">공지사항 관리</li>
				<li class="topmenu2">1:1 문의사항</li>
				<li class="topmenu2">예약현황</li>
				<li class="topmenu2">관리자현황</li>
				<li class="topmenu3"><span><%= session.getAttribute("name") %></span>님 환영합니다 <a href="/index.jsp">[로그아웃]</a></li>
			</ul>
		</div>
		<div class="menuline"></div>
	</nav>


	<!-- 관리자 리스트 시작 -->
	<main class="page_main">
		<section class="page_section">
			<form id="frm" name="frm" method="post"
				onsubmit="return member_search();">
				<div class="listbody">
					<div class="adlisttitle">관리자 현황</div>
					<div class="procho">
						<ul>
							<li class="prochoL procfont">소속</li>
							<li class="prochoL "><select class="adlistcsel1">
									<option value="">전체</option>
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
							</select></li>
						</ul>
					</div>
					<div class="procho">
						<ul>
							<li class="prochoL procfont">검색형식</li>
							<li class="prochoL "><select class="adlistcsel1"
								name="search_part">
									<option>이름</option>
									<option>아이디</option>
									<option>연락처</option>
							</select></li>
							<li class="prochoL"><input type="text" class="adlistcsel1"></li>
							<li class="prochoL"><input type="submit" class="proclick"
								value="검색"></li>
							<li class="prochoL"><button type="button" class="proclick">전체</button></li>
						</ul>
					</div>
					<div class="protaball">
						<table width="1100">
							<thead>
								<tr style="color: white; background-color: rgb(67, 66, 66);">
									<td class="listcenter" width=50>NO</td>
									<td class="listcenter" width=150>구분</td>
									<td class="listcenter" width=150>아이디</td>
									<td class="listcenter" width=120>이름</td>
									<td class="listcenter" width=80>직책</td>
									<td class="listcenter" width=200>이메일</td>
									<td class="listcenter" width=120>연락처</td>
									<td class="listcenter" width=120>현황</td>
									<td class="listcenter" width=110>적용</td>
								</tr>
							</thead>
							<tbody>
								<tr height="30">
									<td class="listcenter" colspan="9">등록된 관리자가 없습니다.</td>
								</tr>
								<tr class="master_list">
									<td class="listcenter" width=50></td>
									<td class="listcenter" width=150></td>
									<td class="listcenter" width=150></td>
									<td class="listcenter" width=120></td>
									<td class="listcenter" width=80></td>
									<td class="listcenter" width=200></td>
									<td class="listcenter" width=120></td>
									<td class="listcenter" width=120><select
										class="adlistsel3">
											<option>근무중</option>
											<option>퇴직중</option>
									</select></td>
									<td class="listcenter" width=110>
										<button type="button" class="listclick">적용</button>
									</td>
								</tr>
							</tbody>
					<tbody>
						<c:choose>
							<c:when test="${empty userList}">
								<tr height="30">
									<td class="listcenter" colspan="9">등록된 관리자가 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:set var="count" value="1" />
								<c:forEach items="${userList}" var="user">
									<tr class="master_list">
										<td class="listcenter" width=50>${count}</td>
										<!-- 회원 정보 출력 -->
									</tr>
									<!-- count 증가 -->
									<c:set var="count" value="${count + 1}" />
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
						</table>
					</div>


					<div class="propagebt">
						<ul>
							<li><</li>
							<li>1</li>
							<li style="margin-right: 0px;">></li>
						</ul>
					</div>
				</div>
			</form>
			<!-- 관리자 리스트 끝 -->
		</section>
	</main>
	<footer>
		<div class="menusize">Copyright ⓒ 2023 Raemian 분양안내 관리 시스템 All
			rights reserved</div>
	</footer>
</body>
<!-- 결과를 표시할 영역 -->
<div id = "searchResults"></div>
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js">
    function search() {
      var searchType = document.querySelector("#frm select[name='search_part']").value;
      var searchText = document.getElementById("searchInput").value;
      $.ajax({
          url: "/Search.do",
          method: "POST",
          data: {type: searchType, text: searchText},
          dataType: 'json',
          success: function(response) {
              displayResults(response);
          },
          error: function(xhr, status, error) {
              console.log(error);
              alert("검색에 실패했습니다.");
          }
      });
  }

  function displayResults(results) {
      var tableBody = "";
      if (results.length === 0) {
         tableBody += "<tr height='30'><td colspan='9' 
         className='listcenter'>일치하는 결과가 없습니다.</td></tr>";
      } else {
         for (var i = 0; i< results.length; i++) {
             tableBody += "<tr>";
             tableBody += "<td>" + results[i].id + "</td>";
             tableBody += "<td>" + results[i].name + "</td>";
             tableBody += "<td>" + results[i].password + "</td>";
             tableBody += "<td>" + results[i].email + "</td>";
             tableBody += "</tr>";
         }
     }

     $("#searchResults").html(tableBody);
 }

function resetSearch() {
    $("#searchInput").val(""); // 입력 필드 초기화
    search(); // 전체 검색 실행
}
</script>
</html>