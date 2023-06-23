package com.ducks.demys.boot.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ducks.demys.boot.vo.Sc_Tag;

@Mapper
public interface Sc_TagRepository {
	
	public List<Sc_Tag> getSc_TagListByMEMBER_NUM(int MEMBER_NUM);

	public List<Sc_Tag> getSc_TagListBySC_NUM(int SC_NUM);
	
	public Sc_Tag getSc_TagBySCTAG_NUM(int SCTAG_NUM);
	
	public int selectSc_TagSequenceNextValue();
	
	public void registSc_Tag(Sc_Tag sctag);
	
	public void modifySc_Tag(Sc_Tag sctag);
	
	public void removeSc_Tag(int SCTAG_NUM);
}
