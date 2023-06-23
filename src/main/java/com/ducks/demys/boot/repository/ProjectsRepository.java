package com.ducks.demys.boot.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ducks.demys.boot.command.SearchCriteria;
import com.ducks.demys.boot.vo.Projects;
import com.ducks.demys.boot.vo.ProjectsForPrint;

@Mapper
public interface ProjectsRepository {

	// public List<Projects> getPJList();

	public List<Projects> getPJList(SearchCriteria cri);

	public List<Projects> getPJCalList(int MEMBER_NUM);

	int getPJListCount(SearchCriteria cri);

	public List<ProjectsForPrint> getPJListForTMDashboard(int MEMBER_NUM, int PJ_IMP, String SORT);

	public List<ProjectsForPrint> getPJListForOtherDashboard(int MEMBER_NUM, int PJ_IMP, String SORT);

	// public List<Projects> getPJListByMEMBER_NUM(int MEMBER_NUM);

	public List<Projects> getPJListOrderByPJ_ENDDATE();

	public int getPJListCount();
	public int getPJListCountForDashboard();

	public int getPJListSTATUSCount(int PJ_STATUS);

	public Projects getPJByPJ_NUM(int PJ_NUM);

	public int selectPJSequenceNextValue();

	public void registPJ(Projects project);

	public void modifyPJ(Projects project);

	public void removePJ(int PJ_NUM);

	public void modifyPJBudget(Projects projects);

	public List<Projects> getPJTeamList(Map<String, Object> paramMap);

	public int getPJTeamListCount(SearchCriteria cri, int MEMBER_NUM);
}
