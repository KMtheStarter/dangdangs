<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
            if (isChecked.id == 1 && isChecked.nickname == 1) $("#submit").attr("disabled", false)
            else $("#submit").attr("disabled", true)
         }
      });
   }
</script>
</head>




<body>
<div class="container-fluid" style="padding-left: 0px; padding-right: 0px;">
   <header>
      <jsp:include page="/WEB-INF/jsp/include/topMenu.jsp" />
   </header>

   <div class="backgroundForm"
      style="background-image: url('${ pageContext.request.contextPath }/resources/img/backgrounds/blackimg.jpg');">
         
      <div class="container ourstyle" >
      <h1  style="color:white; font-weight:700; ">회원가입하기</h1>       
      <form:form method="post" commandName="memberVO"  style="padding: 1rem;">
         <table>
            <tr >          
               <td><form:input id="id" placeholder="아이디를 입력하세요" path="mid" /></td>
               <td><input type="button"  class="btn-danger ourbutton" style="margin-left:1rem;" value="중복확인"  onclick="validCheck(0)"></td>
            </tr>
            <tr>
               <td></td>
               <td><form:errors path="mid" class="error" /><label id="idchk">&nbsp;</label></td>
            </tr>
            <tr>              
               <td><form:input type="password" placeholder="비밀번호를 입력하세요" path="mpassword" size="30" /></td>
            </tr>
            <tr>
               <td></td>
               <td><form:errors path="mpassword" class="error" />&nbsp;</td>
            </tr>
            <tr>               
               <td><form:input id="nick" placeholder="별명을 입력하세요" path="mnick" size="30" /></td>
               <td><input type="button" class="btn-danger ourbutton" style="margin-left:1rem;" value="중복확인" onclick="validCheck(1)"></td>
            </tr>
            <tr>
               <td></td>
               <td><form:errors path="mnick" class="error" /><label
                  id="nickchk">&nbsp;</label></td>
            </tr>
         </table>
         <br>
         <button id="submit"  type="submit"  class="ourbutton btn btn-block ">가입하기</button>
      </form:form>
   </div>
   </div>
   </div>
</body>
</html>