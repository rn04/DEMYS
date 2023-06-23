package com.ducks.demys.boot.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ducks.demys.boot.service.CalendarService;
import com.ducks.demys.boot.service.MemberService;
import com.ducks.demys.boot.service.ProjectsService;
import com.ducks.demys.boot.vo.Calendar;
import com.ducks.demys.boot.vo.Member;
import com.ducks.demys.boot.vo.Projects;

@Controller
public class CalendarController {
   public CalendarService calendarService;
   public ProjectsService projectsService;
   public MemberService memberService;

   public CalendarController(CalendarService calendarService, ProjectsService projectsService,MemberService memberService) {
      this.calendarService = calendarService;
      this.projectsService = projectsService;
      this.memberService = memberService;
   }

   @RequestMapping("/calendar/calendar")
   public String showCalendar(Model model) {
      return "calendar/calendar";
   }

   @RequestMapping("/calendar/getCalendar")
   @ResponseBody
   public List<Calendar> getCalendar(int MEMBER_NUM) {
      Member member = memberService.getMemberByMEMBER_NUM(MEMBER_NUM);

      List<Calendar> calendar = calendarService.getCalendarList(MEMBER_NUM);

      return calendar;
   }
   
   @RequestMapping("/calendar/getCalendardetail")
   @ResponseBody
   public Calendar getCalendardetail(@RequestParam("SC_NUM") int SC_NUM) {
         
         Calendar calendar = calendarService.getCalendardetail(SC_NUM);
         SimpleDateFormat dspformatter = new  SimpleDateFormat("yyyy-MM-dd HH:mm");
         Timestamp startDate = calendar.getSC_STARTDATE();
         Timestamp endDate = calendar.getSC_ENDDATE();
         String stringStartDate = dspformatter.format(startDate);
         String stringEndDate = dspformatter.format(endDate);
         calendar.setSTART(stringStartDate);
         calendar.setEND(stringEndDate);
         return calendar;
   }
   
      
         
   @PostMapping("/calendar/registCalendar")
   public String registCalendar(Calendar sc) {
       Calendar regsc = sc;
       calendarService.registCalendar(regsc);


       // 적절한 응답을 반환
       return "redirect:/calendar/calendar";
   }
   
   @RequestMapping("/calendar/removeCalendar")
   @ResponseBody
   public void removeCalendar(@RequestParam("sc_NUM") int SC_NUM) {
       calendarService.removeCalendar(SC_NUM); 
   }
   
   @RequestMapping("/calendar/getModal_PJList")
   @ResponseBody
   public List<Projects> getModal_PJList(Model model, @RequestParam("member_NUM")int MEMBER_NUM) {
      Member member = memberService.getMemberByMEMBER_NUM(MEMBER_NUM);
      List<Projects> projectList = projectsService.getPJCalList(MEMBER_NUM);
      model.addAttribute("projectList",projectList);
      
       return projectList;
   }
   
   
   
   @RequestMapping("/calendar/modifyCalendar")
   @ResponseBody
   public void modifyCalendar(@RequestBody Calendar sc) {
       calendarService.modifyCalendar(sc);
  
   }
   
}