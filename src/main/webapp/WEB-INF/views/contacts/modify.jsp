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
   padding-top : 5px;
   padding-bottom : 10px;
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
      <form class="table-box-type-1" method="post" action="/contacts/doModify" >
         <div class="main-title">업체 정보 수정</div>
         <input type="hidden" id="CT_NUM" name="CT_NUM" value="${contacts.CT_NUM }"/>
            <div class="form-group">
                  <label style="font-weight: bold;">업체명</label>
               <div class="input-group">
                 <div class="input-group-prepend">
                    <input type="text" class="input input-bordered w-full"  id="CT_NAME" name="CT_NAME" autocomplete="off" style="background-color:#e7e7e7;" readonly value="${contacts.CT_NAME }"/>
                </div>              
               </div>
               <div class="flex justify-between">
               <label style="font-weight: bold;">대표자명</label>
             <label style="font-weight: bold; margin-right:170px;">구분</label>
             </div>              
               <div class="input-group">
                 <div class="input-group-prepend2">
                    <input type="text"  placeholder="대표자명을 입력하세요." class="input input-bordered w-full" autocomplete="off"  id="CT_CEO" name="CT_CEO" value="${contacts.CT_CEO }"/>
                </div>
                <div class="input-group-prepend3">
                    <select class="select select-bordered w-full" name="CT_TYPE" id="CT_TYPE">
                     <option value=1>협력업체</option>
                     <option value=2>거래처</option>
                     <option value=3>클라이언트</option>
                   </select>
                  </div>
               </div>
            <div class="form-group row">
             <label style="font-weight: bold;">전화번호</label>
             <div class="form-box" style="display:flex;">
                 <div class="input-group-sm">
                     <select style="width: 22%;" name="phoneNumber1" id="ct_tel1" class="select select-bordered float-left" value="${phoneNumber1 }">
                         <option value="">-선택-</option>
                      <option value="02" ${phoneNumber1 == '02' ? 'selected' : ''}>02</option>
                      <option value="031" ${phoneNumber1 == '031' ? 'selected' : ''}>031</option>
                      <option value="041" ${phoneNumber1 == '041' ? 'selected' : ''}>041</option>
                      <option value="042" ${phoneNumber1 == '042' ? 'selected' : ''}>042</option>
                      <option value="044" ${phoneNumber1 == '044' ? 'selected' : ''}>044</option>
                      <option value="033" ${phoneNumber1 == '033' ? 'selected' : ''}>033</option>
                      <option value="053" ${phoneNumber1 == '053' ? 'selected' : ''}>053</option>
                      <option value="054" ${phoneNumber1 == '054' ? 'selected' : ''}>054</option>
                  </select>
                     <label class="float-left" style="padding: 0; text-align: center;width:5%;">&nbsp;-&nbsp;</label> 
                     <input style="width:34%;" type="text" class="input input-bordered float-left" id="ct_tel2" name="phoneNumber2" autocomplete="off" onkeyup="this.value = this.value.replace(/[^\d]/g, '')" value="${ phoneNumber2}"/> 
                     <label class="float-left" style="padding: 0; text-align: center;width:5%;">&nbsp;-&nbsp;</label> 
                     <input style="width:34%;" type="text" class="input input-bordered float-right" id="ct_tel3" name="phoneNumber3" autocomplete="off" onkeyup="this.value = this.value.replace(/[^\d]/g, '')" value="${ phoneNumber3}"/>
                 </div>
             </div>
         </div>
            <div class="form-group row">
               <label style="font-weight: bold;">이메일</label>
                  <div class="form-box" style="display:flex;">
                     <div class="input-group-sm w-full flex">
                        <input name="CT_EMAIL" type="text" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, &#39;&#39;);" autocomplete="off" class="input input-bordered w-full" id="inputEmail" value="${contacts.CT_EMAIL }" onchange="email_check()">
                     </div>
                  </div>
               </div>
            <div class="form-group row">
               <label style="font-weight: bold;">팩스번호</label>
                  <div class="form-box" style="display:flex;">
                     <div class="input-group-sm">
                        <input style="width:30%;" type="text" class="input input-bordered float-left"  id="CT_FAX" name="ct_fax1" autocomplete="off" onkeyup="this.value = this.value.replace(/[^\d]/g, '')" value="${ct_fax1 }"/> 
                           <label class="float-left" style="padding: 0; text-align: center;width:5%;">&nbsp;-&nbsp;</label> 
                        <input style="width:30%;" type="text" class="input input-bordered float-left"  id="CT_FAX" name="ct_fax2" autocomplete="off" onkeyup="this.value = this.value.replace(/[^\d]/g, '')" value="${ct_fax2 }"/> 
                           <label class="float-left" style="padding: 0; text-align: center;width:5%;">&nbsp;-&nbsp;</label> 
                        <input style="width:30%;" type="text" class="input input-bordered float-right" id="CT_FAX" name="ct_fax3" autocomplete="off" onkeyup="this.value = this.value.replace(/[^\d]/g, '')" value="${ct_fax3 }"/>
                        </div>
                     </div>
                  </div>
                  <div class="flex justify-between">
                        <label style="font-weight: bold;">주소</label>
                   </div>              
                        <div class="input-group">
                          <div class="input-group-prepend2">
                             <input type="text" id="sample6_postcode" class="input input-bordered w-full" name="postcode" autocomplete="off" value="${postcode }"/>
                         </div>
                         <div class="input-group-prepend3">
                             <button type="button" class="btn btn-se" onclick="sample6_execDaumPostcode();">우편번호 찾기</button>
                           </div>
                        </div>
                     <div class="input-group">
                       <div class="input-group-prepend">
                          <input type="text"  id="sample6_address" class="input input-bordered w-full" autocomplete="off" name="address" value="${address }"/>
                      </div>              
                     </div>
                     <div class="input-group">
                       <div class="input-group-prepend">
                          <input type="text"  id="sample6_detailAddress"  class="input input-bordered w-full" autocomplete="off" name="detailAddress" value="${detailAddress }"/>
                      </div>
                      <div class="input-group-prepend">
                          <input type="text" id="sample6_extraAddress" class="input input-bordered w-full" autocomplete="off" name="extraAddress" value="${extraAddress }"/>
                      </div>                 
                     </div>
                     <label style="font-weight: bold;">담당자명</label>
                     <div class="input-group">
                       <div class="input-group-prepend">
                          <input type="text" class="input input-bordered w-full" name="CT_MANAGER" autocomplete="off" value="${contacts.CT_MANAGER }"/>
                      </div>              
                     </div>
                    <div class="form-group row">
                  <label style="font-weight: bold;">전화번호</label>
                  <div class="form-box" style="display:flex;">
                     <div class="input-group-sm">
                        <select style="width:22%;" name="ct_mg_tel1" id="CT_MG_TEL" class="select select-bordered float-left" value="${ct_mg_tel1}"> 
                               <option value="">-선택-</option>
                               <option value="010" ${ct_mg_tel1 == '010' ? 'selected' : ''}>010</option>
                               <option value="011" ${ct_mg_tel1 == '011' ? 'selected' : ''}>011</option>
                               <option value="070" ${ct_mg_tel1 == '070' ? 'selected' : ''}>070</option>
                        </select> 
                           <label class="float-left" style="padding: 0; text-align: center;width:5%;">&nbsp;-&nbsp;</label> 
                        <input style="width:34%;" type="text" class="input input-bordered float-left"  id="CT_MG_TEL" name="ct_mg_tel2" autocomplete="off" onkeyup="this.value = this.value.replace(/[^\d]/g, '')" value="${ct_mg_tel2}"/> 
                           <label class="float-left" style="padding: 0; text-align: center;width:5%;">&nbsp;-&nbsp;</label> 
                        <input style="width:34%;" type="text" class="input input-bordered float-right"  id="CT_MG_TEL" name="ct_mg_tel3" autocomplete="off" onkeyup="this.value = this.value.replace(/[^\d]/g, '')" value="${ct_mg_tel3}"/>
                        </div>
                     </div>
                  </div>
      <div class="card-footer row" style="margin-top: 0; border-top: none;display:flex;flex-direction:row;justify-content:center;">                  
         <button type="submit" id="modifyBtn" class="btn btn-se" style="margin-right: 10px;">수 정</button>
         <div class="col-sm-4"></div>
         <button type="button" id="cancelBtn" onclick="CloseWindow();" class="btn btn-se"  style="margin-left: 10px;">취 소</button>
      </div>   
            </div>
         </form>
      </div>
   </div>
</div>
<script>
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = '';
            var extraAddr = '';

          
            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}

function CloseWindow(parentURL){
   
   window.opener.location.reload(true);      
   window.close();
}
   </script>
</body>







