<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="/resources/css/common.css">
    </head>

    <body>

        <!-- HEADER -->
        <%@ include file="/WEB-INF/views/common/header.jsp" %>
            <main>
                <div id="searchOption" class="container">
                    <input type="number" id="page" value="${param.page}" hidden>
                    <input type="text" id="fesTitle" value="${param.fesTitle}" hidden>
                    <div id="totalNum"></div>
                </div>
                <div class="container">
                    <h3><br> 검색 결과</h3>
                </div>
                <!-- Festival List -->
                <%@ include file="/WEB-INF/views/common/festivalList.jsp" %>
            </main>
            <!-- FOOTER -->
            <%@ include file="/WEB-INF/views/common/footer.jsp" %>
                <script src="/resources/js/createFestivalList.js"></script>
                <script src="/resources/js/searchOption.js"></script>
                <script src="/resources/js/common.js"></script>
                <script>

                    window.onload = function () {
                        loadFestivalList();
                    }
                    const textObject = document.querySelector('#searchOption #fesTitle');
                    textObject.addEventListener('keyup', event => {
                        if (event.keyCode === 13) {
                            searchFestivalList();
                        }
                    })
                    function loadFestivalList() {
                        if (!document.querySelector('#page').value) {
                            document.querySelector('#page').value = 1;;
                        }
                        fe("/festival-search" + searchUrl())
                            .then(jsonData => {
                                createList(jsonData);
                                if (jsonData.endRow === 0) {
                                    return;
                                }
                                const paging = document.querySelector('.paginaiton');
                                html = '<div class="container text-center"><h5>';
                                html += '1 ';
                                if (jsonData.prePage === 0) {
                                    html += '< ';
                                } else {
                                    html += '<a href="/views/festivalInfo/searchlist?page=1&fesTitle=${param.search}">' + '\<</a> ';
                                }
                                for (pageNum of jsonData.navigatepageNums) {
                                    if (pageNum === jsonData.pageNum) {
                                        html += pageNum + ' ';
                                    } else {
                                        html += '<a href="/views/festivalInfo/searchlist?page=' + pageNum + '&fesTitle=${param.search}">';
                                        html += pageNum + "</a> ";
                                    }
                                }
                                if (jsonData.pageNum === jsonData.pages) {
                                    html += '> ' + jsonData.pageNum;
                                } else {
                                    html += '<a href="/views/festivalInfo/searchlist?page=' + jsonData.nextPage + '&fesTitle=${param.search}">' + '\></a> ';
                                    html += '<a href="/views/festivalInfo/searchlist?page=' + jsonData.pages + '&fesTitle=${param.search}">' + jsonData.pages + '</a>'
                                }
                                html += '</h5></div>'
                                paging.insertAdjacentHTML("beforeend", html);
                            });
                    }
                </script>
    </body>

    </html>