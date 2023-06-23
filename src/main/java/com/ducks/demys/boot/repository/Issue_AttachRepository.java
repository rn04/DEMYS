package com.ducks.demys.boot.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ducks.demys.boot.vo.Issue_Attach;

@Mapper
public interface Issue_AttachRepository {
	
	public List<Issue_Attach> getIssue_AttachListByISSUE_NUM(int ISSUE_NUM);
	
	public Issue_Attach getIssueatByISSUEAT_NUM(int ISSUEAT_NUM);
	
	public int selectIssue_AttachSequenceNextValue();
	
	public void registIssue_Attach(Issue_Attach issueat);
		
	public void removeIssue_Attach(int ISSUEAT_NUM);

	public void removeIssue_AttachAll(int ISSUE_NUM);
}
