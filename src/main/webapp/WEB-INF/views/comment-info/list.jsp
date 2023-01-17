<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>댓글목록</h2>
<input type="text" id="title"><button onclick="getCommentInfos()">검색</button>
<table border="1">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>id</th>
		<th>작성일</th>
	</tr>
	<tbody id="tBody">
	</tbody>
</table>
<button onclick="location.href='/views/comment-info/insert'">등록</button>
<script>
function getCommentInfos(){
	fetch('/comment-infos?title=' + document.querySelector('#title').value)
	.then(function(res){
		return res.json();
	})
	.then(function(list){
		let html = '';
		for(let i=0;i<list.length;i++){
			const commentInfo = list[i];
			html += '<tr>';
			html += '<td>' + commentInfo.ciNum + '</td>';
			html += '<td><a href="/views/comment-info/view?ciNum=' + commentInfo.ciNum + '">' + commentInfo.title + '</a></td>';
			html += '<td>' + commentInfo.uiId + '</td>';
			html += '<td>' + commentInfo.ciCredattim + '</td>';
			html += '</tr>';
		}
		document.querySelector('#tBody').innerHTML = html;
	})
};
window.onload = function(){
	getCommentInfos()
}
</script>
</body>
</html>