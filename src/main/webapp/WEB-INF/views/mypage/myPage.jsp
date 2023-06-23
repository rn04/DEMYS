<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../common/mainhead.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<style>
#modal {
   display: none;
   position: relative;
   width: 100%;
   height: 100%;
   z-index: 1;
}

#modal h2 {
   margin: 0;
}

#modal .modal_content {
   width: 600px;
   height: 400px; 
   top: 50%; 
   background: #fff;
   border: 2px solid #666;
   left: 50%;
   transform: translate(-50%, -50%);
   position: fixed;
}

#modal .modal_layer {
   position: fixed;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   background: rgba(0, 0, 0, 0.5);
   z-index: -1;
}
</style>




<!-- 모달창  -->


<!-- <form method="post" action="../member/doCheckPassword" onsubmit="MemberCheckPassword__submit(this); return false;"> -->
<div id="modal">

      <div class="modal_content">
            <div class="flex" style="background-color: #153A66;">
                  <div class="navbar text-neutral-content" style="width: 100%; padding: 0px; min-height: 1rem; height: 50px;">
                        <div class="text-white" style="font-weight: bold; font-size: 1rem; margin-right: auto;">
                              &nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
                  </div>
            </div>

            <div style="position: absolute; top: 35%; left: 50%; transform: translate(-50%, -50%);">
                  <i class="fas fa-light fa-triangle-exclamation" style="font-size: 5rem;"></i>
            </div>
            
            <form action="../mypage/doCheckPassword" method="get" onsubmit="MemberCheckPassword__submit(this); return false;">
            
            <div>
                  <input type="password" name="loginPwInput" placeholder="비밀번호를 확인하세요" class="loginPwInput"
                        style="border: 2px solid #153A66; width: 400px; height: 50px; position: absolute; top: 60%; left: 50%; transform: translate(-50%, -50%);" />
            </div>

            <div style="display: flex; position: absolute; top: 80%; left: 50%; transform: translate(-50%, -50%);">
                  <button type="submit"
                        style="font-size: 20px; width: 100px; height: 40px; background-color: #153A66; color: white; border-radius: 8px; margin-right: 50px;">확인</button>
                  <button id="modal_close_btn"
                        style="font-size: 20px; width: 100px; height: 40px; background-color: #153A66; color: white; border-radius: 8px;">취소</button>
            </div>

            </form>
      </div>

      <div class="modal_layer"></div>
</div>

<!-- </form> -->


