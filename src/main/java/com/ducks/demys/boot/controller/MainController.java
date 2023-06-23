package com.ducks.demys.boot.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ducks.demys.boot.service.IssueService;
import com.ducks.demys.boot.service.Issue_TagService;
import com.ducks.demys.boot.service.MemberService;
import com.ducks.demys.boot.service.ProjectsService;
import com.ducks.demys.boot.vo.Issue;
import com.ducks.demys.boot.vo.Issue_Tag;
import com.ducks.demys.boot.vo.Member;
import com.ducks.demys.boot.vo.Projects;
import com.ducks.demys.boot.vo.ProjectsForPrint;
import com.ducks.demys.boot.vo.Tasks;

import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {
   
   MemberService memberService;
   ProjectsService projectsService;
   IssueService issueService;
   Issue_TagService issue_TagService;
   
   public MainController(MemberService memberService, ProjectsService projectsService, IssueService issueService, Issue_TagService issue_TagService) {
      this.memberService=memberService;
      this.projectsService=projectsService;
      this.issueService=issueService;
      this.issue_TagService=issue_TagService;
   }
   
   @RequestMapping("/main")
   public String showMain(Model model, HttpSession session){
      if(session.getAttribute("member")==null) {
         return "redirect:/member/login";
      }else {
         
         int ing = projectsService.getPJListSTATUSCount(1);
         int delay = projectsService.getPJListSTATUSCount(2);
         int success = projectsService.getPJListSTATUSCount(3);
         int fail = projectsService.getPJListSTATUSCount(4);
         int total=projectsService.getPJListCountForDashboard();
         
         List<Projects> pjList=projectsService.getPJListOrderByPJ_ENDDATE();
         
         List<Issue> issueList=issueService.getIssueListForBottomDashboard(0, "end");
         
         model.addAttribute("ing", ing);
         model.addAttribute("delay", delay);
         model.addAttribute("success", success);
         model.addAttribute("fail", fail);
         model.addAttribute("total", total);
         model.addAttribute("pjList", pjList);
         model.addAttribute("issueList", issueList);
         
         return "/main";
      }
      
   }
   
   @RequestMapping("/projecting")
   @ResponseBody
   public List<ProjectsForPrint> showProjectingList(@RequestBody ProjectsForPrint pj){
      int MEMBER_NUM=pj.getMEMBER_NUM();
      int PJ_IMP=pj.getPJ_IMP();
      String SORT=pj.getSORT();
      List<ProjectsForPrint> projects = projectsService.getPJListForDashboard(MEMBER_NUM, PJ_IMP, SORT);
      return projects;
   }
   @RequestMapping("/issueing")
   @ResponseBody//@RequestBody Issue issue
   public Map<String, Object> showissueingList(){
//      int MYISSUE=issue.getMYISSUE();
//      String SORT=issue.getSORT();
      Map<String, Object> dataMap = new HashMap<String, Object>();
      
      List<Issue> issueList = issueService.getIssueListForBottomDashboard(0, "end");
      List<Issue> Imp1List=new ArrayList<Issue>();
      List<Issue> Imp2List=new ArrayList<Issue>();
      List<Issue> Imp3List=new ArrayList<Issue>();
      int Imp1ListCount =0;
      int Imp2ListCount =0;
      int Imp3ListCount =0;
      for(Issue issueImp : issueList) {
         if(issueImp.getISSUE_IMP()==3) {
            Imp3List.add(issueImp);
            Imp3ListCount++;
         }
         if(issueImp.getISSUE_IMP()==2) {
            Imp2List.add(issueImp);
            Imp2ListCount++;
         }
         if(issueImp.getISSUE_IMP()==1) {
            Imp1List.add(issueImp);
            Imp1ListCount++;
         }
      }
      dataMap.put("Imp1List", Imp1List);
      dataMap.put("Imp2List", Imp2List);
      dataMap.put("Imp3List", Imp3List);
      dataMap.put("Imp1ListCount", Imp1ListCount);
      dataMap.put("Imp2ListCount", Imp2ListCount);
      dataMap.put("Imp3ListCount", Imp3ListCount);

      return dataMap;
   }
   
   @RequestMapping("/mainIssue2")
   public void showissue(){
   }
   @RequestMapping("/login")
   public void showlogin(){
   }
}