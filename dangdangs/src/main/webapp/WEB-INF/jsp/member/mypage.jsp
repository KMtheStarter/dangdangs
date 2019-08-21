<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script>
	function deletePet(no){
		if(confirm("펫을 삭제하시겠습니까?")){
			$.ajax({
				type : "DELETE",
				url : "${ pageContext.request.contextPath }/pet/"+no,
				success : function(data){
					if (data == 1){
						location.href="${ pageContext.request.contextPath }";
					} else {
						alert("삭제에 실패했습니다.");
					}
				}
			});
		}
	}
</script>
</head>
<body>
<div class="container-fluid" style="padding-left: 0px; padding-right: 0px;">
	<header>
		<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp" />
	</header>
	<div class="backgroundForm" style="background-image:url('${ pageContext.request.contextPath }/resources/img/backgrounds/mypage.jpg');">
	<div style="width: 60em; height:50em; text-align: center; background-color: rgba(0,0,0,0.7); padding: 1rem; border-radius: 1em;">
	<h2 style="color: white; font-weight: 700;">마이페이지</h2>
	<hr style="border-color:#477AFF">
	<h3 style="color: white;">로그인된 아이디: ${ loginVO.mid }</h3>
	<hr style="border-color:#477AFF">
	<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true" style="color: #5CAB75;">내 정보</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false" style="color: #5CAB75;">나의 댕댕이</a>
  </li>
</ul>
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab" style="text-align: left;">
  	<h2 style="color:white;"><strong>${ loginVO.mnick }</strong> 님 안녕하세요</h2> <br>
  	<h2 style="color:white;">아이디 :<strong> ${ loginVO.mid }</strong></h2><br>
  	<h3 class="text-center"><a href="${ pageContext.request.contextPath }/mypage/checkPwd" style="color: #5A79B8;">회원정보 수정하기</a></h3>
  </div>
  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
	<h2 style="color:white;">내 댕댕이</h2>
		<hr style="border-color:white;">
		<div align="center">
			<div class="container" style="font-size: 30px; margin-bottom: 10px;">
				<c:forEach items="${ petList }" var="pet">
 				 <div class="row">
  				  <div class="col-sm" style="color: white;">
   					   ${ pet.pname }
   				 </div>
 			   <div class="col-sm" style="color: white;">
  			    ${ pet.spname }
 			   </div>
 			   <div class="col-sm" style="font-size: 20px;">
  			    <a href="${ pageContext.request.contextPath }/board/spcode/${ pet.spcode }" style="color: #F9FF9E;">관련 정보<br>보러가기</a>
  			  </div>
  			   <div class="col-2">
 			   <input class="btn ourbutton"type="button" value="삭제" onclick="deletePet(${ pet.pno })">
  			  </div>
 			 </div>
 			 </c:forEach>		
			</div>
			<div style="border: 1px solid;">
			<h3><a style="color: #E8D1DD;" href="${ pageContext.request.contextPath }/pet">댕댕이 등록하기</a></h3>
			</div>
			<br>
		</div>
	</div>
</div>
</div>
	</div>
	</div>
</body>
</html>