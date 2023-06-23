<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
               이슈
            </div>
         </div>
      </div>
   
   
         <div class="flex flex-row card-body" style="padding-top:10px; padding-bottom:10px;display: flex;flex-direction: row; justify-content:space-between;">
            <div class="flex flex-col">
               <!-- 제목 -->
               <div class="flex flex-row">
               <div class="flex items-center font-bold" style="width:100px; height:49px; border:1px solid #aaaaaa; border-right:0">&nbsp;&nbsp;   보통(${issue.issue_imp})</div> <!-- 1:낮음 2:보통 3:중요 -->
               <div class="flex items-center" style="width:550px; height:49px; border:1px solid #aaaaaa;">&nbsp;&nbsp;   화면 이슈(${issue.issue_title})</div>
               </div>
               <!-- 분류, 날짜, 채택 -->
               <div class="flex flex-row">
                  <!-- <select class="w-24 h-8 text-center inline-block"  style="height:48px; border:1px solid #aaaaaa;" disabled>
                        <option value="step" >개발 단계</option>
                        <option value="a">분석</option>
                        <option value="d">설계</option>
                        <option value="r">구현</option>
                        <option value="t" selected>시험</option>
                  </select> -->
                  <div class="text-center inline-block" style="width:160px; line-height:45px; height:48px; border:1px solid #aaaaaa;">이주헌(${member.member_name})</div>
                  <div class="flex justify-center">
                  <div class="flex items-center justify-center" style="border:1px solid #aaaaaa; border-radius:0px; width:236px; border-right:0;">2023.05.22(${issue.issue_regDate })</div>
                     <div class="flex justify-center" style="border:1px solid #aaaaaa; border-left:0; border-right:0; font-size:1.6rem; line-height:40px;">~</div>
                  <div class="flex items-center justify-center" style="border:1px solid #aaaaaa; border-radius:0px; width:236px; border-left:0;">2023.05.31(${issue.issue_deadline })</div>
               </div>
                  
                  <!-- <div class="flex justify-center items-center" style="height:48px; border:1px solid #aaaaaa; width:150px; font-weight:bolder">
                      채택
                  </div> -->
               </div>
               
               <div style="width:650px; height:400px; border:1px solid #aaaaaa;">
                  &nbsp;&nbsp;회의 내용 나오는 곳.(${meetingbook.mb_content })
               </div>
               
               
               <!-- 첨부파일 -->
               <div class="flex items-center" style="width:650px; height:49px; border:1px solid #aaaaaa; color:#dfdfdf; justify-content:space-between;">&nbsp;&nbsp;첨부파일이름.hwp(${mb_attach.mbat_filename })
                  <span>
                     <i class="fa-sharp fa-solid fa-paperclip fa-flip-vertical text-2xl text-black mr-3 " ></i>
                  </span>
               </div>
               <div class="flex items-center" style="width:650px; height:49px; border:1px solid #aaaaaa; justify-content:space-between;">&nbsp;&nbsp;김원미, 권오상, 이주헌(${issue_tag.member_num })
                  <span>
                     <i class="fa-solid fa-tag text-2xl text-black mr-3 " ></i>
                  </span>
               </div>
               
               
               </div>
               
               <%-- <div class="flex flex-col">
               
                  <div class="flex flex-row" style="width:400px; height:30px; border:1px solid #aaaaaa; border-bottom:0px;">
                     <div class="flex flex-row" style="border-bottom:0">
                        <div class="flex">
                           <img class="w-9 rounded-full" src="/resource/img/abc.jpg">
                        </div>
                        <div class="flex">권오상&nbsp;&nbsp;</div>
                     </div>
                  </div>
                  <div class="flex" style="width:400px; height:100px; border:1px solid #aaaaaa; border-top:0px;">수정했습니다. 이메일 확인 바람.(${issuere_content} )</div>
               </div> --%>
               
               <div style="width:400px;">
                  <div style="width: 100%; height: 400px; border: 1px solid #aaa; background-color: white; margin-bottom:96px;">
                     <div class="title" style="height: 5%;"></div>
                     <div class="content flex flex-col items-start" style="height:90%; margin-left: 5px; overflow: auto; ">
                        <c:forEach begin="0" end="4" step="1"   >
                           <div class="bg-base-100 pb-3" style="width: 95%; height: 55%; margin: 5px; border-bottom:1px solid #aaa">
                              <div class="" style="width: 97%; height: 50%; margin: 0;">
                                 <div class="card-title flex justify-between pb-5" style="margin: 0;">
                                    <div class="flex">
                                       <div>
                                          <img class="w-7 rounded-full mr-2" src="/resource/img/imja.jpg" style="line-height:30px;">
                                       </div>
                                       <div style="font-size:14px;">이주헌&nbsp;&nbsp;</div>
                                    </div>
                                 </div>
                                 <div style="font-size: 14px; text-color: gray;">수정했습니다. 이메일 확인 바람</div>
                                 <div style="display:flex; justify-content:flex-end; margin-top:10px;">
                                    <button class="btn btn-se w-12 h-5 rounded" style="font-size: 8px; height: 20px; border-radius: 8px; margin-right: 5px; width:40px; padding:0;">수 정</button>
                                    <button class="btn btn-se w-12 h-5 rounded" style="font-size: 8px; height: 20px; border-radius: 8px; width:40px; padding:0;">삭 제</button>
                                 </div>
                              </div>
                           </div>
                        </c:forEach>
                     </div>
                     
                  </div>
                     <div class="flex flex-row">
                        <div><i class="fa-solid fa-check ml-3 mr-3 text-xl"></i><span>댓글 작성</span></div>
                     </div>
                  <div class="flex flex-row" style="height:70px; margin-top:5px;">
                     <div class="flex flex-row">
                        <textarea class="form-control" style="width:360px; height:70px; border:1px solid #aaa; resize:none; border-radius:0px;" placeholder="내용을 작성하세요."></textarea>
                     </div>
                     <div class="flex flex-row">
                        <button class="btn btn-se" style="font-size: 12px; width: 40px; height: 70px; border-radius: 0 3px 3px 0; margin-right: 10px; padding:0;">등 록</button>
                     </div>
                  </div>
               </div>
               
         </div>
 
      <div style="display:flex; justify-content:center; margin-top:20px; margin-bottom:15px;">
         <button class="btn btn-se" style="font-size: 20px; width: 100px; height: 40px; border-radius: 8px; margin-right: 10px;">수 정</button>
         <button class="btn btn-se" style="font-size: 20px; width: 100px; height: 40px; border-radius: 8px;">삭제</button>
      </div>
   </div>
   <div class="modal_layer"></div>
   <!-- /.content-wrapper -->
   <script>
      


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






