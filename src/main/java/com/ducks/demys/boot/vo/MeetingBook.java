package com.ducks.demys.boot.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MeetingBook {
	
	private int MB_NUM;
	private String MB_TITLE;
	private String MB_CONTENT;
	private Date MB_REGDATE;
	private Date MB_UPDATEDATE;
	private int MEMBER_NUM;
	private int PJ_NUM;
	private String MEMBER_NAME;

}
