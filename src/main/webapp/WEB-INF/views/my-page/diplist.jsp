<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>마이 페이지에 들어갈 찜 목록 입니다.</h2>
	<table border="1">
		<tr>
			<th>찜 번호</th>
			<th>축제 번호</th>
			<th>찜한 날짜</th>
		</tr>
		<tBody id="tBody"></tBody>
	</table>
	<br>
	<button>찜 취소</button>
<script>
window.onload = function(){
	getDipInfoList();
}
function getDipInfoList(){
	fetch('/dib-infos')
	.then(function(res){
		return res.json();
	})
	.then(function(list){
		console.log(list);
		let html = '';
		for(let value of list){
			const dibInfo = value;
			html += '<tr>';
			html += '<td>' + dibInfo.diNum + '</td>';
			html += '<td>' + dibInfo.fiNum + '</td>';
			html += '<td>' + dibInfo.diDate + '</td>';
			html += '</tr>';
		}
		document.querySelector('#tBody').innerHTML = html;
	});
}
</script>
</body>
</html>