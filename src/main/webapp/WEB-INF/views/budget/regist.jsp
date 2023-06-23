<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 예산수립 등록.css -->
<link rel="stylesheet" href="/resource/css/budget/regist.css" />

      <!-- project작업공간 -->
      <div class="p-main-body">
            <input type="hidden" name="PJ_NUM" value="${projects.PJ_NUM }" />
            <input type="hidden" name="BUDGET_STATUS" value="${projects.BUDGET_STATUS }" />
            
            <div class="bud_body">
               <div class="bud_title">
                  <div  class="bud_title0">
                     <span>${projects.PJ_NAME } 예산서</span>
                  </div>
               </div>
               
               <div class="bud_conts">
                  <div class="bud_cont">
                     <div class="bud_regi_cont">
                        <table border="1" class="w-full">
                           <thead>
                              <tr>
                                 <th style="width:6%;">No</th>
                                 <th style="width:12%;">구분</th>
                                 <th style="width:35%;">예산내역</th>
                                 <th style="width:25%;">비고</th>
                                 <th style="width:17%;">예산금액</th>
                                 <th style="width:5%;"></th>
                              </tr>
                           </thead>
                           <tbody>
                           
                           </tbody>
                        </table>
                     </div>
                     
                     <div class="bud_regi_cont-foots">
                     <div class="bud_regi_cont-foot">
                         <div class="bud_add">
                            <button class="bud_add_bt"><i class="fa-solid fa-circle-plus text-blue-600"></i>&nbsp;예산항목 추가</button>
                         </div>
                      </div>
                      <div class="w-full bud_regi_cont-foot-1 p-2">
                         <div style="color:#AAAAAA;font-weight:bold;">총 ${budgetDetailListCount } 건</div> ㅣ
                         <div style="color:#153A66;font-weight:bold;"><fmt:formatNumber value="${BUDDT_TOTAL}" pattern="#,###"/> 원</div>
                      </div>
                   </div>
                     
                     
                  
                  </div>
                  <div class="bud_exp shadow-md">
                     <div class="bud_exp_0" style="height:45%;">
                        <div class="progress">
                         <div class="progress__bar"></div>
                         <div class="progress__text">
                           <span><fmt:formatNumber value="${PLUS_COST_Per }" pattern="#.##"/></span>%
                         </div>
                    </div>
                     </div>
                     <div class="bud_exp_1" style="height:10%;">
                        <div><i class="fa-solid fa-circle mr-2" style="color:skyblue;"></i>예산금액</div>
                        <div><i class="fa-solid fa-circle mr-2" style="color:#e7e7e7;"></i>예산매출</div>
                     </div>
                     <div class="bud_exp_2" style="height:39%;">
                        <div>
                           <span>예상 매출액</span>
                           <span><fmt:formatNumber value="${projects.PJ_PRICE}" pattern="#,###"/> 원</span>
                        </div>
                        <div >
                           <span>예상 지출액</span>
                           <span class="pl-4">${budgetDetailListCount } 건</span>
                           <span><fmt:formatNumber value="${BUDDT_TOTAL}" pattern="#,###"/> 원</span>
                        </div>
                        <div class="border-b-2">
                           <span>예상 매출이익률</span>
                           <span id="budget_pro"><fmt:formatNumber value="${PLUS_COST_Per }" pattern="#.##"/> %</span>
                        </div>
                        <div style="color: rgb(2 132 199);">
                           <span>예상 매출이익</span>
                           <span><fmt:formatNumber value="${PLUS_COST }" pattern="#,###"/> 원</span>
                        </div>
                     </div>
                     
                  </div>
                  
                
               </div>   
               <div class="bud_regi-bt">
                  <div></div>
                  <c:if test="${projects.BUDGET_STATUS == 0 }">
                     <button class="bud-bt-1" onclick="BUDGET_REGI_go()">최종예산 등록</button>
                  </c:if>
               </div>
               
               
               
            </div>
            
   
   
   
   
         <!-- p-main-body끝나는 태그 -->
      </div>   

<script>
//예산항목 추가 
const addButton = document.querySelector(".bud_add_bt");
const tbody = document.querySelector("tbody");

