<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 예산수립목록.css -->
<link rel="stylesheet" href="/resource/css/budget/list.css" />


            <!-- 예산수립 타이틀 -->
            
             
             <!-- 신규예산서 등록버튼있는 바?부분 -->
            <div class="budget_head">
               <span style="color:#fff;font-weight: bold; font-size: 20px;width: 100%;display: flex;align-items: center; padding-left: 20px;">예산서</span>
            </div>
            
            <!-- 리스트가 들어가는 바디부분 or 예산없을떄 아이콘떠야함-->
            <div>
            <div class="budget_body" style="display:block;">
               <!-- 바디 안 리스트(카드 전체부분) -->
               <div class="card" onclick="BUDGET_RD_go('${projects.PJ_NUM}');">
               <!-- 카드 하늘색부분(헤드) -->
               <div class="card_head">
                  <!-- 상태 or 팀장/팀원에따라서 상태가 나와야함 그럼 if문을 써야할까?  -->   
                  <!-- 팀장한테 보일 부분 -->
                  <div class="card_head_a" >
                      <c:if test="${projects.BUDGET_STATUS == 0 }">
                        <div class="head_status text-violet-500"><i class="fa-solid fa-circle-plus"></i>&nbsp;작성중</div>
                     </c:if>
                     <c:if test="${projects.BUDGET_STATUS == 1 }">
                          <div class="head_status text-blue-500"><i class="fas fa-solid fa-circle-pause"></i>&nbsp;진행중</div>
                     </c:if>
                     <c:if test="${projects.BUDGET_STATUS == 2 }">
                        <div class="head_status text-green-500"><i class="fa-solid fa-circle-check"></i>&nbsp;승인</div>
                     </c:if>
                     <c:if test="${projects.BUDGET_STATUS == 3 }">
                        <div class="head_status text-red-500"><i class="fa-solid fa-circle-stop"></i>&nbsp;반려</div>
                     </c:if>
                  </div>   
                  
                  <!-- 팀원한테 보일 부분 -->
                  <div class="card_head_aa"></div>
                  
                  <div class="card_head_b">
                     <div class="head_title" style="color:#153A66">${projects.PJ_NAME }예산서</div><%-- ${예산 제목이 들어가겠쥬 } --%>
                  </div>
                  <div class="card_head_c">
                    <fmt:formatDate value="${projects.PJ_REGDATE }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;등록
                  </div>
               </div>
               
               <!-- 리스트 하얀부분(바디) -->
               <div class="card_body">
                  <div class="card_body_a">
                    <table class="table">
                      <tbody class="table_tbody">
                        <!-- row 1 -->
                        <tr style="color:#115db7;">
                          <th>예상 매출액</th>
                     <td>
                             <fmt:formatNumber value="${projects.PJ_PRICE}" pattern="#,###"/> 원
                          </td>
                        </tr>
                        <!-- row 2 -->
                        <tr>
                          <th>예상 지출액</th>
                          <td><fmt:formatNumber value="${BUDDT_TOTAL}" pattern="#,###"/> 원 </td>
                        </tr>
                        <!-- row 3 -->
                        <tr>
                          <th>매출이익</th>
                          <td><fmt:formatNumber value="${PLUS_COST}" pattern="#,###"/> 원</td>
                        </tr>
                        <!-- row 4 -->
                        <tr>
                          <th>이익률</th>
                          <td><fmt:formatNumber value="${PLUS_COST_Per }" pattern="#.##"/> %</td>
                        </tr>
                      </tbody>
                   </table>            
                  </div>
               </div>
               </div>
            </div>
            <!-- 예산목록없을떄 아이콘뜨기 -->
            <div style="display:none;">
               <div class="budget_body">
                  <div class="budget_body_icon">
                     <i class="fas fa-light fa-file-circle-xmark"></i>
                  </div>
               </div>
            </div>
            
            </div>
            
 <script>
 function BUDGET_RD_go(PJ_PK){
    var PJ_NUM = PJ_PK;
    $.ajax({
      url:"<%=request.getContextPath()%>/budget/detail_go?PJ_NUM="+PJ_NUM,
      type:"get",
      success:function(data){
         //alert("넘어감");
         $("#p-main-bodys").html(data);
         
      }, error:function(){
         alert("error!!!!!!");
        }
      
    });
 }
 
 if (${not empty alertScript}) {
       ${alertScript}
   }
 </script>
 
 
 