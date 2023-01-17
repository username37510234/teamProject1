<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="text" id="uiId" placeholder="아이디"><button onclick="checkId">중복확인</button><br>
<input type="text" id="uiName" placeholder="이름"><br>
<input type="password" id="uiPwd" placeholder="비밀번호"><br>
<input type="password" id="uiPwdCheck" placeholder="비밀번호 확인"><br>
<input type="text" id="uiPhone" placeholder="전화번호"><br>
<button onclick="join()">회원가입</button>
<script type="text/javascript">

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
function join() {
	if(!isCheckedId){
		alert('중복확인 해주세요.');
		return false;
	}
	const uiId = document.querySelector('#uiId')
	if(uiId.value.trim().length<4){
		alert('아이디는 4글자 이상입니다.');
		uiId.value='';
		uiId.focus();
		return;
	}
	const uiPwd = document.querySelector('#uiPwd');
	if(uiPwd.value.trim().length<6){
		alert('비밀번호는 6글자 이상입니다.');
		uiPwd.value='';
		uiPwd.focus();
		return;
	}
	const uiPwdCheck = document.querySelector('#uiPwdCheck');
	if(uiPwd.value != uiPwdCheck.value){
		alert('비밀번호와 비밀번호 확인이 다릅니다.');
		uiPwdCheck.value='';
		uipwdCheck.focus();
		return;
	}
	const param = {
			uiId : document.querySelector('#uiId').value,
			uiPwd : document.querySelector('#uiPwd').value,
			uiName : document.querySelector('#uiName').value,
			uiProfile : document.querySelector('#uiPhone').value						
	}
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
		
	})
}
</script>


</body>
</html>