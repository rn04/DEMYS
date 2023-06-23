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

.register-card-body {
	height : 639px;
	border : 4.5px solid #153A66;
}
.input-group {
	width: 100%;
    display: flex;
    justify-content: center;
    margin : 13px auto;
}
.input-group2 {
	 display: flex;
	 float:left;
}
.btn-se {
	min-height:1rem;
	border:none;
	color:#ffffff;
  	background-color:#153A66;
  	height:30px;
  	font-size:0.8rem;
}
.btn-se:hover {
	background-color:#016FA0;
}
.mailbox-attachment-icon {
	border: 1px solid #153A66;
	height: 150px; 
	width: 150px; 
	margin: 0 auto;
	border-radius: 70%;
}
.form-horizontal {
	width: 80%;
	margin: 0 auto;
	/* border : 1px solid green; */
}

.form-group {
	/* border:1px solid #D5D5D5; */
}

.form-control {
	border:1px solid #D5D5D5;
	border-radius : 0;
	font-size:0.7rem;
}

.form-control2 {
	height : 30px;
	border:1px solid #D5D5D5;
}
.label-box {
	font-weight:bold;
	font-size:0.7rem;
	width:24.5%;
	margin:auto;
}
</style>
<body>
	<div class="regist_content">
		<div class="navbar-box">
			<div class="navbar-content">
				<div class="navbar-logo">DEMYS PMS</div>
			</div>	
		</div>
				<div class="card">
				<div class="register-card-body">
					<form role="form" class="form-horizontal" action="/member/registMember" method="post">
						<input type="hidden" name="MEMBER_PIC" value="noImage.jpg" accept="image/*" />
						<div class="input-group mb-3">
							<div class="mailbox-attachments clearfix" style="text-align: center;">
								<div class="mailbox-attachment-icon has-img" id="pictureView"></div>
								<div class="mailbox-attachment-info">
									<div class="input-group input-group-sm">
										<label for="inputFile" class=" btn btn-se btn-sm btn-flat input-group-addon">파일선택</label>
										<input id="inputFileName" class="form-control2" type="text" name="tempPicture" disabled /> 
										<span class="btn btn-se btn-sm btn-append input-group-append-sm">
											<button type="button" class="btn btn-se btn-sm btn-append" onclick="upload_go();">업로드</button>
										</span>
									</div>
								</div>
							</div>
							<br />
						</div>
						<div class="form-group" style="display:flex;">
      						<label for="inputId" class="label-box">아이디</label>
							<div class="input-group2 input-group-sm" style="width:75.5%;">
								<input name="MEMBER_ID"  autocomplete="off"  onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, &#39;&#39;);" type="text" class="form-control" id="inputId"
									onkeyPress="id_check_onKey();" placeholder="   8글자 이상 영문자,숫자 조합" maxlength ="20" style="width:74.5%;margin-left:auto;"> 
									<span class="input-group-append-sm">
									<button type="button" onclick="idCheck_go();" class="btn btn-se btn-sm btn-append">중복확인</button>
								</span>
							</div>
						</div>
						<div class="form-group" style="display:flex;">
      						<label class="label-box">비밀번호</label>
							<div class="input-group2 input-group-sm" style="width:75%;">
								<input name="MEMBER_PW"  autocomplete="off"  type="password" class="form-control" id="inputPassword"
									 placeholder="   영문자,숫자,특수문자 조합" maxlength ="20" onchange="javascript:pw_length_check()" style="width:100%;"> 
							</div>
						</div>
						<div class="form-group" style="display:flex;">
      						<label class="label-box">비밀번호 확인</label>
							<div class="input-group2 input-group-sm" style="width:75%;">
								<input name="MEMBER_PWCK" autocomplete="off"  type="password" class="form-control" id="inputPasswordCK" maxlength="20" onchange="javascript:pw_check()"
									 placeholder="   비밀번호 확인" style="width:100%;"> 
							</div>
						</div>
						<div class="form-group" style="display:flex;">
      						<label class="label-box">이름</label>
							<div class="input-group2 input-group-sm" style="width:75%;">
								<input name="MEMBER_NAME" autocomplete="off"  type="text" class="form-control" id="inputName" maxlength="6" onchange="name_check()"
									 placeholder="   이름" style="width:100%;">
							</div>
						</div>
						<div class="form-group" style="display:flex;">
      						<label class="label-box">휴대폰 번호</label>
							<div class="input-group2 input-group-sm" style="width:75%;">
								<input name="MEMBER_PHONE" autocomplete="off"  type="text" class="form-control" id="inputPhone" maxlength="11" onchange="phone_check()" onkeyup="this.value = this.value.replace(/[^\d]/g, '')"
									 placeholder="   '-'없이 입력해주세요." style="width:100%;">
							</div>
						</div>
						<div class="form-group" style="display:flex;">
      						<label class="label-box">이메일</label>
							<div class="input-group2 input-group-sm" style="width:75%;">
								<input name="MEMBER_EMAIL" autocomplete="off"  type="text" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, &#39;&#39;);" class="form-control" id="inputEmail" onchange="email_check()"
									 placeholder="   이메일을 입력해주세요." style="width:100%;">
							</div>
						</div>
						<div class="form-group" style="display:flex;">
      						<label class="label-box">소속부서</label>
							<div class="input-group2 input-group-sm" style="width:75%;">
								<select class="select form-control select-sm w-full" id="inputDep" name="MEMBER_DEP">
									<option disabled selected value="">전체</option>
									<option>개발1팀</option>
									<option>개발2팀</option>
									<option>인사팀</option>
								 </select>
							</div>
						</div>
						<div class="form-group" style="display:flex;">
      						<label class="label-box">직책</label>
							<div class="input-group2 input-group-sm" style="width:75%;">
								<select class="select form-control select-sm w-full" id="inputAuthority" name="MEMBER_AUTHORITY" onchange="authority_check()">
									<option disabled selected value="">전체</option>
									<option value=1>팀원</option>
									<option value=3>팀장</option>
								 </select>
							</div>
						</div>
						<div class="form-group" style="display:flex;">
      						<label class="label-box">직급</label>
							<div class="input-group2 input-group-sm" style="width:75%;">
								<select class="select form-control select-sm w-full" id="inputPosition" name="MEMBER_POSITION" onchange="position_check()">
									<option disabled selected>전체</option>
									<option value=1>사원</option>
									<option value=2>선임</option>
									<option value=3>책임</option>
								 </select>
							</div>
						</div>
						<div class="card-footer" style="">
							<div class="row" style="display:flex;flex-direction:row;justify-content:center;margin-top:35px;">
								<div class="" style="margin-right:10px;">
									<button type="submit" id="registBtn" onclick="regist_go(); return false;" class="btn btn-se">등&nbsp;&nbsp;록</button>
								</div>
								<div class="" style="margin-left:10px;">
									<button type="button" id="cancelBtn" onclick="CloseWindow();" class="btn btn-se">취&nbsp;&nbsp;소</button>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- register-card-body -->
			</div>
		</div>

	<!-- /.content -->

