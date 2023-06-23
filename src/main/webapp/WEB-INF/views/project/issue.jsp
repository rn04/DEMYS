<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
</style>

<link rel="stylesheet" href="/resource/css/project/list.css" />
<link rel="stylesheet" href="/resource/css/project/phead.css" />
<!-- 요구사항리스트.css -->
<link rel="stylesheet" href="/resource/css/require/list.css" />

<div class="project-part">
      <div class="p-body" style="width: 100%; height:800px; border:0;">
            <!-- project작업공간 -->
            <div class="p-main-body" style="margin-top:-20px;">

                  <div class="header-2-menu0">
                        <div class="p-body-header-2">
                              <div style="display: flex; margin-top: 5px; height: 25px;">
                                    <div class="header-3-menu">
                                          <a href="#" style="font-weight: bolder; font-size: 18px;">이슈관리</a>
                                    </div>
                              </div>
                        </div>
                  </div>

                  <div class="rq-title">
                        <div class="flex" style="justify-content: space-between;">
                              <div class="flex items-center ml-3">
                                    <button id="button1" class="rq-regi-bt btn btn-se" style="margin-right: 8px;">전체보기</button>
                                    <button id="button2" class="rq-regi-bt btn btn-se" style="margin-right: 8px;">최신순</button>
                              </div>
                              <select class="w-24 h-10 mr-2 text-center" style="border: 1px solid #aaaaaa;">
                                    <option value="imp_rate" selected>중요도</option>
                                    <option value="high">중 요</option>
                                    <option value="normal">보 통</option>
                                    <option value="low">낮 음</option>
                              </select>
                              <select class="w-24 h-10 mr-2 text-center" style="border: 1px solid #aaaaaa;">
                                    <option value="select" selected>전체</option>
                                    <option value="title">제목+내용</option>
                                    <option value="writer">작성자</option>
                              </select>

                              <input type="text" placeholder="검색어를 입력하세요." autocomplete="off" class="input input-bordered"
                                    style="width: 200px; float: right; background-color: #e7e7e7; border-radius: 0px; height: 40px;" />
                              <button onclick="">
                                    <i class="fa-solid fa-magnifying-glass ml-2"
                                          style="font-size: 25px; width: 20px; color: #e7e7e7; line-height: 30px;"></i>
                              </button>
                        </div>

                        <div style="margin-right: 10px;">
                              <button id="modal_opne_btn" class="rq-regi-bt btn btn-se">등록</button>
                        </div>
                  </div>

                  <!--          팀장 팀원 둘 다 모든 이슈 다 봐 -->
                  <!-- 3중요 2보통 1낮음 -->
                  <!-- 칸반보드 -->

                  <div class="flex justify-evenly" style="width: 100%; height: 90%;">
                        <div style="width: 32%; height: 95%; margin-top: 5px; background-color: #e7e7e7;">
                              <div class="title" style="margin: 5px; height: 5%;">
                                    <span class="font-bold">&nbsp;&nbsp;중요</span>
                                    <%-- <span style="font-weight: bolder">${issueList.size()}</span> --%>
                              </div>
                              <div class="content flex flex-col items-center" style="height: 90%; margin-left: 5px; overflow: auto;">
                                    <c:forEach var="issue" items="${issueList }">
                                          <c:if test="${issue.ISSUE_IMP == '3' }">
                                                <div class="card card-side" style="width: 90%; height: 30%; margin: 5px;">
                                                      <div class="card-body card-shadow shadow-md bg-base-100"
                                                            style="width: 97%; height: 95%; margin: 0; border-radius: 15px;"
                                                            onclick="window.open('issue_detail?ISSUE_NUM=${issue.ISSUE_NUM}','이슈 상세','width=1150px,height=740px,left=500px,top=150px');">
                                                            <div class="card-title flex" style="margin: 0;">
                                                                  <div class="flex items-center" style="margin: 0; width: 100%;">
                                                                        <div class="whitespace-nowrap">${issue.ISSUE_TITLE}</div>
                                                                        <div class="flex" style="width: 100%;">
                                                                              <!-- <i class="fa-regular fa-comment" style="font-size: 23px; margin: 0; margin-left: auto;"></i>
                              <div style="z-index: 1; bottom: -5%; left:80%; position: absolute; margin: 0; font-size: 15px; font-weight: bolder; color: red;">&nbsp;4</div> -->
                                                                              <i class="fa-regular fa-comment"
                                                                                    style="font-size: 23px; margin: 0; margin-left: auto; position: relative;">
                                                                                    <div
                                                                                          style="z-index: 1; position: absolute; top: 20%; right: 33%; font-weight: bolder; color: red; font-size: 11px;">&nbsp;&nbsp;${issue.ISSUEREPLY_COUNT }</div>
                                                                              </i>
                                                                        </div>
                                                                  </div>
                                                            </div>
                                                            <div style="font-size: 11px; text-color: gray;">${issue.ISSUE_CONTENT }</div>
                                                            <!-- issue.ISSUE_CONTENT이긴한데 ISSUE_IMP가 3인 애들의 CONTENT -->
                                                            <div style="font-size: 11px; text-color: gray;">
                                                                  <fmt:formatDate value="${issue.ISSUE_REGDATE }" pattern="yyyy-MM-dd" />
                                                                  ~
                                                                  <fmt:formatDate value="${issue.ISSUE_DEADLINE }" pattern="yyyy-MM-dd" />
                                                            </div>
                                                            <div class="flex items-center justify-between">
                                                                  <div class="flex items-center">
                                                                        <div>
                                                                              <div class="manPicture" style="width:25px;height:25px;display:block;margin:0 auto;border-radius:50%;" data-id="${issue.MEMBER_ID }"></div>
                                                                        </div>
                                                                        <div>&nbsp;${issue.MEMBER_NAME }</div>
                                                                        <!--  issue.vo에 member_name 추가, 이슈 레포지터리.xml에 member_name 쪼인 -->
                                                                  </div>
                                                                  <div style="margin: 0; padding: 0; line-height: 20px;">

                                                                        <c:if test="${issue.ISSUE_STATUS == '1'}">
                                                                              <div class="badge badge-success gap-2"
                                                                                    style="font-size: 12px; margin: 0; background-color: blue;color:white;">진행중</div>
                                                                        </c:if>
                                                                        <c:if test="${issue.ISSUE_STATUS == '2'}">
                                                                              <div class="badge badge-success gap-2" style="font-size: 12px; margin: 0;">완료</div>
                                                                        </c:if>
                                                                        <c:if test="${issue.ISSUE_STATUS == '3'}">
                                                                              <div class="badge badge-success gap-2"
                                                                                    style="font-size: 12px; margin: 0; background-color: orange;">중지</div>
                                                                        </c:if>

                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </c:if>
                                    </c:forEach>

                              </div>
                        </div>



                        <div style="width: 32%; height: 95%; margin-top: 5px; background-color: #e7e7e7;">
                              <div class="title" style="margin: 5px; height: 5%;">
                                    <span class="font-bold">&nbsp;&nbsp;보통</span>
                                    <%-- <span style="font-weight: bolder">${issueList.size()}</span> --%>
                              </div>
                              <div class="content flex flex-col items-center" style="height: 90%; margin-left: 5px; overflow: auto;">

                                    <c:forEach var="issue" items="${issueList }">
                                          <c:if test="${issue.ISSUE_IMP == '2' }">
                                                <div class="card card-side" style="width: 90%; height: 30%; margin: 5px;">
                                                      <div class="card-body card-shadow shadow-md bg-base-100 "
                                                            style="width: 97%; height: 95%; margin: 0; border-radius: 15px;"
                                                            onclick="window.open('issue_detail?ISSUE_NUM=${issue.ISSUE_NUM}','이슈 상세','width=1150px,height=740px,left=500px,top=150px');">
                                                            <div class="card-title flex" style="margin: 0;">
                                                                  <div class="flex items-center" style="margin: 0; width: 100%;">
                                                                        <div class="whitespace-nowrap">${issue.ISSUE_TITLE}</div>
                                                                        <div class="flex" style="width: 100%;">
                                                                              <!-- <i class="fa-regular fa-comment" style="font-size: 23px; margin: 0; margin-left: auto; "></i>
                              <div style="z-index: 1; bottom: -5%; left:80%; position: absolute; margin: 0; font-size: 15px; font-weight: bolder; color: red;">&nbsp;4</div> -->
                                                                              <i class="fa-regular fa-comment"
                                                                                    style="font-size: 23px; margin: 0; margin-left: auto; position: relative;">
                                                                                    <div
                                                                                          style="z-index: 1; position: absolute; top: 20%; right: 33%; font-weight: bolder; color: red; font-size: 11px;">&nbsp;&nbsp;${issue.ISSUEREPLY_COUNT }</div>
                                                                              </i>
                                                                        </div>
                                                                  </div>
                                                            </div>
                                                            <div style="font-size: 11px; text-color: gray;">${issue.ISSUE_CONTENT }</div>
                                                            <div style="font-size: 11px; text-color: gray;">
                                                                  <fmt:formatDate value="${issue.ISSUE_REGDATE }" pattern="yyyy-MM-dd" />
                                                                  ~
                                                                  <fmt:formatDate value="${issue.ISSUE_DEADLINE }" pattern="yyyy-MM-dd" />
                                                            </div>
                                                            <div class="flex items-center justify-between">
                                                                  <div class="flex items-center">
                                                                        <div>
                                                                              <div class="manPicture" style="width:25px;height:25px;display:block;margin:0 auto;border-radius:50%;" data-id="${issue.MEMBER_ID }"></div>
                                                                        </div>
                                                                        <div>&nbsp;${issue.MEMBER_NAME }</div>
                                                                  </div>
                                                                  <div style="margin: 0; padding: 0; line-height: 20px;">
                                                                        <%-- <c:if test="${issue.issue_imp == '1'}">
                                       <div class="badge badge-md badge-error">진행중</div>
                                    </c:if>
                           
                                    <c:if test="${issue.issue_imp == '2'}">
                                       <div class="badge badge-md badge-warning" >완료</div>
                                    </c:if>
                           
                                    <c:if test="${issue.issue_imp == '3'}">
                                       <div class="badge badge-md badge-success" >중지</div>
                                    </c:if> --%>

                                                                        <c:if test="${issue.ISSUE_STATUS == '1'}">
                                                                              <div class="badge badge-success gap-2"
                                                                                    style="font-size: 12px; margin: 0; background-color: blue;color:white;">진행중</div>
                                                                        </c:if>
                                                                        <c:if test="${issue.ISSUE_STATUS == '2'}">
                                                                              <div class="badge badge-success gap-2" style="font-size: 12px; margin: 0;">완료</div>
                                                                        </c:if>
                                                                        <c:if test="${issue.ISSUE_STATUS == '3'}">
                                                                              <div class="badge badge-success gap-2"
                                                                                    style="font-size: 12px; margin: 0; background-color: orange;">중지</div>
                                                                        </c:if>

                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </c:if>
                                    </c:forEach>
                              </div>
                        </div>

                        <div style="width: 32%; height: 95%; margin-top: 5px; background-color: #e7e7e7;">
                              <div class="title" style="margin: 5px; height: 5%;">
                                    <span class="font-bold">&nbsp;&nbsp;낮음</span>
                                    <%-- <span style="font-weight: bolder">${issueList.size()}</span> --%>
                              </div>
                              <div class="content flex flex-col items-center" style="height: 90%; margin-left: 5px; overflow: auto;">

                                    <c:forEach var="issue" items="${issueList }">
                                          <c:if test="${issue.ISSUE_IMP == '1' }">
                                                <div class="card card-side" style="width: 90%; height: 30%; margin: 5px;">
                                                      <div class="card-body card-shadow shadow-md bg-base-100 "
                                                            style="width: 97%; height: 95%; margin: 0; border-radius: 15px;"
                                                            onclick="window.open('issue_detail?ISSUE_NUM=${issue.ISSUE_NUM}','이슈 상세','width=1150px,height=740px,left=500px,top=150px');">
                                                            <div class="card-title flex" style="margin: 0;">
                                                                  <div class="flex items-center" style="margin: 0; width: 100%;">
                                                                        <div class="whitespace-nowrap">${issue.ISSUE_TITLE}</div>
                                                                        <div class="flex" style="width: 100%;">
                                                                              <!-- <i class="fa-regular fa-comment" style="font-size: 23px; margin: 0; margin-left: auto; "></i>
                              <div style="z-index: 1; bottom: -5%; left:80%; position: absolute; margin: 0; font-size: 15px; font-weight: bolder; color: red;">&nbsp;4</div> -->
                                                                              <i class="fa-regular fa-comment"
                                                                                    style="font-size: 23px; margin: 0; margin-left: auto; position: relative;">
                                                                                    <div
                                                                                          style="z-index: 1; position: absolute; top: 20%; right: 33%; font-weight: bolder; color: red; font-size: 11px;">&nbsp;&nbsp;${issue.ISSUEREPLY_COUNT }</div>
                                                                              </i>
                                                                        </div>
                                                                  </div>
                                                            </div>
                                                            <div style="font-size: 11px; text-color: gray;">${issue.ISSUE_CONTENT }</div>
                                                            <div style="font-size: 11px; text-color: gray;">
                                                                  <fmt:formatDate value="${issue.ISSUE_REGDATE }" pattern="yyyy-MM-dd" />
                                                                  ~
                                                                  <fmt:formatDate value="${issue.ISSUE_DEADLINE }" pattern="yyyy-MM-dd" />
                                                            </div>
                                                            <div class="flex items-center justify-between">
                                                                  <div class="flex items-center">
                                                                        <div>
                                                                              <div class="manPicture" style="width:25px;height:25px;display:block;margin:0 auto;border-radius:50%;" data-id="${issue.MEMBER_ID }"></div>
                                                                        </div>
                                                                        <div>&nbsp;${issue.MEMBER_NAME }</div>
                                                                  </div>
                                                                  <div style="margin: 0; padding: 0; line-height: 20px;">
                                                                        <%-- <c:if test="${issue.issue_imp == '1'}">
                                       <div class="badge badge-md badge-error">진행중</div>
                                    </c:if>
                           
                                    <c:if test="${issue.issue_imp == '2'}">
                                       <div class="badge badge-md badge-warning" >완료</div>
                                    </c:if>
                           
                                    <c:if test="${issue.issue_imp == '3'}">
                                       <div class="badge badge-md badge-success" >중지</div>
                                    </c:if> --%>
                                                                        <c:if test="${issue.ISSUE_STATUS == '1'}">
                                                                              <div class="badge badge-success gap-2"
                                                                                    style="font-size: 12px; margin: 0; background-color: blue;color:white;">진행중</div>
                                                                        </c:if>
                                                                        <c:if test="${issue.ISSUE_STATUS == '2'}">
                                                                              <div class="badge badge-success gap-2" style="font-size: 12px; margin: 0;">완료</div>
                                                                        </c:if>
                                                                        <c:if test="${issue.ISSUE_STATUS == '3'}">
                                                                              <div class="badge badge-success gap-2"
                                                                                    style="font-size: 12px; margin: 0; background-color: orange;">중지</div>
                                                                        </c:if>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </c:if>
                                    </c:forEach>
                              </div>
                        </div>
                  </div>


                  <!-- 등록모달 -->
                  <div id="modal1">


                        <!-- 제목, 개발단계 -->
                        <div class="modal_content">
                              <div class="flex card-body" style="padding-bottom: 0px;">
                                    <div class="navbar text-neutral-content"
                                          style="width: 100%; padding: 0px; min-height: 1rem; height: 30px; border-bottom: 3px solid #016fa0;">
                                          <div class="text-black mb-3" style="font-weight: bold; font-size: 1.5rem;">
                                                이슈 등록
                                                <input type="hidden" name="issuestatus" value="1" />
                                                <%-- <input type="hidden" name="issueenddate" value="${issue.ISSUE_ENDDATE }" /> --%>
                                                <input type="hidden" name="membernum" value="${member.MEMBER_NUM }" />
                                                <%-- ${issue.MEMBER_NUM} --%>
                                                <input type="hidden" name="pjnum" value="${PJ_NUM }" />
                                                <%-- <input type="hidden" name="issuenum" value="${issue.ISSUE_NUM }"/> --%>
                                          </div>
                                    </div>
                              </div>

                              <div class="container flex flex-col card-body" style="padding-top: 10px; padding-bottom: 10px;">
                                    <div class="flex">

                                          <select class="w-24 h-8 text-center pr-2"
                                                style="height: 48px; border: 1px solid #aaaaaa; border-right: 0px;" name="issueimp" id="issue_imp">
                                                <option value=0 selected>중요도</option>
                                                <option value=3>중&nbsp;&nbsp;요</option>
                                                <option value=2>보&nbsp;&nbsp;통</option>
                                                <option value=1>낮&nbsp;&nbsp;음</option>
                                          </select>
                                          <input type="text" id="issue_title" name="issuetitle" placeholder="제목을 입력하세요." autocomplete="off" class="input"
                                                style="border: 1px solid #aaaaaa; border-radius: 0px; width: 638px; justify-content: space-between;">
                                    </div>

                                    <div class="flex justify-center">
                                          <div class="flex items-center justify-center"
                                                style="border: 1px solid #aaaaaa; border-radius: 0px; width: 150px; border-right: 0">${member.MEMBER_NAME}</div>

                                          <input id='issue_regdate' type="date" class="input" name="issueregdate"
                                                style="border: 1px solid #aaaaaa; border-radius: 0px; width: 350px; justify-content: space-between; border-right: 0;">
                                          <div class="flex justify-center"
                                                style="border: 1px solid #aaaaaa; border-left: 0; border-right: 0; font-size: 1.5rem; line-height: 40px;">~</div>
                                          <input id="issue_deadline" type="date" class="input" name="issuedeadline"
                                                style="border: 1px solid #aaaaaa; border-radius: 0px; width: 350px; justify-content: space-between; border-left: 0;">
                                    </div>


                                    <!-- 내용 -->
                                    <textarea class="textarea" name="issuecontent" id="issue_content" class="form-control"
                                          style="height: 150px; width: 100%; resize: none; border: 1px solid #aaaaaa; border-radius: 0px;"
                                          placeholder="내용을 작성하세요."></textarea>

                                    <!-- 첨부파일 -->
                                    <div class="filebox bs3-primary w-full" style="margin: 0 0">
                                          <input class="upload-name" value="첨부파일을 등록하세요" disabled="disabled" style="color: #aaa;">
                                          <label for="ex_filename">
                                                <i class="fa-solid fa-paperclip text-2xl text-black mr-3 "></i>
                                          </label>
                                          <input type="file" id="ex_filename" class="upload-hidden">
                                    </div>
                                    <input type="hidden" name="member_num_list" id="memberNumList"/>
                                    <div class="filebox bs3-primary w-full" style="margin: 0 0">
                                          <input id="tagname" class="upload-name" value="태그할 사람을 선택하세요." disabled="disabled" style="color: #aaa;" />
                                          <label for="modal_opne_btn_issuetag">
                                                <i class="fa-solid fa-tag text-2xl text-black mr-3" id="modal_opne_btn_issuetag"></i>
                                          </label>
                                    </div>
                              </div>

                              <div style="display: flex; justify-content: center;">
                                    <button class="btn btn-se" onclick="regist_go();"
                                          style="font-size: 20px; width: 100px; height: 40px; border-radius: 8px; margin-right: 10px;">등 록</button>
                                    <button class="btn btn-se" id="modal_close_btn"
                                          style="font-size: 20px; width: 100px; height: 40px; border-radius: 8px;">취 소</button>
                              </div>
                        </div>

                        <div class="modal_layer"></div>
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
                  <script>
