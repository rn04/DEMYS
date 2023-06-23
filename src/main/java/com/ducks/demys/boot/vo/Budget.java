package com.ducks.demys.boot.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Budget {
	
	private int BUD_NUM;
	private String BUD_TYPE;
	private int BUD_STATUS;
	private Date BUD_REGDATE;
	private Date BUD_UPDATEDATE;
	private int PJ_NUM;
	private int MEMBER_NUM;
	private int BUD_PRICE;
	private String PJ_NAME; 

}
