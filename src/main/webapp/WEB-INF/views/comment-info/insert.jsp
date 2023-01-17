<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
	<tr>
		<th>축제</th>
		<td><input type="text" id="title"></td>
	</tr>
	<tr>
		<th>id</th>
		<td>${userInfo.uiId}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="10" cols="40" id="ciContent"></textarea></td>
	</tr>
	<tr>
		<th colspan="2">
			<button onclick="insertCommentInfo()">등록</button>
			<button>리스트</button>
		</th>
	</tr>
</table>
// 작성일 ,수정일 함께 구현하려다 실패, 다시해야함
// db 수정일도 추가하기
// userInfo, festivalInfo에서 정보 받아오는 법 찾기

<script>
function insertCommentInfo(){
	const param = {};
	param.title = document.querySelector('#title').value;
	param['ciContent'] = document.querySelector('#ciContent').value;
	
	fetch('/comment-infos',{
		method:'POST',
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