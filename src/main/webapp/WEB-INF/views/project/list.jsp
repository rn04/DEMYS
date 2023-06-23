<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../common/head.jsp" %>


<div class="project-part">

   <div class="p-sidbar">
      <div class="p-bt">
         <div class="p-regist">
            <button class="p-rg-bt">
               <i class="fa-regular fa-square-plus"></i>
               프로젝트등록
            </button>
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
                  <select class="select w-full max-w-xs">
                       <option disabled selected>프로젝트명</option>
                       <option>프로젝트명</option>
                       <option>업체명</option>
                  </select>
               </div>
            </div>
         </div>
         <div class="p-searchbar">
            <input type="text" placeholder="검색어를 입력하세요." class="input input-bordered" style="width:85%;"/>
            <i class="fa-solid fa-magnifying-glass" style="font-size:30px;width:15%;display:flex;align-items: center;justify-content: space-around;"></i>
         </div>
         
      </div>
      <div class="p-list">
<%--          <c:forEach var="name" items="" varStatus="status">
             
         </c:forEach> --%>
         <div class="p-list-box">
            <div style="border-bottom:1px solid #797979;">
               <div class="ellipsis p-list-title">
                  <span style="color:red;font-size:23px;"><i class="fa-sharp fa-solid fa-flag"></i></span>
                  <span >프로젝트제목들어가야함계속길게적는중</span>
               </div>
               <div class="p-list-date">
                  <span>2023.05.02 ~ </span>
                  <span> 2023.07.02</span>
               </div>
            </div>
            <div class="p-list-box-bottom">
               <span style="font-size:15px;">(주)오싸거</span>
               <span class="p-list-issu">이슈 3</span>
            </div>
         </div>
         <div class="p-list-box">
         </div>
         <div class="p-list-box">
         </div>
         <div class="p-list-box">
         </div>
         <div class="p-list-box">
         </div>
         <div class="">
         pagenation들어가야함
         </div>
         
      </div>
   
   </div>
   
   <div class="p-body">
   
   </div>

</div>



</body>
</html>