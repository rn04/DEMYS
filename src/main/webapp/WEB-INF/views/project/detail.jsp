<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<link rel="stylesheet" href="/resource/css/project/detail.css" />
<!-- 프로젝트정보/거래처 등록 모달창.css -->
<link rel="stylesheet" href="/resource/css/project/contacts_regist_modal.css" />
<link rel="stylesheet" href="/resource/css/project/contacts_modal.css" />

<!-- kendo -->
<script src="//kendo.cdn.telerik.com/2015.3.930/js/jquery.min.js"></script>
<script src="//kendo.cdn.telerik.com/2015.3.930/js/jszip.min.js"></script>
<script src="//kendo.cdn.telerik.com/2015.3.930/js/kendo.all.min.js"></script>
<link rel="stylesheet" href="//kendo.cdn.telerik.com/2015.3.930/styles/kendo.common.min.css" />
<link rel="stylesheet" href="//kendo.cdn.telerik.com/2015.3.930/styles/kendo.metro.min.css" />
<!-- kendo -->


<div class="p-body-header">
           <div class="p-main-title">
              <div>
                 <c:choose>
                  <c:when test="${projects.PJ_IMP eq 3}">
                     <i class="fa-solid fa-flag ml-6" style="color:#D9001B;"></i>
                  </c:when>
                  <c:when test="${projects.PJ_IMP eq 2}">
                     <i class="fa-solid fa-flag ml-6" style="color:#F59A23;"></i>
                  </c:when>
                  <c:otherwise>
                     <i class="fa-solid fa-flag ml-6" style="color:#FFFF00;"></i>
                  </c:otherwise>
               </c:choose>
                  <span class="p-main-title-sty">${projects.PJ_NAME }</span>
              </div>
               <div class="p-main-reg-date">
                     <span >▶ 등록일 : <fmt:formatDate value="${projects.PJ_REGDATE }" pattern="yyyy-MM-dd"/></span>
               </div>
           </div>
           
            <div class="p-body-header-1">
               <div style="display: flex;">
                  <div class="header-1-menu"><a onclick="PJ_IMP_go();" href="#">프로젝트</a></div> |
              <c:if test="${member.MEMBER_AUTHORITY == 2}">
                <div class="header-1-menu"><a onclick="UNITWORK_gogo()" href="#">단위업무</a></div> |
              </c:if>
              <c:if test="${member.MEMBER_AUTHORITY == 3}">
                <div class="header-1-menu"><a onclick="UNITWORK_go()" href="#">단위업무</a></div> |
              </c:if>
                  <div class="header-1-menu"><a onclick="ISSUE_go()" style="cursor:pointer;">이슈관리</a></div> |
                  <div class="header-1-menu"><a onclick="BUDGET_go();" style="cursor:pointer;">예산수립</a></div> |
                  <div class="header-1-menu"><a onclick="MEETINGBOOK_go();" style="cursor:pointer;">회의록</a></div> |
                  <div class="header-1-menu"><a onclick="PRODUCT_TL_go();" style="cursor:pointer;">산출물관리 &nbsp;</a></div>
               </div>
            </div>
      </div> 
      <!-- project작업공간 -->
      <div class=" p-main-body" id="p-main-bodys">
            <div class="p-body-cont">
               <div class="header-2-menu0">
                  <div class="p-body-header-2">
                     <div style="display:flex;margin-top:5px;height:25px;">
                        <input type="hidden" name="PJ_NUM" value="${projects.PJ_NUM}" />
                        <input type="hidden" name="CT_PK" value="${projects.CT_NUM }" />
                        |<div class="header-2-menu" onclick="PJ_IMP_go();"><a href="#">프로젝트 정보</a></div> |
                        <div class="header-2-menu" onclick="pjhrList_go();"><a href="#">참여인력</a></div> |
                        <div class="header-2-menu"><a onclick="PJ_Require_go();" href="#">요구사항 관리</a></div> |
                     </div>
                  </div>
               </div>
               
               
               <!-- 프로젝트정보 -->
               <div id="project_BODY" >
                  <div class="p-info-detail">
                     <div class="p-info-detail-title">
                        <span style="font-weight:bold;">프로젝트 정보</span>
                        <c:if test="${member.MEMBER_AUTHORITY == 3 }">
                           <button id="P_modify" style="display:block;" class="p-info-detail-bt" onclick="P_MODIFY();">수&nbsp;&nbsp;정</button>
                           </c:if>
                        <div id=Pj_modify style="width: 215px; display:none;justify-content: space-between;">
                           <button id="Pj_modify_go"  class="p-info-detail-bt" onclick="PJ_MODIFY_go();">수&nbsp;&nbsp;정</button>
                           <button id="Pj_modify_fail" class="p-info-detail-bt" onclick="PJ_MODIFY_fail();">취&nbsp;&nbsp;소</button>
                        </div>
                     </div>
                     <div class="p-detail-table">
                        <table border="1" id="table_Pj_Detail">
                           <tr>
                              <td>프로젝트명</td>
                              <td class="td-pj-name">${projects.PJ_NAME }</td>
                           </tr>
                           <tr>
                              <td>프로젝트기간</td>
                              <td class="td-pj-date">
                                 <span class="td-pj-start"><fmt:formatDate value="${projects.PJ_STARTDATE }" pattern="yyyy-MM-dd"/></span>
                                 <span class="td-pj-end">~ <fmt:formatDate value="${projects.PJ_ENDDATE }" pattern="yyyy-MM-dd"/></span>
                              </td>
                           </tr>
                           <tr >
                              <td>예상 매출액</td>
                              <td class="td-pj-price">${projects.PJ_PRICE }</td>
                           </tr>
                           <tr>
                              <td>업체명</td>
                              <td class="td-ct-name">${projects.CT_NAME }</td>
                           </tr>
                           <tr>
                              <td>프로젝트 리더</td>
                              <td class="td-m-name">${projects.MEMBER_NAME }</td>
                           </tr>
                           <tr class="td-pj-type">
                              <td>프로젝트 구분</td>
                              <c:if test="${projects.PJ_TYPE eq 1}">
                                 <td>내부 프로젝트</td>
                              </c:if>
                              <c:if test="${projects.PJ_TYPE eq 2}">
                                 <td>외부 프로젝트</td>
                              </c:if>
                           </tr>
                           <tr>
                              <td>프로젝트 내용</td>
                              <td class="td-pj-content">${projects.PJ_CONTENT }</td>
                           </tr>
                           <tr>
                              <td>프로젝트 사업구분</td>
                              <td class="td-pj-field">${projects.PJ_FIELD }</td>
                           </tr>
                           <tr>
                              <td>깃 주소</td>
                              <td class="td-pj-git">${projects.PJ_GIT }</td>
                           </tr>
                        </table>
                        <!-- MEMBER_NUM, CONTACTS_NUM  -->
                        <input id="c_numbers" type="hidden" name="CT_NUM_PJ" value=""/>
                        <input id="m_numbers" type="hidden" name="MEMBER_NUM_PJ" value=""/>
                     </div>
                  </div>
                  <!-- 프로젝트정보 끝나는 태그 -->
                  
                  <!-- 프로젝트정보안에 거래처 화면 -->
                  <input type="hidden" name="CT_TYPE" value="2" />
                  <div id="pjctList_load">
                     <div class="p-info-cts-title">
                        <div>
                           <span style="font-weight:bold;">총 거래처</span>
                           <span style="font-weight:bold;color:blue;">${pjctListCount }</span>
                        </div>
                        <div>
                           <button id="modal_opne_btn_Cts_1" class="p-info-detail-bt" onclick="ct_Regi();">등&nbsp;&nbsp;록</button>
                        </div>
                     </div>
                     <div class="p-cts-list">
                        <table>
                           <thead>
                           <tr>
                              <th>No.</th>
                              <th>거래처명</th>
                              <th>대표 전화번호</th>
                              <th>대표 팩스번호</th>
                              <th>대표 주소</th>
                              <th>거래처 담당자</th>
                              <th></th>
                           </tr>
                           </thead>
                           <tbody id="pjct_list" style="height: 40px;overflow-y:auto;overflow-x:hidden;">
                           <c:forEach var="pjctList" items="${pjctList }" varStatus="status">
                           <input type="hidden" value="${pjctList.PJCT_NUM }" name="PJCT_NUM"/>   
                        <tr id="remove_row_${status.index}">
                            <td>${status.index+1 }</td>
                            <td>${pjctList.CT_NAME }</td>
                            <td>${pjctList.CT_TEL }</td>
                            <td>${pjctList.CT_FAX }</td>
                            <td>${pjctList.CT_ADDR }</td>
                            <td>${pjctList.CT_MANAGER }</td>
                            <td>
                               <button id="remov_Btt" class="remove-btt" data-row-id="${status.index}" onclick="PJCT_REMOVE_go('${pjctList.PJCT_NUM}');">
                               <i class="fa-solid fa-circle-xmark" style="color:red;font-size:23px;padding-right:5px;"></i>
                               </button>
                            </td>
                        </tr>
                           </c:forEach>
                           </tbody>
                        </table>
                        <!-- <div id="addPjctList"></div> -->
                     </div>
                  </div>
                  <!-- 거래처화면 끝나는 태그 -->
               </div>
            </div>
         <!-- p-main-body끝나는 태그 -->
      </div>   
   <!-- project/phead.jsp (t-body) 화면 끝나는 태그 -->
