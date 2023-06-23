package com.ducks.demys.boot.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Contacts {

	private int CT_NUM;
	private String CT_NAME;
	private String CT_TEL;
	private String CT_CEO;
	private String CT_MANAGER;
	private String CT_MG_TEL;
	private Date CT_REGDATE;
	private Date CT_UPDATEDATE;
	private int CT_TYPE;
	private String CT_ADDR;
	private String CT_EMAIL;
	private String CT_FAX;

}
