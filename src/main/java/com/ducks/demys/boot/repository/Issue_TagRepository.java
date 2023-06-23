package com.ducks.demys.boot.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ducks.demys.boot.vo.Issue_Tag;

@Mapper
public interface Issue_TagRepository {

   public List<Issue_Tag> getIssue_TagList();
   
   public List<Issue_Tag> getIssue_TagListByPJ_NUM(int PJ_NUM);
   
   public List<Issue_Tag> getIssue_TagListByMEMBER_NUM(int MEMBER_NUM);
         
   public List<Issue_Tag> getIssue_TagByListISSUE_NUM(int ISSUE_NUM);

   public int selectIssue_TagSequenceNextValue();
   
   public void registIssue_Tag(Issue_Tag issuetag);
   
   public void modifyIssue_Tag(Issue_Tag issuetag);
   
   public void removeIssue_Tag(int ISSUETAG_NUM);
}