<!-- ----------------------------리스트 이동-------------------------------------- -->
<script>
var header1MenuItems = document.querySelectorAll('.header-1-menu');

header1MenuItems.forEach(function (menuItem) {
   menuItem.addEventListener('click', function () {
      header1MenuItems.forEach(function (item) {
         item.classList.remove('bold-menu');
      });
      menuItem.classList.add('bold-menu');
   });
});

var header2MenuItems = document.querySelectorAll('.header-2-menu');

header2MenuItems.forEach(function (menuItem) {
   menuItem.addEventListener('click', function () {
      header2MenuItems.forEach(function (item) {
         item.classList.remove('bold-menu');
      });
      menuItem.classList.add('bold-menu');
   });
});


   var PJ_NUM = $('input[name="PJ_NUM"]').val();
//프로젝트 정보로 이동
function PJ_IMP_go(){
   pj_detail(PJ_NUM);
}
//참여인력리스트로 이동
function pjhrList_go(){
   //alert(PJ_NUM);
   console.log(PJ_NUM);
   $.ajax({
      url: "PjNumhrList?PJ_NUM="+PJ_NUM,
      type: "get",
      dataType: "text",
      success: function(data){
         //alert("참여인력리스트");
         $("#project_BODY").html(data);
         MemberPictureThumb('<%=request.getContextPath()%>');
      },
      error: function (xhr, status, error) {
            // AJAX 요청이 실패했을 때 실행할 코드
            console.log(error);
        }
   });
}
// 요구사항관리
function PJ_Require_go(){
   $.ajax({
      url:"require_go?PJ_NUM="+PJ_NUM,
      type:"get",
      dataType:"text",
      success:function(data){
         $("#project_BODY").html(data);
      },
      error: function (xhr, status, error) {
            // AJAX 요청이 실패했을 때 실행할 코드
            console.log(error);
        }
   });
}
//단위업무(팀장)
function UNITWORK_go(){
   $.ajax({
      url:"unitwork_go?PJ_NUM="+PJ_NUM,
      type:"get",
      dataType:"text",
      success:function(data){
         $("#p-main-bodys").html(data);
      },
      error: function (xhr, status, error) {
            // AJAX 요청이 실패했을 때 실행할 코드
            console.log(error);
        }
   });
}

