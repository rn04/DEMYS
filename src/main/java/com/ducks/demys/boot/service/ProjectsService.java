package com.ducks.demys.boot.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.command.PageMaker;
import com.ducks.demys.boot.command.SearchCriteria;
import com.ducks.demys.boot.repository.IssueRepository;
import com.ducks.demys.boot.repository.MemberRepository;
import com.ducks.demys.boot.repository.ProjectsRepository;
import com.ducks.demys.boot.vo.Member;
import com.ducks.demys.boot.vo.Projects;
import com.ducks.demys.boot.vo.ProjectsForPrint;

@Service
public class ProjectsService {

	private ProjectsRepository projectsRepository;
	private IssueRepository issueRepository;
	private MemberRepository memberRepository;

	public ProjectsService(ProjectsRepository projectsRepository, IssueRepository issueRepository,
			MemberRepository memberRepository) {
		this.projectsRepository = projectsRepository;
		this.issueRepository = issueRepository;
		this.memberRepository = memberRepository;
	}

	public Map<String, Object> getPJList(SearchCriteria cri) {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<Projects> projectsList = projectsRepository.getPJList(cri);
		// 각 프로젝트의 이슈 갯수
		for (Projects project : projectsList) {
			project.setISSUE_COUNT(issueRepository.getIssuePjListCount(project.getPJ_NUM()));
		}
		dataMap.put("projects", projectsList);

		int totalCount = projectsRepository.getPJListCount(cri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	public List<ProjectsForPrint> getPJListForDashboard(int MEMBER_NUM, int PJ_IMP, String SORT) {
		Member member = memberRepository.getMemberByMEMBER_NUM(MEMBER_NUM);
		if (member == null || member.getMEMBER_AUTHORITY() == 3) {
			return projectsRepository.getPJListForTMDashboard(MEMBER_NUM, PJ_IMP, SORT);
		} else {
			return projectsRepository.getPJListForOtherDashboard(MEMBER_NUM, PJ_IMP, SORT);
		}
	}
	
	public Map<String, Object> getPJTeamList(SearchCriteria cri, int MEMBER_NUM) {
	      Map<String, Object> dataMap = new HashMap<String, Object>();
	      Map<String, Object> paramMap = new HashMap<String, Object>();
	      paramMap.put("cri", cri);
	      paramMap.put("MEMBER_NUM", MEMBER_NUM);      
	      List<Projects> projectsList = projectsRepository.getPJTeamList(paramMap);
	      // 각 프로젝트의 이슈 갯수
	      for (Projects project : projectsList) {
	         project.setISSUE_COUNT(issueRepository.getIssuePjListCount(project.getPJ_NUM()));
	      }
	      dataMap.put("projects", projectsList);

	      int totalCount = projectsRepository.getPJTeamListCount(cri, MEMBER_NUM);
	      
	      PageMaker pageMaker = new PageMaker();
	      pageMaker.setCri(cri);
	      pageMaker.setTotalCount(totalCount);
	      dataMap.put("pageMaker", pageMaker);

	      return dataMap;
	   }

//	public List<Projects> getPJListByMEMBER_NUM(int MEMBER_NUM){
//		return projectsRepository.getPJListByMEMBER_NUM(MEMBER_NUM);
//	}

	public List<Projects> getPJListOrderByPJ_ENDDATE() {
		return projectsRepository.getPJListOrderByPJ_ENDDATE();
	}

	public List<Projects> getPJCalList(int MEMBER_NUM) {
		return projectsRepository.getPJCalList(MEMBER_NUM);
	}

	public int getPJListCount() {
		return projectsRepository.getPJListCount();
	}
	public int getPJListCountForDashboard() {
		return projectsRepository.getPJListCountForDashboard();
	}

	public int getPJListSTATUSCount(int PJ_STATUS) {
		return projectsRepository.getPJListSTATUSCount(PJ_STATUS);
	}

	public Projects getPJByPJ_NUM(int PJ_NUM) {
		return projectsRepository.getPJByPJ_NUM(PJ_NUM);
	}

	public void registPJ(Projects project) {
		project.setPJ_NUM(projectsRepository.selectPJSequenceNextValue());
		projectsRepository.registPJ(project);
	}

	public void modifyPJ(Projects project) {
		projectsRepository.modifyPJ(project);
	}

	public void modifyPJBudget(Projects projects) {
		projectsRepository.modifyPJBudget(projects);
	}

	public void removePJ(int PJ_NUM) {
		projectsRepository.removePJ(PJ_NUM);
	}
}
