package com.ducks.demys.boot.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductForSearch {
	
	private int PRODUCT_STEP;
	private int PJ_NUM;
	private String searchType;
	private String keyword;

}
