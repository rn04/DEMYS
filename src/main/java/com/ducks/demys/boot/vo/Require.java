package com.ducks.demys.boot.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Require {
	
	private int REQUIRE_NUM;
	private int REQUIRE_LEVEL;
	private String REQUIRE_TITLE;
	private String REQUIRE_DETAIL;
	private Date REQUIRE_REGDATE;
	private int MEMBER_NUM;
	private int PJ_NUM;
	private int CT_NUM;
	private String MEMBER_NAME;

}