// 단위업무(팀원)
function UNITWORK_gogo(){
   $.ajax({
      url:"unitwork_gogo?PJ_NUM="+PJ_NUM,
      type:"get",
      dataType:"text",
      success:function(data){
         $("#p-main-bodys").html(data);
      },
      error: function (xhr, status, error) {
            // AJAX 요청이 실패했을 때 실행할 코드
            console.log(error);
        }
   });
}

//예산수립
function BUDGET_go(){
   $.ajax({
      url: "<%=request.getContextPath()%>/budget/budget_go?PJ_NUM=" + PJ_NUM,
      type:"get",
      dataType:"text",
      success:function(data){
         $("#p-main-bodys").html(data);
      },
      error: function (xhr, status, error) {
            console.log(error);
        }
   });
}

//회의록으로 이동
function MEETINGBOOK_go(){
   $.ajax({
      url:"meetingbook_go?PJ_NUM="+PJ_NUM,
      type:"get",
      dataType:"text",
      success:function(data){
         $("#p-main-bodys").html(data);
      },
      error: function (xhr, status, error) {
            // AJAX 요청이 실패했을 때 실행할 코드
            console.log(error);
        }
   });
}

//산출물관리로 이동
function PRODUCT_go(){
   $.ajax({
      url:"product_go?PJ_NUM="+PJ_NUM,
      type:"get",
      dataType:"text",
      success:function(data){
         $(".p-body-cont").html(data);
      },
      error: function (xhr, status, error) {
            // AJAX 요청이 실패했을 때 실행할 코드
            console.log(error);
        }
   });
}

//팀장 산출물관리로 이동
function PRODUCT_TL_go(){
   var gubunAu = '${member.MEMBER_AUTHORITY}';
   if(gubunAu != 3){
      PRODUCT_go();
      return;
   }
   $.ajax({
      url:"product_TL_go?PJ_NUM="+PJ_NUM,
      type:"get",
      dataType:"text",
      success:function(data){
         $(".p-body-cont").html(data);
      },
      error: function (xhr, status, error) {
            // AJAX 요청이 실패했을 때 실행할 코드
            console.log(error);
        }
   });
}

var ISSUE_NUM=${ISSUE_NUM};
if(ISSUE_NUM!=null&&ISSUE_NUM!=0){
   ISSUE_go_fromDashBoard(ISSUE_NUM);
}

function ISSUE_go_fromDashBoard(ISSUE_NUM){
      $.ajax({
            url:"issue_go?PJ_NUM="+PJ_NUM+"&ISSUE_NUM="+ISSUE_NUM,
            type:"get",
            dataType:"text",
            success:function(data){
               $(".p-main-body").html(data);
            },
            error: function (xhr, status, error) {
                  // AJAX 요청이 실패했을 때 실행할 코드
                  console.log(error);
            }
      });
}

