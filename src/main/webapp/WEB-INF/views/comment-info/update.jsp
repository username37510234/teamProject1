<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<th>번호</th>
		<td><input type="text" id="ciNum"></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><input type="text" id="ciWriter"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="10" cols="40" id="ciContent"></textarea></td>
	</tr>
	<tr>
		<th colspan="2">
			<button onclick="updateCommentInfo()">수정</button>
			<button>리스트</button>
		</th>
	</tr>
</table>
<script>
function getComment(){
	fetch('/comment-infos/${param.ciNum}')
	.then(function(res){
		return res.json();
	})
	.then(function(commentInfo){
		document.querySelector('#ciWriter').value = commentInfo.ciWriter;
		document.querySelector('#ciContent').value = commentInfo.ciContent;
	});
}
window.onload = function(){
	getComment();
}
function updateCommentInfo(){
	const param = {};
	param.ciWriter = document.querySelector('#ciWriter').value;
	param['ciContent'] = document.querySelector('#ciContent').value;
	
	fetch('/comment-infos/${param.ciNum}',{
		method:'PATCH',
		headers : {
			'Content-Type' : 'application/json'
		},
		body : JSON.stringify(param)
	})
	.then(async function(res){
		if(res.ok){
			return res.json();
		}else{
			const err = await res.text();
			throw new Error(err);
		}
	})
	.then(function(data){
		if(data===1){
			alert('정상등록 되었습니다.');
			location.href='/views/comment-info/list';
		}
		
	})
	.catch(function(err){
		alert(err);
	});
}
</script>
</body>
</html>