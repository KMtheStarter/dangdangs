<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
   integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
   crossorigin="anonymous">


<link rel="stylesheet" type="text/css"
   href="${ pageContext.request.contextPath }/resources/css/layout.css">
<link rel="stylesheet" type="text/css"
   href="${ pageContext.request.contextPath }/resources/css/style.css">

<script
   src="${ pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>

<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
   integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
   crossorigin="anonymous"></script>

<script src="${ pageContext.request.contextPath }/resources/js/checkForm.js"></script>
<script>
if("${ param.msg }") alert("${ param.msg }");

function checkVal(){
   let form = document.loginForm;
   if (isNull(form.mid, "아이디를 입력하세요.")) return false;
   if (isNull(form.mpassword, "패스워드를 입력하세요.")) return false;
   return true;
}
</script>
</head>
<body>
<div class="container-fluid" style="padding-left: 0px; padding-right: 0px;">
   <header>
      <jsp:include page="/WEB-INF/jsp/include/topMenu.jsp" />
   </header>
   <div class="backgroundForm" style="background-image: url('${ pageContext.request.contextPath }/resources/img/backgrounds/blackimg.jpg');">
   <div class="container ourstyle"   align="center"    >
      <h1  style="color:white; font-weight:700; ">로그인하기</h1> 
      <form method="post" name="loginForm" onsubmit="return checkVal()"  style="margin: 1rem auto;  width:20rem; padding:1rem;">
       <input type="text" name="mid" placeholder="Username" required="required" />
       <br>
       <br>
        <input type="password" name="mpassword" placeholder="Password"  required="required"  />
        <br>
        <br>
        <button type="submit" class="btn btn-danger btn-block" style="font-weight:700; background-color:#e50914;">로그인하기</button>
        <br>
        <button  class="btn btn-danger btn-block"   style="font-weight:700; background-color:#e50914;"    onclick="location.href='singup.jsp' ">회원가입</button>
    </form>
   </div>
   </div>
   </div>
</body>
</html>