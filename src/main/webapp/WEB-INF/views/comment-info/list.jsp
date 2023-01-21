<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>댓글</h2>
<input type="text" id="ciWriter"><button onclick="getCommentInfos()">검색</button>
<table border="1">
	<tr>
		<th>번호</th>
		<th>작성자</th>
		<th>내용</th>
		<th>작성일</th>
	</tr>
	<tbody id="tBody">
	</tbody>
</table>
<button onclick="location.href='/views/comment-info/insert'">등록</button>
<script>
function getCommentInfos(){
	fetch('/comment-infos?ciWriter=' + document.querySelector('#ciWriter').value)
	.then(function(res){
		return res.json();
	})
	.then(function(list){
		let html = '';
		for(let i=0;i<list.length;i++){
			const boardInfo = list[i];
			html += '<tr>';
			html += '<td>' + commentInfo.ciNum + '</td>';
			html += '<td><a href="/views/comment-info/view?ciNum=' + commentInfo.ciNum + '">' + commentInfo.ciWriter + '</a></td>';
			html += '<td>' + commentInfo.uiId + '</td>';
			html += '<td>' + commentInfo.ciRegdate + '</td>';
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