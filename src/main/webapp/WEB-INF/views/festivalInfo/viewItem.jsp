<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ab2b2200ac883488e69cf3fa876c5f25"></script>
    </head>

    <body>
        <div class="float-start" style="width: 65%;">
            <table style="margin-left: 31%; margin-top: 100px">
                <tbody id="festivalInfo"></tbody>
            </table>
            <br>
        </div>
        <div id="location" class="float-end container" style="width: 35%; margin-top:100px">
            <h2> 추천 주변 관광지</h2>
        </div>
        <div id="map" class="container" style="width:500px;height:400px;">
        </div>
        <script>
            window.onload = function () {
                fetch("/festival-info/${param.fiNum}")
                    .then(function (result) {
                        return result.json();
                    }).then(function (toJsonData) {
                        let html = '';
                        const fest = toJsonData.festivalInfo;
                        html += '<td colspan=2><img src="' + fest.firstimage + '" height=600px width=90%></td>';
                        html += '<tr><td>축제명</td><td>' + fest.title + '</td></tr>';
                        html += '<tr><td>위치</td><td>' + fest.addr1 + '</td></tr>';
                        html += '<tr><td>시작일</td><td>' + fest.eventstartdate + '</td></tr>';
                        html += '<tr><td>종료일</td><td>' + fest.eventenddate + '</td></tr>';
                        document.querySelector('#festivalInfo').innerHTML = html;
                        html = '<ul class="list-group">';
                        document.querySelector('title').innerText = fest.title;
                        const locations = toJsonData.locationInfo;
                        for (let location of locations) {
                            html += '<li class="list-group-item"><img src="'+location.firstimage;
                            html += '" width="100px"><br>관광지명 :' + location.title + '<br><a href="https://map.kakao.com/link/to/' + location.title + ',' + location.mapy + ',' + location.mapx + '" target="_blank"> 위치 :' + location.addr1 + '</a></li>';
                        }
                        html += '</ul>';
                        document.querySelector('#location').innerHTML += html;
                        var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
                        if (fest.mlevel != "") {
                            mlevel = fest.mlevel;
                        } else {
                            mlevel = 4;
                        }
                        var options = { //지도를 생성할 때 필요한 기본 옵션
                            center: new kakao.maps.LatLng(fest.mapy, fest.mapx), //지도의 중심좌표.
                            level: mlevel //지도의 레벨(확대, 축소 정도)
                        };

                        var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

                        // 마커가 표시될 위치입니다 
                        var markerPosition = new kakao.maps.LatLng(fest.mapy, fest.mapx);

                        // 마커를 생성합니다
                        var marker = new kakao.maps.Marker({
                            position: markerPosition
                        });

                        // 마커가 지도 위에 표시되도록 설정합니다
                        marker.setMap(map);
                        var iwContent = '<div style="padding:5px;">' + fest.title + ' <br><a href="https://map.kakao.com/link/to/' + fest.title + ',' + fest.mapy + ',' + fest.mapx + '" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                            iwPosition = new kakao.maps.LatLng(fest.mapy, fest.mapx); //인포윈도우 표시 위치입니다

                        // 인포윈도우를 생성합니다
                        var infowindow = new kakao.maps.InfoWindow({
                            position: iwPosition,
                            content: iwContent
                        });

                        // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
                        infowindow.open(map, marker);
                    });
            }

        </script>
    </body>

    </html>