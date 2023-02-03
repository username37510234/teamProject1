<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="/resources/css/main.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>

    <body>
        <!-- HEADER -->
        <%@ include file="/WEB-INF/views/common/header.jsp" %>
            <main>
                <!-- NAV -->
                <%@ include file="/WEB-INF/views/common/searchNav.jsp" %>
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