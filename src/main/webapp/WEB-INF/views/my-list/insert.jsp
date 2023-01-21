<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
window.onload = function(){
	insertDipInfo();
}
function insertDipInfo(){
	const param = {};
	param.diNum = document.querySelector('#diNum').value;
	param.diActive = document.querySelector('#diActive').value;
	param.diDate = document.querySelector('#diDate').value;
	param.uiNum = document.querySelector('#uiNum').value;
	param.fiNum = document.querySelector('#fiNum').value;	
	fetch('/dib-infos',{
		method : 'POST',
		headers: {
			'Content-Type' : 'application/json'
		},
		body : JSON.stringify(param)
	})
	.then(function(res){
		return res.json();
	})
	.then(function(data){
		console.log(data);
 		if(data==1){
			alert('찜 성공!');
			location.href='/views/dip-info/list'
		} else {
			alert('찜 실패!');
		}
	})
}
</script>
</body>
</html>