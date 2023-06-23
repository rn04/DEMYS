<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko" class="light" data-theme="light">
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

<!-- 아이콘 나오게 하기(common.css) -->
<link rel="stylesheet" href="/resource/common.css" />


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
   height : 665px;
}
.main-box {
   width: 80%;
   margin: 0 auto;
   height : 665px;

}
.main-title {
   padding-top : 5px;
   padding-bottom : 10px;
   text-align : center;
   font-weight: bold;
   font-size: 2rem;
   
}

.input-group {
   margin-bottom : 3px;
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
}

.select-bordered {
   height:30px;
   min-height:1rem;
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

.form-group {
   margin-bottom : 5px;
}
.card-footer {
   padding-top : 15px;
}

</style>
<body>
   <div class="regist_content">
      <div class="flex card-body" style="padding-bottom:0px;">
         <div class="navbar text-neutral-content" style="width: 100%; padding: 0px; min-height: 1rem; height: 30px; border-bottom:3px solid #016fa0;">
            <div class="text-black mb-3" style="font-weight: bold; font-size: 1.5rem; ">
               산출물 수정
            </div>
         </div>
      </div>
   
   
         <div class="flex flex-col card-body" style="padding-top:10px; padding-bottom:10px;">
            
               <!-- 제목 -->
               <input class="flex w-25 items-center" style="height:48px; border:1px solid #aaaaaa;" value="${product.PRODUCT_TITLE }" name="title"/>
               <input type="hidden" name="status" value="${product.PRODUCT_STATUS }" />
               <input type="hidden" name="pdnum" value="${product.PRODUCT_NUM }" />
               <input type="hidden" name="pjnum" value="${product.PJ_NUM }" />
               <input type="hidden" name="membernum" value="${product.MEMBER_NUM }" />
               
               <!-- 분류, 날짜, 채택 -->
               <div class="flex flex-row">
                   <select class="w-24 h-8 text-center inline-block"  style="height:48px; border:1px solid #aaaaaa;" name="step" >
                        <option value="step" >개발 단계</option>
                        <option value="1" ${product.PRODUCT_STEP eq '1' ? 'selected' : ""} >분석</option>
                        <option value="2" ${product.PRODUCT_STEP eq '2' ? 'selected' : ""} >설계</option>
                        <option value="3" ${product.PRODUCT_STEP eq '3' ? 'selected' : ""} >구현</option>
                        <option value="4" ${product.PRODUCT_STEP eq '4' ? 'selected' : ""} >시험</option>
                  </select> 
               
                  <div class="flex w-full" style="height:48px; border:1px solid #aaaaaa; border-left:0px;">
                     <label for="icon" style="line-height:50px; width:100%;"><i class="fa-solid fa-calendar-days ml-3" style="color:#016fa0;"></i>&nbsp;&nbsp;&nbsp;
                     <fmt:formatDate value="${product.PRODUCT_REGDATE }" pattern="yyyy-MM-dd"/>
                     </label>
                  </div>
                  <!-- <select class="w-28 h-8 text-center inline-block"  style="height:48px; border:1px solid #aaaaaa;">
                        <option value="1" selected>채택</option>
                        <option value="0">미채택</option>
                  </select> -->
                  
                  <!-- <select class="w-28 h-8 text-center inline-block"  style="height:48px; border:1px solid #aaaaaa;">
                        <option value="1" selected>채택</option>
                        <option value="0">미채택</option>
                  </select> -->
                  
                  <!-- <div class="flex justify-center items-center" style="height:48px; border:1px solid #aaaaaa; width:150px; font-weight:bolder">
                      채택
                  </div> -->
               </div>
               
               <textarea style="width:100%; height:200px; border:1px solid #aaaaaa;" name="content">&nbsp;&nbsp;${product.PRODUCT_CONTENT }</textarea>
               
               <!-- 첨부파일 -->
               <div class="flex w-full items-center" style="height:48px; border:1px solid #aaaaaa; color:#dfdfdf; justify-content:space-between;">&nbsp;&nbsp;시스템 시험 결과서 ver.1.hwp
                  <span>
                     <i class="fa-sharp fa-solid fa-paperclip text-2xl text-black mr-3 " ></i>
                  </span>
               </div>
               
            </div>
 
      <div style="display:flex; justify-content:center; margin-top:10px;">
         <button class="btn btn-se" onclick="modify_go('${product.PRODUCT_NUM}');" style="font-size: 20px; width: 100px; height: 40px; border-radius: 8px; margin-right: 10px;">수 정</button>
         <button type="button" id="cancelBtn" onclick="window.close();" class="btn btn-se" style="font-size: 20px; width: 100px; height: 40px; border-radius: 8px;">닫 기</button>
      </div>
   </div>
   <div class="modal_layer"></div>
   <!-- /.content-wrapper -->
   <script>
      
   function modify_go(PRODUCT_NUM){
      var title = $("input[name=title]").val();
      var step = $("select[name=step]").val();
      var content = $("textarea[name=content]").val();
      var membernum = $("input[name=membernum]").val();
      var pjnum = $("input[name=pjnum]").val();
      var pdnum = $("input[name=pdnum]").val();
      
      
      var data={
            "PRODUCT_TITLE":title,
            "PRODUCT_STEP":step,
            "PRODUCT_CONTENT":content,
            "MEMBER_NUM":membernum,
            "PJ_NUM":pjnum,
            "PRODUCT_NUM":pdnum
      }
      $.ajax({
         url:"<%=request.getContextPath()%>/project/doproduct_modify",
         type:"post",
         data:data,
         success:function(){
            alert("수정이 완료되었습니다.");
            window.opener.location.reload();
            window.close();
         },
         error:function(){
            alert('왜안됨?');
         }
      });
   }
   
   
   

      $(document).ready(function(){
           var fileTarget = $('.filebox .upload-hidden');

          fileTarget.on('change', function(){
              if(window.FileReader){
                  var filename = $(this)[0].files[0].name;
              } else {
                  var filename = $(this).val().split('/').pop().split('\\').pop();
              }

              $(this).siblings('.upload-name').val(filename);
             });
      }); 

   </script>
</body>






