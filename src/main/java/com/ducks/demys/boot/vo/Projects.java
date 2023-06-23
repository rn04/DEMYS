package com.ducks.demys.boot.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Projects {

   private int PJ_NUM;
   private String PJ_NAME;
   private Date PJ_STARTDATE;
   private String STRING_STARTDATE;
   private Date PJ_ENDDATE;
   private String STRING_ENDDATE;
   private Date PJ_REGDATE;
   private Date PJ_UPDATEDATE;
   private int PJ_IMP;
   private String PJ_CONTENT;
   private int PJ_SATUS;
   private int PJ_TYPE;
   private String PJ_FIELD;
   private String PJ_GIT;
   private int PJ_PRICE;
   private int MEMBER_NUM;
   private int CT_NUM;
   private int SUM_PERCENT;
   private String CT_NAME;
   private String MEMBER_NAME;
   private int ISSUE_COUNT;
   private int DDAY;
   private int BUDGET_STATUS;
}