<div style="margin: 0 auto; height: 955px; width: 70%;">

      <div style="display: flex; border-bottom: 2px solid black; padding-top: 20px;">
            <div style="width:200px;font-size: 1.5rem; font-weight: bold;">마이페이지</div>

            <div id="root" style="width: 90%; display: flex; justify-content: flex-end; margin-left: 20px; margin-bottom: 5px;">
                <%-- 계정 수정 버튼 --%>
                <c:if test="${not hideModifyButton}">
                    <button id="modal_opne_btn" style="font-size: 15px; width: 110px; height: 40px; background-color: #153A66; color: white; border-radius: 8px;">계정수정</button>
                </c:if>
            </div>



      </div>




      <div class="container" style="margin: 0 auto; margin-top: 10px;">
            <!-- 프로필 -->
            <div
                  style="border: 2px solid #E7E7E7; height: 50px; line-height: 50px; font-size: 20px; font-weight: bold; border-radius: 15px 15px 2px 2px;">&nbsp;&nbsp;&nbsp;&nbsp;프로필</div>
            <div
                  style="margin-top: 2px; border-radius: 0 0 15px 15px; height: 200px; border: 2px solid #E7E7E7; background-color: #E7E7E7;">

                  <div class="row" style="display: flex;">
                        <!-- 프로필 사진 -->
                        <div class="col-sm-6 grid-rows-1" style="margin-left:40px;">
                              <div class="manPicture" data-id="${member.MEMBER_ID }" style="border: 2px solid #153A66; width: 180px; height: 180px; border-radius: 50%; margin: 10px;" ></div>
                        </div>
                        <div style="margin: 10px;">

                              <!-- 이메일 -->
                              <div class="col-sm-6 grid-rows-2"
                                    style="font-size: 20px; text-align: center; line-height: 90px; height: 90px; width: 520px;">
                                    ${member.MEMBER_EMAIL }
                              </div>
                              <div class="flex">
                                    <!-- 이름 -->
                                    <div class="col-sm-6 grid-rows-5"
                                          style="font-size: 2rem; text-align: right; line-height: 50px; font-weight: bold; height: 50px; width: 250px;">
                                          ${member.MEMBER_NAME }
                                    </div>
                                    &nbsp;&nbsp;&nbsp;
                                    <!-- 직급 -->
                                    <div class="col-sm-6 grid-rows-6"
                                          style="font-size: 2rem; line-height: 50px; font-weight: bold; height: 50px; width: 500px;">
                                          <c:if test="${member.MEMBER_POSITION eq 1}">
                                             ( 사원 )
                                          </c:if>
                                          <c:if test="${member.MEMBER_POSITION eq 2}">
                                             ( 선임 )
                                          </c:if>
                                          <c:if test="${member.MEMBER_POSITION eq 3}">
                                             ( 책임 )
                                          </c:if>
                                    </div>
                              </div>
                        </div>
                  </div>
            </div>

            <!-- 계정정보 -->
            <div style="margin-top: 10px;">
                  <div
                        style="border: 2px solid #E7E7E7; height: 50px; line-height: 50px; font-size: 20px; font-weight: bold; border-radius: 15px 15px 2px 2px;">&nbsp;&nbsp;&nbsp;&nbsp;계정정보</div>
                  <div class="" style="margin-top: 2px; border-radius: 0 0 15px 15px; border: 2px solid #E7E7E7;">

                        <div class="row" style="display: flex;">

                              <div style="margin: 10px;">


                                    <div class="flex" style="margin-left:20px;margin-top:15px;margin-bottom:5px;">
                                       <!-- 아이디 -->
                                       <div class="col-sm-6 grid-rows-5"  style="font-size:15px; text-align:left; line-height:35px; font-weight:bold;height:35px;width:400px;">
                                          아이디
                                       </div>
                                       &nbsp;&nbsp;&nbsp;
                                       <!--아이디 정보칸 -->
                                       <input value="${member.MEMBER_ID }" type="text" class=" input input-bordered w-full max-w-xs" style="pointer-events: none;line-height:35px;height:35px;width:100%; background-color: #E7E7E7;" />
                                       
                                    </div>   
                              </div>
                        </div>
                  </div>
            </div>

            <!-- 개인정보  -->
            <div style="margin-top:10px;">
               <div style="border:2px solid #E7E7E7;height:50px;line-height:50px;font-size:20px;font-weight:bold;border-radius:15px 15px 2px 2px;">&nbsp;&nbsp;&nbsp;&nbsp;개인정보</div>
            <div class="" style="margin-top:2px; border-radius:0 0 15px 15px;border: 2px solid #E7E7E7;" >
               
               <div class="row" style="display:flex;">
               
                     <div style="margin:10px;">
                     
                        
                           <div class="flex" style="margin-left:20px;margin-top:15px;margin-bottom:5px;">
                              <!-- 이름 -->
                              <div class="col-sm-6 grid-rows-5"  style="font-size:15px; text-align:left; line-height:35px; font-weight:bold;height:35px;width:400px;">
                                 이름
                              </div>
                              &nbsp;&nbsp;&nbsp;
                              <!--이름 정보칸 -->
                              <input value="${member.MEMBER_NAME }" type="text" class=" input input-bordered w-full max-w-xs" style="pointer-events: none;line-height:35px;height:35px;width:100%; background-color: #E7E7E7;" />
                              
                           </div>   
                           
                           
                              <div class="flex" style="margin-top:10px;margin-left:20px;">
                              <!-- 휴대폰번호 -->
                              <div class="col-sm-6 grid-rows-5"  style="font-size:15px; text-align:left; line-height:35px; font-weight:bold; height:35px;width:400px;">
                                 휴대폰 번호
                              </div>
                              &nbsp;&nbsp;&nbsp;
                              <!-- 휴대폰번호 정보칸 -->
                              <input value="${member.MEMBER_PHONE }" type="text" class=" input input-bordered w-full max-w-xs" style="pointer-events: none;line-height:35px;height:35px;width:100%; background-color: #E7E7E7;" />
                              
                           </div>   
                           
                              <div class="flex" style="margin-top:10px;margin-left:20px;">
                              <!-- 이메일 -->
                              <div class="col-sm-6 grid-rows-5"  style="font-size:15px; text-align:left; line-height:35px; font-weight:bold;height:35px;width:400px;">
                                 이메일
                              </div>
                              &nbsp;&nbsp;&nbsp;
                              <!-- 이메일 정보칸 -->
                              <input value="${member.MEMBER_EMAIL }" type="text" class=" input input-bordered w-full max-w-xs" style="pointer-events: none;line-height:35px;height:35px;width:100%; background-color: #E7E7E7;" />
                              
                           </div>   
                           
                              <div class="flex" style="margin-top:10px;margin-left:20px;">
                              <!-- 담당부서 -->
                              <div class="col-sm-6 grid-rows-5"  style="font-size:15px; text-align:left; line-height:35px; font-weight:bold;height:35px;width:400px;">
                                 담당부서
                              </div>
                              &nbsp;&nbsp;&nbsp;
                              <!-- 담당부서 정보칸 -->
                              <div style="border:1px solid #ccc;margin-left:100px; border-radius:8px;line-height:35px; height: 35px;pointer-events: none; width: 110%; background-color: #E7E7E7; ">
                                    &nbsp;&nbsp;&nbsp;${member.MEMBER_DEP }
                              </div>
                              
                              
                           </div>   
                           
                           
                              <div class="flex" style="margin-top:10px;margin-left:20px;">
                              <!-- 직책 -->
                              <div class="col-sm-6 grid-rows-5"  style="font-size:15px; text-align:left; line-height:35px; font-weight:bold; height:35px;width:400px;">
                                 직책
                              </div>
                              &nbsp;&nbsp;&nbsp;
                              <!-- 직책 정보칸 -->
                              <div style="border:1px solid #ccc;margin-left:100px; border-radius:8px;line-height:35px; height: 35px;pointer-events: none; width: 110%; background-color: #E7E7E7; ">
                                    &nbsp;&nbsp;
                                    
                                 <c:if test="${member.MEMBER_AUTHORITY eq 1}">
                                     팀원 
                                 </c:if>
                                 <c:if test="${member.MEMBER_AUTHORITY eq 2}">
                                     팀장 
                                 </c:if>
                                 <c:if test="${member.MEMBER_AUTHORITY eq 3}">
                                     인사팀 
                                 </c:if>
                                    
                              </div>
                              
                           </div>   
                           
                              <div class="flex" style="margin-top:10px;margin-left:20px;margin-bottom:20px;">
                              <!-- 직급 -->
                              <div class="col-sm-6 grid-rows-5"  style="font-size:15px; text-align:left; line-height:35px; font-weight:bold; height:35px;width:400px;">
                                 직급
                              </div>
                              &nbsp;&nbsp;&nbsp;
                              <!-- 직급 정보칸 -->
                              <div style="border:1px solid #ccc;margin-left:100px; border-radius:8px;line-height:35px; height: 35px;pointer-events: none; width: 110%; background-color: #E7E7E7; ">
                                 &nbsp;&nbsp;
                                 
                                 <c:if test="${member.MEMBER_POSITION eq 1}">
                                     사원 
                                 </c:if>
                                 <c:if test="${member.MEMBER_POSITION eq 2}">
                                     선임 
                                 </c:if>
                                 <c:if test="${member.MEMBER_POSITION eq 3}">
                                     책임 
                                 </c:if>
                              </div>
                              

                     </div>
               </div>
            </div>
         </div>
      </div>

      </div>

</div>

      <script>
         /* 모달 */
         document.getElementById("modal_opne_btn").onclick = function() {
            document.getElementById("modal").style.display = "block";
         }

         document.getElementById("modal_close_btn").onclick = function() {
            document.getElementById("modal").style.display = "none";
         }
         
         
         /* 비밀번호 확인 */
         let MemberCheckPassword__submitDone = false;
         function MemberCheckPassword__submit(form) {
            if (MemberCheckPassword__submitDone) {
               return;
            }

            form.loginPwInput.value = form.loginPwInput.value.trim();

            if (form.loginPwInput.value.length == 0) {
               alert('비밀번호를 입력해주세요.');
               form.loginPwInput.focus();
               return;
            }
            
            MemberCheckPassword__submitDone = true;
            form.submit();

         }
         
      
         if (${not empty alertScript}) {
              ${alertScript}
          }
         
      
         
         
      </script>

      </body>
      </html>