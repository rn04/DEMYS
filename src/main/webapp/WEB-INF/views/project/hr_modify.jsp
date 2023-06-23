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

<!-- 참여인력수정.css -->
<link rel="stylesheet" href="/resource/css/project/hr_modify.css" />

<body>
<!-- 참여인력 수정  -->

<div class="hr_detail">
        <div class="flex" style="background-color: #153A66;">
            <div class="navbar text-neutral-content openWindow-head">
                  <div class="openWindow-head-1">&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
            </div>
         </div>

      <div class="hr-modify-conts">
         <div class="hr-modify-title">
            <span>참여인력 수정</span>
         </div>
         <div class="hr-regi-detail">
            <div class="td-wrapper hr-modi-cont">
               <div class="hr-icon">
                  <div class="manPicture" data-id="${pjhr.MEMBER_ID }" style="width:180px;height:215px;display:block;margin:0 auto;"></div>
               </div>
               <div class="hr-modi-conts">
                  <div>✔ ${pjhr.MEMBER_NAME } </div>
                  <div>
                     <div class="flex items-center justify-between w-full">
                        <div class="">✔ ${pjhr.PJHR_WORK }</div>
                        <select name="PJHR_WORK" class="select w-60">
                             <option disabled selected>담당업무</option>
                             <option value="PM" ${pjhr.PJHR_WORK == 'PM' ? "selected":""}>매니저(PM)</option>
                             <option value="PL" ${pjhr.PJHR_WORK == 'PL' ? "selected":""}>리더(PL)</option>
                             <option value="AA" ${pjhr.PJHR_WORK == 'AA' ? "selected":""}>공통설계자(AA)</option>
                             <option value="TA" ${pjhr.PJHR_WORK == 'TA' ? "selected":""}>구축담당자(TA)</option>
                             <option value="DA" ${pjhr.PJHR_WORK == 'DA' ? "selected":""}>DB설계자(DA)</option>
                             <option value="QA" ${pjhr.PJHR_WORK == 'QA' ? "selected":""}>품질보증(QA)</option>
                             <option value="BA" ${pjhr.PJHR_WORK == 'BA' ? "selected":""}>프로세스설계자(BA)</option>
                        </select>
                     </div>
                  </div>
                  <div class="font-bold">✔ 세부사항</div>
                  <div>&nbsp;<input type="text" value="${pjhr.PJHR_DETAIL }" name="PJHR_DETAIL"class="input w-full h-16" /></div>
               </div>
            </div>
         </div>
         <input type="hidden" value="${pjhr.PJ_NUM }" name="PJ_NUM" />
         
         <div class="p-regi-modal-bts">
                  <button onclick="PjhrModify_go();" class="p-regi-modal-bt">수정</button>
                  <button onclick="Closewin();" class="p-regi-modal-bt">취소</button>
            </div>
            <input type="hidden" value="${pjhr.PJHR_NUM}" name="PJHR_NUM" />
      </div>
</div>


<script>
function PjhrModify_go(){
   //var id = '';
   var PJ_NUM = $('input[name="PJ_NUM"]').val();
   var PJHR_WORK = $('select[name="PJHR_WORK"]').val();
   var PJHR_DETAIL = $('input[name="PJHR_DETAIL"]').val();
   var PJHR_NUM = $('input[name="PJHR_NUM"]').val();
   
   var data ={
         "pjhr_WORK":PJHR_WORK,
         "pjhr_DETAIL":PJHR_DETAIL,
         "pjhr_NUM":parseInt(PJHR_NUM),
         "pj_NUM":parseInt(PJ_NUM)
      }
   console.log(data);
   $.ajax({
      url:"hr_modifydo",
      type:"post",
      data:JSON.stringify(data),      
       contentType:"application/json",
      success:function(data){
         alert("수정이 완료되었습니다.");
         opener.parent.pjhrList_go();
         window.close();
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
