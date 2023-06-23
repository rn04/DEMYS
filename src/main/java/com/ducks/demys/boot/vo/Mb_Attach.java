package com.ducks.demys.boot.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Mb_Attach {
	
	private int MBAT_NUM;
	private String MBAT_FILENAME;
	private String MBAT_FILETYPE;
	private String MBAT_UPLOADPATH;
	private Date MBAT_REGDATE;
	private int MB_NUM;

}
