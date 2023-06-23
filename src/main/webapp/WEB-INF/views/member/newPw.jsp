<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- 테일윈드 불러오기 -->
<!-- 노말라이즈, 라이브러리까지 한번에 해결 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.7/tailwind.min.css" />

<!-- 데이지 UI -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@2.51.5/dist/full.css" rel="stylesheet" type="text/css" />

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />

<!-- 사이트 공통 CSS -->
<link rel="stylesheet" href="/resource/common.css" />
<!-- 사이트 공통 JS -->
<script src="/resource/common.js" defer="defer"></script>

</head>
<style>

body {
   margin:0;
   padding:0;
}

.navbar-box {
	background-color: #153A66;
}
.navbar-content {
	width: 100%; 
	padding: 0px; 
	min-height: 1rem; 
	height: 50px; 
	line-height:50px;
} 

.navbar-logo {
	color:#ffffff;
	font-weight: bold;
	font-size: 1.5rem;
	padding-left:20px;
}

.main {
	height : 318px;
	border : 4.5px solid #153A66;
}
.main-box {
	width: 80%;
	margin: 0 auto;
	height : 313px;
}
.main-title {
	text-align : center;
}
.input-group {
	margin :5px 0px;
	height:40px;
}

.input-group-prepend {
	width: 100%;
}

.input-bordered {
	width: 100%;
	height:35px;
	border : 1px solid #aaaaaa;
	font-size:0.8rem;
}

.btn-se {
	width : 80px;
	min-height:1rem;
	border:none;
	color:#ffffff;
  	background-color:#153A66;
  	height:40px;
}
.btn-se:hover {
	background-color:#016FA0;
}

.form-group {
	width:100%;
	margin :5px 0px;
	display:flex;
	align-items: center;
}
.card-footer {
	padding-top : 10px;
	margin-top: 0; 
	border-top: none;
	display:flex;
	flex-direction:row;
	justify-content:center;
}

.newPw-name {
	font-size:0.8rem;
	font-weight: bold;
	width:47%;
	height:40px;    
	display: flex;
    align-items: center;
    margin-right:10px;
}
.fa-gear {
	margin :10px auto;
	color : #153A66;
	font-size:60px;
	width:80px;
	height:60px;
}
</style>
<body>
	<div class="regist_content">
		<div class="navbar-box">
			<div class="navbar-content">
				<div class="navbar-logo">DEMYS PMS</div>
			</div>	
		</div>
	<div class="main">	
		<div class="main-box">	
			<form action="/member/doNewPw" method="post" id="updataPw">
			<div class="main-title"><i class="fa-solid fa-gear"></i></div>
				<input type="hidden" id="VERTIFICATION_CODE" name="VERTIFICATION_CODE" value="${VERTIFICATION_CODE}">
				<div class="form-group">
      				<label class="newPw-name">새 비밀번호</label>
      			<div class="input-group">
        			<div class="input-group-prepend">
        				<input type="password" class="input input-bordered"  id="newPassword" name="newPassword" required/>
 					</div>     			
      			</div>
      			</div>
      			<div class="form-group">
      			<label class="newPw-name">새 비밀번호 확인</label>
      			<div class="input-group">
        			<div class="input-group-prepend">
        				<input type="password"  class="input input-bordered"  id="confirmPassword" name="confirmPassword" required/>
 					</div>     			
      			</div>
      			</div>
		<div class="card-footer row">			
			<div class="col-sm-4"></div>
			<button type="button" class="btn btn-se" onclick="updateAndClose();">수 정</button>
			<button type="button" id="cancelBtn" onclick="CloseWindow();" class="btn btn-se"  style="margin-left: 10px;">취 소</button>
		</div>	
		</form>
		</div>
					</div>
				</div>


<script>
function updateAndClose() {
	  var newPassword = $("#newPassword").val();
	  var confirmPassword = $("#confirmPassword").val();
	  var VERTIFICATION_CODE = $("#VERTIFICATION_CODE").val();
	  if (newPassword !== confirmPassword) {
	    alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
	    return;
	  }
	  var data= {
	      "newpassword": newPassword,
	      "confirmpassword": confirmPassword,
	      "vertification_CODE": VERTIFICATION_CODE
	    }
	  $.ajax({
	    url:"<%=request.getContextPath()%>/member/doNewPw",
	    type:"POST",
	    data:JSON.stringify(data),
	    contentType:"application/json",
	    success: function () {
	      alert("비밀번호 수정이 완료되었습니다.");
	      window.close();
	      window.opener.location.reload();
	      window.opener.location.href = "/member/login";
	    },
	    error: function () {
	      alert("비밀번호 수정 중에 오류가 발생했습니다. 다시 시도해주세요.");
	      return;
	    }
	  });
	}

	
function CloseWindow(parentURL){
	
	window.opener.location.reload(true);		
	window.close();
}
   </script>
</body>







