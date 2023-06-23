package com.ducks.demys.boot.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ducks.demys.boot.service.NotificationService;
import com.ducks.demys.boot.vo.Member;
import com.ducks.demys.boot.vo.Notification;

import jakarta.servlet.http.HttpSession;

@Controller
public class NotificationController {

	 @Autowired
	  private NotificationService notificationService;

	 @RequestMapping("/notification/noti_list_go")
	 @ResponseBody
	 public  Map<String, Object> getNotifications(HttpSession session) {
	     Member member = (Member) session.getAttribute("member");
	     String MEMBER_ID = member.getMEMBER_ID();
	     int DELSTATUS = 0;
	     List<Notification> notificationList = notificationService.getNotificationList(MEMBER_ID, DELSTATUS);
	     int notiListCount = notificationService.getNotificationCount(MEMBER_ID, DELSTATUS);
	     
	     Map<String, Object> map = new HashMap<>();
	     map.put("notificationList",notificationList);
	     map.put("notiListCount",notiListCount);
	     
	     return map;
	 }

	  @RequestMapping("/notification/remove")
	  @ResponseBody
	  public void removeNotification(@RequestParam("NOTI_NUM") int NOTI_NUM) {
	    notificationService.removeNotification(NOTI_NUM);
	  }

	  @RequestMapping("/notification/noti_count")
	  @ResponseBody
	  public int getNotificationCount(HttpSession session) {
	      Member member = (Member) session.getAttribute("member");
	      String MEMBER_ID = member.getMEMBER_ID();
	      int DELSTATUS = 0;
	      return notificationService.getNotificationCount(MEMBER_ID, DELSTATUS);
	  }
	}