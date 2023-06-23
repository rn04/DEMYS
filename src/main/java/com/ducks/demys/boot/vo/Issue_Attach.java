package com.ducks.demys.boot.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Issue_Attach {
	
	private int ISSUEAT_NUM;
	private String ISSUEAT_FILENAME;
	private String ISSUEAT_FILETYPE;
	private String ISSUEAT_UPLOADPATH;
	private Date ISSUEAT_REGDATE;
	private int ISSUE_NUM;

}
