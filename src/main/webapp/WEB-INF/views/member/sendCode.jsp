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
.fa-envelope {
	margin : 30px auto;
	font-size:70px;
	width:100px;
	height:80px;
	color : #153A66;
}
.main-content {
	font-size: 0.8rem;
	text-align: center;
	margin-bottom : 30px;
}
.input-group {
	margin :5px 0px;
	height:40px;
	display:flex;
}

.input-group-prepend {
	width: 100%;
}

.input-bordered {
	width: 70%;
	height:40px;
	border : 1px solid #aaaaaa;
	font-size:0.8rem;
}
.findPw-name {
	font-size:0.8rem;
	font-weight: bold;
	width:20%;
	height:40px;    
	display: flex;
    align-items: center;
    margin-right:10px;
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
			<div class="main-title"><i class="fa-regular fa-envelope"></i></div>
				<div class="main-content">입력하신 이메일로 인증번호를 발송하였습니다.</div>
				<form action="/member/doSendCode" method="POST" id="verificationForm">
      			<div class="input-group">
        			<div class="input-group-prepend">
        				<input type="hidden" placeholder="인증번호 입력" class="input input-bordered"  id="VERTIFICATION_CODE" name="VERTIFICATION_CODE" value="${VERTIFICATION_CODE }"/>
            			<input type="hidden" placeholder="아이디" class="input input-bordered"  id="MEMBER_ID" name="MEMBER_ID" value="${MEMBER_ID }"/>
        				<input type="text" placeholder="인증번호 입력" class="input input-bordered" autocomplete="off"  id="enteredCode" name="enteredCode" />
        				<button type="submit" id="findBtn" class="btn btn-se" style="margin-right: 10px;">인 증</button>
 					</div>     			
      			</div>
      		</form>
      	</div>
	</div>
	</div>


<script>

$(document).ready(function() {
  $("#findBtn").click(function() {
    var enteredCode = $("#enteredCode").val();
    var VERTIFICATION_CODE = $("#VERTIFICATION_CODE").val();
    var MEMBER_ID = $("#MEMBER_ID").val();

    if (!enteredCode) {
      alert("임시비밀번호 오류입니다.");
      $("#enteredCode").val("");
      return;
    }

    if (enteredCode === VERTIFICATION_CODE) {
    	
      $.ajax({
        url: "/member/doSendCode",
        method: "POST",
        data: {
          "VERTIFICATION_CODE": VERTIFICATION_CODE,
          "MEMBER_ID": MEMBER_ID
        },
        success: function(data) {
        	alert("인증에 성공했습니다.");
        },
        error: function(error) {
          alert("유효하지 않은 인증 코드입니다. 다시 입력해주세요.");
          return;
        }
      });
    } else {
      alert("인증번호가 일치하지 않습니다.");
      $("#enteredCode").val("");
      return;
    }
  });
});


	    	
function CloseWindow(parentURL){
	
	window.opener.location.reload(true);		
	window.close();
}
   </script>
</body>







