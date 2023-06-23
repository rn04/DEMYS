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
/* p-main-body 고정 수정X, border만 씌워서 작업!! */
.p-main-body{
   margin-top:5px;
   width:100%;
   height: calc(930px - 65px - 63px); 
   padding:5px;
}

#modal1 {
   display: none;
   position: relative;
   width: 100%;
   height: 100%;
   z-index: 1;
}


#modal1 h2 {
   margin: 0;
}

#modal1 .modal_content {
   width: 800px;
   height: 500px; 
   top: 50%; 
   background: #fff;
   border: 2px solid #016fa0;
   left: 50%;
   transform: translate(-50%, -50%);
   position: fixed;
}

#modal1 .modal_layer {
   position: fixed;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   background: rgba(0, 0, 0, 0.5);
   z-index: -1;
}

.filebox {
   margin-top: 1.5rem;
   margin-left: 84px;
   position: relative;
}

.filebox input[type="file"] {
   position: absolute;
   width: 1px;
   height: 1px;
   padding: 0;
   margin: -1px;
   overflow: hidden;
   clip:rect(0,0,0,0);
   border: 0;
}

.filebox label {
   display: inline-block;
    padding: 0.5em 0.75em;
    font-size: inherit;
    line-height: normal;
    vertical-align: middle;
    cursor: pointer;
    position: absolute;
    right: -10px;
}

/* named upload */
.filebox .upload-name {
   display: inline-block;
    padding: 9px;
    font-size: inherit;
    font-family: inherit;
    line-height: normal;
    vertical-align: middle;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    border: 1px solid #aaa;
    width: 100%;
    background-color: white;
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

</style>


      <body>
         <div class="regist_content">
            <div class="flex card-body" style="padding-bottom:0px;">
               <div class="navbar text-neutral-content" style="width: 100%; padding: 0px; min-height: 1rem; height: 30px; border-bottom:3px solid #016fa0;">
                  <div class="text-black mb-3" style="font-weight: bold; font-size: 1.5rem; ">
                     회의록 수정
                     <input type="hidden" name="pjnum" value="1" /> 
                     <input type="hidden" name="membernum" value="3" />
                  </div>
               </div>
            </div>

            <div class="container flex flex-col card-body" style="padding-top:10px; padding-bottom:10px; max-width:1000px;">
               <div class="flex">
                  <input type="text" name="mbtitle" placeholder="제목을 입력하세요." class="input" style="border:1px solid #aaaaaa; border-radius:0px; width:100%; justify-content:space-between;" value="${meetingBook.MB_TITLE}">
                  
                  <div class="w-36 h-8 text-center" style="line-height:45px; height:48px; border:1px solid #aaa; border-left:0;">${meetingBook.MEMBER_NAME }</div>
               </div>   
               
               <!-- 내용 -->   
               <textarea class="textarea" name="mbcontent" id="content" class="form-control" style="height:250px;width:100%; resize:none; border:1px solid #aaaaaa; border-radius:0px;" placeholder="내용을 작성하세요.">${meetingBook.MB_CONTENT}</textarea>
               
               <!-- 첨부파일 -->
               <div class="filebox bs3-primary w-full" style="margin:0 0">
                  <input class="upload-name" value="첨부파일을 등록하세요" disabled="disabled" style="color:#aaa;">
                     <label for="ex_filename">
                        <i class="fa-sharp fa-solid fa-paperclip text-2xl text-black mr-3 " ></i>                       
                     </label>
                  <input type="file" id="ex_filename" class="upload-hidden">
               </div>
            </div>

            <div style="display:flex; justify-content:center;">
               <button onclick="modify_go('${param.MB_NUM}');"class="btn btn-se" style="font-size: 20px; width: 100px; height: 40px; border-radius: 8px; margin-right: 10px;">수 정</button>
               <button class="btn btn-se" id="modal_close_btn" onclick="window.close();" style="font-size: 20px; width: 100px; height: 40px; border-radius: 8px;">취 소</button>
            </div>
         </div>
   </body>
<!-- project/list.jsp 화면끝나는 태그 -->

      <script>

      function modify_go(MB_NUM){
         var mbtitle = $("input[name='mbtitle']").val();
         var mbcontent = $("textarea[name='mbcontent']").val();
         
         
         var data={
               "MB_TITLE":mbtitle,
               "MB_CONTENT":mbcontent,
               "MB_NUM":MB_NUM
         }
         $.ajax({
            url:"<%=request.getContextPath()%>/project/domeetingbook_modify",
            type:"post",
            data:data,      
            success:function(){
               alert("수정이 완료되었습니다.");
               window.close();
               opener.MEETINGBOOK_go();
               
            },
            error:function(){
               alert('수정 내용을 확인하세요.');
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