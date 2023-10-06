document.getElementById("member_add").addEventListener("click", function() {
	window.location.href = "admin_ship.jsp";
});
function passwordCheck() {
	var pwd1 = $("#pwd1").val();
	var pwd2 = $("#pwd2").val();
	if (pwd1 != pwd2) {
		$("#passMessage").html("비밀번호가 서로 일치하지 않습니다.");
	} else {
		$("#passMessage").html("");
		$("#memPassword").val(memPassword1);
	}
}
function registerCheck() {
	var id = $("#id").val();
	$.ajax({
		url: "${contextPath}/RegisterCheck.do",
		type: "get",
		data: { "id": id },
		success: function(result) {
			// 중복유무 출력(result=1 : 사용할수있는 아이디, 0 : 사용할수없는 아이디)
			if (result == 1) {
				$("#checkMessage").html("사용할 수 있는 아이디입니다.");
				$("#checkType").attr("class", "modal-content panel-success");
			} else {
				$("#checkMessage").html("사용할 수 없는 아이디입니다.");
				$("#checkType").attr("class", "modal-content panel-warning");
			}
			$("#myModal").modal("show");
		},
		error: function() { alert("error"); }
	});
}

function validateLoginForm() {
	var idInput = document.getElementById('id');
	var passwordInput = document.getElementById('password');

	if (idInput.value.trim() === '') {
		alert('아이디를 입력하세요.');
		return false;
	}

	if (passwordInput.value.trim() === '') {
		alert('비밀번호를 입력하세요.');
		return false;
	}

	return true;
}

// 회원가입 버튼 클릭 시 이동
function member_add() {
	window.location.href = '${contextPath}/Register.do';
}
