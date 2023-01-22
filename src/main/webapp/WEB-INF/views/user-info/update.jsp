<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="text" id="uiId" value="${userInfo.uiId}" disabled>아이디<br>
<input type="text" id="uiName"  value="${userInfo.uiName}">이름<br>
<input type="text" id="uiNickname"  value="${userInfo.uiNickname}">닉네임<br>
<input type="text" id="uiPhone"  value="${userInfo.uiPhone}">휴대폰번호<br>


<button onclick="join()">회원수정</button>
<script>

function join(){
	const param = {
			uiId : document.querySelector('#uiId').value,
			uiName : document.querySelector('#uiName').value,
			uiNickname : document.querySelector('#uiNickname').value,
			uiPhone : document.querySelector('#uiPhone').value
	}
	fetch('/user-infos/${userInfo.uiNum}',{
		method : 'PATCH',
		headers : {
			'Content-Type' : 'application/json'
		},
		body : JSON.stringify(param)
	})
	.then(function(res){
		return res.json()
	})
	.then(function(data){
		if(data===true){
			alert('수정이 성공하였습니다.')
			location.href='/views/user-info/view';
		}
	})
	.catch(function(err){
		alert('오류가 발생하였습니다.')
		location.replace();
	})
}
</script>
</body>
</html>