//이슈관리로 이동
function ISSUE_go(){
   $.ajax({
      url:"issue_go?PJ_NUM="+PJ_NUM,
      type:"get",
      dataType:"text",
      success:function(data){
         $(".p-main-body").html(data);
      MemberPictureThumb('<%=request.getContextPath()%>');
      },
      error: function (xhr, status, error) {
            // AJAX 요청이 실패했을 때 실행할 코드
            console.log(error);
        }
   });
}

</script>   

<!-- ----------------------------리스트 이동-------------------------------------- -->
   
   

<!-- ------------------------------------------------------------------------------------------------------------------------------- -->
<!-- 모달창-거래처 조회 등록  -->
<div id="modal_Cts_1">

      <div class="modal_content_1">
            <div class="flex" style="background-color: #153A66;">
                  <div class="navbar text-neutral-content modal-head">
                        <div class="text-white modal-head-0">&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
                  </div>
            </div>

         <div class="cts-view">
            <div class="cts-title">
               <span>거래처 등록</span>
            </div>
            <div class="cts-title-sub">* 거래처정보를 입력하세요.</div>
            <div class="cts-modal-search_1">
               <div class="cts-title-sub">거래처명</div>
               <input id="ct-serch-name" class="cts-name" placeholder="거래처명을 조회하세요." autocomplete="off" disabled></input>
            
                     <button id="modal_opne_btn1" class="p-regi-modal-bt" onclick="searchCONTACTS();">검색</button>
            </div>
            <div class="p-regi-modal-bts">
                     <button class="p-regi-modal-bt" onclick="PJCT_REGIST();">등록</button>
                     <button id="modal_close_btn_Cts_1" class="p-regi-modal-bt">취소</button>
               </div>
               <!-- CONTACTS_NUM  -->
               <input id="c_number" type="hidden" name="CT_NUM" value=""/>
         </div>
      </div>

      <div class="modal_layer"></div>
</div>   

<!-- 거래처 모달창-업체명  -->
<div id="modal_1" class="modal_contacts_name">

      <div class="modal_content">
            <div class="flex" style="background-color: #153A66;">
                  <div class="navbar text-neutral-content modal-head">
                        <div class="text-white modal-head-0">&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
                  </div>
            </div>

         <div class="cts-view">
            <div class="cts-title">
               <span>거래처목록</span>
            </div>
            <div class="cts-title-sub">* 등록된 거래처를 조회합니다.</div>
            <div class="p-modal-serach select_contacts">
               <select class="select select-bordered p-cts-select " name="searchType" id="searchType">
                    <option disabled selected>선택 </option>
                    <option value="cn" ${searchType=='cn' ? "selected":"" }>거래처명</option>
                    <option value="cc" ${searchType=='cc' ? "selected":"" }>대표자명</option>
               </select>
               <div class="p-modal-searchbar contacts-modal-searchbar">
                  <input name="keyword" type="text" placeholder="검색어를 입력하세요." autocomplete="off" class="input input-bordered p-modal-searchbar-input" value="${keyword }"/>
                  <i onclick="contacts_list_go();" class="fa-solid fa-magnifying-glass" style="font-size:30px;width:15%;display:flex;align-items: center;justify-content: space-around;"></i>
               </div>
            </div>
            <div class="cts-serch-list">
               <table id="contactsList_view" border="1">
                  <!-- contactsList나오는곳 -->
               </table>
            </div>
            <div class="p-regi-modal-bts add_contacts_modal">
                     <button class="p-regi-modal-bt" onclick="CONTACTS_S_REGI();">선택</button>
                     <button id="modal_close_btn1" class="p-regi-modal-bt" onclick="CLOSE_MODAL_CT();">취소</button>
                     <!-- CONTACTS NUM, CEO값 받을 공간 -->
                     <div class="add_contacts_id" ></div>
                     
               </div>
         </div>
      </div>

      <div class="modal_layer"></div>
</div>
<script>
function searchCONTACTS(){
   $(".modal_contacts_name").css('display',"block");
    $.ajax({
      url: "Search_Modal",
      type: "get",
      dataType:"json",
      success: function(data){
         var contactsList = data.contactsList;
         var table = $('#contactsList_view');
         table.empty();
         
         for(var i=0 ; i<contactsList.length; i++ ){
            var contacts = contactsList[i];
            if (contacts.ct_TYPE == 2){
               var row = '<tr data-contacts-num ="'+ contacts.ct_NUM +'"> <td>' + contacts.ct_NAME + '</td><td>' + contacts.ct_CEO + '</td></tr>';
               table.append(row);
            }
         }
         table.find('tr').click(function(){
            var CT_NUM = $(this).data('contacts-num');
            var CT_NAME = $(this).find('td:first-child').text();
            var CT_CEO = $(this).find('td:last-child').text();
            
            var input_cnum = '<input id="c_num" type="hidden" value="'+CT_NUM +'" />';
            var input_cname = '<input id="c_name" type="hidden" value="'+CT_NAME +'" />';

             var addContactsId = $('.add_contacts_id');

            if (addContactsId.length) {
               addContactsId.empty();
            }
            addContactsId.append(input_cnum);
            addContactsId.append(input_cname);
            
            table.find('tr>td:last-child').each(function(){
               if($(this).text() == CT_CEO){
                  $(this).parent('tr').css('background-color', "#e7e7e7e7");
               }else{
                  $(this).parent('tr').css('background-color', "#ffffff");
               }
            });
         });
      }
   });
}


