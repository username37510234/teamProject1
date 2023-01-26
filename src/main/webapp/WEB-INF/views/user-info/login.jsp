<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<P>${msg}</P>
<input type="text" id="uiId" placeholder="아이디"><br>
<input type="password" id="uiPwd" placeholder="비밀번호"><br>
<button onclick="login()">Login</button>
<script>
function login(){
	let param = {
			uiId : document.querySelector('#uiId').value,
			uiPwd : document.querySelector('#uiPwd').value
	}
	fetch('/login',{
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