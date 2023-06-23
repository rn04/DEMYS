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
               이슈 상세
            </div>
         </div>
      </div>
   
   
         <div class="flex flex-row card-body" style="padding-top:10px; padding-bottom:10px;display: flex;flex-direction: row; justify-content:space-between;">
            <div class="flex flex-col">
               <!-- 제목 -->
               <div class="flex flex-row">
                  <c:if test="${issue.ISSUE_IMP eq 3 }">
                     <div class="flex items-center font-bold justify-center" style="width:100px; height:49px; border:1px solid #aaaaaa; border-right:0">중요</div> <!-- 1:낮음 2:보통 3:중요 -->
                  </c:if>
                  <c:if test="${issue.ISSUE_IMP eq 2 }">
                     <div class="flex items-center font-bold justify-center" style="width:100px; height:49px; border:1px solid #aaaaaa; border-right:0">보통</div> <!-- 1:낮음 2:보통 3:중요 -->
                  </c:if>
                  <c:if test="${issue.ISSUE_IMP eq 1 }">
                     <div class="flex items-center font-bold justify-center" style="width:100px; height:49px; border:1px solid #aaaaaa; border-right:0">낮음</div> <!-- 1:낮음 2:보통 3:중요 -->
                  </c:if>
               <div class="flex items-center" style="width:550px; height:49px; border:1px solid #aaaaaa;">&nbsp;&nbsp;${issue.ISSUE_TITLE}</div>
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
                  <div class="text-center inline-block" style="width:160px; line-height:45px; height:48px; border:1px solid #aaaaaa;">${issue.MEMBER_NAME }</div>
                  <div class="flex justify-center">
                  <div class="flex items-center justify-center" style="border:1px solid #aaaaaa; border-radius:0px; width:236px; border-right:0;"><fmt:formatDate value="${issue.ISSUE_REGDATE }" pattern="yyyy-MM-dd"/></div>
                     <div class="flex justify-center" style="border:1px solid #aaaaaa; border-left:0; border-right:0; font-size:1.6rem; line-height:40px;">~</div>
                  <div class="flex items-center justify-center" style="border:1px solid #aaaaaa; border-radius:0px; width:236px; border-left:0;"><fmt:formatDate value="${issue.ISSUE_DEADLINE }" pattern="yyyy-MM-dd"/></div>
               </div>
                  
                  <!-- <div class="flex justify-center items-center" style="height:48px; border:1px solid #aaaaaa; width:150px; font-weight:bolder">
                      채택
                  </div> -->
               </div>
               
               <div style="width:650px; height:400px; border:1px solid #aaaaaa;">
                  &nbsp;&nbsp;${issue.ISSUE_CONTENT }
               </div>
               
               
               <!-- 첨부파일 -->
                  <div class="flex items-center" style="width:650px; height:49px; border:1px solid #aaaaaa; color:#dfdfdf; justify-content:space-between; cursor:pointer;" onclick="window.location='<%=request.getContextPath()%>/resource/submitFile/${issue.ISSUE_TITLE }_20230601.zip'">&nbsp;&nbsp;${issue.ISSUE_TITLE }_20230601.zip
                     <span>
                        <i class="fa-sharp fa-solid fa-paperclip text-2xl text-black mr-3 " ></i>
                     </span>
                  </div>
                  <div class="flex items-center" style="width:650px; height:49px; border:1px solid #aaaaaa; justify-content:space-between;">&nbsp;&nbsp;
                  <c:forEach var="issue_tag" items="${issue.tagList}" varStatus="status">
                     ${issue_tag.MEMBER_NAME }${issue.tagList.size() eq status.index+1 ? '' : ',' }
                  </c:forEach>
                     <span>
                        <i class="fa-solid fa-tag text-2xl text-black mr-3 " ></i>
                     </span>
                  </div>
               
               
               </div>
               
               
               
               <div style="width:400px;">
                  <div style="width: 100%; height: 400px; border: 1px solid #aaa; background-color: white; margin-bottom:96px;">
                     <div class="title" style="height: 5%;"></div>
                     <div class="content flex flex-col items-start" style="height:90%; margin-left: 5px; overflow: auto; ">
                         <c:forEach var="reply" items="${replyList}"  >
                           <div class="bg-base-100 pb-3" style="width: 95%; height: 115px; margin: 5px; border-bottom:1px solid #aaa">
                              <div class="" style="width: 97%; height: 50%; margin: 0;">
                                 <div class="card-title flex justify-between pb-5" style="margin: 0;">
                                    <div class="flex">
                                       <div>
                                           <div class="manPicture" style="width:25px;height:25px;display:block;margin:0 auto;border-radius:50%;" data-id="${reply.MEMBER_ID }"></div>
                                       </div>
                                       <div style="font-size:14px;">&nbsp;${reply.MEMBER_NAME }&nbsp;&nbsp;</div>
                                       <div style="font-size:14px; color:#aaa; float:right;">
                                       
                                       <fmt:formatDate value="${reply.ISSUERE_UPDATEDATE ne null && not empty reply.ISSUERE_UPDATEDATE ? reply.ISSUERE_UPDATEDATE : reply.ISSUERE_REGDATE }" pattern="yyyy-MM-dd  hh:mm"/>
                                       
                                       
                                       </div>
                                    </div>
                                 </div>
                                 <div style="font-size: 14px; text-color: gray;">${reply.ISSUERE_CONTENT }</div>
                                 <div style="display:flex; justify-content:flex-end; margin-top:10px;">
                                 <c:if test="${member.MEMBER_NUM eq reply.MEMBER_NUM}">
                                   
                                   
                                     <div class="dropdown dropdown-end" id="reply_modify" style="display:flex;">
                                     <button class="btn btn-se w-12 h-5 rounded" style="font-size: 8px; height: 20px; border-radius: 8px; margin-right: 5px; width:40px; padding:0;">수 정</button>
                                    <div class="dropdown dropdown-end" id="reply_modify_container" >
                                  <div tabindex="0" class="flex menu menu-compact dropdown-content mt-3 p-2 shadow bg-base-100 rounded-box" style="position:absolute; color: black; width: 320px; height: 200px; align-items: center; border:1px solid black;">
                                    <div id="remodi_contentbox">
                                        <div class="flex flex-row">
                                                <div><i class="fa-solid fa-check ml-3 mr-3 text-xl"></i><span>댓글 수정</span></div>
                                                </div>
                                             <div class="flex flex-row" style="height:70px; margin-top:5px;">
                                                <div class="flex flex-row">
                                                   <textarea class="form-control" name="issuere_content" style="width:260px; height:150px; border:1px solid #aaa; resize:none; border-radius:0px;" placeholder="내용을 작성하세요."></textarea>
                                                   <input type="hidden" name="issuere_num" value="${reply.ISSUERE_NUM}" />
                                                   <input type="hidden" name="issure_updatedate" value="${reply.ISSUERE_UPDATEDATE }" />
                                                </div>
                                                <div class="flex flex-row">
                                                   <button class="btn btn-se" style="font-size: 12px; width: 40px; height: 150px; border-radius: 0 3px 3px 0; margin-right: 10px; padding:0;" onclick="replyModify_go();">등 록</button>
                                                </div>
                                             </div> 
                                    </div>
                                  </div>
                              </div> 
                                 </div>
                                    
                                    
                                    <button class="btn btn-se w-12 h-5 rounded" style="font-size: 8px; height: 20px; border-radius: 8px; width:40px; padding:0;" onclick="replydel_go(${reply.ISSUERE_NUM});">삭 제</button>
                                 </c:if>
                                 </div>
                              </div>
                           </div>
                        </c:forEach> 
                     </div>
                     
                  </div>
                  
                     <div class="flex flex-row">
                        <div><i class="fa-solid fa-pen ml-3 mr-3 text-xl"></i><span>댓글 등록</span></div>
                     </div>
                  <div class="flex flex-row" style="height:70px; margin-top:5px;">
                     <div class="flex flex-row">
                        <textarea class="form-control" style="width:360px; height:70px; border:1px solid #aaa; resize:none; border-radius:0px;" placeholder="내용을 작성하세요." id="reply_content"></textarea>
                     </div>
                     <div class="flex flex-row">
                        <button class="btn btn-se" style="font-size: 12px; width: 40px; height: 70px; border-radius: 0 3px 3px 0; margin-right: 10px; padding:0;" onclick="replyRegist_go();">등 록</button>
                     </div>
                  </div> 
               </div>
               
         </div>
 
      <div style="display:flex; justify-content:center; margin-top:20px; margin-bottom:15px;">
      <c:if test="${member.MEMBER_NUM eq issue.MEMBER_NUM}">
         <button class="btn btn-se" style="font-size: 20px; width: 100px; height: 40px; border-radius: 8px; margin-right: 10px;" onclick="issue_modify_go();">수 정</button>
      </c:if>
      <c:if test="${member.MEMBER_NUM eq issue.MEMBER_NUM || member.MEMBER_AUTHORITY eq 3}">
         <button class="btn btn-se" style="font-size: 20px; width: 100px; height: 40px; border-radius: 8px; margin-right: 10px;" onclick="issuedel_go(${issue.ISSUE_NUM});">삭 제</button>
      </c:if>
         <button class="btn btn-se" style="font-size: 20px; width: 100px; height: 40px; border-radius: 8px; margin-right: 10px;" onclick="window.close();">닫 기</button>
      </div>
   </div>
   <div class="modal_layer"></div>
   <!-- /.content-wrapper -->
   <%@ include file="issue_replyhd.jsp" %>
   
   <script>
      

 
        function replydel_go(ISSUERE_NUM){
        var result = confirm("댓글을 삭제하시겠습니까?");
      var data={
            "ISSUERE_NUM":parseInt(ISSUERE_NUM)
         }
        if(result == true) {
           $.ajax({
              url:"<%=request.getContextPath()%>/project/replydel_go",
              type:"post",
              data:data,
              success:function(){                 
                 alert("댓글을 삭제하였습니다.");
                 setTimeout(function() {   
                  history.go(); }, 300);
              }
           });
        } else {
           history.go(-1);
        }
      }
        
        
        
        function issuedel_go(ISSUE_NUM){
            var result = confirm("이슈를 삭제하시겠습니까?");
          var data={
                "ISSUE_NUM":parseInt(ISSUE_NUM)
             }
            if(result == true) {
               $.ajax({
                  url:"<%=request.getContextPath()%>/project/issuedel_go",
                  type:"post",
                  data:data,
                  success:function(){                 
                     alert("해당 이슈를 삭제하였습니다.");
                     window.close();
                     opener.ISSUE_go();
                  }
               });
            } else {
               history.go(-1);
            }
          }
     
        
        function replyModify_go(ISSUERE_NUM){
           
            var issuerenum= parseInt($("input[name='issuere_num']").val());
            var issuerecontent = $("textarea[name='issuere_content']").val();
            var issuereupdatedate = $("input[name='issuere_updatedate']").val();
           
           
           
           
            var result = confirm("댓글을 수정하시겠습니까?");
          var data={
                "ISSUERE_NUM":parseInt(issuerenum),
                "ISSUERE_CONTENT":issuerecontent,
                "STRING_UPDATEDATE":issuereupdatedate
             }
            if(result == true) {
               $.ajax({
                  url:"<%=request.getContextPath()%>/project/doreplymodify_go",
                  type:"post",
                  data:data,
                  success:function(){                 
                     alert("댓글을 수정하였습니다.");
                     setTimeout(function() {   
                      history.go(); }, 500);
                  }
               });
            } else {
               history.go(-1);
            }
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

      
      window.onload=function(){
          MemberPictureThumb('<%=request.getContextPath()%>');
       }
       
       
     function MemberPictureThumb(contextPath){
           for(var target of document.querySelectorAll('.manPicture')){   
              var id = target.getAttribute('data-id');
              
              target.style.backgroundImage="url('"+contextPath+"/member/getPicture?MEMBER_ID="+id+"')";            
              target.style.backgroundPosition="center";
              target.style.backgroundRepeat="no-repeat";
              target.style.backgroundSize="cover";
           }
        }
     
     function issue_modify_go(){
         location.href='issue_modify?ISSUE_NUM=${issue.ISSUE_NUM}';
         
         setTimeout(function(){
            window.resizeTo(850, 700);
         },0);
         
      }
      
      
      
   </script>
   

</body>