// 업체Contacts조회
function contacts_list_go(){
   
   //alert("리스트 돋보기");
   var searchType = $('.select_contacts>select[name="searchType"]').val();
   var keyword = $('div.contacts-modal-searchbar>input[name="keyword"]').val();
   
   $.ajax({
      
      url: "regist_searchCONTACTS",
      type: "get",
      dataType:"json",
      data:{
         "searchType":searchType,
         "keyword": keyword
      },
      success: function(data){
         var contactsList = data.contactsList;
         var table = $('#contactsList_view');
         table.empty();
         
         for(var i=0 ; i<contactsList.length; i++ ){
            var contacts = contactsList[i];
            if (contacts.ct_TYPE == 2){
               var row = '<tr data-contacts-num ="'+ contacts.ct_NUM +'"> <td>' + contacts.ct_NAME + '</td><td>' + contacts.ct_CEO + '</td></tr>';
               table.append(row);
            }
         }
         table.find('tr').click(function(){
            var CT_NUM = $(this).data('contacts-num');
            var CT_NAME = $(this).find('td:first-child').text();
            var CT_CEO = $(this).find('td:last-child').text();
            
            var input_cnum = '<input id="c_num" type="hidden" value="'+CT_NUM +'" />';
            var input_cname = '<input id="c_name" type="hidden" value="'+CT_NAME +'" />';

             var addContactsId = $('.add_contacts_id');

            if (addContactsId.length) {
               addContactsId.empty();
            }
            addContactsId.append(input_cnum);
            addContactsId.append(input_cname);
            
            table.find('tr>td:last-child').each(function(){
               if($(this).text() == CT_CEO){
                  $(this).parent('tr').css('background-color', "#e7e7e7e7");
               }else{
                  $(this).parent('tr').css('background-color', "#ffffff");
               }
            });
         });
      }
   });
   
}
//조회화면에서 등록버튼(선택)
function CONTACTS_S_REGI(){   
   var CT_NAME = $('#c_name').val();
   //alert(CT_NAME);
   $('#ct-serch-name').val(CT_NAME);
   $(".modal_contacts_name").css('display', "none");
}
// 거래처등록모달_찾은후 등록하기버튼 (PJ_NUM값 필요, Project:현제 프로젝트에 거래처만 넣어야함)
// 등록시 필요한 값: PJCT_NUM(시퀀스), CT_TYPE=2, PJ_NUM, CT_NUM
function PJCT_REGIST(){
   var CT_NUM = $('#c_num').val();
   var PJ_NUM = $('input[name="PJ_NUM"]').val();
   var CT_TYPE = $('input[name="CT_TYPE"]').val();
   var data = {
         "ct_NUM":parseInt(CT_NUM),
         "pj_NUM":parseInt(PJ_NUM),
         "ct_TYPE":parseInt(CT_TYPE)
   }
   $.ajax({
         url:"<%=request.getContextPath()%>/project/contacts_Regist",
         type:"post",
         dataType:"json",
         contentType:"application/json",
         data:JSON.stringify(data),
         success: function(){
           alert("진짜 등록완료인데..");
         },
       error:function(){
          alert("거래처등록이 완료되었습니다.");
          $('#ct-serch-name').val('');
          $('#modal_Cts_1').css('display', "none");
          pj_detail(PJ_NUM);
       }
      });
} 
// 거래처삭제
function PJCT_REMOVE_go(PJCT_PK){
   /* var PJCT_NUM = PJCT_PK;
   
   console.log(PJCT_NUM); */
   var PJ_NUM = $('input[name="PJ_NUM"]').val();
   //var PJ_NUM = PJ_PK;
   //alert(PJ_NUM);
   var data = {'PJCT_NUM':parseInt(PJCT_PK) }
   $.ajax({
      url:"pjct_Remove",
      type:"post",
      data:data,
      success: function(){
         alert("삭제가 완료되었습니다.");
         pj_detail(PJ_NUM);
      },
      error:function(){
         alert("서버상에 오류로 삭제되지 못하였습니다.");
        }
   });

}
function CLOSE_MODAL_CT(){
   $(".modal_contacts_name").css('display', "none");
}

