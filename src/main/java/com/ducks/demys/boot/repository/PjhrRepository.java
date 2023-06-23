package com.ducks.demys.boot.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ducks.demys.boot.vo.Pjhr;

@Mapper
public interface PjhrRepository {

	public List<Pjhr> getPjhrListByPJ_NUM(int PJ_NUM);
	
	public int getPjhrListByPJ_NUMCount(int PJ_NUM);

	public List<Pjhr> getPjhrListByMEMBER_NUM(int MEMBER_NUM);
	
	public Pjhr getPjhrByPJHR_NUM(int PJHR_NUM);
	
	public int selectPjhrSequenceNextValue();
	
	public void registPjhr(Pjhr pjhr);
	
	public void modifyPjhr(Pjhr pjhr);
	
	public void removePjhr(int PJHR_NUM);
	
}