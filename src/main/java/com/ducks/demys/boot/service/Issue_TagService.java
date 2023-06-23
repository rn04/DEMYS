package com.ducks.demys.boot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.Issue_TagRepository;
import com.ducks.demys.boot.vo.Issue_Tag;

@Service
public class Issue_TagService {
   
   private Issue_TagRepository issue_TagRepository;
   
   public Issue_TagService(Issue_TagRepository issue_TagRepository) {
      this.issue_TagRepository= issue_TagRepository;
   }
   
   public List<Issue_Tag> getIssue_TagList(){
      return issue_TagRepository.getIssue_TagList();
   }
   
   public List<Issue_Tag> getIssue_TagListByPJ_NUM(int PJ_NUM){
      return issue_TagRepository.getIssue_TagListByPJ_NUM(PJ_NUM);
   }
   
   public List<Issue_Tag> getIssue_TagListByMEMBER_NUM(int MEMBER_NUM){
      return issue_TagRepository.getIssue_TagListByMEMBER_NUM(MEMBER_NUM);
   }

   
   public List<Issue_Tag> getIssue_TagByListISSUE_NUM(int ISSUE_NUM) {
      return issue_TagRepository.getIssue_TagByListISSUE_NUM(ISSUE_NUM);
   }
   
   public void registIssue_Tag(Issue_Tag issuetag) {
      issuetag.setISSUETAG_NUM(issue_TagRepository.selectIssue_TagSequenceNextValue());
      issue_TagRepository.registIssue_Tag(issuetag);
   }
   
   public void modifyIssue_Tag(Issue_Tag issuetag) {
      issue_TagRepository.modifyIssue_Tag(issuetag);
   }
   
   public void removeIssue_Tag(int ISSUE_NUM) {
      issue_TagRepository.removeIssue_Tag(ISSUE_NUM);
   }
}