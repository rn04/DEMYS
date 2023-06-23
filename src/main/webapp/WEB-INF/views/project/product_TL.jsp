<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<style>
/* p-main-body 고정 수정X, border만 씌워서 작업!! */
.p-main-body{
   margin-top:5px;
   width:100%;
   height: calc(930px - 65px - 63px); 
   padding:5px;
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

.btn-se {
   width : 130px;
   min-height:1rem;
   border:none;
   color:#ffffff;
   background-color:#153A66;
   height:30px;
   
}

.btn-se:hover {
   background-color:#016FA0;
}



</style>

<!-- 요구사항리스트.css -->
<link rel="stylesheet" href="/resource/css/require/list.css" />
      
            <div class="p-body-cont">
               <div class="header-2-menu0">
                  <div class="p-body-header-2">
                     <div style="display:flex;margin-top:5px;height:25px;">
                         |<div class="header-2-menu"><a onclick="javascript:showList('${PJ_NUM}',1,'','');" style="cursor:pointer; width:100%; text-align:center;">분 석</a></div> |          <!-- showList(PJ_NUM,1) -->
                        <div class="header-2-menu"><a onclick="javascript:showList('${PJ_NUM}',2,'','');" style="cursor:pointer; width:100%; text-align:center;">설 계</a></div> |
                        <div class="header-2-menu"><a onclick="javascript:showList('${PJ_NUM}',3,'','');" style="cursor:pointer; width:100%; text-align:center;">구 현</a></div> |
                        <div class="header-2-menu"><a onclick="javascript:showList('${PJ_NUM}',4,'','');" style="cursor:pointer; width:100%; text-align:center;">시 험</a></div> |
                     </div>
                  </div>
               </div>
               
                <div class="rq-title">
                     <div class="flex" style="justify-content:space-between;">
                  <select class="w-24 h-8 mr-2 text-center" style="border:1px solid #aaaaaa;">
                      <option value="select" selected>선택</option>
                      <option value="title">제목</option>
                      <option value="writer">작성자</option>
                  </select>
         
                  <input type="text" placeholder="검색어를 입력하세요." class="input input-bordered" style="width:200px; float:right; background-color:#e7e7e7; border-radius:0px; height:2rem;"/>
                  <button onclick=""><i class="fa-solid fa-magnifying-glass ml-2" style="font-size:25px; width:20px; color:#e7e7e7; line-height:30px;"></i></button>                  
               </div>
               
                   <div>
                        <button id="modal_opne_btn" class="rq-regi-bt btn btn-se">등록</button>
                    </div>
                 </div>
                <!-- 산출물  -->
                
                <div class="rq-list">
                     <table>
                        <thead>
                           <tr style="width:100%;">
                              <th style="width:10%;">No</th>
                              <th style="width:50%; text-align:center;">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</th>
                              <th style="width:5%;">첨&nbsp;부&nbsp;파&nbsp;일</th>
                              <th style="width:15%;">작&nbsp;성&nbsp;자</th>
                              <th style="width:10%;">등&nbsp;록&nbsp;일</th>
                              <th style="width:10%;">사&nbsp;용&nbsp;여&nbsp;부</th>
                           </tr>
                         </thead>
                         <tbody id="PD-LIST" style="height: 45px; overflow-y:auto; overflow-x:hidden;">
                             <input type="hidden" id="gubunValue"/>
                           
                           </tbody>
                       </table>
                   </div>
                </div>
     
             
             <!-- 등록모달 -->
      <div id="modal1">
      
      
        <!-- 제목, 개발단계 -->
         <div class="modal_content">
            <div class="flex card-body" style="padding-bottom:0px;">
               <div class="navbar text-neutral-content" style="width: 100%; padding: 0px; min-height: 1rem; height: 30px; border-bottom:3px solid #016fa0;">
                  <div class="text-black mb-3" style="font-weight: bold; font-size: 1.5rem; ">
                     산출물 등록
                     <input type="hidden" name="status" value="0" />
                     <input type="hidden" name="pjnum" value="${PJ_NUM }" />   <%-- 나중에 value="${projects.pj_num }" --%>
                     <input type="hidden" name="membernum" value="${member.MEMBER_NUM }" />    <!-- loginedUser -->
                  </div>
               </div>
            </div>

            <div class="container flex flex-col card-body" style="padding-top:10px; padding-bottom:10px;">
               <div class="flex">
                  <input type="text" placeholder="제목을 입력하세요." class="input" name="title" style="border:1px solid #aaaaaa; border-radius:0px; width:638px; justify-content:space-between;">
                  <select class="w-24 h-8 text-center" style="height:48px; border:1px solid #aaaaaa; border-left:0px;" name="step">
                        <option value="step" selected>개발 단계</option>
                        <option value="1">분&nbsp;&nbsp;석</option>
                        <option value="2">설&nbsp;&nbsp;계</option>
                        <option value="3">구&nbsp;&nbsp;현</option>
                        <option value="4">시&nbsp;&nbsp;험</option>
                  </select>
               </div>
               
               <!-- 내용 -->   
               <textarea class="textarea" name="content" id="content" class="form-control" style="height:250px;width:100%; resize:none; border:1px solid #aaaaaa; border-radius:0px;" placeholder="내용을 작성하세요."></textarea>
               
               <!-- 첨부파일 -->
               <div class="filebox bs3-primary w-full" style="margin:0 0">
                  <input class="upload-name" value="첨부파일을 등록하세요" disabled="disabled" style="color:#aaa;">
                     <label for="ex_filename">
                        <i class="fa-sharp fa-solid fa-paperclip text-2xl text-black mr-3 " ></i>                       
                     </label>
                  <input type="file" id="ex_filename" class="upload-hidden">
               </div>
            </div>

            <div style="display:flex; justify-content:center;">
               <button class="btn btn-se" onclick="regist_go();" style="font-size: 20px; width: 100px; height: 40px; border-radius: 8px; margin-right: 10px;">저장</button>
               <button class="btn btn-se" id="modal_close_btn" style="font-size: 20px; width: 100px; height: 40px; border-radius: 8px;">취소</button>
            </div>
         </div>

      <div class="modal_layer"></div>
   </div>

<%@ include file="pdhandle_TL.jsp" %>


<script>

      function regist_go(){
          var title = $("input[name=title]").val();
          var step = $("select[name=step]").val();
          var content = $("textarea[name=content]").val();
          var status = $("input[name=status]").val();
          var membernum = $("input[name=membernum]").val();
          var pjnum = $("input[name=pjnum]").val();
          
          
          var data={
                "PRODUCT_TITLE":title,
                "PRODUCT_STEP":step,
                "PRODUCT_CONTENT":content,
                "PRODUCT_STATUS":status,
                "MEMBER_NUM":membernum,
                "PJ_NUM":pjnum
          }
          $.ajax({
             url:"<%=request.getContextPath()%>/project/product_regist",
             type:"post",
             data:data,
             success:function(){
                alert("등록되었습니다.");
                PRODUCT_go();
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
         
         document.getElementsByClassName("modal2_opne_btn").onclick = function() {
            document.getElementsByClassName("modal2").style.display = "block";
         }
         document.getElementsByClassName("modal2_close_btn").onclick = function() {
            document.getElementsByClassName("modal2").style.display = "none";
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
         
         
         
         
         
         function status_on(PRODUCT_NUM, PRODUCT_STATUS){
            console.log("테스트 : " + PRODUCT_NUM + "__" + PRODUCT_STATUS);
      
            var data = {
                  product_num: PRODUCT_NUM,
                  product_status: PRODUCT_STATUS
            }
            
            $.ajax({
                  url:"<%=request.getContextPath()%>/project/PDstatusChange",
                  type:"post",
                  data: data,
                  dataType: "text",
                  success:function(data){
                        
                     if (PRODUCT_STATUS == 1) {
                        $('#approveBtn1'+PRODUCT_NUM).css( 'background-color', '#016FA0' ).css( 'color', 'white' );
                        $('#approveBtn2'+PRODUCT_NUM).css('background-color', '').css( 'color', 'black' );
                     } else {
                       $('#approveBtn1'+PRODUCT_NUM).css('background-color', '').css( 'color', 'black' );
                       $('#approveBtn2'+PRODUCT_NUM).css( 'background-color', '#016FA0' ).css( 'color', 'white' );
                           
                     }
                  },
                  error: function(error){
                    console.log(error);
                  }
               });
         }
         
         
   </script>
                