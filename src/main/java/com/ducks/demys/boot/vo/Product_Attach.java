package com.ducks.demys.boot.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Product_Attach {
	
	private int PDAT_NUM;
	private String PDAT_FILENAME;
	private String PDAT_FILETYPE;
	private String PDAT_UPLOADPATH;
	private Date PDAT_REGDATE;
	private int PRODUCT_NUM;

}
