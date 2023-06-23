package com.ducks.demys.boot.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ducks.demys.boot.service.UnitworkService;
import com.ducks.demys.boot.vo.Member;
import com.ducks.demys.boot.vo.Unitwork;

import jakarta.servlet.http.HttpSession;

@Controller
public class UnitworkController {

   private UnitworkService unitworkService;

   public UnitworkController(UnitworkService unitworkService) {
      this.unitworkService = unitworkService;

   }

   //팀장
     @RequestMapping("/project/unitwork_go") 
     public String showListPM(Model model, @RequestParam("PJ_NUM") int PJ_NUM) {
     
        List<Unitwork> unitWorkList = unitworkService.getUnitworkListPM(PJ_NUM);
        model.addAttribute("unitWorkList", unitWorkList);
     
        return "/project/unitworkPM"; 
    }

     @RequestMapping("/project/unitworkPM")
     @ResponseBody
     public List<Unitwork> loadUnitworkDataPM(Model model, @RequestParam("PJ_NUM") int PJ_NUM) {
        List<Unitwork> unitworkData = unitworkService.getUnitworkListPM(PJ_NUM);
        model.addAttribute("unitworkData", unitworkData);
        return unitworkData;
     }

     
   //팀원
     @RequestMapping("/project/unitwork_gogo") 
     public String showListPA(Model model, @RequestParam("PJ_NUM") int PJ_NUM) {
        
        List<Unitwork> unitWorkList = unitworkService.getUnitworkListPA(PJ_NUM);
        model.addAttribute("unitWorkList", unitWorkList);
        
        return "/project/unitworkPA"; 
     }
   
     @RequestMapping("/project/unitworkPA")
     @ResponseBody
     public List<Unitwork> loadUnitworkDataPA(@RequestParam("PJ_NUM") int PJ_NUM, HttpSession session) {
         Member member = (Member) session.getAttribute("member");
         int loggedInMemberNum = member.getMEMBER_NUM();

         List<Unitwork> unitworkData = unitworkService.getUnitworkListPM(PJ_NUM);

         List<Unitwork> filteredUnitworkData = new ArrayList<>();

         for (Unitwork unitwork : unitworkData) {
             if (unitwork.getMEMBER_NUM() == loggedInMemberNum) {
                 filteredUnitworkData.add(unitwork);
             }
         }

         return filteredUnitworkData;
     }

     @RequestMapping( "/project/unitwork/update")
     @ResponseBody
   public String updateUnitwork(Model model, @RequestParam("uw_NUM") int UW_NUM, @RequestParam("uw_NAME") String UW_NAME, @RequestParam("uw_STARTDATE") Date UW_STARTDATE, @RequestParam("uw_ENDDATE") Date UW_ENDDATE,@RequestParam("uw_PERCENT")  Double UW_PERCENT, @RequestParam("uw_STATUS") int UW_STATUS) {
      unitworkService.modifyUnitwork(UW_NUM, UW_NAME, UW_STARTDATE, UW_ENDDATE, UW_PERCENT, UW_STATUS);
       return "/project/unitwork/update";
   }   
   
   
     @RequestMapping("/project/unitwork/create")
     @ResponseBody public int createUnitwork() {
     int UW_NUM = unitworkService.registUnitwork();
     return UW_NUM;
     }
    
    
        @RequestMapping("/project/unitwork/destroy")
      @ResponseBody
      public void removeUnitwork(@RequestParam("uw_NUM") int UW_NUM) {
      unitworkService.removeUnitwork(UW_NUM);

        }
}