<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 댕댕이</title>
</head>
<body>
	<h2>내 댕댕이</h2>
		<hr>
		<div align="center">
			<table style="border: 1px solid;">
				<tr>
					<th>댕댕이 이름</th>
					<th>댕댕이 종</th>
				</tr>
				<c:forEach items="${ petList }" var="pet">
				<tr>
					<td><a href="${ pageContext.request.contextPath }/mypage/mypet/${ pet.spcode }">${ pet.pname } 관련 정보 보러가기</a></td>
					
					<td>${ pet.spname }</td>
					
				</tr>
				</c:forEach>
			</table>
		</div>
</body>
</html>