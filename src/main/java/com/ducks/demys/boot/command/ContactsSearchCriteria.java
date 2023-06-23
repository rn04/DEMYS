package com.ducks.demys.boot.command;

public class ContactsSearchCriteria {
	
	private int page;
	private int perPageNum;
	private String searchType;
	private String keyword;
	private int CT_TYPE;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public void setPage(String page) {
		this.page = Integer.parseInt(page);
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	public void setPerPageNum(String perPageNum) {
		this.perPageNum = Integer.parseInt(perPageNum);
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getCT_TYPE() {
		return CT_TYPE;
	}
	public void setCT_TYPE(int CT_TYPE) {
		this.CT_TYPE = CT_TYPE;
	}
	public void setCT_TYPE(String CT_TYPE) {
		this.CT_TYPE = Integer.parseInt(CT_TYPE);
	}
	
	public int getStartRowNum() {
		return (this.page-1)*this.perPageNum;
	}
}
