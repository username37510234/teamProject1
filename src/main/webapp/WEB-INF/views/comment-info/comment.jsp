<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="script/jquery-3.5.1.min.js"></script>
</head>
<body>

	<div class="comment-box">
		<div class="comment-count">
		댓글 <span id="count">0</span>
		</div>
		
		<div class="comment-name">
			<span class="writer">작성자 : <input type="text" class="form-control" id="com_writer" placeholder="이름"
			name="com_writer" value='${ciWriter}' readonly style="width: 100px; border: none;">
			</span>
		</div>
		
		<div class="comment-sbox">
			<textarea class="comment-input" id="com_content" cols="80" rows="2" name="com_content"></textarea>
		</div>
		
		<div class="insertBtn">
			<button id="Comment_insert" onclick="getList()">댓글등록</button>
		</div>
		
	</div>
	<div class="comment_Box" style="border:1px solid gray">
		
	</div>
	
<script>
function 

</script>
</body>
</html>