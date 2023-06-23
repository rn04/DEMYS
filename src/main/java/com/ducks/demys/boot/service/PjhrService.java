package com.ducks.demys.boot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.PjhrRepository;
import com.ducks.demys.boot.vo.Pjhr;

@Service
public class PjhrService {
	
	private PjhrRepository pjhrRepository;
	
	public PjhrService(PjhrRepository pjhrRepository) {
		this.pjhrRepository= pjhrRepository;
	}
	
	public List<Pjhr> getPjhrListByPJ_NUM(int PJ_NUM){
		return pjhrRepository.getPjhrListByPJ_NUM(PJ_NUM);
	}
	public int getPjhrListByPJ_NUMCount(int PJ_NUM){
		return pjhrRepository.getPjhrListByPJ_NUMCount(PJ_NUM);
	}
	
	public List<Pjhr> getPjhrListByMEMBER_NUM(int MEMBER_NUM){
		return pjhrRepository.getPjhrListByMEMBER_NUM(MEMBER_NUM);
	}
	
	public Pjhr getPjhrByPJHR_NUM(int PJHR_NUM){
		return pjhrRepository.getPjhrByPJHR_NUM(PJHR_NUM);
	}
	
	public void registPjhr(Pjhr Pjhr) {
		Pjhr.setPJHR_NUM(pjhrRepository.selectPjhrSequenceNextValue());
		System.out.println(Pjhr);
		System.out.println("번호: "+ Pjhr.getPJHR_NUM());
		pjhrRepository.registPjhr(Pjhr);
	}
	
	public void modifyPjhr(Pjhr Pjhr) {
		pjhrRepository.modifyPjhr(Pjhr);
	}
	
	public void removePjhr(int PJHR_NUM) {
		pjhrRepository.removePjhr(PJHR_NUM);
	}
}
