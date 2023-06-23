
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template" id="reply-list-template">
{{#each .}}
   <div class="bg-base-100 pb-3 issuereply" style="width: 95%; height: 115px; margin: 5px; border-bottom:1px solid #aaa">
      <div class="" style="width: 97%; height: 50%; margin: 0;">
         <div class="card-title flex justify-between pb-5" style="margin: 0;">
            <div class="flex">
               <div>
                  <img class="w-7 rounded-full mr-2" src="<%=request.getContextPath()%>/resource/img/imja.jpg" style="line-height:30px;">
               </div>
               <div style="font-size:14px;">{{reply.MEMBER_NAME}}&nbsp;&nbsp;</div>
            </div>
         </div>
         <div style="font-size: 14px; text-color: gray;">{{reply.ISSUERE_CONTENT}}</div>
         <div style="display:flex; justify-content:flex-end; margin-top:10px;">
            <c:if test="{{member.MEMBER_NUM eq reply.MEMBER_NUM}}">
               <button class="btn btn-se w-12 h-5 rounded" style="font-size: 8px; height: 20px; border-radius: 8px; margin-right: 5px; width:40px; padding:0;">수 정</button>
               <button class="btn btn-se w-12 h-5 rounded" style="font-size: 8px; height: 20px; border-radius: 8px; width:40px; padding:0;">삭 제</button>
            </c:if>
         </div>
      </div>
   </div>
{{/each }}
</script>




<script>
Handlebars.registerHelper({
   
   "prettifyDate":function(timeValue){ //Handlbars에 날짜출력함수 등록
      var dateObj=new Date(timeValue);
      var year=dateObj.getFullYear();
      var month=dateObj.getMonth()+1;
      var date=dateObj.getDate();
      return year+"-"+month+"-"+date;
   },
   /* "visibleByLoginCheck":function(replyer){
      var result="none";      
      if(replyer == "${member.MEMBER_ID}") result="visible";      
      return result;                    
   }, */
   
});
</script>

<script>
function printData(replyArr,target,templateObject){
   var template=Handlebars.compile(templateObject.html());
   var html = template(replyArr);   
   $('.issuereply').remove();
   target.after(html);
}

</script>

<script>


function replyRegist_go(){
   //alert("reply add btn");
   var replytext=$('#newReplyText').val();   
   //alert(replytext);
   //alert('${param.ISSUE_NUM}')
   //alert('${member.MEMBER_NUM}')
   var data={
         "issuere_CONTENT":$('#reply_content').val(),
         "member_NUM":'${member.MEMBER_NUM}',
         "issue_NUM":'${param.ISSUE_NUM}'      
   }
   $.ajax({
      url:"<%=request.getContextPath()%>/project/issue_reply_go",
      type:"post",
      data:JSON.stringify(data),      
      contentType:'application/json',
      success:function(data){
         alert('댓글이 등록되었습니다.');
         location.reload();
         //getPage(data); //리스트 출력
         //$('#newReplyText').val("");   
      }
   });
}

<%-- //댓글 수정 modal
function replyModifyModal_go(issuere_NUM){
   //alert($('#'+rno+'-replytext').text());
   
   var replytext = $('#'+issuere_NUM+'-replytext').text();
   
   $('div#modifyModal div.modal-body input#replytext').val(replytext);
   $('div#modifyModal div.modal-header h4.modal-title').text(rno);
}

//댓글 수정.
function replyModify_go(){
   //alert("reply modify btn");
   var rno=$('div#modifyModal h4.modal-title').text();
   var replytext=$('div#modifyModal #replytext').val();
   

   var sendData={
         "rno":rno,
         "replytext":replytext
   }
   
   $.ajax({
      url:"<%=request.getContextPath()%>/reply/modify.do",
      type:"post",
      data:JSON.stringify(sendData),
      contentType:"application/json",
      success:function(result){
         alert("수정되었습니다.");
         getPage(replyPage);
      },
      error:function(error){
         alert("실패했습니다.");
      },
      complete:function(){
         $('#modifyModal').modal('hide');
      }
   });
}

//reply삭제
function replyRemove_go(){
   //alert("remove reply btn");
   var rno=$('h4.modal-title').text();
   
   var data = {
         bno:${board.bno},
         rno : rno      
         }
   
   $.ajax({
      url:"<%=request.getContextPath()%>/reply/remove.do",
      type:"post",
      contentType:"application/json",
      data:JSON.stringify(data),
      success:function(page){
         alert("삭제했습니다.");
         replyPage = page;
         getPage(page);
      },
      error:function(error){
         alert("실패했습니다.");
      },
      complete:function(){
         $('#modifyModal').modal('hide');
      }
         
   }); --%>

</script>







