<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko" class="light" data-theme="light">
<head>
<meta charset="UTF-8">
<title>DEMYS</title>
<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>    

<!-- 테일윈드 불러오기 -->
<!-- 노말라이즈, 라이브러리까지 한번에 해결 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.7/tailwind.min.css" />

<!-- 데이지 UI -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@2.51.5/dist/full.css" rel="stylesheet" type="text/css" />

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />

<!-- 사이트 공통 CSS -->
<link rel="stylesheet" href="/resource/common.css" />
<!-- 사이트 공통 JS -->
<script src="/resource/common.js" defer="defer"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
/* p-main-body 고정 수정X, border만 씌워서 작업!! */
.p-main-body {
   margin-top: 5px;
   width: 100%;
   height: calc(930px - 65px - 63px);
   padding: 5px;
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

#modal2 {
   display: none;
   position: relative;
   width: 100%;
   height: 100%;
   z-index: 1;
}

#modal2 h2 {
   margin: 0;
}

#modal2 .modal_content {
   width: 800px;
   height: 500px;
   top: 50%;
   background: #fff;
   border: 2px solid #016fa0;
   left: 50%;
   transform: translate(-50%, -50%);
   position: fixed;
}

#modal2 .modal_layer {
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
   clip: rect(0, 0, 0, 0);
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
   width: 130px;
   min-height: 1rem;
   border: none;
   color: #ffffff;
   background-color: #153A66;
   height: 30px;
}

.btn-se:hover {
   background-color: #016FA0;
}

.header-3-menu {
   width: 150px;
   justify-content: space-around;
}

.card-shadow:hover {
   border: 2px solid #AAAAAA;
   border-radius: 10px;
}

@charset "UTF-8";

#modal_1, #modal_2 {
   display: none;
   position: relative;
   width: 100%;
   height: 100%;
   z-index: 1;
}

#modal_1 h2, #modal_2 h2 {
   margin: 0;
}
/* 모달창 크기 조절 */
#modal_1 .modal_content, #modal_2 .modal_content {
   width: 600px;
   height: 500px;
   top: 50%;
   background: #fff;
   border: 2px solid #666;
   left: 50%;
   transform: translate(-50%, -50%);
   position: fixed;
}
/* 모달창 뒷 배경 */
#modal_1 .modal_layer, #modal_2 .modal_layer {
   position: fixed;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   background: rgba(0, 0, 0, 0.5);
   z-index: -1;
}
/* 모달헤더 */
.modal-head {
   width: 100%;
   padding: 0px;
   min-height: 1rem;
   height: 50px;
}

.modal-head-0 {
   font-weight: bold;
   font-size: 1rem;
   margin-right: auto;
}
/* 모달 화면구현 */
.cts-title {
   border-bottom: 4px solid #016FA0;
   width: 100%;
   font-weight: bold;
   font-size: 22px;
   padding: 5px;
}
/* .cts-title-sub{
   margin:5px 0;
   color:#333333;
   font-weight:bold;
} */
.p-modal-serach {
   display: flex;
   flex-direction: row;
   width: 100%;
   align-items: center;
   margin: 5px 0;
   border: 1px solid #aaaaaa;
   padding: 5px;
}

.cts-serch-list {
   width: 100%;
   height: 240px;
   background-color: #e7e7e7;
   margin-bottom: 10px;
   padding: 5px;
   overflow: auto;
   overflow-x: hidden;
}

.cts-serch-list>table {
   width: 100%;
}

.cts-serch-list tr {
   height: 40px;
   margin: 5px;
   padding: 5px;
   background-color: white;
   border: 1px solid #aaaaaa;
}

.cts-serch-list tr:hover {
   background-color: #e7e7e7e7;
}

.cts-serch-list tr>td:first-child {
   font-weight: bold;
   padding-left: 10px;
}

.cts-serch-list tr>td {
   padding-left: 30px;
}

.p-modal-searchbar {
   width: 100%;
   height: 100%;
   display: flex;
}

