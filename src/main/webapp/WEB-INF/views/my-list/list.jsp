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
	<header>
		<h1><a href="/"><img src="" alt="오늘 뭐하지?"></a></h1>
		<div>
			<c:if test="${userInfo eq null}">
			<a href="/views/user-info/login">로그인</a>
			<a href="/views/user-info/join">회원가입</a>
			</c:if>
			<c:if test="${userInfo ne null}">
			<a href="/auth/logout">로그아웃</a>
			<a href="/views/user-info/view">회원정보</a>
			</c:if>
		</div>
		<div>
			<input type="text" value="검색어 입력">
			<input type="submit" value="검색">
		</div>
		<nav>
			<ul id="menu">
				<li><a href="/views/festivalInfo/list">지역별 축제</a>
				<li><a href="">전국 축제</a>
				<li><a href="">인기 축제</a>
				<li><a href="/views/my-list/list">마이리스트</a>
			</ul>
		</nav>		
	</header>
	<!-- HEADER END -->
	
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
	<!-- MAIN END -->
	
	<!-- FOOTER -->
	<footer>
		<div>
			<p>오늘 뭐하지?</p>
		</div>
		<div>
			<p>사이트 제작 : NowonEzen3rdTeam</p>
		</div>
		<p>팀원 : 남궁명건, 박진영, 송준수, 최아름, 현상민</p>
		<p>팀 이메일 : nowonezen3rdteam@gmail.com</p>
		<p>데이터 제공 : 한국관광공사</p>
	</footer>
	<!-- FOOTER END -->
	
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
	.then(function(myLists){
		console.log(myLists);
		let html = '';
		for(let myListValue of myLists){
			const myList = myListValue;
			console.log(myList);
			fetch('/festival-infos/' + myList.fiNum)
			.then(function(res){
				console.log(res);
				return res.json();
			})
			.then(function(fesInfo){
				html += '<tr>';
				html += '<td><input type="checkbox" name="mlNums" value="' + myList.mlNum + '"></td>';
				html += '<td>' + myList.mlDate + '</td>';
				html += '<td><img src="' + fesInfo.firstimage + '" height=125px></td>';
				html += '<td><a href="/views/festivalInfo/viewItem?fiNum=' + myList.fiNum + '">' + fesInfo.title + '</a></td>';
				html += '<td>' + fesInfo.addr1 + '</td>';
				html += '<td>' + fesInfo.eventstartdate + '</td>';
				html += '<td>' + fesInfo.eventenddate + '</td>';
				html += '</tr>';
				document.querySelector('#tBody').innerHTML = html;
			});
		}
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