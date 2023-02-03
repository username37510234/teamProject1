<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!-- HEADER -->
		<header>
			<link rel="stylesheet" href="/resources/css/main.css">
			<link rel="stylesheet" href="/resources/css/common.css">
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
			<div id="headerDiv"
				class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom container">
				<a href="/" class="d-flex align-items-center col-md-auto mb-2 mb-md-0 text-dark text-decoration-none"><img
						src="" alt="오늘 뭐하지?"></a>

				<nav class="col-md-5">
					<ul id="menu" class="nav col-md-auto mb-2 justify-content-center mb-md-0">
						<li class="col-md-3"><a href="/views/festivalInfo/list" class="nav-link px-2 link-dark">지역별 축제</a>
						<li class="col-md-3"><a href="/views/festivalInfo/finishedList" class="nav-link px-2 link-dark">종료된 축제</a>
						<li class="col-md-3"><a href="/views/festivalInfo/likesList" class="nav-link px-2 link-dark">인기 축제</a>
						<li class="col-md-3"><a href="/views/my-list/list" class="nav-link px-2 link-dark">마이리스트</a>
					</ul>
				</nav>
				<div class="col-md-2">
					<input type="text" id="search" placeholder="축제명 검색(Enter)" class="form-control">
				</div>
				<div class="col-md-3">
					<div class="btn-group" role="group" aria-label="Basic example">
					<c:if test="${userInfo eq null}">
						<button class="btn btn-outline-primary"
							onclick='location.href="/views/user-info/login"'>로그인</button>
						<button class="btn btn-outline-primary" onclick='location.href="/views/user-info/join"''>회원가입</button>
					</c:if>
					<c:if test="${userInfo ne null}">
					<button class="btn btn-outline-primary" onclick=' location.href="/auth/logout"''>로그아웃</button>
						<button class="btn btn-outline-primary" onclick='location.href="/views/user-info/view"''>회원정보</button>
					</c:if>
					</div>
				</div>
			</div>
		<script>
			document.querySelector(' title').innerText = '오늘 뭐하지'; const searchDo = document.querySelector('#search'); function
				searchGo() { location.href = '/views/festivalInfo/searchlist?fesTitle=' + searchDo.value; }
			searchDo.addEventListener('keyup', key => {
				if (key.keyCode === 13) {
					searchGo();
				}
			})
		</script>
		</header>
		<!-- HEADER END -->