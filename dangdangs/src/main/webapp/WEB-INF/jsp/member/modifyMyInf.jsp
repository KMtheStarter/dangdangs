<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
   href="${ pageContext.request.contextPath }/resources/css/layout.css">
<link rel="stylesheet" type="text/css"
   href="${ pageContext.request.contextPath }/resources/css/style.css">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
var isChecked = {
        id: 0,
        nickname: 0
  }
  
function validCheck(idx){
   let tagId;
   if (idx == 0) tagId = "#id";
   else tagId = "#nick";
   let val = $(tagId).val();
   $.ajax({
      url: "${ pageContext.request.contextPath }/signup/valid",
      data: {
         index: idx,
         query: val
      },
      type: "post",
      success: function(data){
         if (data == ""){
            if (idx == 0){
               $("#idchk").text(val + "은 사용 가능한 아이디입니다.");
               isChecked.id = 1;
            } else{
               $("#nickchk").text(val + "은 사용 가능한 닉네임입니다.");
               isChecked.nickname = 1;
            }
         } else {
            if (idx == 0) {
               $("#idchk").text(val + "은 사용 불가능한 아이디입니다." );
               isChecked.id = 0;
            } else{
               $("#nickchk").text(val + "은 사용 불가능한 닉네임입니다." );
               isChecked.nickname = 0;
            }
         }
         if (isChecked.nickname == 1) $("#submit").attr("disabled", false)
         else $("#submit").attr("disabled", true)
      }
   });
}
</script>
</head>
<body>
<header>
		<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp" />
	</header>
	<div class="backgroundForm" style="background-image:url('${ pageContext.request.contextPath }/resources/img/backgrounds/mypage.jpg');">
	<div class="container ourstyle" align="center">
<h1>내 정보 수정</h1>

<form:form method="post" commandName="memberVO" action="${ pageContext.request.contextPath }/mypage/modifyMyInf">
<form:hidden path="mid"	value="${ loginVO.mid }"/>
	<table style="margin-right: auto; margin-left: auto;">
		<tr style="font-size: large;">
			<td>id</td>
			<td>${ loginVO.mid }</td>
			<td></td>
		</tr>
		
		<tr>
			<td>닉네임</td>
			<td><form:input id="nick" path="mnick" size="30"></form:input></td>
			<td><input type="button" class="btn btn-outline-primary" style="margin-left:1rem;" value="중복확인" onclick="validCheck(1)"></td>
		</tr>
		<tr>
           <td></td>
           <td><form:errors path="mnick" class="error" /><label
              id="nickchk">&nbsp;</label></td>
        </tr>
		<tr>
			<td>비밀번호</td>
			<td><form:input id="pwd" path="mpassword" size="40"></form:input></td>
		</tr>

	</table>
	<button id="submit" type="submit" class="btn btn-outline-success">수정하기</button>
</form:form>
</div>
</div>
</body>
</html>