</script>
<!-- ------------------------------------------------------------------------------------------------------------------------------- -->

<!-- ------------------------- 모달창-프로젝트메니저 ------------------------- -->
  <div id="modal_2" class="modal_member_name">

    <div class="modal_content">
          <div class="flex" style="background-color: #153A66;">
                <div class="navbar text-neutral-content modal-head">
                      <div class="text-white modal-head-0">&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
                </div>
          </div>

      <div class="cts-view">
         <div class="cts-title">
            <span>프로젝트 리더</span>
         </div>
         <div class="cts-title-sub">* 프로젝트 리더를 선택하세요.</div>
         <div class="p-modal-serach select_member">
            <select class="select select-bordered p-cts-select select_member" name="searchType" id="searchType">
                 <option disabled selected>선택 </option>
                 <option value="mn" ${searchType=='mn' ? "selected":"" }>리더명</option>
                 <option value="md" ${searchType=='md' ? "selected":"" }>담당부서</option>
            </select>
            <div class="p-modal-searchbar key_member">
               <input name="keyword" type="text" placeholder="검색어를 입력하세요." autocomplete="off" class="input input-bordered p-modal-searchbar-input" value="${keyword }"/>
               <i onclick="member_list_go();" class="fa-solid fa-magnifying-glass" style="font-size:30px;width:15%;display:flex;align-items: center;justify-content: space-around;"></i>
            </div>
         </div>
         <div class="cts-serch-list">
            <table id="memberList_view" border="1">
               <!-- memberList나오는 위치 -->
            </table>
         </div>
         <div class="p-regi-modal-bts">
                  <button class="p-regi-modal-bt" onclick="javascript:MEMBER_S_REGI();">등록</button>
                  <button id="modal_close_btn2" class="p-regi-modal-bt" onclick="CLOSE_MODAL();">취소</button>
                  <!-- MEMBER NUM, NAME값 받을 공간 -->
                  <div class="add_member_id" ></div>
            </div>
      </div>
    </div>

    <div class="modal_layer"></div>
</div>

<script>

function ct_Regi(){
   $("#modal_Cts_1").css('display',"block");
}
document.getElementById("modal_close_btn_Cts_1").onclick = function() {
   document.getElementById("modal_Cts_1").style.display = "none";
}
</script>
<!-- ------------------------- 모달창-프로젝트메니저 ------------------------- -->


<!------------------------------ 협력업체-클라이언트 리스트 ------------------>
<!-- 모달창-업체명  -->
<div id="modal_1" class="modal_ctPJ_name">

      <div class="modal_content">
            <div class="flex" style="background-color: #153A66;">
                  <div class="navbar text-neutral-content modal-head">
                        <div class="text-white modal-head-0">&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
                  </div>
            </div>

         <div class="cts-view">
            <div class="cts-title">
               <span>업체명</span>
            </div>
            <div class="cts-title-sub">* 등록된 업체를 조회합니다.</div>
            <div class="p-modal-serach select_contacts">
               <select class="select select-bordered p-cts-select " name="searchType" id="searchType">
                    <option disabled selected>선택 </option>
                    <option value="cn" ${searchType=='cn' ? "selected":"" }>업체명</option>
                    <option value="cc" ${searchType=='cc' ? "selected":"" }>대표자명</option>
               </select>
               <div class="p-modal-searchbar contacts-modal-searchbar">
                  <input name="keyword" type="text" placeholder="검색어를 입력하세요." autocomplete="off" class="input input-bordered p-modal-searchbar-input" value="${keyword }"/>
                  <i onclick="ctPJ_list_go();" class="fa-solid fa-magnifying-glass" style="font-size:30px;width:15%;display:flex;align-items: center;justify-content: space-around;"></i>
               </div>
            </div>
            <div class="cts-serch-list">
               <table id="contactsList_view1" border="1">
                  <!-- contactsList나오는곳 -->
               </table>
            </div>
            <div class="p-regi-modal-bts add_contacts_modal">
                     <button class="p-regi-modal-bt" onclick="CONTACTSPJ_S_REGI();">등록</button>
                     <button id="modal_close_btn1" class="p-regi-modal-bt" onclick="CLOSE_MODAL_CTPJ();">취소</button>
                     <!-- CONTACTS NUM, CEO값 받을 공간 -->
                     <div class="add_contacts_id1" ></div>
               </div>
         </div>
      </div>

      <div class="modal_layer"></div>
</div>

