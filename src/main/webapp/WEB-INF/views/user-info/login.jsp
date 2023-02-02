<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 카카오 로그인 -->
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
	  integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous">
	</script>
	<script>
	  Kakao.init('82febca4b29e4327a47c30d8e9856913'); // <-- app KEY!!(사용하려는 앱의 JavaScript 키 입력)
	</script>
	
	<!-- 로그인이 안됐을 때 나오는 메시지 -->
	<P>${msg}</P>
	
	<div>
		<input type="text" id="uiId" placeholder="아이디"><br>
		<input type="password" id="uiPwd" placeholder="비밀번호"><br>
		<button onclick="login()">Login</button><br><br>
	</div>
	
	<div>
		<a>
			카카오 간편 로그인으로도 가입이 가능합니다.<br>
		</a>
	</div>
	
	<!-- 카카오 로그인 -->
	<a id="kakao-login-btn" href="javascript:loginWithKakao()">
	  <br><img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222"
	    alt="카카오 로그인 버튼" />
	</a>
	<p id="token-result"></p>
	
	<script>
	/* 카카오 로그인 */
	function loginWithKakao() {
	    Kakao.Auth.authorize({
	    	/* 나중에 localhost를 엘라스틱IP로 변경해야한다. */
	      redirectUri: 'http://localhost/auth/oauth',
	    });
	}
	
	/* 일반 로그인 */
	function login(){
		let param = {
				uiId : document.querySelector('#uiId').value,
				uiPwd : document.querySelector('#uiPwd').value
		}
		fetch('/auth/login',{
			method:'POST',
			headers:{
				'Content-Type':'application/json'
			},
			body:JSON.stringify(param)
		})
		.then(function(res){
			return res.text();
		})
		.then(function(data){
			if(data ){
				data=JSON.parse(data);
				if(data.uiName){
					alert(data.uiName + '님 로그인 완료!');
					location.href='/';
					return;
				}
			}
		alert('아이디 비번을 확인해주세요.');
		})
	}
	
	</script>
	
</body>
</html>