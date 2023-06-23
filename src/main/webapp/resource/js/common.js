//팝업창들 띄우기
//새로운 Window창을 Open할 경우 사용하는 함수 ( arg: 주소, 창타이틀, 넓이, 길이 )
function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight){
   winleft = (screen.width - WinWidth) / 2 ;
   wintop = (screen.height - WinHeight) / 2 ;
   var win = window.open(UrlStr, WinTitle, "scrollbars=yes,width=" + WinWidth
                     + ",height="+WinHeight + ",top="+wintop+",left="
                     + winleft + ",resizable=yes");
   win.focus();
}
//팝업창 닫기
function CloseWindow(){
   window.opener.location.reload(true);
   window.close();
}
function Closewin(){
   window.close();
}




// 페이지네이션 + 조회
function list_go(page,url){
   if(!url) url="main";
   
   $("form#searchForm input[name='page']").val(page);
   $("form#searchForm input[name='searchType']").val($('select[name="searchType"]').val());
   $("form#searchForm input[name='keyword']").val($('div.p-searchbar>input[name="keyword"]').val());
   
   console.log($('select[name="searchType"]').val());
   
   $('form#searchForm').attr({
      action:url,
      method:'get'
   }).submit();
}

function searchMEMBER_NAME(){
   
   $(".modal_member_name").css('display',"block");
   $.ajax({
      url: "Search_Modal",
      type: "get",
      dataType:"json",
      success: function(data){
         var memberList = data.memberList;
         var table = $('#memberList_view');
         table.empty();
         //console.log(data);
         for(var i=0 ; i<memberList.length; i++ ){
            var member = memberList[i];
            var row = '<tr data-member-num ="'+ member.member_NUM +'"> <td>' + member.member_NAME + '</td><td>' + member.member_DEP + '</td></tr>';
            table.append(row);
         }
         
         table.find('tr').click(function(){
            var MEMBER_NAME = $(this).find('td:first-child').text();
            var MEMBER_NUM = $(this).data('member-num');
            
            var input_mnum = '<input id="m_num" type="hidden" value="' + MEMBER_NUM + '" />';
            var input_mname = '<input id="m_name" type="hidden" value="' + MEMBER_NAME + '" />';
            
             var addMemberId = $('.add_member_id');

            if (addMemberId.length) {
                 addMemberId.empty();
            }
            addMemberId.append(input_mnum);
            addMemberId.append(input_mname);
            
            table.find('tr>td:first-child').each(function(){
               if($(this).text() == MEMBER_NAME){
                  $(this).parent('tr').css('background-color', "#e7e7e7e7");
               }else{
                  $(this).parent('tr').css('background-color', "#ffffff");
               }
            });
         });
      }
   }); 
}

//프로젝트member조회
function member_list_go(){
   
   //alert("리스트 돋보기");
   var searchType = $('.select_member[name="searchType"]').val();
   var keyword = $('.key_member>input[name="keyword"]').val();
   console.log(searchType);
   console.log(keyword);
   $.ajax({
      //alert("리스트 ajax");
      url: "regist_searchMEMBER",
      type: "get",
      dataType:"json",
      data:{
         "searchType":searchType,
         "keyword": keyword
      },
      success: function(data){
         var memberList = data.memberList;
         var table = $('#memberList_view');
         table.empty();
         
         for(var i=0 ; i<memberList.length; i++ ){
            var member = memberList[i];
            var row = '<tr data-member-num ="'+ member.member_NUM +'"> <td>' + member.member_NAME + '</td><td>' + member.member_DEP + '</td></tr>';
            table.append(row);
         }
         
         table.find('tr').click(function(){
            var MEMBER_NAME = $(this).find('td:first-child').text();
            var MEMBER_NUM = $(this).data('member-num');
            
            var input_mnum = '<input id="m_num" type="hidden" value="' + MEMBER_NUM + '" />';
            var input_mname = '<input id="m_name" type="hidden" value="' + MEMBER_NAME + '" />';
            
             var addMemberId = $('.add_member_id');

            if (addMemberId.length) {
                 addMemberId.empty();
            }
            addMemberId.append(input_mnum);
            addMemberId.append(input_mname);
            
            table.find('tr>td:first-child').each(function(){
               if($(this).text() == MEMBER_NAME){
                  $(this).parent('tr').css('background-color', "#e7e7e7e7");
               }else{
                  $(this).parent('tr').css('background-color', "#ffffff");
               }
            });
         });
      }
   });
}
// 참여인력 member 조회 등록
function MEMBER_S_REGI(){
   var MEMBER_NUM = $('#m_num').val();
   $('#m_number').val(MEMBER_NUM);
   var MEMBER_NAME = $('#m_name').val();
   $('#m_names').val(MEMBER_NAME);

   $(".modal_member_name").css('display', "none");
}

//프로젝트매니저, 참여인력 모달창 닫기
function CLOSE_MODAL(){
   $(".modal_member_name").css('display', "none");
}










