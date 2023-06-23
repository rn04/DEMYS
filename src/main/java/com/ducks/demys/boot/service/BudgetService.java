package com.ducks.demys.boot.service;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.BudgetRepository;
import com.ducks.demys.boot.vo.Budget;

@Service
public class BudgetService {
	
	private BudgetRepository budgetRepository;
	
	public BudgetService(BudgetRepository budgetRepository) {
		this.budgetRepository= budgetRepository;
	}
	
	public Budget getBudgetByBudget_NUM(int BUD_NUM) {
		return budgetRepository.getBudgetByBudget_NUM(BUD_NUM);
	}
	
	public Budget getBudgetByPJ_NUM(int PJ_NUM) {
		return budgetRepository.getBudgetByPJ_NUM(PJ_NUM);
	}
	
	public void registBudget(Budget budget) {
		budget.setBUD_NUM(budgetRepository.selectBudgetSequenceNextValue());
		budgetRepository.registBudget(budget);
	}
	
	public void modifyBudget(Budget budget) {
		budgetRepository.modifyBudget(budget);
	}
	
	public void removeBudget(int BUD_NUM) {
		budgetRepository.removeBudget(BUD_NUM);
	}
}
