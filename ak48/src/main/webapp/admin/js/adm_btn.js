document.getElementById("member_add").addEventListener("click", function() {
	window.location.href = "index.jsp";
});
function goInsert() {
    document.frm.submit(); // 전송
}
function checkDuplicate() {
        var idInput = document.getElementById('id');
        var id = idInput.value.trim();

        if (id === '') {
            alert('아이디를 입력하세요.');
            return;
        }

        // AJAX 요청으로 서버에 중복 체크 요청
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    var result = xhr.responseText;
                    if (result === '0') {
                        alert('이미 존재하는 회원입니다.');
                    } else if (result === '1') {
                        alert('사용 가능한 아이디입니다.');
                    }
                } else {
                    alert('중복 체크에 실패했습니다.');
                }
            }
        };

        xhr.open("GET", "/Registercheck?Id=" + encodeURIComponent(id), true);
        xhr.send();
    }