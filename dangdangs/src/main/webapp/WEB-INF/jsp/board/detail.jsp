<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


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
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
   integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
   crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function deleteComment(no){
		if(confirm("댓글을 삭제하시겠습니까?")){
			$.ajax({
				type : "PUT",
				url : "${ pageContext.request.contextPath }/comment/"+no,
				success : function(data){
					if (data == 1){
						location.href="${ pageContext.request.contextPath }/board/${ vo.bno }"
					} else {
						alert("삭제에 실패했습니다.");
					}
				}
			});
		}
	}
	
	
</script>


<style>

h2{
margin-top:10rem;
margin-bottom:10rem;
}


h7:first-child:first-letter { font-size: 5rem; float: left; padding: 10px; height: 64px; 
font-family: 'HominisNormal'; background-color: #7F7664; margin-right: 10px; color: white; border-radius: 5px; line-height: 5rem; } 


h7:first-child:first-line { font-weight: bold; font-size: 2.8rem; color: #7f7664; }







</style>

</head>
<body>
<div class="container-fluid" style="padding-left: 0px; padding-right: 0px; text-align:center; background-color:#F8F1EB" >
	<header>
		<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp" />
	</header>
	<br>


		<div class="container ourfont"
			style="font-size: 1.5rem; width: 40rem; font-weight: 400; color: black; display: inline-block;">


			


			<h5 class="text-center"
				style="color: #444444; margin-top: 10rem; font-weight: 300; font-family: 'Black Han Sans'; font-size: 10rem; margin-bottom: 0; padding: 0;">${ vo.dname }</h5>






			<h4 class="text-right"
				style="color: #314c79; margin-top: 0; font-family: 'Noto Sans KR'; font-size: 1.7rem;">
				<strong>작성일</strong>: ${ vo.bdate }
			</h4>


			<img src="${ pageContext.request.contextPath }/upload/${ vo.bfname }"
				class="rounded-circle " alt="Cinque Terre"
				style="height: 25rem; width: 25rem; border: 5px solid white; margin-top: 5rem;">
			<h5
				style="color: #444444; margin-top: 1rem; font-weight: 300; font-size: 1.5rem; font-family: 'Jua';">
				Presented by <Strong>DangDang'S</Strong>
			</h5>

			<h5
				style="color: #444444; margin-top: 10rem; font-weight: 300; font-size: 6rem; font-family: 'Black Han Sans';">나타나는
				증상들</h5>

			<ul class="text-left" style="margin-right: 2rem;">
				<c:forEach items="${ syname }" var="syname" varStatus="status">
					<li><h1
							style="font-weight: 400; color: #314c79; margin-top: 1rem; margin-left: 5rem; font-family: 'Jua'; margin-left: 0; font-size: 3rem;">
							<small>${status.count}.</small>${ syname }</h1></li>
				</c:forEach>
			</ul>

			<h5
				style="color: #444444; margin-top: 10rem; font-weight: 300; font-size: 6rem; font-family: 'Black Han Sans';">요약</h5>

			<div class="container" style="width: 50rem; text-overflow: ellipsis;">
				<h7 class="text-left"
					style="color: #444444; white-space: pre-wrap;	 overflow: hidden; margin-top:2rem; line-height:5rem; margin-right:10rem;
						 font-weight:700; font-size: 2.5rem; width:50rem; display:block; font-family:'Noto Sans KR';">${fn:replace(vo.bsum, replaceChar, "<br/>") }</h7>
			</div>

			<h5
				style="color: #444444; margin-top: 10rem; font-weight: 300; font-size: 6rem; font-family: 'Black Han Sans';">원인</h5>


			<h2 class="text-left"
				style="color: #444444; overflow: hidden; margin-top: 2rem; line-height: 5rem; font-weight: 700; font-size: 2.5rem; width: 50rem; display: block; font-family: 'Noto Sans KR';">
				${fn:replace(vo.bcause, replaceChar, "<br/>") }</h2>


			<h5
				style="color: #444444; margin-top: 10rem; font-weight: 300; font-size: 6rem; font-family: 'Black Han Sans';">치료법</h5>


			<div class="container" style="width: 50rem; text-overflow: ellipsis;">
				<h5 class="text-left"
					style="color: #444444; white-space: pre-line; overflow: hidden; margin-top: 2rem; line-height: 5rem; margin-right: 10rem; font-weight: 700; font-size: 2.5rem; width: 50rem; display: block; font-family: 'Noto Sans KR';">${fn:replace(vo.btreat, replaceChar, "<br/>") }</h5>
			</div>


			<h5
				style="color: #444444; margin-top: 10rem; font-weight: 300; font-size: 6rem; font-family: 'Black Han Sans';">관리법</h5>

			<div class="container" style="width: 50rem; text-overflow: ellipsis;">
				<h5 class="text-left"
					style="color: #444444; white-space: pre-line; overflow: hidden; margin-top: 2rem; line-height: 5rem; margin-right: 10rem; font-weight: 700; font-size: 2.5rem; width: 50rem; display: block; font-family: 'Noto Sans KR';">${fn:replace(vo.bcare, replaceChar, "<br/>") }</h5>
			</div>



			<h5
				style="color: #444444; margin-top: 10rem; font-weight: 300; font-size: 3rem; font-family: 'Black Han Sans';">우리 강아지가 걱정 된다면?</h5>


			<button type="button" class="btn ourbutton2" style="width:20rem;height:3rem; margin-top:1rem; margin-bottom:5rem; background-color:#444444;" 
				onclick="location.href='${ pageContext.request.contextPath }/diag'">진단하러
				가기</button>

		</div>
		<br> <br>




					<div align="center">
						<c:if test="${ commentList != null }">
							<table style="width : 80%">
								<c:forEach items="${ commentList }" var="comment">
									<tr>
										<th style="width: 5%">작성자</th>
										<td style="width: 7%">${ comment.mnick }</td>
										<th style="width: 5%">내용</th>
										<td>${ comment.ccontent }</td>
										<td style="width: 7%">${ comment.cdate }</td>
										<td style="width: 7%"><input type="button" value="삭제"
											onclick="deleteComment(${ comment.cno })"></td>
									</tr>
								</c:forEach>
							</table>
						</c:if>
						<c:choose>
							<c:when test="${ not empty loginVO }">
								<form method="post"
									action="${ pageContext.request.contextPath }/comment/${ vo.bno }">
									<%-- 댓글 달기 폼 cno, mnick, bno, ccontent, cdate, ctype --%>
									<input type="hidden" name="mnick" value="${ loginVO.mnick }">
									<input type="hidden" name="bno" value="${ vo.bno }">
									<table style="width: 80%;">
										<tr>
											<th>작성자</th>
											<td>${ loginVO.mnick }</td>
											<th>내용</th>
											<td></td>
										</tr>
										<tr>
											<td><textarea name="ccontent" rows="3" cols="100"></textarea>
												<button type="submit" class="btn btn-outline-dark">댓글작성</button></td>
										</tr>
									</table>
								</form>
							</c:when>
							<c:otherwise>
								<div style="width: 80%; margin-bottom: 5rem;	" >
									<a style="color:grey; font-size:2rem;"href="${ pageContext.request.contextPath }/login"><strong style="color:red; font-size:3rem;">로그인</strong> 후 댓글을 달
									수 있습니다.</a>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				

			
			
   
   
   
   
   
   
   
   
   
   
   <footer>
		<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
	</footer>
	</div>
   
</body>
</html>