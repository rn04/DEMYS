<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/mainhead.jsp"%>

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
   clip:rect(0,0,0,0);
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
</style>


<!-- 모달창  -->

   
<div style="margin:0 auto; height: 955px; width:70%;">
   
   <div style="display:flex; border-bottom:2px solid black;">
      <div style="font-size: 1.5rem; font-weight: bold;width:160px;height:70px;line-height: 70px;"> 마이페이지</div>
      <div style="color:#E7E7E7;font-size:1.5rem;height:70px;line-height:70px;">|&nbsp;</div>
      <div style="font-size:20px; font-weight: bold; width:200px;height:70px;line-height: 70px; ">계정수정</div>
   </div>
   <div class="container" style="margin:0 auto; margin-top:10px;">
   
   

      <div style="display:flex;justify-content:flex-end; margin-bottom:10px;">   
            <button onclick="modify_submit();"  style="font-size: 15px; width: 110px; height: 40px; background-color: #153A66; color: white; border-radius: 8px;margin-right:10px;">수정</button>
            <button onclick="window.location.href='/mypage/myPage'" style="font-size: 15px; width: 110px; height: 40px; background-color: #153A66; color: white; border-radius: 8px;">취소</button>
      </div>
   


   <form name="Modiform" action="/mypage/doModify" method="post">
   

            <!-- 프로필 -->
            <div style="border:2px solid #E7E7E7;height:50px;line-height:50px;font-size:20px;font-weight:bold;border-radius:15px 15px 2px 2px;">&nbsp;&nbsp;&nbsp;&nbsp;프로필</div>
            
            <div style="margin-top:2px; border-radius:0 0 15px 15px;height:130px;border: 2px solid #E7E7E7; background-color:#E7E7E7;" >
               
               <div class="row" style="display:flex;">
               
         
            
               
               <div class="filebox bs3-primary" style="margin:0 0;width:30%;margin-right:0;">
                  <div style="position:relative;width:35%;display:flex;left:20%;">
                    <div class="manPicture" data-id="${member.MEMBER_ID }" style="border: 5px solid #153A66; width: 100px; height: 100px; border-radius: 50%; margin: 20px; margin-left: 10px;" ></div>
                     <label  for="ex_filename"  style="position:absolute; top:50%;">
                     <i class="fa-solid fa-pencil" style="text-align:center;font-size:15px;border:5px solid #153A66; width:35px; height:35px; line-height:30px; border-radius:50%;background-color:white; "></i>
                                              
                     </label>
                  </div>
                  <!-- <input name="MEMBER_PIC" type="file" id="ex_filename" class="upload-hidden"> -->
                  
               </div>
               
            
                  <!-- 프로필 사진 -->
                  <div class="col-sm-6 grid-rows-1">
                     
                  </div>
               
               
                  
                     <div style="margin:10px;float:left;width:40%;">
                     
                        <!-- 이메일 -->
                        <div class="col-sm-6 grid-rows-2"  style="font-size:20px; text-align:center; line-height:50px; height:50px; width:70%;">
                           ${member.MEMBER_EMAIL }
                        </div>
                           <div class="flex">
                              <!-- 이름 -->
                              <div class="col-sm-6 grid-rows-5"  style="font-size:2rem; text-align:right; line-height:50px; font-weight:bold; height:50px;width:250px;">
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
            <div style="margin-top:10px;">
               <div style="border:2px solid #E7E7E7;height:50px;line-height:50px;font-size:20px;font-weight:bold;border-radius:15px 15px 2px 2px;">&nbsp;&nbsp;&nbsp;&nbsp;계정정보</div>
            <div class="" style="margin-top:2px; border-radius:0 0 15px 15px;border: 2px solid #E7E7E7;" >
               
               <div class="row" style="display:flex;">
               
                     <div style="width:100%;margin-left:10px;">
                     
                        
                           <div class="flex" style="margin-left:20px;margin-top:10px;margin-bottom:5px;">
                              <!-- 아이디 -->
                              <div class="col-sm-6 grid-rows-5"  style="font-size:15px; text-align:left; line-height:35px; font-weight:bold;height:35px;width:25%;">
                                 아이디
                              </div>
                              &nbsp;&nbsp;&nbsp;
                              <!-- 아이디 정보칸 -->
                              <input name="MEMBER_ID" id="MEMBER_ID" value="${member.MEMBER_ID }" type="text" class=" input input-bordered w-full max-w-xs" style="pointer-events: none;line-height:35px;height:35px;width:100%; background-color: #E7E7E7;" />
                              <input name="MEMBER_NUM" id="MEMBER_NUM" value="${member.MEMBER_NUM }" type="hidden" />
                              
                           </div>
                           
                           <div class="flex" style="margin-left:20px;margin-top:10px;margin-bottom:5px;">
                              <!-- 비밀번호 -->
                              <div  class="col-sm-6 grid-rows-5"  style="font-size:15px; text-align:left; line-height:35px; font-weight:bold;height:35px;width:25%;">
                                 비밀번호
                              </div>
                              &nbsp;&nbsp;&nbsp;
                              <!-- 비밀번호 정보칸 -->
                              <input type="password" value="${member.MEMBER_PW }" id="MEMBER_PW" name="MEMBER_PW" onchange="check_pw()" value="" placeholder="비밀번호를 입력하세요." class=" input input-bordered w-full max-w-xs" style="line-height:35px;height:35px;width:100%; background-color: #fffff;" />
                              
                           </div>
                           
                           <div class="flex" style="margin-left:20px;margin-top:10px;margin-bottom:10px;">
                              <!-- 비밀번호 확인 -->
                              <div class="col-sm-6 grid-rows-5"  style="font-size:15px; text-align:left; line-height:35px; font-weight:bold;height:35px;width:25%;">
                                 비밀번호 확인
                              </div>
                              &nbsp;&nbsp;&nbsp;
                              <!-- 비밀번호 확인 정보칸 -->
                              
                              <input  id="pwd2" onchange="check_pw()" type="password" class=" input input-bordered w-full max-w-xs" style="line-height:35px;height:35px;width:100%; background-color: #fffff;" />
                              &nbsp;&nbsp;&nbsp;<span id="check" style="line-height:35px;" ></span>
                              
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
                              <input name="MEMBER_NAME" value="${member.MEMBER_NAME }" type="text" class=" input input-bordered w-full max-w-xs" style="pointer-events: none;line-height:35px;height:35px;width:100%; background-color: #E7E7E7;" />
                              
                           </div>   
                           
                           
                              <div class="flex" style="margin-top:10px;margin-left:20px;">
                              <!-- 휴대폰번호 -->
                              <div class="col-sm-6 grid-rows-5"  style="font-size:15px; text-align:left; line-height:35px; font-weight:bold; height:35px;width:400px;">
                                 휴대폰 번호
                              </div>
                              &nbsp;&nbsp;&nbsp;
                              <!-- 휴대폰번호 정보칸 -->
                              <input name="MEMBER_PHONE" id="MEMBER_PHONE" value="${member.MEMBER_PHONE }" type="text" class=" input input-bordered w-full max-w-xs" style="line-height:35px;height:35px;width:100%; background-color: #fffff;" />
                              
                           </div>   
                           
                              <div class="flex" style="margin-top:10px;margin-left:20px;">
                              <!-- 이메일 -->
                              <div class="col-sm-6 grid-rows-5"  style="font-size:15px; text-align:left; line-height:35px; font-weight:bold;height:35px;width:400px;">
                                 이메일
                              </div>
                              &nbsp;&nbsp;&nbsp;
                              <!-- 이메일 정보칸 -->
                              <input name="MEMBER_EMAIL" id="MEMBER_EMAIL" value="${member.MEMBER_EMAIL }" type="text" class=" input input-bordered w-full max-w-xs" style="line-height:35px;height:35px;width:100%; background-color: #fffff;" />
                              
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
                              <div id="mem_po" style="border:1px solid #ccc;margin-left:100px; border-radius:8px; line-height:35px;height: 35px;pointer-events: none; width: 110%; background-color: #E7E7E7; ">
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

