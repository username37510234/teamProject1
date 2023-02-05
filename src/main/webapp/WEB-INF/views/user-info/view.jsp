<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/css/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>
</head>
<body>
<!-- HEADER -->
			<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!-- main -->
<main>
	<div>
		이름 : ${userInfo.uiName}<br>
		닉네임 : ${userInfo.uiNickname}<br>
	</div>
	<div class="mb-3 row">
    <label for="staticEmail" class="col-sm-2 col-form-label">이름</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="${userInfo.uiName}">
    </div>
  </div>
  <div class="mb-3 row">
    <label for="staticEmail" class="col-sm-2 col-form-label">닉네임</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="${userInfo.uiNickname}">
    </div>
  </div>
  
	<div id="confirm" style="display:none">
		<input type="password" id="uiPwd" placeholder="비밀번호"><button onclick="passwordConfirm()">확인</button>
	</div>
	<button onclick="showConfirm('update')">수정</button><button onclick="showConfirm('delete')">탈퇴</button>
</main>
<!-- FOOTER -->
				<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<script>
	let _type;
	function showConfirm(type){
		_type = type;
		document.querySelector('#confirm').style.display = '';
	}
	function passwordConfirm(){
		let method = 'POST'
		if(_type==='delete'){
			method = 'DELETE';	
		}
		const param = {
				uiPwd : document.querySelector('#uiPwd').value
		}
		fetch('/user-infos/${userInfo.uiNum}',{
			method : method,
			headers : {
				'Content-Type':'application/json'
			},
			body:JSON.stringify(param)
		})
		.then(function(res){
			return res.json();
		})
		.then(function(data){
			if(data===true){
				if(_type==='update'){
					location.href='/views/user-info/update';
				}else if(_type==='delete'){
					alert('삭제완료!');
					location.href='/auth/logout';
				}
			}else{
				alert('비밀번호를 확인해주세요');
			}
		})
	}
	</script>
</body>
</html>