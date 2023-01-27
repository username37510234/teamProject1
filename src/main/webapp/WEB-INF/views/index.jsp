<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- HEADER -->
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<!-- MAIN -->
	<main>
		<div>
			<table>
				<tBody id="tBody"></tBody>
			</table>
		</div>
	</main>

	<!-- FOOTER -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
<script>
window.onload = function(){
	getReadCountFesInfoImg();
}
function getReadCountFesInfoImg(){
	fetch('/festival-infos/readcount')
	.then(function(res){
		return res.json();
	})
	.then(function(list){
		console.log(list);
		let html = '';
		for(let value of list){
			const festivalInfo = value;
			html += '<img src="' + festivalInfo.firstimage + '" height=125px>';
		}
		document.querySelector('#tBody').innerHTML = html;
	})
}
</script>
</body>
</html>