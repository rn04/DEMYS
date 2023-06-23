<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="common/mainhead.jsp"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.css"   rel="stylesheet" type='text/css'>


      <div style="width: 100%; height: 955px;">
         <div class="flex justify-center items-center" style="width: 100%; height:30%;">
            <div class="flex items-center" style="width: 99%; height:91%; border: 2px solid gray;">
               <div class="flex-col flex justify-center items-center" style="width: 28%; height:85%; border-right: 2px solid gray;">
                  <i class="fa-sharp fa-solid fa-pen-to-square" style="font-size:3rem;">총프로젝트</i>
                  <div>
                     <span style="font-size:2rem; color:red;">${total }</span>
                     <span style="font-size:1.5rem;">건</span>
                  </div>
                  <div>
                     <i class="fa-solid fa-compact-disc" style="color:green;"><span style="color:black;">완료 ${success } 건</span></i>
                     <i class="fa-solid fa-compact-disc" style="color:blue;"><span style="color:black;">진행중 ${ing } 건</span></i>
                     <i class="fa-solid fa-compact-disc" style="color:gold;"><span style="color:black;">지연 ${delay } 건</span></i>
                     <i class="fa-solid fa-compact-disc" style="color:red;"><span style="color:black;">실패 ${fail } 건</span></i>
                  </div>
               </div>
               <div class="flex-col flex justify-center items-center" style="width: 34%; height:85%; border-right: 2px solid gray;">
                  <i class="fa-sharp fa-solid fa-bars-progress">이번달 종료되는 프로젝트</i>
                  <br/>
                  <table style="width:90%;">
                     <c:forEach var="pj" items="${pjList }" begin="0" end="4" step="1">
                        <tr style="cursor:pointer;" onclick="location.href='project/main?PJ_NUM=${pj.PJ_NUM }'">
                           <td><div class="badge badge-outline badge-warning gap-2">D-${pj.DDAY }</div></td>
                           <td>
                              <i class="fa-solid fa-flag" style="color:red;"></i>
                           </td>
                           <td>${pj.PJ_NAME }</td>
                           <td>진행률</td>
                           <td> | </td>
                           <td>${pj.SUM_PERCENT }%</td>
                        </tr>
                     </c:forEach>
                  </table>
               </div>
               <div class="flex-col flex justify-center items-center" style="width: 38%; height:85%; ">
                  <i class="fa-regular fa-clock">실시간 이슈</i>
                  <br/>
                  <table style="width:90%; table-layout: fixed;">
                     <c:forEach var="issue" items="${issueList }" begin="0" end="4" step="1">
                        <tr style="cursor:pointer;" onclick="location.href='project/main?PJ_NUM=${issue.PJ_NUM}&ISSUE_NUM=${issue.ISSUE_NUM }'">
                           <td style="display:flex;width:30px;">
                              <i class="fa-regular fa-message fa-flip-horizontal" style="font-size:23px;position:relative;"></i>
                              <div style="z-index:-1; position:absolute; line-height:17px; font-weight:bolder; color:red;">&nbsp;${issue.ISSUEREPLY_COUNT }</div>
                           </td>
                           <td style="width:250px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${issue.ISSUE_TITLE }</td>
                           <td style="width:50px;">${issue.MEMBER_NAME }</td>
                           <td style="width:10px;"> | </td>
                           <td style="width:210px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${issue.ISSUE_CONTENT }</td>
                        </tr>
                     </c:forEach>
                  </table>
               </div>
            </div>
         </div>
         <hr/>
         <div class="flex justify-between" style="width: 100%; height:5%;">
            <div class="flex justify-start items-center">
            <c:if test="${member.MEMBER_AUTHORITY==3 }">
               &nbsp;&nbsp;<a onclick="javascript:pjarea_go();"><span style="cursor:pointer; margin:5px; border-right: 2px solid gray; font-size:15px;">진행현황&nbsp;&nbsp;</span></a>
            </c:if>   
            <c:if test="${member.MEMBER_AUTHORITY!=3 }">
               &nbsp;&nbsp;<a onclick="javascript:projecting_go(${member.MEMBER_NUM},0,'');"><span style="cursor:pointer; margin:5px; border-right: 2px solid gray; font-size:15px;">진행현황&nbsp;&nbsp;</span></a>
            </c:if>   
               
               <a onclick="javascript:issueing_go(0,'end')"><span style="cursor:pointer; font-size:15px; margin:5px;">이슈현황</span></a>
            </div>
            <div class="flex justify-end items-center">
                    <c:if test="${member.MEMBER_AUTHORITY==3 }">
               <div style="font-size:15px;">상태</div>
                  <select id="pjarea" class="select select-bordered select-sm w-full max-w-xs" style="width:150px; height:15px; margin:5px;" onchange="pjarea_go();">
                    <option value=0>전체프로젝트</option>               
                    <option value="${member.MEMBER_NUM }">담당프로젝트</option>
                  </select>
                    </c:if>
               <c:if test="${member.MEMBER_AUTHORITY!=3 }">
               <input id="pjarea" type="hidden" value="${member.MEMBER_NUM }"/>
               </c:if>
               <div style="font-size:15px;">중요도</div>
                  <select id="important" class="select select-bordered select-sm w-full max-w-xs" style="width:100px; height:15px; margin:5px;" onchange="pjarea_go();">
                    <option value=0>전체</option>
                    <option value=1>중요</option>
                    <option value=2>보통</option>
                    <option value=3>낮음</option>
                  </select>
               
               <div style="font-size:15px;">기간</div>
                  <select id="orderby" class="select select-bordered select-sm w-full max-w-xs" style="width:150px; height:15px; margin:5px;" onchange="pjarea_go();">
                    <option value="end">마감임박순</option>
                    <option value="reg">최신등록일순</option>
                  </select>
            </div>
         </div>
         <hr/>
         <div style="width: 100%; height:4%;">
         
         </div>
         <hr/>
         <div id="bottomContent" class="flex" style="width: 100%; height:59.5%;">
            <div id="bottomListContent" style="width: 100%; height: 100%;">
               <%@ include file="bottomContent.jsp"%>
            </div>
   <!--          <div id="chartTmp" style="width: 50%; height: 100%; border: 1px solid red;">
               <div id="chart-container"></div>
            </div> -->
         </div>
      </div>
            
<%@ include file="common/foot.jsp"%>