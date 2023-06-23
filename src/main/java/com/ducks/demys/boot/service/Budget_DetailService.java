package com.ducks.demys.boot.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.Budget_DetailRepository;
import com.ducks.demys.boot.repository.ProjectsRepository;
import com.ducks.demys.boot.vo.Budget_Detail;
import com.ducks.demys.boot.vo.Projects;

@Service
public class Budget_DetailService {
   
   private Budget_DetailRepository budget_DetailRepository;
   private ProjectsRepository projectsRepository;
   
   public Budget_DetailService(Budget_DetailRepository budget_DetailRepository, ProjectsRepository projectsRepository) {
      this.budget_DetailRepository= budget_DetailRepository;
      this.projectsRepository= projectsRepository;
   }
   
   public List<Budget_Detail> getBuddtListByBUD_NUM(int BUD_NUM){
      return budget_DetailRepository.getBuddtListByBUD_NUM(BUD_NUM);
   }
   
   
   public Map<String, Object> getBuddtCal (int PJ_NUM) {
      List<Budget_Detail> BudgetTotal = budget_DetailRepository.getBuddtListByBUD_NUM(PJ_NUM);
      // 예상 지출액
      int BUDDT_TOTAL = 0;
      for(Budget_Detail TOTAL: BudgetTotal) {
         BUDDT_TOTAL += TOTAL.getBUDDT_COST();
      }
      Projects budget_plus = projectsRepository.getPJByPJ_NUM(PJ_NUM);
      // 예상매출이익
      int PLUS_COST = 0;
      PLUS_COST = budget_plus.getPJ_PRICE() - BUDDT_TOTAL;
      
      // 예상매출 이익률
      double PLUS_COST_Per = 0;
      try {
          if (PLUS_COST != 0) {
              PLUS_COST_Per = ((double) PLUS_COST / budget_plus.getPJ_PRICE()) * 100;
          }
      } catch (Exception e) {
          e.printStackTrace();
      }
      
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("BUDDT_TOTAL", BUDDT_TOTAL);
      map.put("PLUS_COST", PLUS_COST);
      map.put("PLUS_COST_Per", PLUS_COST_Per);
      
      return map;
   }
   
   public int getBuddtListByBUD_NUMCount(int BUD_NUM) {
      return budget_DetailRepository.getBuddtListByBUD_NUMCount(BUD_NUM);
   }
   
   public Budget_Detail getBuddtByBUDDT_NUM(int BUDDT_NUM) {
      return budget_DetailRepository.getBuddtByBUDDT_NUM(BUDDT_NUM);
   }
   
   public void registBUDDT(Budget_Detail buddt) {
      buddt.setBUDDT_NUM(budget_DetailRepository.selectBuddtSequenceNextValue());
      budget_DetailRepository.registBUDDT(buddt);
   }
   
   public void modifyBUDDT(Budget_Detail buddt) {
      budget_DetailRepository.modifyBUDDT(buddt);
   }
   
   public void removeBUDDT(int BUDDT_NUM) {
      budget_DetailRepository.removeBUDDT(BUDDT_NUM);
   }

   
}