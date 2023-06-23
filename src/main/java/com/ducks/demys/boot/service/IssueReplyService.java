package com.ducks.demys.boot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.IssueReplyRepository;
import com.ducks.demys.boot.vo.IssueReply;

@Service
public class IssueReplyService {
   
   private IssueReplyRepository issueReplyRepository;
   
   public IssueReplyService(IssueReplyRepository issueReplyRepository) {
      this.issueReplyRepository= issueReplyRepository;
   }
   
   public List<IssueReply> getIssueReplyListByISSUE_NUM(int ISSUE_NUM){
      return issueReplyRepository.getIssueReplyListByISSUE_NUM(ISSUE_NUM);
   }
   
   
   public IssueReply getIssueByISSUERE_NUM(int ISSUERE_NUM) {
      return issueReplyRepository.getIssueByISSUERE_NUM(ISSUERE_NUM);
   }
   
   public void registIssueReply(IssueReply issuere) {
      issuere.setISSUERE_NUM(issueReplyRepository.selectIssueReplyequenceNextValue());
      issueReplyRepository.registIssueReply(issuere);
   }
   
   public void modifyIssueReply(IssueReply issuere) {
      issueReplyRepository.modifyIssueReply(issuere);
   }
   
   public void removeIssueReply(int ISSUERE_NUM) {
      issueReplyRepository.removeIssueReply(ISSUERE_NUM);
   }
   
   public int gethowmanyreply(int ISSUE_NUM) {
      
   return issueReplyRepository.gethowmanyreply(ISSUE_NUM);
   }
   
   
}