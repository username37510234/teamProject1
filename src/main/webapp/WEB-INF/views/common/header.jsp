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
	<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom container">
		<a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none"><img src="" alt="오늘 뭐하지?"></a>
		
		<nav>
			<ul id="menu" class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
				<li><a href="/views/festivalInfo/list" class="nav-link px-2 link-dark">지역별 축제</a>
				<li><a href="/views/festivalInfo/finishedList" class="nav-link px-2 link-dark">종료된 축제</a>
				<li><a href="/views/festivalInfo/likesList" class="nav-link px-2 link-dark">인기 축제</a>
				<li><a href="/views/my-list/list" class="nav-link px-2 link-dark">마이리스트</a>
			</ul>
		</nav>
		<div>
			<input type="text" id="fesTitle" placeholder="축제명 검색" class="form-control">
		</div>
		<div>
			<c:if test="${userInfo eq null}">
			<button class="btn btn-outline-primary me-2" onclick='location.href="/views/user-info/login"'>로그인</button>
			<button class="btn btn-outline-primary me-2" onclick='location.href="/views/user-info/join"''>회원가입</button>
			</c:if>
			<c:if test="${userInfo ne null}">
			<button class="btn btn-outline-primary me-2" onclick='location.href="/auth/logout"''>로그아웃</button>
			<button class="btn btn-outline-primary me-2" onclick='location.href="/views/user-info/view"''>회원정보</button>
			</c:if>
		</div>
		<script>
			document.querySelector('title').innerText = '오늘 뭐하지';
		</script>		
	</header>
	<!-- HEADER END -->
</body>
</html>