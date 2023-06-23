<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko" class="light" data-theme="light">
<head>
<meta charset="UTF-8">
<title>DEMYS</title>
<link rel="shortcut icon" type="image/x-icon" href="../resource/img/favicon.ico">
<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- 테일윈드 불러오기 -->
<!-- 노말라이즈, 라이브러리까지 한번에 해결 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.7/tailwind.min.css" />

<!-- 데이지 UI -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@2.51.5/dist/full.css" rel="stylesheet" type="text/css" />

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />

<link rel="stylesheet" href="/resource/common.css" />

</head>
<style>


.notification-item {
  position: relative;
  z-index: 3; /* 알림 리스트를 다른 요소들 위에 표시하도록 설정 */
}

#notificationContainer {
  position: relative;
  z-index: 3;
}

.btn-ghost:hover {
   background-color: #016FA0;
}

.alramBoard:hover {
   background-color: #f7f7f7;
}

.btn-top {
   background-color: white;
   border: none;
}

.btn-top:hover {
   background-color: #AAAAAA;
   border: #AAAAAA;
}

.navbar {
   padding: 0px;
   min-height: 1rem;
   height: 55px;
}
a:hover{
   background-color:#016FA0;
   color:white;
}

</style>
<body>
      <div class="navbar text-neutral-content bg-white">
            <a href="/main">
                  <img style="width: 160px; height: 55px;" src="/resource/img/logo.jpg" alt="" />
            </a>
            <div class="flex-1"></div>
            <c:if test="${not empty member.MEMBER_ID}">
            <div class="flex-none">
                  <div class="dropdown dropdown-end" id="notificationContainer">
                        <button tabindex="0" class="btn btn-top btn-circle" id="notificationButton" onclick="NOTILIST_go();">
                              <div class="indicator">
                                  <svg style="color: black;" xmlns="http://www.w3.org/2000/svg" class="h-6 w6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                  	<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9" /></svg>
                                  		<span class="badge badge-xs badge-primary indicator-item" id="notificationCount"></span>
                              </div>
                        </button>
               				<div class="dropdown dropdown-end" id="notificationContainer" >
							    <div tabindex="0" class="flex menu menu-compact dropdown-content mt-3 p-2 shadow bg-base-100 rounded-box w-52" style="color: black; width: 505px; height: 450px; align-items: center; border:1px solid black;">
							       <span  class="text-center mb-2 text-white" style=" opacity: 70%; font-weight: bold; font-size: 1.2rem; width: 490px; height: 40px; border-radius: 13px; background-color: #016FA0; line-height: 40px;">Notification</span>
									  <div id="notificationList">
									<!-- list들어오는 공간 -->
									</div>
							    </div>
							</div> 
                        </div>
                  </div>
				  <li style="margin: 0 auto;color:black;list-style-type: none;">
				    <span>
				      ${member.MEMBER_NAME}
				      <c:choose>
				        <c:when test="${member.MEMBER_POSITION eq 1}">
				          사원
				        </c:when>
				        <c:when test="${member.MEMBER_POSITION eq 2}">
				          선임
				        </c:when>
				        <c:when test="${member.MEMBER_POSITION eq 3}">
				          책임
				        </c:when>
				      </c:choose>
				    </span>
				  </li>
                  <div class="dropdown dropdown-end">
                        <label tabindex="0" class="btn btn-top btn-circle avatar">
                              <div class="w-10 rounded-full">
                                  <div class="manPicture " data-id="${member.MEMBER_ID }" style="width:40px;height:40px;display:block;margin:0 auto;"></div>
                              </div>
                        </label>
                        <ul tabindex="0" class="menu menu-compact dropdown-content mt-3 p-2 shadow bg-base-100 rounded-box w-52"
                              style="color: black;">
                              <li>
                                <a href="/mypage/myPage" class="justify-between"> MyPage </a>
                              </li>
                              <li>
						   		 <a href="/member/logout" > Logout </a>
							  </li>
                        </ul>
                  </div>
				</c:if>
            </div>
      <div class="flex" style="background-color: #153A66;">
            <div class="navbar text-neutral-content" style="width: 100%;">
                  <ul class="text-white" style="margin-left: auto;">
                        <li>
                          <a href="/main" class="btn btn-ghost normal-case text-xl" style="width: 130px;">
                              <span>DashBoard</span>
                          </a>
                        </li>
                        <li>
                          <a href="/project/main" class="btn btn-ghost normal-case text-xl" style="width: 130px;">
                              <span>Projects</span>
                          </a>
                        </li>
                        <li>
                          <a href="/calendar/calendar" class="btn btn-ghost normal-case text-xl" style="width: 130px;">
                              <span>Calendar</span>
                          </a>
                        </li>
                        <li>
                          <a href="/tasks/list" class="btn btn-ghost normal-case text-xl" style="width: 130px;">
                              <span>Tasks</span>
                          </a>
                        </li>
                        <li>
                          <a href="/contacts/list" class="btn btn-ghost normal-case text-xl" style="width: 130px;">
                              <span>Contacts</span>
                          </a>
                        </li>
                  </ul>
            </div>
      </div>
