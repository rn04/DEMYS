<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- 프로젝트 참여인력.css -->
<link rel="stylesheet" href="/resource/css/project/hr_list.css" />
<!-- 모달창.css -->
<link rel="stylesheet" href="/resource/css/project/contacts_modal.css" />
<!-- 참여인력추가 모달.css -->
<link rel="stylesheet" href="/resource/css/project/hr_regist_modal.css" />


               <!-- 참여인력 정보 -->
               <div id="hrList_new">
               <input type="hidden" name="PJ_NUM" value="${projects.PJ_NUM}" />
                  <div class="info-title">
                        <c:if test="${member.MEMBER_AUTHORITY == 3 }">
                           <button id="pjhr_Regibt" class="hr-regist-bt" onclick="PJHR_REGIST_go('${projects.PJ_NUM}');">참여인력 추가</button>
                        </c:if>
                     </div>
                     <div class="flex w-full mx-2.5">
                        <span style="font-weight:bold;">총 참여인력 &nbsp;</span>
                        <span style="font-weight:bold;color:blue;"> ${pjhrListCount }</span>
                        
                   </div>
                     <div class="hr-list">
                        <c:forEach var="pjhrList" items="${pjhrList }" varStatus="status">
                        <div class="td-wrapper hr-list-cont shadow-lg" onclick="javascript:OpenWindow('hr_detail?PJHR_NUM=${pjhrList.PJHR_NUM}&PJ_NUM=${projects.PJ_NUM }','참여인원상세',600,500);">
                           <div class="hr-img"> 
                                 <div class="manPicture" data-id="${pjhrList.MEMBER_ID }" style="width:150px;height:180px;display:block;margin:0 auto;border-radius:5%;"></div>
                           </div>
                           <div class="w-3/5 px-2.5" >
                              <input type="hidden" value="${pjhrList.PJHR_NUM }" name="PJHR_NUM" />
                             <%--  <div class="font-bold">No. ${status.index+1}</div> --%>
                              <div>✔ ${pjhrList.MEMBER_NAME }</div>
                              <div>✔ ${pjhrList.PJHR_WORK }</div>
                              <div>✔ ${pjhrList.PJHR_DETAIL }</div>
                           </div>
                        </div>
                        </c:forEach>
                     </div>
                  </div>
                  <!-- 참여인력 끝나는 태그 -->
               </div>


<!--  --><!-- 모달창-참여인력 추가(등록) 화면  -->
<div id="modal_hr">

      <div class="modal_hr_content_1">
            <div class="flex" style="background-color: #153A66;">
                  <div class="navbar text-neutral-content modal-head">
                        <div class="text-white modal-head-0">&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
                  </div>
            </div>

         <div class="cts-view">
            <div class="hr-title">
               <span>참여인력 추가</span>
            </div>
            <div class="hr-regi-detail">
               <div class="td-wrapper hr-regi-cont">
                  <div class="hr-icon">
                   	<div id="addManPicture"class="manPicture" data-id="" style="width:100%;height:100%;display:block;margin:0 auto;"></div>
                  </div>
                  <div class="hr-regi-conts">
                     <div>✔ &nbsp;
                        <input id="m_names" name="PJHR_NAME" type="text" disabled placeholder="이름을 입력하세요." autocomplete="off" class="input w-full h-9" />
                        <button id="modal_opne_btn_hr_2" class="p-regi-modal-bt" onclick="searchPJHR_NAME();">조회</button>
                     </div>
                     <div>✔ &nbsp; 
                        <div class="">
                           <select class="select w-64" name="PJHR_WORK">
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
                     <div>&nbsp;<input type="text" name="PJHR_DETAIL" placeholder="  세부사항을 입력하세요."  autocomplete="off" class="input w-full h-16" /></div>
                     <input type="hidden" value="${pjhr.PJ_NUM }" name="PJ_NUM" />
                     <!-- MEMBER_NUM -->
                        <input id="m_number" type="hidden" name="MEMBER_NUM" value=""/>
                  </div>
               </div>
            </div>
            
            
            <div class="p-regi-modal-bts">
                     <button class="p-regi-modal-bt" onclick="PJHR_REGI();" >등록</button>
                     <button id="modal_close_btn_hr_1" class="p-regi-modal-bt" onclick="PJHR_Search();">취소</button>
               </div>
         </div>
      </div>

      <div class="modal_layer"></div>
