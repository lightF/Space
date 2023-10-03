<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/admin_css.css?v=202309037">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<title>관리자페이지</title>
</head>
<body>
	<form id="frm" name="소속" method="post" action="">

		<div class="membody">
			<div class="adtitle">ADMINISTRATOR MEMBERSHIP</div>
			<div class="memoutline">
				<div class="memsel1">
					<ul class="memu">
						<li class="memfont">소속 및 부서선택</li>
						<li class="memlisel1"><select class="kosel">
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
						</select></li>
					</ul>
					<ul class="memu">
						<li class="memlisel1"><select class="kosel">
								<option value="">부서선택</option>
								<option value="임원">임원</option>
								<option value="회계팀">회계팀</option>
								<option value="영업팀">영업팀</option>
								<option value="전산팀">전산팀</option>
								<option value="디자인팀">디자인팀</option>
								<option value="MD팀">MD팀</option>
								<option value="고객관리팀">고객관리팀</option>
						</select></li>
					</ul>
				</div>
				<div class="memsel1">
					<ul class="memu">
						<li class="memfont">이름</li>
						<li><input type="text" class="admamber1" id="이름" name="이름"
							value="" placeholder="이름을 입력해 주세요"></li>
						<li class="memfont1">직책</li>
						<li><select class="kosel">
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
						</select></li>
					</ul>
				</div>
				<div class="memsel2">
					<ul>
						<li class="memfont">아이디</li>
						<li><input type="text" class="admamber2" id="아이디" name="아이디"
							value="" placeholder="아이디를 입력해 주세요"></li>
						<li><button class="idcheck" id="중복체크" name="중복체크" value=""
								onclick="registerCheck()">중복체크</button></li>
					</ul>
				</div>
				<div class="memsel2">
					<ul>
						<li class="memfont">패스워드</li>
						<li><input type="password" class="admamber1" id="패스워드"
							name="패스워드" value="" placeholder="패스워드를 입력해 주세요"></li>
						<li class="memfont">패스워드확인</li>
						<li><input type="password" class="admamber4" id="패스워드확인"
							name="패스워드확인" value="" placeholder="동일한 패스워드를 입력해 주세요"></li>
					</ul>
				</div>
				<div class="memsel3">
					<ul>
						<li class="memfont">이메일</li>
						<li><input type="text" class="admamber3" id="이메일" name="이메일"
							value="" placeholder="이메일을 입력해 주세요"></li>
					</ul>
				</div>
				<div class="memsel4">
					<ul>
						<li class="memfont">연락처</li>
						<li><select class="adnumber" name="연락처" id="연락처">
								<option value="010">010</option>
								<option value="011">011</option>
						</select></li>
						<li class="ad_number">-</li>
						<li><input type="text" class="adnumber" id="연락처2" name="연락처2"
							maxlength="4"></li>
						<li class="ad_number">-</li>
						<li><input type="text" class="adnumber" id="연락처3" name="연락처3"
							maxlength="4"></li>
					</ul>
				</div>

			</div>
		</div>
		<div class="admembt">
			<ul>
				<li><button type="submit" class="admembt_ok" id="adm_ok"
						onclick="완료">신청하기</button></li>
				<li><button type="submit" class="admembt_no" id="adm_cancel">취소하기</button></li>
			</ul>
		</div>
	</form>
</body>
<script type="text/javascript">
    e.preventDefault();  // 폼 제출 방지
    
    var formData = {
        소속: $('#소속선택').val(),
        부서: $('#부서선택').val(),
        이름: $('#이름').val(),
        직책: $('#직책선택').val()
    };
    
    // Ajax 요청
    $.ajax({
        url: '/saveMembership',  // 멤버십 저장 API 엔드포인트 경로 설정
        type: 'POST',
        data: JSON.stringify(formData),
        contentType: 'application/json',
        success: function(response) {
            alert('신청이 완료되었습니다!');
            // 추가적인 로직 수행 (예: 페이지 리로드)
            location.reload();
       },
       error:function(xhr,status,error){
         console.error(error);
       }
   });
});
</script>
</html>