package com.ducks.demys.boot.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
public class ProjectsForPrint {

	private int PJ_NUM;
	private String PJ_NAME;
	private Date PJ_STARTDATE;
	private Date PJ_ENDDATE;
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
	
	private String MEMBER_NAME;
	private String CT_NAME;
	private int SUM_PERCENT;
	private int ISSUE_COUNT;
	
	private String SORT;
	
}
