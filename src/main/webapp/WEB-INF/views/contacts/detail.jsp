<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- 테일윈드 불러오기 -->
<!-- 노말라이즈, 라이브러리까지 한번에 해결 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.7/tailwind.min.css" />

<!-- 데이지 UI -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@2.51.5/dist/full.css" rel="stylesheet" type="text/css" />

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	height : 768px;
	border : 4.5px solid #153A66;
}
.main-box {
	width: 80%;
	margin: 0 auto;
	height : 763px;
}
.main-title {
	padding-top : 30px;
	padding-bottom : 30px;
	text-align : center;
	font-weight: bold;
	font-size: 1.5rem;
	
}

.input-group {
	margin :5px 0px;
	height:30px;
}


.input-group-prepend {
	width: 100%;
}
.input-group-prepend2 {
	width:49%;
	margin-right:30px;
}

.input-group-prepend3 {
	width:49%;
}
.input-bordered {
	width: 100%;
	height:30px;
	border : 1px solid #aaaaaa;
}

.select-bordered {
	height:30px;
	min-height:1rem;
	border : 1px solid #aaaaaa;
}
.form-group {
	width:100%;
}
.btn-se {
	width : 130px;
	min-height:1rem;
	border:none;
	color:#ffffff;
  	background-color:#153A66;
  	height:30px;
}
.btn-se:hover {
	background-color:#016FA0;
}

.form-group, .form-box {
	margin :5px 0px;
}
.card-footer {
	padding-top : 35px;
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
			<div class="main-title">업체 정보 상세</div>
			<form role="form" class="form-horizontal" action="/contacts/modify" method="post" id="ConModifyForm">	
				<input type="hidden" class="input input-bordered w-full"  id="CT_NUM" name="CT_NUM" readonly value="${contacts.CT_NUM }"/>
				<div class="form-group">
      				<label style="font-weight: bold;">업체명</label>
      			<div class="input-group">
        			<div class="input-group-prepend">
        				<input type="text" class="input input-bordered w-full"  id="CT_NAME" name="CT_NAME" readonly value="${contacts.CT_NAME }"/>
 					</div>     			
      			</div>
      			<div class="flex justify-between">
      			<label style="font-weight: bold;">대표자명</label>
 				<label style="font-weight: bold; margin-right:170px;">구분</label>
 				</div>       			
      			<div class="input-group">
        			<div class="input-group-prepend2">
        				<input type="text" class="input input-bordered w-full"  id="CT_CEO" name="CT_CEO" readonly value="${contacts.CT_CEO }"/>
 					</div>
 					<div class="input-group-prepend3">
        				<input type="text" class="input input-bordered w-full" id="CT_TYPE" name="CT_TYPE" readonly value="<c:if test="${contacts.CT_TYPE eq '1'}">협력업체</c:if><c:if test="${contacts.CT_TYPE eq '2'}">거래처</c:if><c:if test="${contacts.CT_TYPE eq '3'}">클라이언트</c:if>" />
      				</div>
      			</div>
      			<div class="form-group row">
					<label style="font-weight: bold;">전화번호</label>
						<div class="form-box" style="display:flex;">
							<input type="text" class="input input-bordered w-full"  id="CT_TEL" name="CT_TEL" readonly value="${contacts.CT_TEL }"/>
						</div>
				</div>
				<div class="form-group row">
					<label style="font-weight: bold;">이메일</label>
						<div class="form-box" style="display:flex;">
							<div class="input-group-sm w-full flex">
								<input type="text" class="input input-bordered w-full" id="CT_EMAIL" name="CT_EMAIL" readonly value="${contacts.CT_EMAIL }"/>
							</div>
						</div>
					</div>
				<div class="form-group row">
					<label style="font-weight: bold;">팩스번호</label>
						<div class="form-box" style="display:flex;">
								<input type="text" class="input input-bordered w-full" id="CT_FAX" name="CT_FAX" readonly value="${contacts.CT_FAX }"/> 
							</div>
						</div>
						<div class="orm-group row">
			      			<label style="font-weight: bold;">주소</label>
			        			<div class="form-box" style="display:flex;">
			        				<input type="text" id="CT_ADDR" class="input input-bordered w-full" name="CT_ADDR" readonly value="${contacts.CT_ADDR }"/>
			 					</div>
      						</div>
      					<label style="font-weight: bold;">담당자명</label>
      					<div class="input-group">
        					<div class="input-group-prepend">
        						<input type="text" class="input input-bordered w-full" id="CT_MANAGER" name="CT_MANAGER" readonly value="${contacts.CT_MANAGER }"/>
 							</div>     			
      					</div>
      					<div class="form-group row">
						<label style="font-weight: bold;">전화번호</label>
						<div class="form-box" style="display:flex;">
								<input type="text" class="input input-bordered w-full"  id="CT_MG_TEL" name="CT_MG_TEL" readonly value="${contacts.CT_MG_TEL }"/>
							</div>
						</div>
						</div>
		<div class="card-footer row" style="margin-top: 0; border-top: none;display:flex;flex-direction:row;justify-content:center;">	
			    <input type="hidden" name="phoneNumber1" value="${phoneNumber1 }">
			    <input type="hidden" name="phoneNumber2" value="${phoneNumber2 }">
			    <input type="hidden" name="phoneNumber3" value="${phoneNumber3 }">
			    <input type="hidden" name="ct_fax1" value="${ct_fax1 }">
			    <input type="hidden" name="ct_fax2" value="${ct_fax2 }">
			    <input type="hidden" name="ct_fax3" value="${ct_fax3 }">
			    <input type="hidden" name="ct_mg_tel1" value="${ct_mg_tel1 }">
			    <input type="hidden" name="ct_mg_tel2" value="${ct_mg_tel2 }">
			    <input type="hidden" name="ct_mg_tel3" value="${ct_mg_tel3 }">
			    <input type="hidden" name="postcode" value="${postcode }">
			    <input type="hidden" name="address" value="${address }">
			    <input type="hidden" name="detailAddress" value="${detailAddress }">
			    <input type="hidden" name="extraAddress" value="${extraAddress }">
			    <input type="hidden" name="CT_NUM" value="${contacts.CT_NUM }" >
 			<button type="button" id="modifyBtn" class="btn btn-se" style="margin-right: 10px;" onclick="modify_go();">수 정</button>
			<button type="button" id="removeBtn" onclick="remove_go();" class="btn btn-se" style="margin-right: 10px;">삭 제</button>
			<button type="button" id="cancelBtn" onclick="CloseWindow();" class="btn btn-se">취 소</button>
		</div>	
			</form>
					</div>
				</div>
		</div>

<script>


function modify_go() {
    // 폼 전송
    document.getElementById("ConModifyForm").submit();
}


function remove_go() {
	  var CT_NUM = getCT_NUM();
	  if (confirm('업체를 삭제하시겠습니까?')) {
	    $.ajax({
	      url: '/contacts/remove',
	      method: 'post',
	      data: { CT_NUM: CT_NUM },
	      success: function(response) {
	    	  window.opener.location.reload(); // 새로고침
	          window.opener.location.href = '/contacts/list'; // 이동
	          window.close(); // 닫기
	      },
	      error: function(error) {
	        console.error('삭제 작업 중 오류가 발생했습니다.');
	      }
	    });
	  }
	}

	function getCT_NUM() {
	  var CT_NUM = document.getElementById('CT_NUM').value;
	  return CT_NUM;
	}

function CloseWindow(parentURL){
	
	window.opener.location.reload(true);		
	window.close();
}
   </script>
</body>