</div>
<script>


//참여인력추가 모달창 열기
function PJHR_REGIST_go(PJ_PK){
   $("#modal_hr").css('display','block');
}


//참여인력등록 취소 모달창 닫기
function PJHR_Search(){
   $('#modal_hr').css('display', 'none');
}
//참여인력등록
function PJHR_REGI(){
   var PJHR_WORK = $('select[name=PJHR_WORK]').val();
   var PJHR_DETAIL = $('input[name=PJHR_DETAIL]').val();
   var MEMBER_NUM = $('input[name=MEMBER_NUM]').val();
   var PJ_NUM = $('input[name=PJ_NUM]').val();
   
   var data={
         "pjhr_WORK":PJHR_WORK,
         "pjhr_DETAIL":PJHR_DETAIL,
         "member_NUM":parseInt(MEMBER_NUM),
         "pj_NUM":parseInt(PJ_NUM)
   }
   console.log(data);
   $.ajax({
      url:"pjhrRegist",
      type:"post",
      data:JSON.stringify(data),
      contentType:"application/json",
      success:function(data){
         alert("참여인력이 추가되었습니다.");
         $('#modal_hr').css('display', 'none');
         pjhrList_go();
         
      },
      error:function(){
         alert("잘못된 입력입니다. ");
      }
   });
   
 
}


</script>


<!-- 모달창-참여인력 조회화면 (프로젝드메니저등록모달창과 제목만 다름) -->
<div id="modal_1" class="modal_PJHR_name">

      <div class="modal_content">
            <div class="flex" style="background-color: #153A66;">
                  <div class="navbar text-neutral-content modal-head">
                        <div class="text-white modal-head-0">&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
                  </div>
            </div>

         <div class="cts-view">
            <div class="cts-title">
               <span>참여인력 조회</span>
            </div>
            <div class="cts-title-sub">* 사원을 조회합니다.</div>
            <div class="p-modal-serach">
               <select class="select select-bordered p-cts-select select_member" name="searchType" id="searchType">
                    <option disabled selected>선택 </option>
                    <option value="mn" ${searchType=='mn' ? "selected":"" }>담당자명</option>
                    <option value="md" ${searchType=='md' ? "selected":"" }>담당부서</option>
                    <%-- <option value="mp" ${searchType=='mp' ? "selected":"" }>직급</option> --%>
               </select>
               <div class="p-modal-searchbar key_member">
                  <input name="keyword" type="text" placeholder="검색어를 입력하세요." autocomplete="off" class="input input-bordered p-modal-searchbar-input" value="${keyword }"/>
                  <i onclick="PJHR_list_go();" class="fa-solid fa-magnifying-glass" style="font-size:30px;width:15%;display:flex;align-items: center;justify-content: space-around;"></i>
               </div>
            </div>
            <div class="cts-serch-list">
               <table id="memberList_view" border="1">
                  <!-- 참여인력리스트 뜨는곳 -->
               </table>
            </div>
            <div class="p-regi-modal-bts">
                     <button class="p-regi-modal-bt" onclick="javascript:PJHR_S_REGI();">등록</button>
                     <button id="modal_close_btn_hr_2" class="p-regi-modal-bt" onclick="PJHR_CLOSE_MODAL();">취소</button>
                     <!-- MEMBER NUM, NAME값 받을 공간 -->
                      <div class="add_member_id" ></div>
               </div>
         </div>
      </div>

      <div class="modal_layer"></div>
</div>

<script>

