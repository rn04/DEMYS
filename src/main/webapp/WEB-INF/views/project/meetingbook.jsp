<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>





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

<link rel="stylesheet" href="/resource/css/project/list.css" />
<link rel="stylesheet" href="/resource/css/project/phead.css" />
<!-- 요구사항리스트.css -->
<link rel="stylesheet" href="/resource/css/require/list.css" />


      <!-- project작업공간 -->
      <div class="p-main-body">
      
            <div class="p-body-cont">
             
               
               <!-- 회의록 리스트 -->
               <div>
                  <div class="rq-title">
                     <div class="flex" style="justify-content:space-between;">
                  <form class="flex">
                       <select name="searchKeywordTypeCode" data-value="${param.searchKeywordTypeCode}" id="" class="w-24 h-8 mr-1 text-center" style="border:1px solid #aaa;">
                        <option disabled="disabled">선택</option>
                        <option value="MB_TITLE">제목</option>
                        <option value="MEMBER_NAME">작성자</option>
                       </select>
                       <input name="searchKeyword" type="text" class="input input-bordered" style="width:200px; float:right; background-color:#e7e7e7; border-radius:0px; height:2rem;" placeholder="검색어를 입력하세요." maxlength="20" value="${param.searchKeyword}"/>
                       <button type="submit"><i class="fa-solid fa-magnifying-glass ml-2" style="font-size:25px; width:20px; color:#e7e7e7; line-height:30px;"></i></button>
                    </form>               
               </div>
                     <div>
                        <button id="modal_opne_btn" onclick="openModal(${meetingBook.PJ_NUM });"class="rq-regi-bt btn btn-se">등&nbsp;&nbsp;록</button>
                        <input type="hidden" name="pjnum" value="${PJ_NUM }" /> 
                        
                     </div>
                  </div>
                  <div class="rq-list">
                     <table>
                        <thead>
                           <tr style="width:100%;">
                              <th style="width:10%;">No</th>
                              <th style="width:50%;">제&ensp;&ensp;&nbsp;&nbsp;목</th>
                              <th style="width:5%;">첨&nbsp;부&nbsp;파&nbsp;일</th>
                              <th style="width:15%;">작&nbsp;성&nbsp;자</th>
                              <th style="width:10%;">등&nbsp;록&nbsp;일</th>
                           </tr>
                         </thead>
                         <tbody style="height: 45px; overflow-y:auto; overflow-x:hidden;">
                           <c:forEach var="meetingBook" items="${meetingBookList}">
                              <tr>
                                 <td onclick="window.open('meetingbook_detail?MB_NUM=${meetingBook.MB_NUM}','회의록 상세','width=900px,height=510px,left=500px,top=300px');" style="cursor:pointer;">${meetingBook.MB_NUM}</td>
                                 <td onclick="window.open('meetingbook_detail?MB_NUM=${meetingBook.MB_NUM}','회의록 상세','width=900px,height=510px,left=500px,top=300px');" style="text-align:start; cursor:pointer;">${meetingBook.MB_TITLE}</td>
                                 <td><i class="fa-solid fa-paperclip text-2xl"></i></td>
                                 <td>${meetingBook.MEMBER_NAME }</td>
                                 <td><fmt:formatDate value="${meetingBook.MB_REGDATE }" pattern="yyyy-MM-dd"/></td>
                              </tr>
                           </c:forEach>
                        </tbody>
                     </table>
                  </div>
               </div>
               
               
        
               
               <!-- 요구사항 끝나는 태그 -->
               
               
               </div>
            </div>

   <!-- project/phead.jsp (t-body) 화면 끝나는 태그 -->
   
          <!-- 등록모달 -->
      <div id="modal1">
      
      
         <div class="modal_content">
            <div class="flex card-body" style="padding-bottom:0px;">
               <div class="navbar text-neutral-content" style="width: 100%; padding: 0px; min-height: 1rem; height: 30px; border-bottom:3px solid #016fa0;">
                  <div class="text-black mb-3" style="font-weight: bold; font-size: 1.5rem; ">
                     회의록 등록
                     
                     <input type="hidden" name="membernum" value="${member.MEMBER_NUM }" />
                  </div>
               </div>
            </div>

            <div class="container flex flex-col card-body" style="padding-top:10px; padding-bottom:10px;">
               <div class="flex">
               <input type="hidden" id="pjNum" name="pjnum" value="" /> 
                  <input type="text" name="mbtitle" placeholder="제목을 입력하세요." class="input" style="border:1px solid #aaaaaa; border-radius:0px; width:600px; justify-content:space-between;">
                  
                  <div class="w-36 h-8 text-center" style="line-height:45px; height:48px; border:1px solid #aaa; border-left:0;">${member.MEMBER_NAME }</div>
               </div>
               
               <!-- 내용 -->   
               <textarea class="textarea" name="mbcontent" id="content" class="form-control" style="height:250px;width:100%; resize:none; border:1px solid #aaaaaa; border-radius:0px;" placeholder="내용을 작성하세요."></textarea>
               
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
               <button onclick="regist_go();"class="btn btn-se" style="font-size: 20px; width: 100px; height: 40px; border-radius: 8px; margin-right: 10px;">저장</button>
               <button class="btn btn-se" id="modal_close_btn" style="font-size: 20px; width: 100px; height: 40px; border-radius: 8px;">취소</button>
            </div>
         </div>

      <div class="modal_layer"></div>
   </div>
<!-- project/list.jsp 화면끝나는 태그 -->

      <script>

      function regist_go(){
         var mbtitle = $("input[name=mbtitle]").val();
         var mbcontent = $("textarea[name=mbcontent]").val();
         var membernum = $("input[name=membernum]").val();
         var pjnum = $("input[name=pjnum]").val();
         
         if (!mbtitle) {
              alert("제목을 확인하세요.");
              return;
          }

          if (!mbcontent) {
              alert("내용을 확인하세요.");
              return;
          }
         
         
         var data={
               "MB_TITLE":mbtitle,
               "MB_CONTENT":mbcontent,
               "MEMBER_NUM":membernum,
               "PJ_NUM":pjnum
         }
         $.ajax({
            url:"<%=request.getContextPath()%>/project/meetingbook_regist",
            type:"post",
            data:data,      
            success:function(){
               alert("등록되었습니다.");
               MEETINGBOOK_go();
            },
            error:function(){
               alert('등록에 실패하였습니다.');
            }
         });
      }
      
      
         /* document.getElementById("modal_opne_btn").onclick = function() {
            document.getElementById("modal1").style.display = "block";
         } */
         function openModal(pjnum){
            document.getElementById("modal1").style.display = "block";
            $('#pjNum').val(pjnum);
            
         }

         document.getElementById("modal_close_btn").onclick = function() {
            document.getElementById("modal1").style.display = "none";
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