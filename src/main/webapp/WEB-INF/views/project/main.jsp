<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="projects" value="${dataMap.projects }"/>

<c:set var="pageMaker" value="${dataMap.pageMaker }"/>
<c:set var="cri" value="${pageMaker.cri }"/>


<%@ include file="../common/head.jsp" %>

<style>
/* p-main-body 고정 수정X, border만 씌워서 작업!! */
.p-main-body{
   margin-top:5px;
   width:100%;
   height: calc(930px - 65px - 63px);
   padding:5px;
}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/resource/css/project/list.css" />
<link rel="stylesheet" href="/resource/css/project/phead.css" />
<link rel="stylesheet" href="/resource/css/project/contacts_modal.css" />



<div class="project-part">
   <div class="p-sidbar">
	<div class="p-bt">
         <div class="p-regist">
            <c:if test="${member.MEMBER_AUTHORITY==3 }">
	            <button class="p-rg-bt" onclick="pjregist_go();">
	               <i class="fa-regular fa-square-plus"></i>
	               프로젝트등록
	            </button>
	         </c:if>
	         <c:if test="${member.MEMBER_AUTHORITY!=3 }">
	            <button class="p-rg-bt">
	               프로젝트 목록
	            </button>
	         </c:if>
            <div class="p-inend">
               <button class="p-inpro">진행중 </button>
               <button class="p-end">완료 </button>
            </div>
            <div class="p-check">
               <div style="padding-top:3px;">
                 <label class="cursor-pointer label">
                   <input type="checkbox" checked="checked" class="checkbox checkbox-info" />
                   <span class="label-text">&nbsp;전체 프로젝트</span>
                 </label>
               </div>
               <div class="w-42">
                  <select class="select w-full max-w-xs" name="searchType" id="searchType">
                       <option disabled selected>선택</option>
                       <option value="pn" ${cri.searchType=='pn' ? "selected":"" }>프로젝트명</option>
                       <option value="cn" ${cri.searchType=='cn' ? "selected":"" }>업체명</option>
                  </select>
               </div>
            </div>
         </div>
         <div class="p-searchbar">
            <input name="keyword" type="text" placeholder="검색어를 입력하세요." class="input input-bordered" style="width:85%;"  autocomplete="off" value="${cri.keyword }"/>
            <button type="button" data-card-widget="search" onclick="list_go(1);" style="width:15%;">
               <i class="fa-solid fa-magnifying-glass" style="font-size:30px;display:flex;align-items: center;justify-content: space-around;"></i>
            </button>
         </div>
         
      </div>
      <div class="p-list">
          <c:forEach var="pj" items="${projects }" >
             <div class="p-list-box" data-pj-num="${pj.PJ_NUM }" onclick="pj_detail(${pj.PJ_NUM });">
               <div style="border-bottom:1px solid #797979;">
                  <div class="ellipsis p-list-title">
                     <c:choose>
                        <c:when test="${pj.PJ_IMP eq 3}">
                           <span style="color:#D9001B;font-size:20px;"><i class="fa-sharp fa-solid fa-flag"></i></span>
                        </c:when>
                        <c:when test="${pj.PJ_IMP eq 2}">
                           <span style="color:#F59A23;font-size:20px;"><i class="fa-sharp fa-solid fa-flag"></i></span>
                        </c:when>
                        <c:otherwise>
                           <span style="color:#FFFF00;font-size:20px;"><i class="fa-sharp fa-solid fa-flag"></i></span>
                        </c:otherwise>
                     </c:choose>
                     
                     <span >${pj.PJ_NAME }</span>
                  </div>
                  <div class="p-list-date">
                     <span><fmt:formatDate value="${pj.PJ_STARTDATE }" pattern="yyyy-MM-dd"/></span>
                     <span>~<fmt:formatDate value="${pj.PJ_ENDDATE }" pattern="yyyy-MM-dd"/></span>
                  </div>
               </div>
               <div class="p-list-box-bottom">
                  <span style="font-size:15px;">${pj.CT_NAME }</span>
                  <span class="p-list-issu">이슈 ${pj.ISSUE_COUNT }</span>
               </div>
            </div>
         </c:forEach>
      
         <div class="p-list-pagination">
            <%@ include file="../module/pagination.jsp" %>
         </div>
         
      </div>
   
   </div>
    <div class="p-body pjbody" style="background-color: rgb(226 232 240);">
       
    </div>   
<!-- project/list.jsp 화면끝나는 태그 -->
</div>



<script>

//프로젝트 상세
function pj_detail(PJ_NUM){
//   alert(pjnum);

   $.ajax({
      url: "detail?PJ_NUM="+PJ_NUM,
      type: "get",
      dataType: "text",
      success: function(data){
         //alert(pjnum);
         $(".pjbody").html(data);
         $(".p-body").css('background-color', "white");
         $(".p-list-box").css('border',"1px solid #797979");
          $(".p-list-box[data-pj-num='" + PJ_NUM + "']").css('border',"4px solid #1ECAF0");
      },
      error: function (xhr, status, error) {
            // AJAX 요청이 실패했을 때 실행할 코드
            console.log(error);
        }
   });
}

function pj_detailForIssue(PJ_NUM,ISSUE_NUM){
//  alert(pjnum);

  $.ajax({
     url: "detail?PJ_NUM="+PJ_NUM+"&ISSUE_NUM="+ISSUE_NUM,
     type: "get",
     dataType: "text",
     success: function(data){
        //alert(pjnum);
        $(".pjbody").html(data);
        $(".p-body").css('background-color', "white");
        $(".p-list-box").css('border',"1px solid #797979");
         $(".p-list-box[data-pj-num='" + PJ_NUM + "']").css('border',"4px solid #1ECAF0");
     },
     error: function (xhr, status, error) {
           // AJAX 요청이 실패했을 때 실행할 코드
           console.log(error);
       }
  });
}
</script>

<script>
function pjregist_go(){
   //alert("regist");
   
   $.ajax({
      url:"regist",
      type:"get",
      dataType:"text",
      success: function(data){
         //alert("form");
         $(".pjbody").html(data);
         $(".p-body").css('background-color', "white");
      }
   });
}

window.onload=function(){
    if(${PJ_NUM}!=null&&${PJ_NUM}!=""){
      if(${ISSUE_NUM}!=null&&${ISSUE_NUM}!=""){
       pj_detailForIssue('${PJ_NUM}','${ISSUE_NUM}');
          history.pushState(null,null,'main');
      }else{           
          pj_detail('${PJ_NUM}');
          history.pushState(null,null,'main');
      }
    }
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
<%@ include file="../common/foot.jsp" %>