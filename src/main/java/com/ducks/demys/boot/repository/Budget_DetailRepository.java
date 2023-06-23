package com.ducks.demys.boot.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ducks.demys.boot.vo.Budget_Detail;

@Mapper
public interface Budget_DetailRepository {

   public List<Budget_Detail> getBuddtListByBUD_NUM(int BUD_NUM);
   
   public int getBuddtListByBUD_NUMCount(int BUD_NUM);
   
   public Budget_Detail getBuddtByBUDDT_NUM(int BUDDT_NUM);
   
   public int selectBuddtSequenceNextValue();
   
   public void registBUDDT(Budget_Detail buddt);
   
   public void modifyBUDDT(Budget_Detail buddt);
   
   public void removeBUDDT(int BUDDT_NUM);

}