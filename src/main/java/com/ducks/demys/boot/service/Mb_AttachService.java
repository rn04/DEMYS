package com.ducks.demys.boot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.Mb_AttachRepository;
import com.ducks.demys.boot.vo.Mb_Attach;

@Service
public class Mb_AttachService {
	
	private Mb_AttachRepository mb_AttachRepository;
	
	public Mb_AttachService(Mb_AttachRepository mb_AttachRepository) {
		this.mb_AttachRepository= mb_AttachRepository;
	}
	
	public List<Mb_Attach> getMb_AttachListByMB_NUM(int MB_NUM){
		return mb_AttachRepository.getMb_AttachListByMB_NUM(MB_NUM);
	}

	
	public Mb_Attach getMbatByMBAT_NUM(int MBAT_NUM) {
		return mb_AttachRepository.getMbatByMBAT_NUM(MBAT_NUM);
	}
	
	public void registMb_Attach(Mb_Attach mbat) {
		mbat.setMBAT_NUM(mb_AttachRepository.selectMb_AttachSequenceNextValue());
		mb_AttachRepository.registMb_Attach(mbat);
	}
	
	public void removeMb_Attach(int MBAT_NUM) {
		mb_AttachRepository.removeMb_Attach(MBAT_NUM);
	}
	
	public void removeMb_AttachAll(int MB_NUM) {
		mb_AttachRepository.removeMb_AttachAll(MB_NUM);
	}
}
