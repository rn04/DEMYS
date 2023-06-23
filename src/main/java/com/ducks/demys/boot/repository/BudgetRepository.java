package com.ducks.demys.boot.repository;

import org.apache.ibatis.annotations.Mapper;

import com.ducks.demys.boot.vo.Budget;

@Mapper
public interface BudgetRepository {
	
	public Budget getBudgetByBudget_NUM(int BUD_NUM);

	public Budget getBudgetByPJ_NUM(int PJ_NUM);
	
	public int selectBudgetSequenceNextValue();
	
	public void registBudget(Budget budget);
	
	public void modifyBudget(Budget budget);
	
	public void removeBudget(int BUD_NUM);
}