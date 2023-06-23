package com.ducks.demys.boot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.RequireRepository;
import com.ducks.demys.boot.vo.Require;

@Service
public class RequireService {
   
   private RequireRepository requireRepository;
   
   public RequireService(RequireRepository requireRepository) {
      this.requireRepository= requireRepository;
   }

   public List<Require> getRequireListByPJ_NUM(int PJ_NUM){
      return requireRepository.getRequireListByPJ_NUM(PJ_NUM);
   }
   
   public List<Require> getSearchRequire(String searchKeywordTypeCode, String searchKeyword, int PJ_NUM) {
      List<Require> require = requireRepository.getSearchRequire(searchKeywordTypeCode, searchKeyword,PJ_NUM);
      return require;
   }

   public Require getRequireByREQUIRE_NUM(int REQUIRE_NUM){
      Require requireList = requireRepository.getRequireByREQUIRE_NUM(REQUIRE_NUM);
      return requireList;
   }
   
   public void registRequire(Require require) {
      require.setREQUIRE_NUM(requireRepository.selectRequireSequenceNextValue());
      requireRepository.registRequire(require);
   }
   
   public void modifyRequire(Require require) {
      requireRepository.modifyRequire(require);
   }
   
   public void removeRequire(int REQUIRE_NUM) {
      requireRepository.removeRequire(REQUIRE_NUM);
   }
}