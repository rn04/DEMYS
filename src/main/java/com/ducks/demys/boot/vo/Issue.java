package com.ducks.demys.boot.vo;

import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Issue {
   
   private int ISSUE_NUM;
   private String ISSUE_TITLE;
   private String ISSUE_CONTENT;
   private int ISSUE_IMP;
   private int ISSUE_STATUS;
   private Date ISSUE_REGDATE;
   private String STRING_REGDATE;
   private Date ISSUE_UPDATEDATE;
   private String STRING_UPDATEDATE;
   private Date ISSUE_DEADLINE;
   private String STRING_DEADLINE;
   private Date ISSUE_ENDDATE;
   private int MEMBER_NUM;
   private int PJ_NUM;
   private String MEMBER_NAME;
   private String PJ_NAME;
   private String CT_NAME;
   private int ISSUEREPLY_COUNT;
   private int MYISSUE;
   private String SORT;
   private String MEMBER_ID;
   private String memberList;
   private List<Issue_Tag> tagList;
   

}