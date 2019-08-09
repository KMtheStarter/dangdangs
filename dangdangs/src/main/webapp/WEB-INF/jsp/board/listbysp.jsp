<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취약종 관련 질병 게시판</title>
</head>
<body>
	<h2>내 댕댕이의 종에 따른 취약 질병 게시판</h2>
	
		<hr>
		<div align="center">
			<table style="border: 1px solid;">
				<tr>
					<th>글 번호</th>
					<th>글 제목</th>
				</tr>
				<c:forEach items="${ boardListBySp }" var="boardSp">
				<tr>
					<td><a href="${ pageContext.request.contextPath }/board/${ boardSp.bno }">${ boardSp.bno }</a></td>
					<td><a href="${ pageContext.request.contextPath }/board/${ boardSp.bno }">${ boardSp.dname }</a></td>
				</tr>
				</c:forEach>
			</table>
		</div>
</body>
</html>