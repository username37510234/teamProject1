<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
 <!-- HEADER -->
 <%@ include file="/WEB-INF/views/common/header.jsp" %>
 <div id="searchOption" class="container">
     <input type="number" id="page" value=1 hidden>
     <select name="" id="fesMonth" onchange="searchFestivalList()">
         <option value="">선택</option>
         <option value="01">1월</option>
         <option value="02">2월</option>
         <option value="03">3월</option>
         <option value="04">4월</option>
         <option value="05">5월</option>
         <option value="06">6월</option>
         <option value="07">7월</option>
         <option value="08">8월</option>
         <option value="09">9월</option>
         <option value="10">10월</option>
         <option value="11">11월</option>
         <option value="12">12월</option>
     </select>
     <select name="" id="fesLocal" onchange="searchFestivalList()">
         <option value="">전국</option>
         <option value="서울">서울</option>
         <option value="인천">인천</option>
         <option value="부산">부산</option>
         <option value="광주">광주</option>
         <option value="대구">대구</option>
         <option value="대전">대전</option>
         <option value="울산">울산</option>
         <option value="세종">세종</option>
         <option value="경기도">경기도</option>
         <option value="강원도">강원도</option>
         <option value="충청북도">충청북도</option>
         <option value="충청남도">충청남도</option>
         <option value="전라북도">전라북도</option>
         <option value="전라남도">전라남도</option>
         <option value="경상북도">경상북도</option>
         <option value="제주">제주</option>
     </select>
     축제명 검색
     <input type="text" id="fesTitle"><button type="button" onclick="searchFestivalList()">검색하기</button>
 </div>
 <div id="mainContent" class="container">
     <table>
         <tr>
             <th></th>
             <th>축제 명</th>
             <th>위치</th>
             <th>시작일</th>
             <th>종료일</th>
         </tr>
         <tbody id="tBody"></tbody>
     </table>
 </div>
 <div class="paginaiton"></div>
 <!-- FOOTER -->
 <%@ include file="/WEB-INF/views/common/footer.jsp" %>
     <script>
         let oneTime = false; // 글로벌 변수

         window.onload = function () {
             loadFestivalList();
         }
         function loadFestivalList() {
             const searchObjs = document.querySelectorAll('#searchOption [id]')
             let url = '?';
             for (let searchObj of searchObjs) {
                 url += searchObj.id + '=' + searchObj.value + '&';
             }
             console.log(url);
             fetch("/festival-infos-last" + url)
                 .then(function (result) {
                     return result.json();
                 }).then(function (toJsonData) {
                     html = '';
                     const body = document.querySelector('#tBody');
                     for (let data of toJsonData.list) {
                         html += '<tr><td><img src="' + data.firstimage2 + '" height=125px></td><td><a href="/views/festivalInfo/viewItem?fiNum=' + data.fiNum + '">' + data.title + '</a></td><td>' + data.addr1 + '</td>';
                         html += '<td>' + data.eventstartdate + '</td><td>' + data.eventenddate + '</td></tr>';
                     }
                     body.innerHTML += html;
                     oneTime = false;
                     document.querySelector('#page').value = Number(document.querySelector('#page').value) + 1;
                 });
         }
         function YesScroll() {
             const pagination = document.querySelector('.paginaiton'); // 페이지네이션 정보획득
             const fullContent = document.querySelector('body'); // 전체를 둘러싼 컨텐츠 정보획득
             const screenHeight = screen.height; // 화면 크기
             document.addEventListener('scroll', OnScroll, { passive: true }) // 스크롤 이벤트함수정의
             function OnScroll() { //스크롤 이벤트 함수
                 const fullHeight = fullContent.clientHeight; // 높이   
                 const scrollPosition = pageYOffset; // 스크롤 위치
                 if (fullHeight - screenHeight <= scrollPosition && !oneTime) { // 만약 전체높이-화면높이/2가 스크롤포지션보다 작아진다면, 그리고 oneTime 변수가 거짓이라면
                     oneTime = true; // oneTime 변수를 true로 변경해주고,
                     loadFestivalList(); // 컨텐츠를 추가하는 함수를 불러온다.
                 }
             }
         }
         YesScroll()

         function clearfestivalList() {
             document.querySelector('#tBody').innerHTML = '';
             document.querySelector('#page').value = 1;
         }

         function searchFestivalList() {
             clearfestivalList();
             loadFestivalList();
         }
     </script>
</head>
<body>

</body>
</html>