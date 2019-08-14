<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>게시글 작성 페이지</h2><hr>
	<div style="padding-left: 40%">
		<form method="post" action="${ pageContext.request.contextPath }/board" enctype="multipart/form-data">
			병명(제목): <input type="text" name="dname" required="required"><br>
			요약:	  <textarea name="bsum"></textarea><br>
			원인:	  <textarea name="bcause"></textarea><br>
			치료법:	  <textarea name="btreat"></textarea><br>
			관리법:	  <textarea name="bcare"></textarea><br>
			이미지:	  <input type="file" name="uploadFile"><br>
			<input type="submit" value="작성하기">
		</form>
	</div>
</body>
</html>