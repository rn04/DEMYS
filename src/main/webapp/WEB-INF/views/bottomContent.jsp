<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template"  id="projecting-template" >

<div class="pj-list">
   <table class="table w-full">
      <thead>
         <tr>
            <th>사업구분</th>
            <th>프로젝트명</th>
            <th>업체명</th>
            <th>시작일</th>
            <th>종료일</th>
            <th>진행률</th>
            <th>담당자</th>
            <th>이슈</th>
         </tr>
      </thead>
      <tbody>
         {{#each .}}
            <tr class="hover" style="cursor:pointer;" onclick="location.href='project/main?PJ_NUM={{pj_NUM }}'">
               <td>{{pj_FIELD }}</td>
               <td>{{pj_NAME }}</td>
               <td>{{ct_NAME }}</td>
               <td>{{prettifyDate pj_STARTDATE }}</td>
               <td>{{prettifyDate pj_ENDDATE }}</td>
               <td>{{sum_PERCENT }}%</td>
               <td>{{member_NAME }}</td>
               <td>{{issue_COUNT}}개</td>
            </tr>
         {{/each}}
      </tbody>
   </table>
</div>


</script>

<script type="text/x-handlebars-template"  id="issueing-template" >
<div id="issueTmp" class="flex justify-around" style="width: 100%; height: 100%;">
<div style="width: 32%; height: 100%; border: 1px solid gray; margin-top: 5px; background-color: #e7e7e7;">
      <div class="title" style="margin: 5px; height: 5%;">
         <span>&nbsp;&nbsp;중요 </span>
         <span style="font-weight: bolder">{{Imp3ListCount}} </span>
      </div>
      <div class="content flex flex-col items-start" style="height: 90%; margin-left: 5px; overflow: auto;">
         {{#each Imp3List}}
            <div class="card card-side bg-base-100 shadow-xl" style="width: 90%; height: 30%; margin: 5px;cursor:pointer;" onclick="location.href='project/main?PJ_NUM={{pj_NUM}}&ISSUE_NUM={{issue_NUM }}'">
               <figure style="background-color: red; width: 3%; height: 100%;"></figure>
               <div class="card-body" style="width: 97%; height: 100%; margin: 0;">
                  <div class="card-title flex justify-between" style="margin: 0;">
                     <div class="flex items-start" style="margin: 0;">
                        <i class="fa-solid fa-flag" style="color: red;"></i>
                        {{issue_TITLE}}
                        <div class="flex" style="position: relative;">
                           <i class="fa-regular fa-message" style="font-size: 23px; margin: 0;"></i>
                           <div style="z-index: 1; bottom: 1%; position: absolute; margin: 0; font-size: 15px; font-weight: bolder; color: red;">&nbsp;{{issuereply_COUNT}}</div>
                        </div>
                     </div>
                     <div style="margin: 0; padding: 0;">
                        <div class="badge badge-success gap-2" style="font-size: 12px; margin: 0; {{dpnoneIng issue_STATUS}}">진행중</div>
                        <div class="badge badge-info gap-2" style="font-size: 12px; margin: 0; {{dpnoneFinish issue_STATUS}}">완료</div>
                        <div class="badge badge-warning gap-2" style="font-size: 12px; margin: 0; {{dpnoneStop issue_STATUS}}">중지</div>
                     </div>
                  </div>
                  <div style="font-size: 11px; text-color: gray;">{{ct_NAME}} | {{pj_NAME}}</div>
                  <div class="flex">
                    <div class="w-8 rounded-full">
                        <div class="manPicture" style="width:25px;height:25px;display:block;margin:0 auto;border-radius:50%;" data-id={{member_ID }}></div>
                     </div>
                     <div>{{member_NAME}}&nbsp;&nbsp;</div>
                     <div class="badge badge-outline badge-error gap-2" style="font-weight: bolder; font-size: 12px; margin: 0;">{{prettifyDate issue_DEADLINE}}</div>
                  </div>
                  <div class="flex">
                     {{#each tagList}}
                        <div class="w-12 h-5 rounded" style="font-weight: bolder; font-size: 12px; border: 1px solid gray; background-color: #e7e7e7; text-align: center;">{{member_NAME}}</div>&nbsp;
                     {{/each}}
                  </div>
               </div>
            </div>
         {{/each}}
      </div>
   </div>
   
   <div style="width: 32%; height: 100%; border: 1px solid gray; margin-top: 5px; background-color: #e7e7e7;">
      <div class="title" style="margin: 5px; height: 5%;">
         <span>&nbsp;&nbsp;보통 </span>
         <span style="font-weight: bolder">{{Imp2ListCount}} </span>
      </div>
      <div class="content flex flex-col items-start" style="height: 90%; margin-left: 5px; overflow: auto;">
         {{#each Imp2List}}
            <div class="card card-side bg-base-100 shadow-xl" style="width: 90%; height: 30%; margin: 5px; cursor:pointer;" onclick="location.href='project/main?PJ_NUM={{pj_NUM}}&ISSUE_NUM={{issue_NUM }}'">
               <figure style="background-color: orange; width: 3%; height: 100%;"></figure>
               <div class="card-body" style="width: 97%; height: 100%; margin: 0;">
                  <div class="card-title flex justify-between" style="margin: 0;">
                     <div class="flex items-start" style="margin: 0;">
                        <i class="fa-solid fa-flag" style="color: red;"></i>
                        {{issue_TITLE}}
                        <div class="flex" style="position: relative;">
                           <i class="fa-regular fa-message" style="font-size: 23px; margin: 0;"></i>
                           <div style="z-index: 1; bottom: 1%; position: absolute; margin: 0; font-size: 15px; font-weight: bolder; color: red;">&nbsp;{{issuereply_COUNT}}</div>
                        </div>
                     </div>
                     <div style="margin: 0; padding: 0;">
                        <div class="badge badge-success gap-2" style="font-size: 12px; margin: 0; {{dpnoneIng issue_STATUS}}">진행중</div>
                        <div class="badge badge-info gap-2" style="font-size: 12px; margin: 0; {{dpnoneFinish issue_STATUS}}">완료</div>
                        <div class="badge badge-warning gap-2" style="font-size: 12px; margin: 0; {{dpnoneStop issue_STATUS}}">중지</div>
                     </div>
                  </div>
                  <div style="font-size: 11px; text-color: gray;">{{ct_NAME}} | {{pj_NAME}}</div>
                  <div class="flex">
                     <div class="w-8 rounded-full">
                        <div class="manPicture" style="width:25px;height:25px;display:block;margin:0 auto;border-radius:50%;" data-id={{member_ID }}></div>
                     </div>
                     <div>{{member_NAME}}&nbsp;&nbsp;</div>
                     <div class="badge badge-outline badge-error gap-2" style="font-weight: bolder; font-size: 12px; margin: 0;">{{prettifyDate issue_DEADLINE}}</div>
                  </div>
                  <div class="flex">
                     {{#each tagList}}
                        <div class="w-12 h-5 rounded" style="font-weight: bolder; font-size: 12px; border: 1px solid gray; background-color: #e7e7e7; text-align: center;">{{member_NAME}}</div>&nbsp;
                     {{/each}}
                  </div>
               </div>
            </div>
         {{/each}}
      </div>
   </div>

   <div style="width: 32%; height: 100%; border: 1px solid gray; margin-top: 5px; background-color: #e7e7e7;">
      <div class="title" style="margin: 5px; height: 5%;">
         <span>&nbsp;&nbsp;낮음 </span>
         <span style="font-weight: bolder">{{Imp1ListCount}}</span>
      </div>
      <div class="content flex flex-col items-start" style="height: 90%; margin-left: 5px; overflow: auto;">
         {{#each Imp1List}}
            <div class="card card-side bg-base-100 shadow-xl" style="width: 90%; height: 30%; margin: 5px; cursor:pointer;" onclick="location.href='project/main?PJ_NUM={{pj_NUM}}&ISSUE_NUM={{issue_NUM }}'">
               <figure style="background-color: gold; width: 3%; height: 100%;"></figure>
               <div class="card-body" style="width: 97%; height: 100%; margin: 0;">
                  <div class="card-title flex justify-between" style="margin: 0;">
                     <div class="flex items-start" style="margin: 0;">
                        <i class="fa-solid fa-flag" style="color: red;"></i>
                        {{issue_TITLE}}
                        <div class="flex" style="position: relative;">
                           <i class="fa-regular fa-message" style="font-size: 23px; margin: 0;"></i>
                           <div style="z-index: 1; bottom: 1%; position: absolute; margin: 0; font-size: 15px; font-weight: bolder; color: red;">&nbsp;{{issuereply_COUNT}}</div>
                        </div>
                     </div>
                     <div style="margin: 0; padding: 0;">
                        <div class="badge badge-success gap-2" style="font-size: 12px; margin: 0; {{dpnoneIng issue_STATUS}}">진행중</div>
                        <div class="badge badge-info gap-2" style="font-size: 12px; margin: 0; {{dpnoneFinish issue_STATUS}}">완료</div>
                        <div class="badge badge-warning gap-2" style="font-size: 12px; margin: 0; {{dpnoneStop issue_STATUS}}">중지</div>
                     </div>
                  </div>
                  <div style="font-size: 11px; text-color: gray;">{{ct_NAME}} | {{pj_NAME}}</div>
                  <div class="flex">
                    <div class="w-8 rounded-full">
                        <div class="manPicture" style="width:25px;height:25px;display:block;margin:0 auto;border-radius:50%;" data-id={{member_ID }}></div>
                     </div>
                     <div>{{member_NAME}}&nbsp;&nbsp;</div>
                     <div class="badge badge-outline badge-error gap-2" style="font-weight: bolder; font-size: 12px; margin: 0;">{{prettifyDate issue_DEADLINE}}</div>
                  </div>
                  <div class="flex">
                     {{#each tagList}}
                        <div class="w-12 h-5 rounded" style="font-weight: bolder; font-size: 12px; border: 1px solid gray; background-color: #e7e7e7; text-align: center;">{{member_NAME}}</div>&nbsp;
                     {{/each}}
                  </div>
               </div>
            </div>
         {{/each}}
      </div>
   </div>
</div>
</script>

<script>
Handlebars.registerHelper({
   "prettifyDate":function(timeValue){ 
      var dateObj=new Date(timeValue);
      var year=dateObj.getFullYear();
      var month=dateObj.getMonth()+1;
      var date=dateObj.getDate();
      return year+"."+month+"."+date;
   },
   "monthDate":function(timeValue){ 
      var dateObj=new Date(timeValue);
      var month=dateObj.getMonth()+1;
      var date=dateObj.getDate();
      return month+"."+date;
   },
   "dpnoneIng":function(ISSUE_STATUS){
      if(ISSUE_STATUS==1) return "";
      else return "display:none;";
   },
   "dpnoneFinish":function(ISSUE_STATUS){
      if(ISSUE_STATUS==2) return "";
      else return "display:none;";
   },
   "dpnoneStop":function(ISSUE_STATUS){
      if(ISSUE_STATUS==3)   return "";
      else return "display:none;";
   }
});

</script>

<script>
function printData(projectArr,target,templateObject){

   var template=Handlebars.compile(templateObject.html());
   var html = template(projectArr);
   $('#issueTmp').remove();
   $('.pj-list').remove();
   target.append(html);
}

function printIssue(issueArr,target,templateObject){
   console.log(templateObject);
   var template=Handlebars.compile(templateObject.html());
   var html = template(issueArr);
   $('.pj-list').remove();
   $('#issueTmp').remove();
   target.append(html);
}

function issueing_go(MYISSUE,SORT){
   
   var data={
         "myissue":MYISSUE,
         "sort":SORT
      }
   
   $.ajax({
      url:"<%=request.getContextPath()%>/issueing",
      type:"post",
      data:JSON.stringify(data),
      contentType:"application/json",
      success:function(data){
         showIssueingList(data);
         MemberPictureThumb('<%=request.getContextPath()%>');
      },
      error:function(error){
         alert("실패했습니다.");
      }
   });
}

function showIssueingList(data){
   printIssue(data,$('#bottomListContent'),$('#issueing-template'));
}



function showProjectingList(data){
   printData(data,$('#bottomListContent'),$('#projecting-template'));
}


function projecting_go(MEMBER_NUM,PJ_IMP,SORT){

   var data={
         "member_NUM":MEMBER_NUM,
         "pj_IMP":PJ_IMP,
         "sort":SORT
   }
   
   $.ajax({
      url:"<%=request.getContextPath()%>/projecting",
      type:"post",
      data:JSON.stringify(data),
      contentType:"application/json",
      success:function(data){
         showProjectingList(data);
         MemberPictureThumb('<%=request.getContextPath()%>');
      },
      error:function(error){
         alert("실패했습니다.");
      }
   });
}
window.onload=function(){
   pjarea_go();
}
function pjarea_go(){
   var MEMBER_NUM = parseInt($('#pjarea').val());
   var PJ_IMP = parseInt($('#important').val());
   var SORT = $('#orderby').val();
   projecting_go(MEMBER_NUM,PJ_IMP,SORT);
}
</script>