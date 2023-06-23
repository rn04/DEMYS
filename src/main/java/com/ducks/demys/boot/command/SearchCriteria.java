package com.ducks.demys.boot.command;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchCriteria {
	private int page; // 해당, 현재페이지
	private int perPageNum; // 페이지안에 있는 컬럼갯수(게시글갯수)
	private String keyword; // 검색어
	private String searchType; // 검색어종류

	
	 
//	 public void setPage(String page) { 
//		 this.page = Integer.parseInt(page); 
//	}
//	 
//	 public void setPerPageNum(String perPageNum) { 
//		 this.perPageNum = Integer.parseInt(perPageNum); 
//	 }
	

	// DAO에서 사용, 각페이지 시작 행번호
	public int getStartRow() {
		return (this.page - 1) * this.perPageNum;
	}
	public int getEndRow() {
		return ((this.page - 1) * this.perPageNum) + this.perPageNum;
	}

}