<script>
function searchCONTACTSPJ_NAME(){
   //alert("contacts");
   $(".modal_ctPJ_name").css('display',"block");
    $.ajax({
      url: "Search_Modal",
      type: "get",
      dataType:"json",
      success: function(data){
         var contactsList = data.contactsList;
         var table = $('#contactsList_view1');
         table.empty();
         console.log(data);
         for(var i=0 ; i<contactsList.length; i++ ){
            var contacts = contactsList[i];
            var row = '<tr data-contacts1-num ="'+ contacts.ct_NUM +'"> <td>' + contacts.ct_NAME + '</td><td>' + contacts.ct_CEO + '</td></tr>';
            table.append(row);
         }
         table.find('tr').click(function(){
            var CT_NUM = $(this).data('contacts1-num');
            var CT_NAME = $(this).find('td:first-child').text();
            var CT_CEO = $(this).find('td:last-child').text();
            
            var input_cnum = '<input id="c_nums" type="hidden" value="'+CT_NUM +'" />';
            var input_cname = '<input id="c_names" type="hidden" value="'+CT_NAME +'" />';
            var input_cceo = '<input id="c_ceos" type="hidden" value="'+CT_CEO+'" />';

            
             var addContactsId = $('.add_contacts_id1');

            if (addContactsId.length) {
               addContactsId.empty();
            }
            addContactsId.append(input_cnum);
            addContactsId.append(input_cname);
            addContactsId.append(input_cceo);
            
            table.find('tr>td:last-child').each(function(){
               if($(this).text() == CT_CEO){
                  $(this).parent('tr').css('background-color', "#e7e7e7e7");
               }else{
                  $(this).parent('tr').css('background-color', "#ffffff");
               }
            });
         });
      }
   });
}

// 클라이언트 업체Contacts조회
function ctPJ_list_go(){
   
   //alert("리스트 돋보기");
   var searchType = $('.select_contacts>select[name="searchType"]').val();
   var keyword = $('div.contacts-modal-searchbar>input[name="keyword"]').val();
   //console.log(searchType);
   //console.log(keyword);
   $.ajax({
      
      url: "regist_searchCONTACTS",
      type: "get",
      dataType:"json",
      data:{
         "searchType":searchType,
         "keyword": keyword
      },
      success: function(data){
         var contactsList = data.contactsList;
         var table = $('#contactsList_view1');
         table.empty();
         
         for(var i=0 ; i<contactsList.length; i++ ){
            var contacts = contactsList[i];
            var row = '<tr data-contacts1-num ="'+ contacts.ct_NUM +'"> <td>' + contacts.ct_NAME + '</td><td>' + contacts.ct_CEO + '</td></tr>';
            table.append(row);
         }
         table.find('tr').click(function(){
            var CT_NUM = $(this).data('contacts1-num');
            var CT_NAME = $(this).find('td:first-child').text();
            var CT_CEO = $(this).find('td:last-child').text();
            
            var input_cnum = '<input id="c_nums" type="hidden" value="'+CT_NUM +'" />';
            var input_cname = '<input id="c_names" type="hidden" value="'+CT_NAME +'" />';
            var input_cceo = '<input id="c_ceos" type="hidden" value="'+CT_CEO+'" />';

             var addContactsId = $('.add_contacts_id1');

            if (addContactsId.length) {
               addContactsId.empty();
            }
            addContactsId.append(input_cnum);
            addContactsId.append(input_cname);
            addContactsId.append(input_cceo);
            
            table.find('tr>td:last-child').each(function(){
               if($(this).text() == CT_CEO){
                  $(this).parent('tr').css('background-color', "#e7e7e7e7");
               }else{
                  $(this).parent('tr').css('background-color', "#ffffff");
               }
            });
         });
      }
   });
   
}

function CONTACTSPJ_S_REGI(){   
   var CT_NUM = $('#c_nums').val();
   $('#c_numbers').val(CT_NUM);
   var CT_NAME = $('#c_names').val();
   $('#c_names').val(CT_NAME);
   var CT_CEO = $('#c_ceos').val();
   $('#c_ceos').val(CT_CEO);
   
   $(".modal_ctPJ_name").css('display', "none");
}

function CLOSE_MODAL_CTPJ(){
   $(".modal_ctPJ_name").css('display', "none");
}

</script>

