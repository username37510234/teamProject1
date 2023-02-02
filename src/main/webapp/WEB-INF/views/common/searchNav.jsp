<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!-- NAV -->
    <nav id="searchNav">
        <div id="searchOption" class="container">
            <input type="number" id="page" value=1 hidden>
            <select name="" id="fesMonth" onchange="searchFestivalList()">

            </select>
            <select name="" id="fesLocal" onchange="searchFestivalList()">

            </select>
            축제명 검색
            <input type="text" id="fesTitle"><button type="button" onclick="searchFestivalList()">검색하기</button>
            <div id="totalNum"></div>
        </div>
    </nav>
    <!-- NAV END -->