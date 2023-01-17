<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ab2b2200ac883488e69cf3fa876c5f25"></script>
    </head>

    <body>
        <table id="festivalInfo">
            
        </table>
        <div id="map" style="width:500px;height:400px;"></div>
        <div id="location"></div>
        <script>
            window.onload = function () {
                fetch("/festival-info/5")
                    .then(function (result) {
                        return result.json();
                    }).then(function (toJsonData) {
                        console.log(toJsonData);
                        let html = '';
                        const fest = toJsonData.festivalInfo;
                        html += '<img src="' + fest.firstimage + '">';
                        html += '<tr><td>축제명</td><td>' + fest.title + '</td></tr>';
                        html += '<tr><td>위치</td><td>' + fest.addr1 + '</td></tr>';
                        html += '<tr><td>시작일</td><td>' + fest.eventstartdate + '</td></tr>';
                        html += '<tr><td>종료일</td><td>' + fest.eventenddate + '</td></tr>';
                        document.querySelector('#festivalInfo').innerHTML = html;
                        html = '<ul>';
                        document.querySelector('title').innerText = fest.title;
                        const locations = toJsonData.locationInfo;
                        for (let location of locations) {
                            html += '<li>관광지명 :' + location.title + ' / <a href="https://map.kakao.com/link/to/'+location.title+','+location.mapy+','+location.mapx+'" target="_blank"> 위치 :' + location.addr1 + '</a></li>';
                        }
                        html += '</ul>';
                        document.querySelector('#location').innerHTML = html;
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
                        var iwContent = '<div style="padding:5px;">'+fest.title+' <br><a href="https://map.kakao.com/link/to/'+fest.title+','+fest.mapy+','+fest.mapx+'" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
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