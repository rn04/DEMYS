package com.ducks.demys.boot.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ducks.demys.boot.vo.Tasks;

@Mapper
public interface TasksRepository {

	public List<Tasks> getTasksListByMEMBER_NUM(int MEMBER_NUM);

	public List<Tasks> getTasksListByTASKS_STATUS(int TASKS_STATUS);

	public List<Tasks> getTasksList();
	
	public Tasks getTasksByTASKS_NUM(int TASKS_NUM);
	
	public int selectTasksSequenceNextValue();
	
	public void registTasks(Tasks tasks);
	
	public void modifyTasks(Tasks tasks);
	
	public void modifyTasksStatus(int TASKS_NUM, int TASKS_STATUS);
	
	public void removeTasks(int TASKS_NUM);

	public void modifyTasksShare(int TASKS_NUM, int TASKS_SHARE);
	
}