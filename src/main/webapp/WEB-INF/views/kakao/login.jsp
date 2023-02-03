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
<P>${msg}</P>
<a>비밀번호 입력</a><br>
<input type="hidden" id="uiId" value="${userInfo.uiId}" readonly>
<input type="password" id="uiPwd" placeholder="비밀번호"><br>
<button onclick="login()">Login</button>
<script>
function getParam(){
	const objs = document.querySelectorAll('input');
	const param = {};
	for(const obj of objs){
		param[obj.id] = obj.value;
	}
	return param;
}

function login(){
	const param = getParam();
	param.uiId = document.querySelector('#uiId').value;
	param.uiPwd = document.querySelector('#uiPwd').value;
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
		if(data){
			data=JSON.parse(data);
			if(data.uiId){
				location.href='/';
				return;
			}
		}
		alert('비번을 확인해주세요.');
	})
}
</script>
</body>
</html>