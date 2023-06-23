package com.ducks.demys.boot.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ducks.demys.boot.service.BudgetService;
import com.ducks.demys.boot.service.Budget_DetailService;
import com.ducks.demys.boot.service.ProjectsService;
import com.ducks.demys.boot.vo.Budget_Detail;
import com.ducks.demys.boot.vo.Member;
import com.ducks.demys.boot.vo.Projects;

import jakarta.servlet.http.HttpSession;

@Controller
public class BudgetController {
   Budget_DetailService budgetdetailService;
   ProjectsService projectsService;
   
   public BudgetController(BudgetService budgetService, ProjectsService projectsService, Budget_DetailService budgetdetailService) {
      this.budgetdetailService = budgetdetailService;
      this.projectsService = projectsService;
   }
   
   @RequestMapping("budget/budget_go")
   public String showBudgetMain(Model model, int PJ_NUM) {
     Projects projects = projectsService.getPJByPJ_NUM(PJ_NUM);
     
   //  List<Budget_Detail> budgetDetailList = budgetdetailService.getBuddtListByBUD_NUM(PJ_NUM);
     Map<String, Object> map = budgetdetailService.getBuddtCal(PJ_NUM);

     model.addAttribute("projects",projects);
     
     model.addAttribute("BUDDT_TOTAL",map.get("BUDDT_TOTAL"));
     model.addAttribute("PLUS_COST",map.get("PLUS_COST"));
     model.addAttribute("PLUS_COST_Per",map.get("PLUS_COST_Per"));
      
     return "budget/list";
   }

   @RequestMapping("budget/list")
   public void showBudgetList() {}
   
   @RequestMapping("budget/detail_go")
   public String showBudgetDetail(HttpSession session , Model model, int PJ_NUM) {
      Member member = (Member)session.getAttribute("member");
      
      Projects projects = projectsService.getPJByPJ_NUM(PJ_NUM);
//      Budget_Detail budgetDetail = budgetdetailService.getBuddtByBUDDT_NUM(PJ_NUM);
      List<Budget_Detail> budgetDetailList = budgetdetailService.getBuddtListByBUD_NUM(PJ_NUM);
      int budgetDetailListCount = budgetdetailService.getBuddtListByBUD_NUMCount(PJ_NUM);
      Map<String, Object> map = budgetdetailService.getBuddtCal(PJ_NUM);
      
      model.addAttribute("projects",projects);
//      model.addAttribute("budgetDetail",budgetDetail);
      model.addAttribute("budgetDetailList",budgetDetailList);
      model.addAttribute("budgetDetailListCount",budgetDetailListCount);
      model.addAttribute("BUDDT_TOTAL",map.get("BUDDT_TOTAL"));
      model.addAttribute("PLUS_COST",map.get("PLUS_COST"));
      model.addAttribute("PLUS_COST_Per",map.get("PLUS_COST_Per"));
      //BUD_STATUS
      
      int budget_status = projects.getBUDGET_STATUS();
      // 조건1. 예산 작성중:0, 진행중:1, 승인:2, 반려:3
      
      
      if(budget_status == 0) {
         if(member.getMEMBER_AUTHORITY()==2 || member.getMEMBER_AUTHORITY()==3) {
            return "budget/regist";            
         }
         else {
            model.addAttribute("alertScript","alert('예산서 등록권한이 없습니다.')");
            return "budget/list";
         }
      }
      else if(budget_status == 1 ) {
         if(member.getMEMBER_AUTHORITY() == 3) {
            return "budget/detail";            
         }
         else {
            model.addAttribute("alertScript","alert('미승인된 예산서 입니다.')");
            return "budget/list";
         }
      }
      else if(budget_status == 3 ) {
         model.addAttribute("alertScript","alert('반려된 예산서 입니다.')");
         return "budget/list";
      }
      else {
         return "budget/detail";
      }
      
      
   }
   
   @RequestMapping("budget/regist")
   public void showBudgetRegist() {
      
   }
   
   @RequestMapping("budget/regist_do")
   @ResponseBody
   public void BudgetRegist_do(@RequestBody Budget_Detail buddt) {
      budgetdetailService.registBUDDT(buddt);
   }
   @RequestMapping("budget/registModi_do")
   @ResponseBody
   public void BudgetRegistModi_do(@RequestBody Projects projects) {
      projectsService.modifyPJBudget(projects);
   }
   
   
}



