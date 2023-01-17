<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="text" id="uiId" value="${userInfo.uiId}" disabled><br>
<input type="text" id="uiName"  value="${userInfo.uiName}"><br>
<input type="text" id="uiPhone"  value="${userInfo.uiPhone}"><br>

<button onclick="join()">회원수정</button>
<script>

function join(){
	const param = {
			uiZip : document.querySelector('#uiZip').value,
			uiName : document.querySelector('#uiName').value,
			uiAddr1 : document.querySelector('#uiAddr1').value,
			uiAddr2 : document.querySelector('#uiAddr2').value,
			uiProfile : document.querySelector('#uiProfile').value,
			uiEmail : document.querySelector('#uiEmail').value
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