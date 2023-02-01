<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

// 축제 리스트를 json으로 받아오면 html로 만들어주는 함수
// 디자인 변경시 해당 부분 변경
function createList(jsonData) {
    if(!jsonData){
        alert("데이터를 불러오지 못했습니다. 다시 시도합니다.");
        location.reload();
        return;
    }
    html = '';
    const body = document.querySelector('#tBody');
    for (let data of jsonData.list) {
        html += '<tr><td><img src="';
        if (data.firstimage2) {
            html += data.firstimage2;
        } else {
            html += '/resources/images/noimg.jpg'
        }
        html += '" height=125px></td><td><a href="/views/festivalInfo/viewItem?fiNum=' + data.fiNum + '">' + data.title + '</a></td><td>' + data.addr1 + '</td>';
        html += '<td>' + data.eventstartdate + '</td><td>' + data.eventenddate + '</td></tr>';
    }
    body.insertAdjacentHTML('beforeend',html);
    document.querySelector('#totalNum').innerHTML = '총 ' + jsonData.total + ' 개의 축제가 검색되었습니다.';
    oneTime = false;
    document.querySelector('#page').value = Number(document.querySelector('#page').value) + 1;
}

// 축제 정보를 초기화하는 함수
function clearfestivalList() {
    document.querySelector('#tBody').innerHTML = '';
    document.querySelector('#page').value = 1;
}

// 축제 정보를 검색하기
function searchFestivalList() {
    clearfestivalList();
    loadFestivalList();
}

