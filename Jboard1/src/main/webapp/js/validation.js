$(document).ready(function(){  // 줄여서 $(function(){});로 씀
	// 전송 데이터 유효성 검증(Validation)
	
	$('#user > form').submit(function(){
		
		// 아이디 중복 확인
		if(!isUidOk){
			alert('이미 사용 중인 아이디입니다.\n아이디를 다시 입력하세요.');
			return false;
		}
		// 아이디 영어여부 확인
		if(!isUidEngOk){
			alert('아이디는 영문 소문자이어야 합니다.\n아이디를 다시 입력하세요.');
			return false;
		}
		
		// 비밀번호 일치여부 확인
		if(!isPasswordOk){
			alert('비밀번호가 일치하지 않습니다.\n다시 확인하십시오.');
			return false;
		}
		
		// 이름 한글여부 확인
		if(!isNameOk){
			alert('이름은 한글 2~10자까지 입력하십시오.');
			return false;
		}
		// 별명 중복확인
		return true;
	});
});