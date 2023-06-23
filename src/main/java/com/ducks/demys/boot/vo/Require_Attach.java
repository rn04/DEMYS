package com.ducks.demys.boot.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Require_Attach {
	
	private int RQAT_NUM;
	private String RQAT_FILENAME;
	private String RQAT_FILETYPE;
	private String RQAT_UPLOADPATH;
	private Date RQAT_REGDATE;
	private int REQUIRE_NUM;

}
