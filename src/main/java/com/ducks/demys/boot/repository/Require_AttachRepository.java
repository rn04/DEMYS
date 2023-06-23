package com.ducks.demys.boot.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ducks.demys.boot.vo.Require_Attach;

@Mapper
public interface Require_AttachRepository {
	
	public List<Require_Attach> getRequire_AttachListByREQUIRE_NUM(int REQUIRE_NUM);
	
	public Require_Attach getRqatByRQAT_NUM(int RQAT_NUM);
	
	public int selectRequire_AttachSequenceNextValue();
	
	public void registRequire_Attach(Require_Attach rqat);
		
	public void removeRequire_Attach(int RQAT_NUM);

	public void removeRequire_AttachAll(int REQUIRE_NUM);
}