// 참여인력조회 모달창.js

</script>
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
   var arvalue = [];
   $("input[name=member_num]:checked").each(function(){
         arvalue.push($(this).val());
   });
   var names ="";
   var numbers = "";
   $.ajax({
      url:"<%=request.getContextPath()%>/project/Search_TAG",
      type:"post",
      traditional: true,
      data: {"arvalue" : arvalue},
      dataType: "json",
      success:function(data){
         for(var i=0; i<data.length; i++){
            names=names+data[i].member_NAME+" ";
            numbers=numbers+data[i].member_NUM+" ";
         }
         console.log($(names));
        $('#tagname').val(names);
        $('#memberNumList').val(numbers);
         
      }
   });
   document.getElementById("modal2").style.display = "none";

}



</script>



                  <!-- p-main-body끝나는 태그 -->
            </div>
            <!-- project/phead.jsp (t-body) 화면 끝나는 태그 -->
      </div>
      <!-- project/list.jsp 화면끝나는 태그 -->
</div>

<script>
       
		if (${ISSUE_NUMM} !== null && ${ISSUE_NUMM} !== 0) {
		    window.open('issue_detail?ISSUE_NUM=' + ${ISSUE_NUMM}, '이슈 상세', 'width=1150px,height=730px,left=500px,top=150px');
		}
      
         //등록모달
         function regist_go(){
         var issuetitle = $("input[name=issuetitle]").val();
         var issuecontent = $("textarea[name=issuecontent]").val();
         var issueimp = $("select[name=issueimp]").val();
         var issuestatus = $("input[name=issuestatus]").val();
         var issueregdate = $("input[name=issueregdate]").val();
         var issuedeadline = $("input[name=issuedeadline]").val();
         var membernum = $("input[name=membernum]").val();
         var pjnum = $("input[name=pjnum]").val();
         var issueregdateObj = new Date(issueregdate);
         var issuedeadlineObj = new Date(issuedeadline);
         
         var memberList = $('#memberNumList').val();
         
         
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
               "issue_TITLE":issuetitle,
               "issue_CONTENT":issuecontent,
               "issue_IMP":issueimp,
               "issue_STATUS":issuestatus,
               "string_REGDATE":issueregdate,
               "string_DEADLINE":issuedeadline,
               "member_NUM":membernum,
               "pj_NUM":pjnum,
               "memberList":memberList
         }
         console.log(data);
         $.ajax({
            url:"<%=request.getContextPath()%>/project/issue_regist",
            type:"post",
            data:JSON.stringify(data),
            contentType:"application/json",
            success:function(){
               alert("등록되었습니다.");
               ISSUE_go();
            },
            error:function(){
               alert('등록에 실패하였습니다.');
            }
         });
      }
         
         
         document.getElementById("modal_opne_btn").onclick = function() {
            document.getElementById("modal1").style.display = "block";
         }

         document.getElementById("modal_close_btn").onclick = function() {
            document.getElementById("modal1").style.display = "none";
         }
         
         
         
         document.getElementById("modal_opne_btn_issuetag").onclick = function() {
               document.getElementById("modal2").style.display = "block";
            }

            document.getElementById("modal_close_btn_issuetag").onclick = function() {
               document.getElementById("modal2").style.display = "none";
            }
         
                  
         
         $(document).ready(function(){
            MemberPictureThumb('<%=request.getContextPath()%>');
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



<%@ include file="../common/foot.jsp"%>