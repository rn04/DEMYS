package com.ducks.demys.boot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.Issue_AttachRepository;
import com.ducks.demys.boot.vo.Issue_Attach;

@Service
public class Issue_AttachService {
	
	private Issue_AttachRepository issue_AttachRepository;
	
	public Issue_AttachService(Issue_AttachRepository issue_AttachRepository) {
		this.issue_AttachRepository= issue_AttachRepository;
	}
	
	public List<Issue_Attach> getIssue_AttachListByISSUE_NUM(int ISSUE_NUM){
		return issue_AttachRepository.getIssue_AttachListByISSUE_NUM(ISSUE_NUM);
	}

	
	public Issue_Attach getIssueatByISSUEAT_NUM(int ISSUEAT_NUM) {
		return issue_AttachRepository.getIssueatByISSUEAT_NUM(ISSUEAT_NUM);
	}
	
	public void registIssue_Attach(Issue_Attach issueat) {
		issueat.setISSUEAT_NUM(issue_AttachRepository.selectIssue_AttachSequenceNextValue());
		issue_AttachRepository.registIssue_Attach(issueat);
	}
	
	public void removeIssue_Attach(int ISSUEAT_NUM) {
		issue_AttachRepository.removeIssue_Attach(ISSUEAT_NUM);
	}
	
	public void removeIssue_AttachAll(int ISSUE_NUM) {
		issue_AttachRepository.removeIssue_AttachAll(ISSUE_NUM);
	}
}
