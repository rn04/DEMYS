package com.ducks.demys.boot.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class IssueReply {
   
   private int ISSUERE_NUM;
   private String ISSUERE_CONTENT;
   private Date ISSUERE_REGDATE;
   private Date ISSUERE_UPDATEDATE;
   private String STRING_UPDATEDATE;
   private int MEMBER_NUM;
   private int ISSUE_NUM;
   private String MEMBER_NAME;
   private int ISSUERE_COUNT;
   private String MEMBER_ID;

}