<script>

window.onload=function(){
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
	
	
	
</script>

<script>
 $(document).ready(function() {
    updateNotificationCount();
    setInterval(updateNotificationCount, 300000);

    updateNotificationList();
    setInterval(updateNotificationList, 300000);
  });

  function updateNotificationCount() {
    $.ajax({
      url: '/notification/noti_count',
      type: 'GET',
      success: function(data) {
        $('#notificationCount').text(data);
      },
      error: function() {
        console.log('알림 개수를 가져오는 도중 오류가 발생했습니다.');
      }
    });
  }
</script>


<script>
function NOTILIST_go() {
	  var notificationList = $('#notificationList');
	  $.ajax({
	    url: "<%=request.getContextPath() %>/notification/noti_list_go",
	    type: "post",
	    dataType: "json",
	    success: function (data) {
	      var notiList = data.notificationList;
	      var notiListCount = data.notiListCount;
	      notificationList.empty();
	      
	      var divider = $('<div style="width:450px; height:1px; background-color:#e3e3e3;"></div>');

	      notificationList.before(divider);
	      
	      var notificationItem; // 알림 항목을 담을 변수

	      for (var i = 0; i < notiListCount; i++) {
	    	  var noti = notiList[i];
	    	  notificationItem = $('<li id="listADDP" class="flex" style="width:480px;"></li>'); // 알림 항목 생성
	    	  var alramBoard = $('<div class="alramBoard m-1" style="border-radius:5px;"></div>'); // 알림 보드 생성
	    	  var iconContainer = $('<div style="width:50px; height:50px; border-radius:50%;margin-right:8px;"></div>'); // 아이콘 컨테이너 생성
	    	  var icon = $('<i class="fa-solid fa-circle-exclamation" style="color:white; line-height:50px; margin-left:12px; font-size:1.7rem;"></i>'); // 아이콘 생성
	    	  var contentContainer = $('<span></span>'); // 내용 컨테이너 생성
	    	  var noti_add_type = $('<h5>' + noti.noti_TYPE + '</h5>').css('color', 'black');
	    	  var noti_add_content = $('<p>' + noti.noti_CONTENT + '</p>').css('color', 'black');
	    	  
	    	  if (noti.noti_TYPE === "이슈") {
	    		    icon = $('<i class="fa-solid fa-circle-exclamation" style="color:white; line-height:50px; margin-left:12px; font-size:1.7rem;"></i>'); // 이슈 아이콘
	    		    iconContainer.css("background-color", "#fc7e7e"); // 이슈인 경우 빨간색 배경색 설정
	    		  } else if (noti.noti_TYPE === "댓글") {
	    		    icon = $('<i class="fa-regular fa-comment-dots" style="color:white; line-height:50px; margin-left:12px; font-size:1.7rem;"></i>'); // 댓글 아이콘
	    		    iconContainer.css("background-color", "#7e9cfc"); // 댓글인 경우 파란색 배경색 설정
	    		  }
	    	  
	    	  iconContainer.append(icon);
	    	  contentContainer.append(noti_add_type);
	    	  contentContainer.append(noti_add_content);
	    	  alramBoard.append(iconContainer);
	    	  alramBoard.append(contentContainer);
	    	  notificationItem.append(alramBoard);
	    	  notificationList.append(notificationItem);
	    	  if (i < notiListCount - 1) {
	              notificationList.append(divider.clone());
	            }
	          }
	    },
	    error: function () {
	      console.log('error');
	    }
	  });
	}
</script>