<!-- 끝협력업체-클라이언트 리스트 -->
<!------------------------------ 협력업체-클라이언트 리스트 ------------------>
<!-- ---------------------------- 프로젝트 수정 화면 -------------------------------------- -->
<script>
// 프로젝트정보 수정
function P_MODIFY(){
   $('#P_modify').css('display','none');
   $('#Pj_modify').css('display', 'block').css('display', 'flex');
   
   
   var PJ_NAME = $(".td-pj-name").text();
   var PJ_STARTDATE= $(".td-pj-start").text();
   var PJ_ENDDATE= $(".td-pj-end").text();
   
   var PJ_PRICE= $(".td-pj-price").text();
   var PJ_CONTENT=$(".td-pj-content").text();
   var MEMBER_NAME= $(".td-m-name").text();
   var CT_NAME=$(".td-ct-name").text();
   var PJ_GIT=$(".td-pj-git").text();
   
   var PJ_TYPE= $(".td-pj-type>td:last-child").text();
   var PJ_FIELD= $(".td-pj-field").text();
   
   
   var table_modify = $('#table_Pj_Detail tr td:last-child');
   table_modify.empty();
   
   var input_pjName = '<input name="PJ_NAME" autocomplete="off" class="modify_css1" type="text" value="'+PJ_NAME+'" />';
   $(".td-pj-name").append(input_pjName);
   
    //var input_pjStart = '<input name="PJ_STARTDATE" class="" type="date"/>';
   //var input_pjEnd = '<input name="PJ_ENDDATE" class="" type="date" />';
   
   var input_pjPrice = '<input name="PJ_PRICE" class="modify_css0" type="text" value="'+PJ_PRICE+'" />';
   $(".td-pj-price").append(input_pjPrice);
   
   
   var input_mName = '<input name="MEMBER_NAME" class="modify_css0 sh-btts" id="m_names" disabled type="text" value="'+MEMBER_NAME+'" />';
   $(".td-m-name").append(input_mName);
   $(".td-m-name").append('<button class="p-info-sh-bt" onclick="searchMEMBER_NAME();">검색</button>');
   
   
   
   
   
   var input_ctName = '<input name="CT_NAME" class="modify_css0 sh-btts" id="c_names" disabled type="value" value="'+CT_NAME+'" />'
   $(".td-ct-name").append(input_ctName);
   $(".td-ct-name").append('<button class="p-info-sh-bt" onclick="searchCONTACTSPJ_NAME();">검색</button>');
   
   
   
   
   
   var input_pjContent = '<input name="PJ_CONTENT" class="modify_css1" type="text" value="'+PJ_CONTENT+'" />';
   $(".td-pj-content").append(input_pjContent);
   
   
   var input_pjGit = '<input name="PJ_GIT" class="modify_css1" autocomplete="off" type="text" value="'+PJ_GIT+'" />';
   $(".td-pj-git").append(input_pjGit);
   

   $(".td-pj-date").append(PJ_STARTDATE);
   $(".td-pj-date").append(" ~ ");
   $(".td-pj-date").append(PJ_ENDDATE);
   $(".td-pj-field").append(PJ_FIELD);
   $(".td-pj-type>td:last-child").append(PJ_TYPE);
}

function PJ_MODIFY_fail(){
	   var PJ_NUM = parseInt($('input[name="PJ_NUM"]').val());
	   pj_detail(PJ_NUM);
	}


function PJ_MODIFY_go(){
   var MEMBER_NUM = parseInt($('#m_num').val());
   var CT_NUM = parseInt($('input[name="CT_PK"]').val());
   var PJ_NUM = parseInt($('input[name="PJ_NUM"]').val());
   var PJ_NAME = $('input[name="PJ_NAME"]').val();
   var PJ_STARTDATE = $('input[name="PJ_STARTDATE"]').val();
   var PJ_ENDDATE = $('input[name="PJ_ENDDATE"]').val();
   var PJ_PRICE = parseInt($('input[name="PJ_PRICE"]').val());
   var PJ_CONTENT = $('input[name="PJ_CONTENT"]').val();
   var PJ_GIT = $('input[name="PJ_GIT"]').val();
   //var PJ_TYPE = $(".td-pj-type>td:last-child").val();
   var data = {
         "pj_NUM":PJ_NUM,
         "pj_NAME":PJ_NAME,
         "string_STARTDATE":PJ_STARTDATE,
         "string_ENDDATE":PJ_ENDDATE,
         "pj_PRICE":PJ_PRICE,
         "pj_CONTENT":PJ_CONTENT,
         "member_NUM":MEMBER_NUM,
         "ct_NUM":CT_NUM,
         "pj_GIT":PJ_GIT
         //"pj_TYPE":parseInt(PJ_TYPE)
   }
   console.log(data);
   $.ajax({
      url:"PjModifyDo",
      type:"post",
      data:JSON.stringify(data),
      contentType:"application/json",
      success:function(PJ_NUM){
         alert("수정되었습니다.");
         pj_detail(PJ_NUM);
      },
      error:function(){
           alert("잘못된 입력입니다. 다시 입력하세요.");
       }
   });
   
}

function showList(PJ_NUM,PRODUCT_STEP,searchType,keyword){
   
   var data={
         "pj_NUM":PJ_NUM,
         "product_STEP":PRODUCT_STEP,
         "searchType":searchType,
         "keyword":keyword
   }

   $.ajax({
      url:"<%=request.getContextPath()%>/project/productList",
      type:"post",
      data:JSON.stringify(data),      
      contentType:'application/json',
      success:function(data){
         printData(data,$('#PD-LIST'),$('#product-list-template'));
         $('#gubunValue').val(PRODUCT_STEP);
         
      }
   });
}
</script>  
<!-- ---------------------------- 프로젝트 수정 화면 -------------------------------------- -->
