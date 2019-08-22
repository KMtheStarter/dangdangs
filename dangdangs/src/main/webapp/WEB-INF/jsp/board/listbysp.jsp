<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취약종 관련 질병 게시판</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- CSS -->
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css">


<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/layout.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet" href="resources/css/board.css">
<script
	src="${ pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>


</head>
<body>
	<div class="container-fluid" style="padding-left: 0px; padding-right: 0px;">
	<header>
		<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp" />
	</header>
		<div class="backgroundForm"
			style="background-image: url('${ pageContext.request.contextPath }/resources/img/backgrounds/2.jpg'); ">
			<div class="container-fluid" style="margin: 2rem; padding: 1rem;">
		<h2 style="color: #EFF2E1;">내 댕댕이의 종에 따른 취약 질병 게시판</h2>
		
		<hr>
		<div align="center">
			<c:forEach items="${ boardListBySp }" var="boardSp">
				<div class="card"
					style="width: 18rem; padding:0.25rem; border-radius:1rem; display: inline-block; margin-top: 4rem; margin-left: 1rem; margin-right: 1rem; border: 5px solid #FF528D;">
					<img class="card-img-top" style="border-top-left-radius:1rem; border-top-right-radius:1rem; height:15rem; height: 15rem;"
						src="${ pageContext.request.contextPath }/upload/${ boardSp.bfname }"
						alt="Card image cap" >
					<div class="card-body" style="background-color:rgba(0,0,0,0.8); border-bottom-left-radius:1rem; border-bottom-right-radius:1rem; ">
						<h5 class="card-title"
							style="white-space: nowrap;color:white;	 overflow: hidden; font-size:2rem; text-overflow: ellipsis;">${ boardSp.dname }</h5>
						<p class="card-text">${ boardSp.bdate }</p>
						<a
							href="${ pageContext.request.contextPath }/board/${ boardSp.bno }"
							class="btn btn-danger btn-block" style="backgorund-color:#e50914">더 알아보기</a>
					</div>
				</div>
			</c:forEach>
		</div>
		</div>
	</div>
	</div>
</body>
</html>