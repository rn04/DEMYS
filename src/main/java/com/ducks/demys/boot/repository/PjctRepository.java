package com.ducks.demys.boot.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ducks.demys.boot.vo.Pjct;

@Mapper
public interface PjctRepository {

	public List<Pjct> getContactsPjctList();
	
	public List<Pjct> getContactsPjctList(int PJ_NUM);
	
	public int getContactsPjctListCount(int PJ_NUM);
	
	public List<Pjct> getPjctListByPJ_NUM(int PJ_NUM);

	public List<Pjct> getPjctListByCT_NUM(int CT_NUM);
	
	public Pjct getPjctByPjct_NUM(int PJCT_NUM);
	
	public int selectPjctSequenceNextValue();
	
	public void registPjct(Pjct pjct);
	
	public void modifyPjct(Pjct pjct);
	
	public void removePjct(int PJCT_NUM);
	
}