addButton.addEventListener("click", function(){
   // 새로운 tr요소 생성
   const newRow = document.createElement("tr");
   
   // tr요소 갯수 증가 -> No.가 1씩 증가하게
   const rowNum = tbody.children.length+1;
   
   // tr요소의 내용 추가
   newRow.innerHTML = `
      <td>
          <div class="p-1 w-full">${rowNum}</div>
        </td>
        <td>
          <div class="p-1 w-full">
            <select id="select_box" class="w-full" name="BUDDT_TYPE">
              <option disabled selected>선택</option>
              <option value="인건비" ${budgetDetail.BUDDT_TYPE == '인건비' ? "selected":""}>인건비</option>
              <option value="교통비" ${budgetDetail.BUDDT_TYPE == '교통비' ? "selected":""}>교통비</option>
              <option value="기타" ${budgetDetail.BUDDT_TYPE == '기타' ? "selected":""}>기타</option>
            </select>
          </div>
        </td>
        <td>
          <div>
            <input name="BUDDT_INFO" class="p-1 w-full" type="text" placeholder="예산내역을 입력하세요." />
          </div>
        </td>
        <td>
          <div>
            <input name="BUDDT_ETC" class="p-1 w-full" type="text" placeholder="상세내용을 입력하세요."/>
          </div>
        </td>
        <td>
          <div>
            <input name="BUDDT_COST" class="p-1 w-full"type="text" placeholder="예산금액을 입력하세요."/>
          </div>
        </td>
        <td>
          <div class="p-1 w-full">
            <button class="remove-button">
              <i class="remove-icon fa-solid fa-circle-xmark"></i>
            </button>
          </div>
        </td>
   `;
   // tr요소에 No. 추가
   newRow.querySelector("div:first-child").textContent = rowNum;
   // tbody에 새로운 tr요소 추가
   tbody.appendChild(newRow);
});
</script>

<!-- 최종예산등록 버튼 -->
<script>

function BUDGET_REGI_go(){
   var PJ_NUM = $('input[name="PJ_NUM"]').val();
   // tbody의 모든 행을 선택
    var rows = $("tbody").find("tr");
    var data = [];

    rows.each(function() {
        var BUDDT_TYPE = $(this).find("select[name='BUDDT_TYPE']").val();
        var BUDDT_INFO = $(this).find("input[name='BUDDT_INFO']").val();
        var BUDDT_ETC = $(this).find("input[name='BUDDT_ETC']").val();
        var BUDDT_COST = $(this).find("input[name='BUDDT_COST']").val();

        // 데이터 객체 생성
        var rowData = {
            "buddt_TYPE": BUDDT_TYPE,
            "buddt_INFO": BUDDT_INFO,
            "buddt_ETC": BUDDT_ETC,
            "buddt_COST": parseInt(BUDDT_COST),
            "pj_NUM": parseInt(PJ_NUM)
        };

        data.push(rowData);
    });

    // for 루프를 사용하여 AJAX 요청 보내기
    for (var i = 0; i < data.length; i++) {
        $.ajax({
            url: "<%=request.getContextPath()%>/budget/regist_do",
            type: "post",
            data: JSON.stringify(data[i]),
            contentType: "application/json",
            success: function(data) {
            },
            error: function() {
                alert("등록 error");
            }
        });
    }
    alert("예산이 등록되었습니다.");
    var budget_STATUS = 1;
   var data2 = {
      "pj_NUM": parseInt(PJ_NUM),
      "budget_STATUS":parseInt(budget_STATUS)
   }  
     $.ajax({
       url: "<%=request.getContextPath()%>/budget/registModi_do",
       type: "post",
       data: JSON.stringify(data2),
       contentType: "application/json",
       success: function(data) {
        BUDGET_go();
       },
       error: function() {
         alert("수정error");
       }
     });
}

//예산 항목 삭제 버튼 클릭 이벤트 핸들러
$("tbody").on("click", ".remove-button", function() {
    // 클릭된 버튼의 부모 tr 요소를 선택하여 삭제
    $(this).closest("tr").remove();
});
</script>

<script>
let bar = document.querySelectorAll('.progress__bar'),
val = document.querySelectorAll('.progress__text > span');
for (let i = 0; i < bar.length; i++) {
let percent = parseInt(val[i].innerHTML);
bar[i].style.transform = 'rotate(' + (percent * 1.8 - 45) + 'deg)';
}
</script>