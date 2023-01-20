<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div id="cDiv"></div>
<div id="btnDiv" style="display:none">
	<button onclick="location.href='/views/comment-info/update?ciNum=${param.ciNum}'">수정</button>
	<button onclick="deleteCommentInfo()">삭제</button>
</div>
<script>
function deleteCommentInfo(){
	fetch('/comment-infos/${param.ciNum}',{
		method:'DELETE'
	})
	.then(function(res){
		return res.json();
	})
	.then(function(data){
		if(data===1){
			alert('삭제 완료');
			location.href='/views/comment-info/list';
		}
	});
}
function getComment(){
	fetch('/comment-infos/${param.ciNum}')
	.then(function(res){
		return res.json();
	})
	.then(function(commentInfo){
		let html = '';
		html += '번호 : ' + commentInfo.ciNum + '<br>';
		html += '작성자 : ' + commentInfo.ciWriter + '<br>';
		html += '내용 : ' + commentInfo.ciContent + '<br>';
		html += '작성일 : ' + commentInfo.ciRegdate + '<br>';
		document.querySelector('#cDiv').innerHTML = html;
		if(commentInfo.fiNum == '${festivalInformation.fiNum}'){
			document.querySelector('#btnDiv').style.display = '';
		}
	});
}
window.onload = function(){
	getComment();
}
</script>
</body>
</html>