.p-modal-searchbar-input {
   width: 85%;
   height: 35px;
   min-height: 35px;
}

.p-cts-select {
   height: 30px;
   min-height: 30px;
   width: 22%;
   margin-right: 10px;
}
/* 모달 버튼 */
.p-regi-modal-bts {
   display: flex;
   justify-content: center;
}

.p-regi-modal-bt {
   font-size: 20px;
   width: 100px;
   height: 40px;
   background-color: #153A66;
   color: white;
   border-radius: 8px;
   margin: 0 5px;
}

.card-body2 {
   padding: var(--padding-card, 2rem);
   flex-direction: column;
   flex: auto;
   display: flex;
}

.modi-name {
   display: inline-block !important;
}
</style>

<link rel="stylesheet" href="/resource/css/project/list.css" />
<link rel="stylesheet" href="/resource/css/project/phead.css" />
<!-- 요구사항리스트.css -->
<link rel="stylesheet" href="/resource/css/require/list.css" />





<div class="modify_content" style="overflow: hidden;">
      <div class="flex card-body" style="padding-bottom: 0px;">
            <div class="navbar text-neutral-content"
                  style="width: 100%; padding: 0px; min-height: 1rem; height: 30px; border-bottom: 3px solid #016fa0;">
                  <div class="text-black mb-3" style="font-weight: bold; font-size: 1.5rem;">
                        이슈 수정
                        <input type="hidden" name="issuestatus" value="1" />
                        <%-- <input type="hidden" name="issueenddate" value="${issue.ISSUE_ENDDATE }" /> --%>
                        <input type="hidden" name="membernum" value="${member.MEMBER_NUM }" />
                        <%-- ${issue.MEMBER_NUM} --%>
                        <input type="hidden" name="pjnum" value="${issue.PJ_NUM }" />
                        <input type="hidden" name="issuenum" value="${issue.ISSUE_NUM }" />
                  </div>
            </div>
      </div>

      <div class="container flex flex-col card-body" style="padding-top: 10px; padding-bottom: 10px;max-width:100%;">
            <div class="flex" style="flex-direction:column;height:80%;">
                  <div style="display: flex;width:100%;">
               
                        <select class="w-24 h-8 text-center pr-2"
                              style="width: 20%; height: 49px; border: 1px solid #aaaaaa; border-right: 0px;" name="issueimp"
                              id="issue_imp">
                              <option value=0 selected>중요도</option>
                              <option value=3 ${issue.ISSUE_IMP eq '3' ? 'selected' : "" }>중&nbsp;&nbsp;요</option>
                              <option value=2 ${issue.ISSUE_IMP eq '2' ? 'selected' : "" }>보&nbsp;&nbsp;통</option>
                              <option value=1 ${issue.ISSUE_IMP eq '1' ? 'selected' : "" }>낮&nbsp;&nbsp;음</option>
                        </select>
                        
                        <input type="text" id="issue_title" autocomplete="off" value="${issue.ISSUE_TITLE }" name="issuetitle" placeholder="제목을 입력하세요."
                              class="input"
                              style="border: 1px solid #aaaaaa; border-radius: 0px; width:80%; height: 49px;">
            
                  </div>

                  <div class="" style="display:flex;width:100%;">
                        <div class="text-center " style="border: 1px solid #aaaaaa; border-radius: 0px; width:20%; line-height: 45px; height: 51px; border-right: 0">${member.MEMBER_NAME}</div>
                        <div class=" " style="width:80%;display:flex;align-items:center;border: 1px solid #aaaaaa;">
                              <input id='issue_regdate' value="${regDate }" type="date" name="issueregdate" style="width:50%; height: 49px; border:0;margin-right:10px;">
                              ~
                              <input id="issue_deadline " value="${deadLine }" type="date" name="issuedeadline" style="width: 50%; height: 49px;border:0;margin-left:10px;">
                        </div>
                  </div>
                  <!-- 내용 -->
                  <textarea class="textarea" name="issuecontent" id="issue_content" class="form-control"
                        style="height:280px; width: 100%; resize: none; border: 1px solid #aaaaaa; border-radius: 0px;"
                        placeholder="내용을 작성하세요.">${issue.ISSUE_CONTENT }</textarea>

                  <!-- 첨부파일 -->
                  <div class="filebox bs3-primary w-full" style="margin: 0 0">
                        <input class="upload-name" value="MTQ 시스템 테스트 이슈_20230601.zip" disabled="disabled" style="color: #aaa;">
                        <label for="ex_filename">
                              <i class="fa-solid fa-paperclip fa-flip-vertical text-2xl text-black mr-3 "></i>
                        </label>
                        <input type="file" id="ex_filename" class="upload-hidden">
                  </div>

                  <div class="filebox bs3-primary w-full" style="margin: 0 0">
                        <input class="upload-name" value="태그할 사람을 선택하세요." disabled="disabled" style="color: #aaa;" />
                        <label for="modal_opne_btn_issuetag">
                              <i class="fa-solid fa-tag text-2xl text-black mr-3" id="modal_opne_btn_issuetag"></i>
                        </label>
                  </div>
            </div>

            <div style="display: flex; justify-content: center;margin-top:20px;">
                  <button class="btn btn-se" onclick="modify_go();"
                        style="font-size: 20px; width: 100px; height: 40px; border-radius: 8px; margin-right: 10px;">저 장</button>
                  <button class="btn btn-se" onclick="window.close();"
                        style="font-size: 20px; width: 100px; height: 40px; border-radius: 8px;">취 소</button>
            </div>
      </div>




      <!-- 모달창-참여인력 조회화면 (프로젝드메니저등록모달창과 제목만 다름) -->
      <div id="modal2">

            <div class="modal_content" style="width: 500px; height: 430px;">
                  <div class="flex card-body" style="padding-bottom: 0px;">
                        <div class="navbar text-neutral-content"
                              style="width: 100%; padding: 0px; min-height: 1rem; height: 30px; border-bottom: 3px solid #016fa0;">
                              <div class="text-black mb-3" style="font-weight: bold; font-size: 1.5rem;">직원 조회</div>
                        </div>
                  </div>

                  <div class="card-body2">
                        <div style="margin-top: -25px; margin-bottom: 5px;">사원을 조회합니다.</div>


                        <div class="p-modal-serach flex items-center" style="background-color: #e7e7e7; margin: 0;">
                              <select class="select-bordered p-cts-select"
                                    style="border: 1px solid #aaa; margin: 0 auto; width: 400px; align-items: center;"
                                    onchange="showMember_Dep(this.value);">
                                    <option disabled selected>선 택</option>
                                    <option value="개발1팀">개발 1팀</option>
                                    <option value="개발2팀">개발 2팀</option>
                              </select>
                        </div>

                        <div class="cts-serch-list " style="height: 220px; padding: 0px;">
                              <table border="1" id="deplist">

                              </table>
                        </div>
                        <div class="p-regi-modal-bts">
                              <button class="p-regi-modal-bt" onclick="checkboxValue_go();">등 록</button>
                              <button id="modal_close_btn_issuetag" class="p-regi-modal-bt">취 소</button>
                        </div>
                  </div>
            </div>

            <div class="modal_layer"></div>
      </div>

      <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
      <script type="text/x-handlebars-template" id="member-dep-template">
{{#each .}}
        <tr style="border-top:0px;">
           <td><input type="checkbox" name="member_num" value="{{member_NUM}}">&nbsp;&nbsp;{{member_NAME}}</td>
        </tr>
{{/each }}

</script>


      <script>
function printData(productArr,target,templateObject){
   var template=Handlebars.compile(templateObject.html());
   var html = template(productArr);   
   
   target.append(html);
}



<%-- function showMember_Dep(MEMBER_DEP){
   $("#deplist").append('');
   var data={
         "MEMBER_DEP":MEMBER_DEP
   }
 
   $.ajax({
      url:"<%=request.getContextPath()%>/project/issue_memberDepList",
      type:"post",
      data:data,
      success:function(data){
         alert(data.MEMBER_NAME);
         printData(data,$('#deplist'),$('#member-dep-template'));
         
      }
   });
} --%>

function showMember_Dep(MEMBER_DEP){
 
   $.ajax({
      url:"<%=request.getContextPath()%>/project/issue_memberDepList?MEMBER_DEP="+MEMBER_DEP,
      type:"get",
      success:function(data){
         console.log(data);
         let template = Handlebars.compile($("#member-dep-template").html());
         let html = template(data);
         $('#deplist tr').remove();
         $('#deplist').append(html);
         
      }
   });
}
function checkboxValue_go(){
var arValue = [];
$("input[name=member_num]:checked").each(function(){
   arValue.push($(this).val());
});
console.log("체크된 값 total : " + arValue);
}





</script>




      <script>
       
         function modify_go(){
            var issuenum= parseInt($("input[name='issuenum']").val());
            var issuetitle = $("input[name='issuetitle']").val();
             var issuecontent = $("textarea[name='issuecontent']").val();
             var issueimp = parseInt($("select[name='issueimp']").val());
             var issuestatus = parseInt($("input[name='issuestatus']").val());
             var issueregdate = $("input[name='issueregdate']").val();
             var issuedeadline = $("input[name='issuedeadline']").val();
             var membernum = parseInt($("input[name='membernum']").val());
           var pjnum = $("input[name=pjnum]").val();
             var issueregdateObj = new Date(issueregdate);
             var issuedeadlineObj = new Date(issuedeadline);
             
            
             
              if (!issuetitle) {
                     alert("제목을 확인하세요.");
                     $('input#issue_title').focus();
                     return;
                 }

                 if (!issuecontent) {
                     alert("내용을 확인하세요.");
                     $('textarea#issue_content').focus();
                     return;
                 }

                 if (issueimp == 0) {
                     alert("중요도를 확인하세요.");
                     $('select#issue_imp').focus();
                     return;
                 }

                 if (!issueregdate) {
                     alert("등록일을 확인하세요.");
                     $('input#issue_regdate').focus();
                     return;
                    }

                 if (!issuedeadline) {
                     alert("마감일을 확인하세요.");
                     $('input#issue_deadline').focus();
                     return;
                 }
                 
                 if (issueregdateObj > issuedeadlineObj) {
                     alert("등록일을 확인하세요.");
                     return;
                 }
            
            
            var data={
               "issue_NUM":issuenum,
               "issue_TITLE":issuetitle,
                "issue_CONTENT":issuecontent,
                "issue_IMP":issueimp,
                "issue_STATUS":issuestatus,
                "string_REGDATE":issueregdate,
                "string_DEADLINE":issuedeadline,
                "member_NUM":membernum,
               "pj_NUM":pjnum
             
            }
            $.ajax({
               url:"<%=request.getContextPath()%>/project/doissue_modify",
               type:"post",
               data:JSON.stringify(data),
               contentType:"application/json",
               success:function(){
                  alert("수정이 완료되었습니다.");
                  window.close();
                  opener.ISSUE_go();
                  
               },
               error:function(){
                  alert('수정 내용을 확인하세요.');
               }
            });
         }
        
         
         document.getElementById("modal_opne_btn_issuetag").onclick = function() {
               document.getElementById("modal2").style.display = "block";
            }

            document.getElementById("modal_close_btn_issuetag").onclick = function() {
               document.getElementById("modal2").style.display = "none";
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
         
         $(function() {
           $('#button1').click( function() {
             if( $(this).html() == '전체보기' ) {
               $(this).html('진행이슈보기');
             }
             else {
               $(this).html('전체보기');
             }
           });
         });
         $(function() {
              $('#button2').click( function() {
                if( $(this).html() == '최신순' ) {
                  $(this).html('마감임박순');
                }
                else {
                  $(this).html('최신순');
                }
              });
            });
         
      </script>