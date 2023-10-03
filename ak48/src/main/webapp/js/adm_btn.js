// adm_btn.js

document.getElementById("adm_ok").addEventListener("click", function() {
	// 입력된 값 가져오기
	var 소속 = document.querySelector(".kosel:nth-of-type(1)").value;
	var 부서 = document.querySelector(".kosel:nth-of-type(2)").value;
	var 이름 = document.querySelector(".admamber1").value;
	var 직책 = document.querySelector(".kosel:nth-of-type(3)").value;
	var 아이디 = document.querySelector(".admamber2").value;
	var 패스워드 = document.querySelector(".admamber1").value;
	var 패스워드확인 = document.querySelector(".admamber4").value;
	var 이메일 = document.querySelector(".admamber3").value;
	var 연락처_앞자리 = document.getElementById("adnumber1").value;
	var 연락처_중간자리 = document.getElementById("adnumber2").value;
	var 연락처_끝자리 = document.getElementById("adnumber3").value;

	// 서버로 전송할 데이터 객체 생성
	var formData = {
		'소속': 소속,
		'부서': 부서,
		'이름': 이름,
		'직책': 직책,
		'아이디': 아이디,
		'패스워드': 패스워드,
		'패스워드확인': 패스워드확인,
		'이메일': 이메일,
		'연락처_앞자리': 연락처_앞자리,
		'연락처_중간자리': 연락처_중간자리,
		'연락처_끝자리': 연락처_끝자리
	};

	// AJAX 요청 보내기 (예시: jQuery 사용)
	$.ajax({
		url: '/register',  // 회원가입 처리를 담당하는 서버 엔드포인트 URL로 수정해야 함
		type: 'POST',
		data: formData,
		success: function(response) {
			console.log('회원가입 성공');
			// 성공적으로 회원가입되었을 때의 동작 추가
		},
		error: function(xhr, status, error) {
			console.log('회원가입 실패');
			// 회원가입 실패 시의 동작 추가
		}
	});
});

// 취소하기 버튼 클릭 이벤트 핸들러
document.getElementById("adm_cancel").addEventListener("click", function() {
	// 취소 버튼 클릭 시의 동작 추가 (예시: 현재 페이지 리로딩)
	location.reload();
	f.submit();
});