</form>   
            
            
</div>

</div>




<script>



function modify_submit(){
      alert("수정이 완료되었습니다.");
      var form = $('form[name="Modiform"]');
      
      form.submit();

   }
   
   
   
/* 비밀번호확인 */
function check_pw() {
   var pw = document.getElementById('MEMBER_PW').value;

   if (document.getElementById('MEMBER_PW').value != ''
         && document.getElementById('pwd2').value != '') {
      if (document.getElementById('MEMBER_PW').value == document
            .getElementById('pwd2').value) {
         document.getElementById('check').innerHTML = '비밀번호가 일치합니다.'
         document.getElementById('check').style.color = 'blue';
      } else {
         document.getElementById('check').innerHTML = '비밀번호가 일치하지 않습니다.';
         document.getElementById('check').style.color = 'red';
      }
   }

}


//doModify실행후에도 mypage에서 값나오게하기
var authorityInfo = document.getElementById('mem_auth');
authorityInfo.innerHTML = '';

if (member.MEMBER_AUTHORITY === 1) {
    authorityInfo.innerHTML = '팀원';
} else if (member.MEMBER_AUTHORITY === 2) {
    authorityInfo.innerHTML = '팀장';
} else if (member.MEMBER_AUTHORITY === 3) {
    authorityInfo.innerHTML = '인사팀';
}



//doModify실행후에도 mypage에서 값나오게하기
var positionInfo = document.getElementById('mem_po');
positionInfo.innerHTML = '';
if (member.MEMBER_POSITION === 1) {
    authorityInfo.innerHTML = '사원';
} else if (member.MEMBER_POSITION === 2) {
    authorityInfo.innerHTML = '선임';
} else if (member.MEMBER_POSITION === 3) {
    authorityInfo.innerHTML = '책임';
}

<%-- window.onload=function(){
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
 --%>



</script>

</body>
</html>