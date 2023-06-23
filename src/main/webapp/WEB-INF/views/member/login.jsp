<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEMYS</title>
<link rel="shortcut icon" type="image/x-icon" href="../resource/img/favicon.ico">
<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- 테일윈드 불러오기 -->
<!-- 노말라이즈, 라이브러리까지 한번에 해결 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.7/tailwind.min.css" />

<!-- 데이지 UI -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@2.51.5/dist/full.css" rel="stylesheet" type="text/css" />

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
</head>
<style>
html,body{
   margin:0;
   padding:0;
   font-family: 'GmarketSansMedium';
}
/*  .img {
    display: block;
    margin : 0 auto;
    } */

.item-box{
   position: relative;
   display: flex;
   justify-content: center;
   align-items: center;
}
    
.content-box{
   position: absolute;
   width: 30%;
   height: 45%;
   background: rgba(255, 255, 255, 0.2);
   border-radius: 10px;
   z-index: 1;
}
.demys {
   padding-top:20px;
   padding-left:20px;
   font-size:4rem;
   font-weight:bold;
   color:#153A66;
}
.user-box {
   padding-left:25px;
   font-size:1rem;
   font-weight:bold;
   color:#ffffff;
}

.login-card {
   display:flex;
   justify-content: center; 
   align-items: center;
   margin-top: 10px;
}
     
.loginbox-btn {
   display:flex;
   align-items: center;
   height: 80px;
   margin-top: 10px;
}
     
.btn-primary {
   color:#ffffff;
   background-color:#153A66;
   border : none;
   margin : 0 auto;
}

.btn-primary:hover {
   background-color:#016FA0 ;
}

.mt-5 {
   text-align: center;
   margin-top : 3rem;
}

.font-demys {
   color : #000000;
}
   
.form-control {
   border-bottom:1px solid #000000;
}
   
.input-card {
   background: rgba(255, 255, 255, 0);
   width: 100px;
   color : #000000;
   font-weight: bold;
}
   
 .id-box {
   line-height:48px;
   outline:none;
   background: rgba(255, 255, 255, 0);
}

.button-group {
    position: fixed; /* or position: absolute; */
    bottom: 30px; /* Adjust the desired distance from the bottom */
    left: 50%; /* Center the buttons horizontally */
    transform: translateX(-50%);
  }
  .error {
   position: fixed;
   left: 50%;
   transform: translateX(-50%);
   color: red;
   text-align: center;
   font-size: 1.1rem;
  }
</style>


<body>
<div class="item-box">
   <div class="img">
       <img src="/resource/img/back.png" style="width:190vh;height:1066px;"/>
   </div>
<div class="content-box" style="border:5px solid #153A66;"> 
	<form class="table-box-type-1" method="post"  action="/member/doLogin">
      <div class="demys">
         <span>DEMYS PMS</span>
      </div>
      <div class="user-box">
         <span>USER LOGIN</span>
      </div>
     <div class="login-card">
         <div class="login-box">
            <div class="flex flex-col gap-2 items-center" >
               <div class="form-control">
                    <label class="input-group input-group-sm">
                      <span class="input-card">ID :</span>
                      <input type="text" class="id-box" name="MEMBER_ID" autocomplete="off" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');" value=""/>
                    </label>
               </div>
               <div class="form-control">
                 <label class="input-group input-group-sm">
                   <span class="input-card">PW :</span>
                   <input type="password" class="id-box" name="MEMBER_PW" autocomplete="off" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');"  value="" />
                 </label>
               </div>
            </div>
       </div>
         </div>
      <div class="loginbox-btn">
         <input type="submit" class="btn btn-primary" value="LOGIN" />
      </div>
      </form>
      <div class="error">
	     <c:if test="${not empty error}">
        <p>${error}</p>
	    </c:if>
	    <c:if test="${not empty invalidId}">
	        <p>${invalidId}</p>
	    </c:if>
	    <c:if test="${not empty invalidPassword}">
	        <p>${invalidPassword}</p>
	    </c:if>
	   </div>
      <div>
         <div id="button-group" class="mt-5">
           <button id="registBtn" class="font-demys" onclick="OpenWindow('registCode','인사과코드',400,350);">계정등록</button>&nbsp;&nbsp;
<!--             <button id="registBtn" class="font-demys" onclick="OpenWindow('sendCode.jsp','인증코드',400,350);">계정등록</button>&nbsp;&nbsp;
          <button id="registBtn" class="font-demys" onclick="OpenWindow('newPw.jsp','새 비밀번호',400,350);">계정등록</button>&nbsp;&nbsp;
          <button id="registBtn" class="font-demys" onclick="OpenWindow('registCode.jsp','인사코드',400,350);">계정등록</button>&nbsp;&nbsp; -->
            <button id="findPwBtn" class="font-demys" onclick="OpenWindow('findPw','비밀번호 찾기',400,350);">비밀번호 찾기</button>
         </div>
      </div>

    
   </div>
</div>

 
<script>
	function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
		winleft = (screen.width - WinWidth) / 2;
		wintop = (screen.height - WinHeight) / 2;
		var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth  
								+",height="+ WinHeight +",top="+ wintop +",left=" 
								+ winleft +",resizable=yes"  );
		win.focus() ; 
}

	//팝업창 닫기
	function CloseWindow(parentURL){
		
		window.opener.location.reload(true);		
		window.close();
	}
 </script>

</body>
</html>