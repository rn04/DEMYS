package com.ducks.demys.boot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.Sc_TagRepository;
import com.ducks.demys.boot.vo.Sc_Tag;

@Service
public class Sc_TagService {
	
	private Sc_TagRepository sc_TagRepository;
	
	public Sc_TagService(Sc_TagRepository sc_TagRepository) {
		this.sc_TagRepository= sc_TagRepository;
	}
	
	public List<Sc_Tag> getSc_TagListBySC_NUM(int SC_NUM){
		return sc_TagRepository.getSc_TagListBySC_NUM(SC_NUM);
	}
	
	public List<Sc_Tag> getSc_TagListByMEMBER_NUM(int MEMBER_NUM){
		return sc_TagRepository.getSc_TagListByMEMBER_NUM(MEMBER_NUM);
	}

	
	public Sc_Tag getSc_TagBySCTAG_NUM(int SCTAG_NUM) {
		return sc_TagRepository.getSc_TagBySCTAG_NUM(SCTAG_NUM);
	}
	
	public void registSc_Tag(Sc_Tag sctag) {
		sctag.setSCTAG_NUM(sc_TagRepository.selectSc_TagSequenceNextValue());
		sc_TagRepository.registSc_Tag(sctag);
	}
	
	public void modifySc_Tag(Sc_Tag sctag) {
		sc_TagRepository.modifySc_Tag(sctag);
	}
	
	public void removeSc_Tag(int SCTAG_NUM) {
		sc_TagRepository.removeSc_Tag(SCTAG_NUM);
	}
}
