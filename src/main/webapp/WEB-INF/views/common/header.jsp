<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<a href="/views/user-info/login">회원가입</a>
			</c:if>
			<c:if test="${userInfo ne null}">
			<a href="/auth/logout">로그아웃</a>
			<a href="/auth/view">회원정보</a>
			</c:if>
		</div>
		<div>
			<input type="text" id="fesTitle" value="축제명 검색">
			<button type="button" onclick="">검색하기</button>
		</div>
		<nav>
			<ul id="menu">
				<li><a href="/views/festivalInfo/list">지역별 축제</a>
				<li><a href="/views/festivalInfo/finishedList">종료된 축제</a>
				<li><a href="/views/festivalInfo/likesList">인기 축제</a>
				<li><a href="/views/my-list/list">마이리스트</a>
			</ul>
		</nav>
		<script>
			document.querySelector('title').innerHTML = '오늘 뭐하지';
		</script>		
	</header>
	<!-- HEADER END -->
</body>
</html>