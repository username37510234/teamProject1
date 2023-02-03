<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
</head>
<body>
<!-- HEADER -->
			<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!-- Main -->
<main>
	<div>
		이름 : <input type="text" id="uiName" value="${userInfo.uiName}"><br>
		닉네임 : <input type="text" id="uiNickname" value="${userInfo.uiNickname}"><br>
	</div> 
	<button onclick="update()">회원수정</button>
</main>
<!-- FOOTER -->
			<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
	
	
	
	
	
	<script>
	function update(){
		const param = {
				uiName : document.querySelector('#uiName').value,
				uiNickname : document.querySelector('#uiNickname').value
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