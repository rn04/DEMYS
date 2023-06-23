<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/x-handlebars-template"  id="product-list-template" >
{{#each .}}
   <tr class="productcard">
      <td onclick="window.open('product_detail?PRODUCT_NUM={{product_NUM}}','산출물 상세','width=900px,height=480px,left=500px,top=300px');" style="cursor:pointer;">{{product_NUM }}</td>
      <td onclick="window.open('product_detail?PRODUCT_NUM={{product_NUM}}','산출물 상세','width=900px,height=480px,left=500px,top=300px');" style="text-align:start; cursor:pointer;">{{product_TITLE }}</td>
      <td><i class="fa-sharp fa-solid fa-paperclip text-2xl"></i></td>
      <td>{{member_NAME }}</td>
      <td>{{prettifyDate product_REGDATE }}</td>
      <td>
         <div class="rounded-lg w-12 text-white" style="margin:0 auto; background-color:#dfdfdf">
            {{#if product_STATUS }}
               <div class="rounded-lg w-12 text-white" style="margin:0 auto; background-color:#016fa0">채택</div>
            {{else }}
               <div class="rounded-lg w-12 text-white" style="margin:0 auto; background-color:#dfdfdf">미채택</div>
            {{/if }}
         </div>
      </td>
   </tr>
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
   }
});
</script>

<script>
function printData(productArr,target,templateObject){
   var template=Handlebars.compile(templateObject.html());
   var html = template(productArr);   
   $('.productcard').remove();
   target.append(html);
}



$(document).ready(function() {
   showList(${PJ_NUM},0,'','');
});


function showList(PJ_NUM,PRODUCT_STEP,searchType,keyword){

   var data={
         "pj_NUM":PJ_NUM,
         "product_STEP":PRODUCT_STEP,
         "searchType":searchType,
         "keyword":keyword
   }

   $.ajax({
      url:"<%=request.getContextPath()%>/project/productList",
      type:"post",
      data:JSON.stringify(data),      
      contentType:'application/json',
      success:function(data){
         console.log("성공");
         console.log(data);
         printData(data,$('#PD-LIST'),$('#product-list-template'));
         $('#gubunValue').val(PRODUCT_STEP);
         /* $("#p-main-bodys").html(data); */
      }
   });
}

/* window.onload=function(){
   onsole.log('${PJ_NUM}');
   console.log(${PJ_NUM});
   test_fun();
   showList(${PJ_NUM},0,'','');
}    */
/* window.onload=function(){
   getPage(1);   
} */

</script>