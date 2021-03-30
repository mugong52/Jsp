/* 아이디, 별명, 휴대폰, 이메일 중복체크 */

var isUidOk = false;
var isUidEngOk = false;
var isPasswordOk = false;
var isNameOk = false;

$(function(){
	// 아이디 중복체크 && 아이디 영어소문자 여부 확인
	var regUid = /^[a-z]+[a-z0-9]{3,10}$/;
			
	$('input[name=uid]').focusout(function(){
		var uid  = $(this).val();
		var jsonData = {'uid': uid};
		/* 
		json은 자바스크립트 문법이므로 {} 사용
		Client와 Server는 json 형태로 정보 교환
		*/
		
		$.ajax({
			url: '/Jboard1/user/proc/checkUid.jsp', 
			type: 'get', 
			data: jsonData, 
			dataType: 'json', 
			success: function(data){
				if(data.result == 0){
					isUidOk = true;
					$('.resultId').css('color', 'green').text('사용 가능한 아이디입니다.');
					
					if(regUid.test(uid) == true){
						isUidEngOk = true;
					}else{
						isUidEngOk = false;
						$('.resultId').css('color', 'red').text('아이디는 영문소문자, 숫자 조합 4~10자까지입니다.');
					}
				}else{
					isUidOk = false;
					$('.resultId').css('color', 'red').text('이미 사용 중인 아이디입니다.');
				}
			} 
		});		
	});
	
	// 비밀번호 일치여부 확인
	$('input[name=pass2]').focusout(function(){
		var pass1 = $('input[name=pass1]').val();
		var pass2 = $('input[name=pass2]').val();
		
		if(pass1 == pass2){
			isPasswordOk = true;
			$('.resultPass').css('color', 'green').text('비밀번호가 일치합니다.');
		}else{
			isPasswordOk = false;
			$('.resultPass').css('color', 'red').text('비밀번호가 일치하지 않습니다.');
		}
	});
	
	// 이름 한글여부 확인
	var regName = /^[가-힣]{2,10}$/;
	
	$('input[name=name]').focusout(function(){
		
		var name = $(this).val();
		
		if(regName.test(name) == true){
			isNameOk = true;
			$('.resultName').text('');
		}else{
			isNameOk = false;
			$('.resultName').css('color', 'red').text('이름은 한글 2~10자까지 입력하십시오.');
		}
	});
	
	// 별명 중복체크
	var inputNick = $('input[name=nick]');
			
	inputNick.focusout(function(){
		var nick  = $(this).val();
		var jsonData = {'nick': nick};
		
		$.ajax({
			url: '/Jboard1/user/proc/checkNick.jsp', 
			type: 'get', 
			data: jsonData, 
			dataType: 'json', 
			success: function(data){
						
				if(data.result == 0){
					$('.resultNick').css('color', 'green').text('사용 가능한 별명입니다.');
				}else{
					$('.resultNick').css('color', 'red').text('이미 사용 중인 별명입니다.');
				}
			} 
		});		
	});
	
	// 이메일 중복체크
	var inputEmail = $('input[name=email]');
			
	inputEmail.focusout(function(){
		var email  = $(this).val();
		var jsonData = {'email': email};
		
		$.ajax({
			url: '/Jboard1/user/proc/checkEmail.jsp', 
			type: 'get', 
			data: jsonData, 
			dataType: 'json', 
			success: function(data){
						
				if(data.result == 0){
					$('.resultEmail').css('color', 'green').text('사용 가능한 이메일입니다.');
				}else{
					$('.resultEmail').css('color', 'red').text('이미 사용 중인 이메일입니다.');
				}
			} 
		});		
	});
	// 휴대폰 중복체크
	var inputHp = $('input[name=hp]');
			
	inputHp.focusout(function(){
		var hp  = $(this).val();
		var jsonData = {'hp': hp};
		
		$.ajax({
			url: '/Jboard1/user/proc/checkHp.jsp', 
			type: 'get', 
			data: jsonData, 
			dataType: 'json', 
			success: function(data){
						
				if(data.result == 0){
					$('.resultHp').css('color', 'green').text('사용 가능한 휴대폰 번호입니다.');
				}else{
					$('.resultHp').css('color', 'red').text('이미 사용 중인 휴대폰 번호입니다.');
				}
			} 
		});		
	});
});