package com.ducks.demys.boot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.IssueRepository;
import com.ducks.demys.boot.repository.Issue_TagRepository;
import com.ducks.demys.boot.vo.Issue;
import com.ducks.demys.boot.vo.Issue_Tag;

@Service
public class IssueService {

   private IssueRepository issueRepository;
   private Issue_TagRepository issue_TagRepository;

   public IssueService(IssueRepository issueRepository, Issue_TagRepository issue_TagRepository) {
      this.issueRepository = issueRepository;
      this.issue_TagRepository = issue_TagRepository;
   }

//   public List<Issue> getIssueList(){
//      return issueRepository.getIssueList();
//   }

   public List<Issue> getIssueListForDashboard() {
      return issueRepository.getIssueListForDashboard();
   }

   public List<Issue> getIssueListForBottomDashboard(int MYISSUE, String SORT) {
      List<Issue> issueList = issueRepository.getIssueListForBottomDashboard(MYISSUE, SORT);
      if (issueList != null && issueList.size() > 0) {
         for (Issue issue : issueList) {
            List<Issue_Tag> tagList = issue_TagRepository.getIssue_TagByListISSUE_NUM(issue.getISSUE_NUM());
            issue.setTagList(tagList);
         }
      }
      return issueList;
   }

//   public List<Issue> getIssueListByMEMBER_NUM(int MEMBER_NUM){
//      return issueRepository.getIssueListByMEMBER_NUM(MEMBER_NUM);
//   }

   public Issue getIssueByISSUE_NUM(int ISSUE_NUM) {
      
      Issue issue = issueRepository.getIssueByISSUE_NUM(ISSUE_NUM);
      
      List<Issue_Tag> issueTagList =  issue_TagRepository.getIssue_TagByListISSUE_NUM(issue.getISSUE_NUM());
      
      if(issueTagList != null && issueTagList.size()>0) {
         
            issue.setTagList(issueTagList);
      }
      
      return issue;
   }

   public void registIssue(Issue issue) {
      int issue_num = issueRepository.selectIssueSequenceNextValue();
      issue.setISSUE_NUM(issue_num);
      String memberNumbers[] = issue.getMemberList().split(" ");
      
      issueRepository.registIssue(issue);
      
      if(memberNumbers != null && memberNumbers.length > 0) {
         for(String numbers : memberNumbers) {
            Issue_Tag issuetag = new Issue_Tag();
            issuetag.setISSUETAG_NUM(issue_TagRepository.selectIssue_TagSequenceNextValue());
            issuetag.setMEMBER_NUM(numbers.trim());
            issuetag.setISSUE_NUM(issue_num);
            System.out.println(issuetag);
            issue_TagRepository.registIssue_Tag(issuetag);
         }
      }
      
      
      
   }

   public void modifyIssue(Issue Issue) {
      issueRepository.modifyIssue(Issue);
   }

   public void removeIssue(int ISSUE_NUM) {
      issueRepository.removeIssue(ISSUE_NUM);
   }

   public List<Issue> getIssueListByPJ_NUM(int PJ_NUM) {
      return issueRepository.getIssueListByPJ_NUM(PJ_NUM);
   }

}