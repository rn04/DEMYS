package com.ducks.demys.boot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.PjctRepository;
import com.ducks.demys.boot.vo.Pjct;

@Service
public class PjctService {
	
	private PjctRepository pjctRepository;
	
	public PjctService(PjctRepository pjctRepository) {
		this.pjctRepository= pjctRepository;
	}
	public List<Pjct> getContactsPjctList(){
		return pjctRepository.getContactsPjctList();
	}
	public int getContactsPjctListCount(int PJ_NUM) {
		return pjctRepository.getContactsPjctListCount(PJ_NUM);
	}
	public List<Pjct> getContactsPjctList(int PJ_NUM){
		return pjctRepository.getContactsPjctList(PJ_NUM);
	}
	
	
	public List<Pjct> getPjctListByPJ_NUM(int PJ_NUM){
		return pjctRepository.getPjctListByPJ_NUM(PJ_NUM);
	}
	
	public List<Pjct> getPjctListByCT_NUM(int CT_NUM){
		return pjctRepository.getPjctListByCT_NUM(CT_NUM);
	}
	
	public Pjct getPjctByPjct_NUM(int PJCT_NUM){
		return pjctRepository.getPjctByPjct_NUM(PJCT_NUM);
	}
	
	public void registPjct(Pjct pjct) {
		pjct.setPJCT_NUM(pjctRepository.selectPjctSequenceNextValue());
		pjctRepository.registPjct(pjct);
	}
	
	public void modifyPjct(Pjct Pjct) {
		pjctRepository.modifyPjct(Pjct);
	}
	
	public void removePjct(int PJCT_NUM) {
		pjctRepository.removePjct(PJCT_NUM);
	}
	
}
