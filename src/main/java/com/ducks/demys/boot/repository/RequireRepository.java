package com.ducks.demys.boot.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ducks.demys.boot.vo.Require;

@Mapper
public interface RequireRepository {

	public List<Require> getRequireListByPJ_NUM(int PJ_NUM);
	
	public List<Require> getSearchRequire(String searchKeywordTypeCode,	String searchKeyword, int PJ_NUM);
	
	public Require getRequireByREQUIRE_NUM(int REQUIRE_NUM);
	
	public int selectRequireSequenceNextValue();
	
	public void registRequire(Require require);
	
	public void modifyRequire(Require require);
	
	public void removeRequire(int REQUIRE_NUM);
	
}