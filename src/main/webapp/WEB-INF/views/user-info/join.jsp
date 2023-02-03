<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
</head>
<body>
	
	<!-- 일반 회원가입 -->
	<div>
		<input type="text" id="uiId" placeholder="아이디"><button onclick="checkId()">중복확인</button><br>
		<input type="text" id="uiName" placeholder="이름"><br>
		<input type="text" id="uiNickname" placeholder="닉네임"><button onclick="checkUiNickname()">중복확인</button><br>
		<input type="password" id="uiPwd" placeholder="비밀번호"><br>
		<input type="password" id="uiPwdCheck" placeholder="비밀번호 확인"><br>
		<button onclick="join()">회원가입</button><br><br>
	</div>

	<!-- 카카오 로그인 -->
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
	  integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous">
	</script>
	<script>
	  Kakao.init('82febca4b29e4327a47c30d8e9856913'); // <-- app KEY!!(사용하려는 앱의 JavaScript 키 입력)
	</script>
	
		<div>
			<a>
				카카오 간편 로그인으로도 로그인이 가능합니다.<br>
			</a>
		</div>
	
	<!-- 카카오 로그인 -->
	<a id="kakao-login-btn" href="javascript:loginWithKakao()">
	  <br><img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222"
	    alt="카카오 가입 버튼" />
	</a>
	<p id="token-result"></p>
	
	<script>
	
	/* 일반 회원가입 */
	let isCheckedId = false;
	function checkId() {
		const uiId = document.querySelector('#uiId').value;
		if(uiId.trim().length<4){
			alert('아이디는 4글자 이상입니다.');
			return;
		}
		fetch('/user-infos/check/' + uiId)
		.then(function(data){
			return data.json();
		})
		.then(function(res){
			if(res===false){
				alert('이용이 가능한 아이디 입니다.');
				isCheckedId = true;
			}else{
				alert('이미 등록되어 있는 아이디입니다.');
				isCheckedId = false;
			}
		});
	}
	
	let isCheckedNickname = false;
	function checkUiNickname() {
		const uiNickname = document.querySelector('#uiNickname').value;
		if(uiNickname.trim().length<=2){
			alert('닉네임은 2글자 이상입니다.');
			return;
		}
		fetch('/user-infos/check-nickname/' + uiNickname)
		.then(function(data){
			return data.json();
		})
		.then(function(res){
			if(res===false){
				alert('이용이 가능한 닉네임 입니다.');
				isCheckedNickname = true;
			}else{
				alert('이미 등록되어 있는 닉네임 입니다.');
				isCheckedNickname = false;
			}
		});
	}
	
	function getParam(){
		const objs = document.querySelectorAll('input');
		const param = {};
		for(const obj of objs){
			param[obj.id] = obj.value;
		}
		return param;
	}
	
	function join() {
		if(!isCheckedId){
			alert('아이디 중복확인 해주세요.');
			return false;
		}
		if(!isCheckedNickname){
			alert('닉네임 중복확인 해주세요.');
			return false;
		}
		const uiId = document.querySelector('#uiId')
		if(uiId && uiId.value.trim().length<4){
			alert('아이디는 4글자 이상입니다.');
			uiId.value='';
			uiId.focus();
			return;
		}
		const uiNickname = document.querySelector('#uiNickname')
		if(uiNickname && uiNickname.value.trim().length<=2){
			alert('닉네임은 2글자 이상입니다.');
			uiId.value='';
			uiId.focus();
			return;
		}
		const uiPwd = document.querySelector('#uiPwd');
		if(uiPwd && uiPwd.value.trim().length<6){
			alert('비밀번호는 6글자 이상입니다.');
			uiPwd.value='';
			uiPwd.focus();
			return;
		}
		const uiPwdCheck = document.querySelector('#uiPwdCheck');
		if(uiPwdCheck && uiPwd.value != uiPwdCheck.value){
			alert('비밀번호와 비밀번호 확인이 다릅니다.');
			uiPwdCheck.value='';
			uipwdCheck.focus();
			return;
		}
		const param = getParam();
		fetch('/user-infos',{
			method : 'POST',
			headers : {
				'Content-Type' : 'application/json'
			},
			body : JSON.stringify(param)
		})
		.then(function(res){
			return res.json()
		})
		.then(function(data){
			console.log(data);
			alert('회원가입이 완료되었습니다.')
			location.href='/views/index'
		})
	}
	
	/* 카카오 로그인 */
	function loginWithKakao() {
	    Kakao.Auth.authorize({
	    	/* 나중에 localhost를 엘라스틱IP로 변경해야한다. */
	      redirectUri: 'http://localhost/auth/oauth',
	    });
  	}
	</script>
	
</body>
</html>