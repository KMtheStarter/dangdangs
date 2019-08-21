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
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/earlyaccess/notosanskr.css">
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
      if (val != ""){
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
    	                  $("#idchk").text("사용 가능한 아이디입니다.");
    	                  isChecked.id = 1;
    	               } else{
    	                  $("#nickchk").text("사용 가능한 닉네임입니다.");
    	                  isChecked.nickname = 1;
    	               }
    	            } else {
    	               if (idx == 0) {
    	                  $("#idchk").text("사용 불가능한 아이디입니다." );
    	                  isChecked.id = 0;
    	               } else{
    	                  $("#nickchk").text("사용 불가능한 닉네임입니다." );
    	                  isChecked.nickname = 0;
    	               }
    	            }
    	            if (isChecked.id == 1 && isChecked.nickname == 1) $("#submit").attr("disabled", false)
    	            else $("#submit").attr("disabled", true)
    	         }
   	      });
      } else {
    	  alert("값을 입력하세요.");
      }
   }
</script>
</head>




<body>
	<div class="container-fluid"
		style="padding-left: 0px; padding-right: 0px;">
		<header>
			<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp" />
		</header>

		<div class="backgroundForm"
			style="background-image: url('${ pageContext.request.contextPath }/resources/img/backgrounds/whitedog.jpg');">

			<div class="container ourstyle" style="width: 18rem; diplay: inline;">
				<h1
					style="color: white; font-weight: 700; margin: 0; padding: 0; font-size: 1.3rem;">회원가입</h1>
				<form:form class="form-inline" method="post" commandName="memberVO"
					style=" margin-top: 0rem;  margin-right:0; margin-bottom:0;   padding-top:0; padding-bottom:0; ">
					<div class="form-group">
						<form:input id="id" class="form-inline" placeholder="id"
							path="mid" style="color:black; width:8rem; margin-left:0.8rem; height:3rem;" />
						<input type="button" class="btn form-control ourbutton2"
							style="font-family: Noto Sans Kr; margin-left: 0.2rem; height:3rem; font-size:0.8rem; font-weight:700; " 
							value="중복확인" onclick="validCheck(0)">
					</div>
					
					<form:errors path="mid" class="error " />
					
					<label id="idchk" class="ourfont" style="text-align:center; margin-left:1rem;" >&nbsp;</label>
					
					<div class="form-group">
						<form:input type="password" placeholder="password"
							path="mpassword" class="form-inline" 
							style=" color:black; width:8rem; margin-left:0.8rem; height:3rem;"  />
						
					</div>
					<form:errors path="mpassword" class="error" />
						<label class="ourfont" style="text-align:center; margin-left:1rem;" >
						&nbsp;
						</label>
					<div class="form-group">
						<form:input id="nick" class="form-inline" placeholder="nickname"
							path="mnick" style=" color:black; width:8rem; margin-left:0.8rem; height:3rem;" />
						<input type="button" class="btn form-control ourbutton2"
							style="font-family: Noto Sans Kr; margin-left: 0.2rem; height:3rem; font-size:0.8rem; font-weight:700; " value="중복확인" onclick="validCheck(1)">
					</div>
					<form:errors path="mnick" class="error" />
					<label id="nickchk" class="ourfont" style="text-align:center; margin-left:1rem;">&nbsp;</label>


					
					<button id="submit" type="submit" class="btn btn-block ourbutton"
						style=" font-family: Noto Sans Kr; width:15rem; font-weight: 700; color: white; margin-left:0.8rem; margin-top:1.5rem; margin-bottom: 1rem; margin-right:0.8rem;  ">회원가입</button>
				</form:form>	
			</div>
		</div>
	</div>
	<footer>
		<jsp:include page="/WEB-INF/jsp/include/footer.jsp" />
	</footer>
</body>
</html>