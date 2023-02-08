<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<!-- MAIN -->
	<main>
		<div>
			<table border="1">
				<tr>
					<th><input type="checkbox" name="allCheck" onclick="toggleCheck(this)"></th>
					<th>추가한 날짜</th>
					<th>축제 이미지</th>
	                <th>축제 명</th>
	                <th>위치</th>
	                <th>시작일</th>
	                <th>종료일</th>
                </tr>
                <tBody id="tBody"></tBody>
			</table>
		</div>
		<br>
		<p><button onclick="deleteMyList()">축제 삭제</button></p>
	</main>
	
	<!-- FOOTER -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
<script>
window.onload = function(){
	getMyLists();
}

function toggleCheck(obj){
	console.log(obj);
	const diNums = document.querySelectorAll('input[name="mlNums"]');
	for(const mlNum of mlNums){
		/* console.log(diNum); */
		diNum.checked = obj.checked;
	}
}

function getMyLists(){
	fetch('/my-lists')
	.then(function(res){
		return res.json();
	})
	.then(async function(myLists){
		console.log(myLists);
		let html = '';
		for(let fesInfo of myLists){
			html += '<tr>';
			html += '<td><input type="checkbox" name="mlNums" value="' + fesInfo.mlNum + '"></td>';
			html += '<td>' + fesInfo.mlDate + '</td>';
			html += '<td><img src="' + fesInfo.firstimage + '" height=125px></td>';
			html += '<td><a href="/views/festivalInfo/viewItem?fiNum=' + fesInfo.fiNum + '">' + fesInfo.title + '</a></td>';
			html += '<td>' + fesInfo.addr1 + '</td>';
			html += '<td>' + fesInfo.eventstartdate + '</td>';
			html += '<td>' + fesInfo.eventenddate + '</td>';
			html += '</tr>';
		}
		document.querySelector('#tBody').innerHTML = html;
	})
}

function deleteMyList(){
	const mlNumObjs = document.querySelectorAll('input[name="mlNums"]:checked');
	console.log(mlNumObjs);
	const mlNums = [];
	for(const mlNumObj of mlNumObjs){
		mlNums.push(mlNumObj.value);
	}
	console.log(mlNums);
	if(mlNums.length===0){
		alert('선택하세요');
		return;
	}
	const param = {
		mlNums:mlNums
	}
	fetch('/my-lists',{
		method:'DELETE',
		headers: {
			 'Content-Type': 'application/json'
		},
		body: JSON.stringify(param)
	})
	.then(function(res){
		console.log(res);
		return res.json();
	})
	.then(function(data){
		console.log(data);
		if(data>=1){
			alert('삭제 완료!');
			location.href='/views/my-list/list'
		} else {
			alert('삭제 실패!');
		}
	})
}
</script>
</body>
</html>