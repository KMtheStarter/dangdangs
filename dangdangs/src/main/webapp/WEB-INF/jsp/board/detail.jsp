<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<script src=“https://cdn.jsdelivr.net/npm/vue”></script>
<script src="${ pageContext.request.contextPath }/resources/js/detailVue.js"></script>
<style>

h2{
margin-top:10rem;
margin-bottom:10rem;
}
</style>

</head>
<body>
<div class="container-fluid" style="padding-left: 0px; padding-right: 0px;">
	<header>
		<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp" />
	</header>
	<br>
	<div class="backgroundForm"
		 >

			<div class="ourfont " style="font-size:1.5rem;  font-weight:400; color:black;">
				
				
					<h2>{{title}}</h2>

					<div>${ vo.bno }</div>
					<div>
						<h3>${ vo.dname }</h3>
					</div>
					<div>${ vo.bdate }</div>
					
					<img src="${ pageContext.request.contextPath }/upload/${ vo.bfname }" class="rounded-circle" alt="Cinque Terre" style="height:15rem;width:15rem;">

					<div>증상</div>

					<c:forEach items="${ syname }" var="syname">
						<li style="list-style-type: circle;">${ syname } 	
					</c:forEach>


					<h2 style="width: 7%; font-size: x-large; position:relative; left:46%   ">요약</h2>
					<div class="row" style="display:inline; height:50rem;">${fn:replace(vo.bsum, replaceChar, "<br/>") }</div>

					<h2 style="width: 7%; font-size: x-large; position:relative; left:46%">원인</h2>
					<div class="row" ><h2>${fn:replace(vo.bcause, replaceChar, "<br/>") }</h2></div>

					<h2 style="width: 7%; font-size: x-large; position:relative; left:46%">치료법</h2>
					<div class="row"><h2>${fn:replace(vo.btreat, replaceChar, "<br/>") }</h2></div>

					<h2 style="width: 7%; font-size: x-large; position:relative; left:46%">관리법!</h2>
					<div class="row"><h2>${fn:replace(vo.bcare, replaceChar, "<br/>") }</h2></div>
					<h2 style="width: 7%; font-size: x-large;">사진!</h2>
					
					<br><br>
					
					
					
					
					<div align="center">
   		<c:if test="${ commentList != null }">
   		<table style="width: 80% ">
   			<c:forEach items="${ commentList }" var="comment">
            <tr>
               <th style="width: 5%">작성자</th>
               <td style="width: 7%">${ comment.mnick }</td>
               <th style="width: 5%">내용</th>
               <td>${ comment.ccontent }</td>
               <td style="width: 7%">${ comment.cdate }</td>
               <td style="width: 7%"><input type="button" value="삭제" onclick="deleteComment(${ comment.cno })"></td>
            </tr>
            </c:forEach>
        </table>
    	</c:if>
    	<c:choose>
    	<c:when test="${ not empty loginVO }">
      	<form method="post" action="${ pageContext.request.contextPath }/comment/${ vo.bno }">
	         <%-- 댓글 달기 폼 cno, mnick, bno, ccontent, cdate, ctype --%>
	         <input type="hidden" name="mnick" value="${ loginVO.mnick }">
	         <input type="hidden" name="bno" value="${ vo.bno }">
	         <table style="width:80%;">
	            <tr>
	               <th>작성자</th>
	               <td>${ loginVO.mnick }</td>
	               <th>내용</th>
	               <td></td>
	            </tr>
	            <tr>
	            <td><textarea name="ccontent" rows="3" cols="100"></textarea>
	         		   <button type="submit" class="btn btn-outline-dark" >댓글작성</button></td>
	            </tr>
	         </table>
	    </form>
	    </c:when>
	    <c:otherwise>
	    	<div style="width:80%; margin-bottom: 10px;">로그인 후 댓글을 달 수 있습니다.</div>
	    </c:otherwise>
	    </c:choose>
	    </div>
   		</div>
				
			</div>
			
   
   
   
   
   
   
   
   
   
   
   <footer>
		<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
	</footer>
	</div>
   
</body>
</html>