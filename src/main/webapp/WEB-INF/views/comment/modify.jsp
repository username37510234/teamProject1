<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
</head>
<body>

<div>

	<form method="post" action="/comment/modify">
	
		<p>
			<label>댓글 작성자</label> <input type="text" name="ciWriter" readonly="readonly" value="${comment.ciWriter}">
		</p>
		<p>
			<textarea rows="5" cols="50" name="ciContent">${comment.ciContent}</textarea>
		</p>
		<p>
			<input type="hidden" name="bno" value="${param.fiNum}">
			<input type="hidden" name="rno" value="${comment.ciNum}">
			
			<button type="submit">댓글 수정</button>
		</p>
	</form>
	
</div>

<!-- 댓글 끝 -->

</body>
</html>