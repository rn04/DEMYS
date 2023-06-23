package com.ducks.demys.boot.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Unitwork {
   
   private int UW_NUM;
   private String UW_NAME;
   private Date UW_STARTDATE;
   private Date UW_ENDDATE;
   private Double UW_PERCENT;
   private int UW_STATUS;
   private String UW_NOTE;
   private int MEMBER_NUM;
   private int PJ_NUM;

   private String MEMBER_NAME;

}