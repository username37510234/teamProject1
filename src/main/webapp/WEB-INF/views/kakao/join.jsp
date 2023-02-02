<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a>추가 정보를 입력해주세요.</a>
	<c:if test="${uiId ne null}"><br>
	<input type="text" id="uiName" placeholder="이름"><br>
	<input type="text" id="uiNickname" placeholder="닉네임"><button onclick="checkUiNickname()">중복확인</button><br>
	<input type="password" id="uiPwd" placeholder="비밀번호"><br>
	<input type="password" id="uiPwdCheck" placeholder="비밀번호 확인"><br>
	<button onclick="join()">회원가입</button>
	</c:if>
	
	<script>
	
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
		if(!isCheckedNickname){
			alert('닉네임 중복확인 해주세요.');
			return false;
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
		//카카오 코드 받아오기
		param.uiId= '${uiId}';
		
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
	</script>
</body>
</html>