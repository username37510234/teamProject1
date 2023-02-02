<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        
    </head>

    <body>
        <!-- HEADER -->
        <%@ include file="/WEB-INF/views/common/header.jsp" %>
            <main>
                <div id="searchOption" class="container">
                    <input type="number" id="page" value=1 hidden>
                    <select name="" id="fesMonth" onchange="searchFestivalList()">

                    </select>
                    <select name="" id="fesLocal" onchange="searchFestivalList()">

                    </select>
                    축제명 검색
                    <input type="text" id="fesTitle"><button type="button" onclick="searchFestivalList()">검색하기</button>
                </div>
                <div id="mainContent" class="container">
                    <div id="totalNum"></div>
                    <table>
                        <tr>
                            <th></th>
                            <th>축제 이름</th>
                            <th>위치</th>
                            <th>시작일</th>
                            <th>종료일</th>
                        </tr>
                        <tbody id="tBody"></tbody>
                    </table>
                </div>
                <div class="paginaiton"></div>
            </main>
            <!-- FOOTER -->
            <%@ include file="/WEB-INF/views/common/footer.jsp" %>
                <script src="/resources/js/createFestivalList.js"></script>
                <script src="/resources/js/searchOption.js"></script>
                <script src="/resources/js/common.js"></script>
                <script>

                    window.onload = function () {
                        addMonthOption();
                        addLocalOption();
                        loadFestivalList();
                    }
                    const textObject = document.querySelector('#searchOption #fesTitle');
                    textObject.addEventListener('keyup', event => {
                        if (event.keyCode === 13) {
                            searchFestivalList();
                        }
                    })
                    function loadFestivalList() {
                        fe("/festival-infos" + searchUrl())
                            .then(jsonData => {
                                createList(jsonData);
                            });
                    }
                    YesScroll()
                </script>
    </body>

    </html>