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
   border:4.5px solid #153A66;
   width:100%;
   height:100vh;
}
</style>

<!-- 참여인력상세.css -->
<link rel="stylesheet" href="/resource/css/project/hr_detail.css" />

<body>

<!-- 참여인력 상세  -->

<div class="hr_detail">
        <div class="flex" style="background-color: #153A66;">
              <div class="navbar text-neutral-content openWindow-head">
                    <div class="openWindow-head-1">&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
              </div>
        </div>

      <div class="hr-detail-conts">
         <div class="hr-detail-title">
            <span>참여인력 상세</span>
         </div>
         <div class="hr-detail-cont">
            <div class="td-wrapper hr-detail-cont-0">
               <div class="hr-img">
                  <!-- <i class="fa-regular fa-file-image" style="font-size:210px;"></i> -->
                  <div class="manPicture" data-id="${pjhr.MEMBER_ID }" style="width:180px;height:215px;display:block;margin:0 auto;"></div>
                  
               </div>
               <div class="hr-detail_1">
                  <div class="font-bold">No. ${pjhr.MEMBER_NUM }</div>
                  <div>✔ ${pjhr.MEMBER_NAME }</div>
                  <div>✔  ${pjhr.PJHR_WORK }</div>
                  <div class="w-auto h-24 ml-7 mr-2">${pjhr.PJHR_DETAIL }</div>
               </div>
            </div>
         </div>
         
         <div class="p-regi-modal-bts">
                 <c:if test="${member.MEMBER_AUTHORITY == 3 }">
                  <button onclick="location.href='hr_modify?PJHR_NUM=${pjhr.PJHR_NUM}&PJ_NUM=${pjhr.PJ_NUM }';" class="p-regi-modal-bt">수정</button>
                  <button class="p-regi-modal-bt" onclick="PJHR_REMOVE_go('${pjhr.PJHR_NUM}');">삭제</button>
               </c:if>
                  <button onclick="Closewin();" class="p-regi-modal-bt">취소</button>
            </div>
      </div>
       <div class="modal_layer"></div>
</div>


<script>
function PJHR_REMOVE_go(PJHR_PK){
   var PJHR_NUM = PJHR_PK;
   var data = {"PJHR_NUM":parseInt(PJHR_NUM)}
   $.ajax({
      url:"pjhr_Remove",
      type:"post",
      data:data,
      success:function(){
         alert("삭제가 완료되었습니다.");
         opener.parent.pjhrList_go();
         window.close();
      },
      error:function(){
         alert("서버상에 오류로 삭제되지 못하였습니다.");
        }
   });
}

</script>





<script>

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
</script>
<script src="/resource/js/common.js" defer="defer"></script> 
</body>

</html>