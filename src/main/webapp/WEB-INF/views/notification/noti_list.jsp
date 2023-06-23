<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 		<div class="dropdown dropdown-end" id="notificationContainer">
                        <button tabindex="0" class="btn btn-top btn-circle" id="notificationButton" >
                              <div class="indicator">
                                    <svg style="color: black;" xmlns="http://www.w3.org/2000/svg" class="h-6 w6" fill="none" viewBox="0 0 24 24"
                                          stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9" /></svg>
                                    <span class="badge badge-xs badge-primary indicator-item" id="notificationCount"></span>
                              </div>
                        </button>
 </div>
 -->

			<div class="dropdown dropdown-end" id="notificationContainer">
			    <div tabindex="0" class="flex menu menu-compact dropdown-content mt-3 p-2 shadow bg-base-100 rounded-box w-52" style="color: black; width: 505px; height: 450px; align-items: center; border:1px solid red;">
			       <span class="text-center mb-2 text-white" style="margin-right: 10px; opacity: 70%; font-weight: bold; font-size: 1.2rem; width: 490px; height: 40px; border-radius: 13px; background-color: #016FA0; line-height: 40px;">Notification</span>
					<c:forEach items="${notificationList}" var="notification">
					 	<div class="flex" style="width:480px; outline:1px solid red;">
							<span>${notification.NOTI_TYPE}</span>
						    <span>${notification.NOTI_CONTENT}</span>
						 </div>
					</c:forEach>
			    </div>
			</div>
 
<!--  <script>
  $(document).ready(function() {
    updateNotificationCount();
    setInterval(updateNotificationCount, 300000);

    updateNotificationList();
    setInterval(updateNotificationList, 300000);
  });
  
    $(document).ready(function() {
      // updateNotificationList 함수 호출
      updateNotificationList();

      // updateNotificationList 함수는 위에 작성한 JavaScript 코드에 포함되어야 합니다.

      function updateNotificationList() {
        var notificationList = $('#notificationList');
        $.ajax({
          url: '/notification/noti_list',
          method: 'GET',
          dataType:"text",
          success: function(response) {
            notificationList.empty();

            for (var i = 0; i < response.length; i++) {
              var notification = response[i];
              var notificationItem = $('<div class="flex" style="width:480px; outline:1px solid red;"></div>');
              notificationItem.append($('<span></span>').text(notification.NOTI_TYPE));
              notificationItem.append($('<span></span>').text(notification.NOTI_CONTENT));

              notificationList.append(notificationItem);
            }
          },
          error: function(error) {
            console.log('알림 리스트를 가져오는 도중 오류가 발생했습니다.');
          }
        });
      }
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

 
  $(document).on('click', '.notification-item', function() {
    var notificationId = $(this).data('id');
    $.ajax({
      url: '/notification/remove',
      method: 'POST',
      data: { id: notificationId },
      success: function(response) {
        updateNotificationList();
        updateNotificationCount();
      },
      error: function(error) {
        console.log('알림 삭제 도중 오류가 발생했습니다.');
      }
    });
  });

  $('#notificationButton').click(function() {
    var notificationList = $('#notificationContainer ul');
    notificationList.toggle();

  /*   var notificationCount = $('#notificationCount');
    notificationCount.text('0'); */
  }); 
</script> --> --%>