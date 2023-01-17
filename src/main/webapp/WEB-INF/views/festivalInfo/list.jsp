<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
    </head>

    <body>
        <div id="searchOption">
            <select name="" id="fesMonth" onchange="loadFestivalList()">
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
            <select name="" id="fesLocal" onchange="loadFestivalList()">
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
        </div>
        <table>
            <tr>
                <th>축제 명</th>
                <th>위치</th>
                <th>시작일</th>
                <th>종료일</th>
            </tr>
            <tbody id="tBody"></tbody>
        </table>
        <script>
            window.onload = function () {
                loadFestivalList();
            }
            function loadFestivalList(){
                const searchObjs = document.querySelectorAll('#searchOption select')
                console.log(searchObjs);
                let url = '?';
                for(let searchObj of searchObjs){
                    url += searchObj.id + '=' + searchObj.value + '&';
                }
                console.log(url);
                fetch("/festival-infos"+url)
                    .then(function (result) {
                        return result.json();
                    }).then(function (toJsonData) {
                        html = '';
                        const body = document.querySelector('#tBody');
                        for(let data of toJsonData){
                            html += '<tr><td><a href="/views/festivalInfo/viewItem?fiNum='+data.fiNum+'">'+data.title+'</a></td><td>'+data.addr1+'</td>';
                            html += '<td>'+data.eventstartdate+'</td><td>'+data.eventenddate+'</td></tr>';
                        }
                        body.innerHTML = html;
                    });
            }
        </script>
    </body>

    </html>