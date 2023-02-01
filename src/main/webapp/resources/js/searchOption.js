<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

// 검색 옵션에 1~12월 추가
function addMonthOption() {
    let monthHtml = '';
    for (let i = 1; i <= 12; i++) {
        monthHtml += '<option value="' + String(i).padStart(2, "0") + '">' + i + '월</option>';
    }
    document.querySelector('#fesMonth').innerHTML += monthHtml;
}

//검색 옵션에 지역 추가
function addLocalOption() {
    const locals = ['서울', '인천', '부산', '광주', '대구',
        '대전', '울산', '세종', '경기도', '강원도', '충청북도',
        '충청남도', '전라북도', '전라남도', '경상북도', '경상남도', '제주'];
    let localHtml = '';
    for (let local of locals) {
        localHtml += '<option value="' + local + '">' + local + '</option>';
    }
    document.querySelector("#fesLocal").innerHTML += localHtml;
}