<!-- picture upload form  -->
<form role="imageForm" action="MEMBER_PIC" method="post" enctype="multipart/form-data">
	<input id="inputFile" name="pictureFile" type="file" class="form-control" style="display:none;" onchange="picture_go();">
	<input id="oldFile" type="hidden" name="oldPicture" value="test" />
	<input type="hidden" name="checkUpload" value="0" />	
</form>

<script>	

function regist_go(){
	//alert("regist btn");
	
	var uploadCheck = $('input[name="checkUpload"]').val();  	
	if(uploadCheck=='0'){
	    alert("사진업로드는 필수 입니다");      
	    return;
	}
	
	if(!$('input[name="MEMBER_ID"]').val()){
	    alert("아이디는 필수입니다.");
	    return;
	}
	if($('input[name="MEMBER_ID"]').val()!=checkedID){
	    alert("아이디는 중복 확인이 필요합니다.");
	    $('input[name="MEMBER_ID"]').focus();
	    return;
	}
	
	var form = $('form[role="form"]');
	form.attr("post","/member/registMember");
	form.submit();
	var successMessage = "${successMessage}"; // 계정 등록 성공 메시지
    var errorMessage = "${errorMessage}";     // 계정 등록 실패 메시지

    if (successMessage) {
        alert(successMessage); // 계정 등록 성공 메시지 알림창 표시
        window.close();        // 오픈 윈도우 닫기
        window.location.href = "/member/login"; // 로그인 화면으로 이동
    }
    if (errorMessage) {
        alert(errorMessage);   // 계정 등록 실패 메시지 알림창 표시
    }
}
	
	
function upload_go(){
	if(!$('input[name="pictureFile"]').val()){
	    alert("사진을 선택하세요.");
	    $('input[name="pictureFile"]').click();
	    return;
	 }  
	
	if($('input[name="checkUpload"]').val()==1){
		alert("이미 업로드된 사진입니다.");
		return;
	}
	
	 var formData = new FormData($('form[role="imageForm"]')[0]);
	 
	 $.ajax({
			url:"picture",
			data:formData,
			type:"post",
		    processData:false,
	        contentType:false,
	        success:function(data){
	        	//업로드 확인변수 세팅
	            $('input[name="checkUpload"]').val(1);
	            //저장된 파일명 저장.
	            $('input#oldFile').val(data); // 변경시 삭제될 파일명	          
	            $('form[role="form"]  input[name="MEMBER_PIC"]').val(data);	    	  
	      	 	alert("사진이 업로드 되었습니다.");
	        },
	        error:function(error){
	        	alert("업로드를 실패했습니다.");
	        }
	 });
			
}
	
	function id_check_onkey() {
		if($('input[name="MEMBER_ID"]').val()!= checkedID) {
		   $('input[name="MEMBER_ID"]').addClass('is-invalid');
		}
	}
	
	var checkedID ="";	
	function idCheck_go(){
		var MEMBER_ID=$('input[name="MEMBER_ID"]');
		
		if(!MEMBER_ID.val()){
		  alert("아이디를 입력해주세요.");
		  MEMBER_ID.focus();
		  return;
	}
		$.ajax({
			url:"/member/idCheck",
			method:"get",
			contentType: 'application/json',
			data:"MEMBER_ID="+MEMBER_ID.val().trim(),
			success:function(data){
			 	if(data.toUpperCase() == "DUPLICATED"){
			 		alert("중복된 아이디 입니다."); 
				}else{
				    alert("사용가능한 아이디 입니다.");
					checkedID=MEMBER_ID.val().trim();
				}
			},
			error:function(error){
				alert(error.status);
			}
		});
	}
	
	function pw_length_check() {
		  var MEMBER_PW = $('#inputPassword').val().trim();
		  if (MEMBER_PW.length < 8 || MEMBER_PW.length > 20) {
		    alert("8글자 이상 20글자 이하입니다.");
		    $('#inputPassword').focus();
		    $('#inputPassword').addClass('is-invalid');
		    return false;
		  } else {
		    $('#inputPassword').removeClass('is-invalid');
		  }
		}
	
	function pw_check() {
		  var pw = $('input[name="MEMBER_PW"]');
		  var pwCK = $('input[name="MEMBER_PWCK"]');
		  
		  if (pwCK.val().length < 8 || pwCK.val().length > 20) {
		    alert("비밀번호 길이를 확인해주세요.");
		    pwCK.focus();
		    pwCK.addClass('is-invalid');
		  } else {
		    pwCK.removeClass('is-invalid');
		  }
		  
		  if (pw.val() !== pwCK.val()) {
			    alert("비밀번호가 일치하지 않습니다.");
			    pwCK.val('');
			    pwCK.focus();
			    pwCK.addClass('is-invalid');
			  } else {
			    pwCK.removeClass('is-invalid');
			  }
			}
	
	function name_check(){
		  var MEMBER_NAME = $('input[name="MEMBER_NAME"]');
		  
		  if(!MEMBER_NAME.val() || MEMBER_NAME.val() === ''){
		    alert("이름을 입력해주세요.");
		    MEMBER_NAME.focus();
		    MEMBER_NAME.addClass('is-invalid');
		  } else {
		    MEMBER_NAME.removeClass('is-invalid');
		  }
		}

	
	function phone_check() {
		  var MEMBER_PHONE = $('input[name="MEMBER_PHONE"]');
		  var numericValue = MEMBER_PHONE.val().replace(/\D/g, "");

		  if (numericValue.length !== 11) {
		    alert("전화번호를 올바르게 입력해주세요.");
		    MEMBER_PHONE.val(numericValue);
		    MEMBER_PHONE.focus();
		    MEMBER_PHONE.addClass('is-invalid');
		  } else {
		    if (MEMBER_PHONE.val() !== numericValue) {
		      alert("전화번호는 숫자만 입력 가능합니다.");
		      MEMBER_PHONE.val(numericValue);
		      MEMBER_PHONE.focus();
		      MEMBER_PHONE.addClass('is-invalid');
		    } else {
		      MEMBER_PHONE.removeClass('is-invalid');
		    }
		  }
		}


	
	function email_check(){
		var MEMBER_EMAIL = $('input[name="MEMBER_EMAIL"]');
		if(!MEMBER_EMAIL.val().match('@')){
			alert("이메일을 형식에 맞게 입력해주세요.");
			MEMBER_EMAIL.focus();
			MEMBER_EMAIL.addClass('is-invalid');
		}else{
			MEMBER_EMAIL.removeClass('is-invalid');
		}
	}
	
	function picture_go(){
		//alert("changee file");
		var form = $('form[role="imageForm"]');
		var picture = form.find('[name=pictureFile]')[0];
    	
		var fileFormat = 
			picture.value.substr(picture.value.lastIndexOf(".")+1).toUpperCase();
		//이미지 확장자 jpg 확인
		if(!(fileFormat=="JPG" || fileFormat=="JPEG")){
			alert("이미지는 jpg 형식만 가능합니다.");
			return;
		} 
		//이미지 파일 용량 체크
		if(picture.files[0].size>1024*1024*1){
			alert("사진 용량은 1MB 이하만 가능합니다.");
			return;
		};
		
		if (picture.files && picture.files[0]) {
			var reader = new FileReader();
			
			reader.readAsDataURL(picture.files[0]);
			 
			reader.onload = function (e) {
				var pictureView = $('div#pictureView')[0];
			 	pictureView.style.backgroundImage = "url("+e.target.result+")";
			 	pictureView.style.backgroundPosition="center";
			 	pictureView.style.backgroundSize="cover";
			 	pictureView.style.backgroundRepeat="no-repeat";			
			}
		}
		
		form.find('[name="checkUpload"]').val(0);
		$('#inputFileName').val(picture.files[0].name);
	}
	
	function position_check() {
		  var MEMBER_POSITION = parseInt($('#inputPosition').val());
		  
		  if (isNaN(MEMBER_POSITION)) {
		    alert("직책을 선택해주세요.");
		    $('#inputPosition').focus();
		    $('#inputPosition').addClass('is-invalid');
		  } else {
		    $('#inputPosition').removeClass('is-invalid');
		  }
		}

	function authority_check() {
		  var MEMBER_AUTHORITY = parseInt($('#inputAuthority').val());
		  
		  if (isNaN(MEMBER_AUTHORITY)) {
		    alert("직급을 선택해주세요.");
		    $('#inputAuthority').focus();
		    $('#inputAuthority').addClass('is-invalid');
		  } else {
		    $('#inputAuthority').removeClass('is-invalid');
		  }
		}
	
	var successMessage = "${successMessage}"; // successMessage 값을 JavaScript 변수에 할당
	  if (successMessage) {
	    alert(successMessage); // 알림창으로 메시지 표시
	  }

	function CloseWindow(parentURL){
		
		window.opener.location.reload(true);		
		window.close();
	}
</script>

</body>

