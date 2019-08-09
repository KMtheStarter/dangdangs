<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<h2>마이페이지</h2>
	<hr>
	<h3>로그인된 아이디: ${ loginVO.mid }</h3>
	<hr>
	<a href="${ pageContext.request.contextPath }/mypage/${ loginVO.mid }">나의 댕댕이</a>
	<a href="${ pageContext.request.contextPath }/pet">댕댕이 등록하기</a>
</body>
</html>