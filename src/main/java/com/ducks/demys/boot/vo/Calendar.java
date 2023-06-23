package com.ducks.demys.boot.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Calendar {
   
   private int SC_NUM;
   private String SC_NAME;
   private String SC_CONTENT;
   private int SC_IMP;
   private String SC_TYPE;
   private Timestamp SC_STARTDATE;
   private String START;
   private Timestamp SC_ENDDATE;
   private String END;
   private Date SC_REGDATE;
   private Date SC_UPDATEDATE;
   private String SC_PLACE;
   private int SC_STATUS;
   private int PJ_NUM;
   private int MEMBER_NUM;
   private int TASKS_NUM;   
   private String title;
   
   private String PJ_NAME;
   
   private String BACKGROUNDCOLOR;
   private String TEXTCOLOR;
   private String BORDERCOLOR;


}