function searchPJHR_NAME(){
   
   $(".modal_PJHR_name").css('display',"block");
   $.ajax({
      url: "Search_Modal",
      type: "get",
      dataType:"json",
      success: function(data){
         var memberList = data.memberList;
         var table = $('#memberList_view');
         table.empty();
         //console.log(data);

         for(var i=0 ; i<memberList.length; i++ ){
            var member = memberList[i];
            var row = '<tr data-member-num ="'+ member.member_NUM +'" data-member-id="'+ member.member_ID+ '"> <td>' + member.member_NAME + '</td><td>' + member.member_DEP + '</td></tr>';
            table.append(row);
         }
         
         table.find('tr').click(function(){
            var MEMBER_NAME = $(this).find('td:first-child').text();
            var MEMBER_NUM = $(this).data('member-num');
            var MEMBER_ID = $(this).data('member-id');
            var input_mnum = '<input id="m_num" type="hidden" value="' + MEMBER_NUM + '" />';
            var input_mname = '<input id="m_name" type="hidden" value="' + MEMBER_NAME + '" />';
            $('#addManPicture').attr('data-id',MEMBER_ID);
            MemberPictureThumb('<%=request.getContextPath()%>');
             var addMemberId = $('.add_member_id');

            if (addMemberId.length) {
                 addMemberId.empty();
            }
            addMemberId.append(input_mnum);
            addMemberId.append(input_mname);
            table.find('tr>td:first-child').each(function(){
               if($(this).text() == MEMBER_NAME){
                  $(this).parent('tr').css('background-color', "#e7e7e7e7");
               }else{
                  $(this).parent('tr').css('background-color', "#ffffff");
               }
            });
         });
      }
   }); 
}

//프로젝트member조회
function PJHR_list_go(){
   
   //alert("리스트 돋보기");
   var searchType = $('.select_member[name="searchType"]').val();
   var keyword = $('.key_member>input[name="keyword"]').val();
   console.log(searchType);
   console.log(keyword);
   $.ajax({
      //alert("리스트 ajax");
      url: "regist_searchMEMBER",
      type: "get",
      dataType:"json",
      data:{
         "searchType":searchType,
         "keyword": keyword
      },
      success: function(data){
         var memberList = data.memberList;
         var table = $('#memberList_view');
         table.empty();
         
         for(var i=0 ; i<memberList.length; i++ ){
            var member = memberList[i];
            var row = '<tr data-member-num ="'+ member.member_NUM +'"> <td>' + member.member_NAME + '</td><td>' + member.member_DEP + '</td></tr>';
            table.append(row);
         }
         
         table.find('tr').click(function(){
            var MEMBER_NAME = $(this).find('td:first-child').text();
            var MEMBER_NUM = $(this).data('member-num');
            
            var input_mnum = '<input id="m_num" type="hidden" value="' + MEMBER_NUM + '" />';
            var input_mname = '<input id="m_name" type="hidden" value="' + MEMBER_NAME + '" />';
            
           
            
            
             var addMemberId = $('.add_member_id');

            if (addMemberId.length) {
                 addMemberId.empty();
            }
            addMemberId.append(input_mnum);
            addMemberId.append(input_mname);
            
            table.find('tr>td:first-child').each(function(){
               if($(this).text() == MEMBER_NAME){
                  $(this).parent('tr').css('background-color', "#e7e7e7e7");
               }else{
                  $(this).parent('tr').css('background-color', "#ffffff");
               }
            });
         });
      }
   });
}
// 참여인력 member 조회 등록
function PJHR_S_REGI(){
   var MEMBER_NUM = $('#m_num').val();
   $('#m_number').val(MEMBER_NUM);
   var MEMBER_NAME = $('#m_name').val();
   $('#m_names').val(MEMBER_NAME);

   $(".modal_PJHR_name").css('display', "none");
}


//프로젝트매니저, 참여인력 모달창 닫기
function PJHR_CLOSE_MODAL(){
   $(".modal_PJHR_name").css('display', "none");
}


</script>

<!-- OpenWindow & 참여업체 조회 -->
<script src="/resource/js/common.js" defer="defer"></script>