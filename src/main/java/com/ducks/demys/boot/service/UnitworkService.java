package com.ducks.demys.boot.service;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.UnitworkRepository;
import com.ducks.demys.boot.vo.Unitwork;

@Service
public class UnitworkService {
   
   private UnitworkRepository unitworkRepository;
   
   public UnitworkService(UnitworkRepository unitworkRepository) {
      this.unitworkRepository= unitworkRepository;
   }
   
   public List<Unitwork> getUnitworkListPM(int PJ_NUM){
      List<Unitwork> unitworkData = unitworkRepository.getUnitworkListPM(PJ_NUM);
      return unitworkData;
   }

   public List<Unitwork> getUnitworkListPA(int PJ_NUM){
      List<Unitwork> unitworkData = unitworkRepository.getUnitworkListPA(PJ_NUM);
      return unitworkData;
   }
   
   public List<Unitwork> getUnitworkListByMEMBER_NUM(int MEMBER_NUM){
      return unitworkRepository.getUnitworkListByMEMBER_NUM(MEMBER_NUM);
   }

   
   public List<Unitwork> getUnitworkByUW_NUM(int UW_NUM) {
      return unitworkRepository.getUnitworkByUW_NUM(UW_NUM);
   }
   
   public int registUnitwork() {
      int UW_NUM=unitworkRepository.selectUnitworkSequenceNextValue();
      unitworkRepository.registUnitwork(UW_NUM);
      return UW_NUM;
   }
   
   public void modifyUnitwork(int UW_NUM, String UW_NAME, Date UW_STARTDATE, Date UW_ENDDATE, Double UW_PERCENT, int UW_STATUS) {
      System.out.println(UW_NUM);
      unitworkRepository.modifyUnitwork(UW_NUM, UW_NAME, UW_STARTDATE, UW_ENDDATE, UW_PERCENT, UW_STATUS);
      
   }

   public void removeUnitwork(int UW_NUM) {
      unitworkRepository.removeUnitwork(UW_NUM);
   }
}