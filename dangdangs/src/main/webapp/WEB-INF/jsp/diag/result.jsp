<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.dname{
	display: inline-block;
	width: 150px;
}

.bsum{
	width: 60%;
}

a:link, a:visited {
	color: #718ABE;
	text-decoration: none;
}
a:hover {
	text-decoration: underline;
}

body > div > span:hover{
	cursor: pointer;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	var listSize = ${ fn:length(voList) }
	var spanStart = 2;
	var divStart = spanStart + 1 + listSize;
	
	$(document).ready(function(){
		for(var i = divStart; i < (divStart + listSize); i++){
			$("body > div > div:nth-child(" + i + ")").css("display", "none");
		}
		$("body > div > div:nth-child(" + divStart + ")").css("display", "block");
		$("body > div > span:nth-child(" + spanStart + ")").css("font-size", "30px");
		$("body > div > span:nth-child(" + spanStart + ")").css("color", "red");
	});
	
	function viewSummary(number){
		var spanid = spanStart + parseInt(number);
		var divid = divStart + parseInt(number);
		for(var i = spanStart; i < (spanStart + listSize); i++){
			$("body > div > span:nth-child(" + i + ")").css("font-size", "16px");
			$("body > div > span:nth-child(" + i + ")").css("color", "black");
		}
		$("body > div > span:nth-child(" + spanid + ")").css("font-size", "30px");
		$("body > div > span:nth-child(" + spanid + ")").css("color", "red");
		for(var i = divStart; i < (divStart + listSize); i++){
			$("body > div > div:nth-child(" + i + ")").css("display", "none");
		}
		$("body > div > div:nth-child(" + divid + ")").css("display", "block");
		
	}

	function copy_to_clipboard(val) {
	      var t = document.createElement("textarea");
	        document.body.appendChild(t);
	        t.value=val;
	        t.select();
	        document.execCommand("Copy");
	        document.body.removeChild(t);
	        alert("URL이 클립보드에 복사되었습니다!");
	}

</script>
</head>
<body style="background-color:#F8F1EB">


		<header>
			<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp" />
		</header>

		<h5 class="text-center"
				style="color: #444444; margin-top: 5rem; font-weight: 300; font-family: 'Black Han Sans'; font-size: 8rem; margin-bottom: 0; padding: 0;">진단결과</h5>
		<hr style="margin-left: 100px; margin-right: 100px;">
		<div align="center" style="margin-left: 100px; margin-right: 100px;">
			<h5 style="color: #314c79; margin-top: 0; margin-bottom:2rem; font-family: 'Noto Sans KR'; font-size: 2rem;">가장 유력한 질병은 ${ dnameList[0] } 입니다.</h5>
			<c:forEach items="${ voList }" var="vo" varStatus="status">
				<span class="dname" style="color: #444444; margin-top: 1rem; font-weight: 300; font-family: 'Noto Sans KR'; font-size: 2rem;"><strong onclick="viewSummary('${ status.index }')">${ vo.dname }</strong></span>
			</c:forEach>
			<hr>
			<c:forEach items="${ voList }" var="vo">
				<div class="bsum" style="color: #444444; margin-top: 1rem; font-weight: 700; font-family: 'Noto Sans KR'; font-size: 1.5rem; border: 1px solid; border-color: #77C7D9; border-bottom-right-radius: 2em; background-color: ">
					<span>${fn:replace(vo.bsum, replaceChar, "<br/>") }</span>
					<br><br><br>
					<a
							href="${ pageContext.request.contextPath }/board/${ vo.bno }"
							class="btn ourbutton" style="color:white; background-color: #444444; width:15rem; height:3rem; margin-top:2rem; margin-bottom:2rem;">더 알아보기</a>
					
				</div>
			</c:forEach>
		</div>

		<c:if test="${ not empty url }">
			<button class = "btn ourbutton" style="background-color: #444444; width:15rem; height:3rem; margin-top:2rem; margin-bottom:2rem;" onclick="copy_to_clipboard('http://222.106.22.28:7777${ pageContext.request.contextPath }/${ url }')">결과 공유하기</button>
		</c:if>


	<footer>
		<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
	</footer>
</body>
</html>