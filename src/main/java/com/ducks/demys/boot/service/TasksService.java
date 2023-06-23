package com.ducks.demys.boot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.TasksRepository;
import com.ducks.demys.boot.vo.Tasks;

@Service
public class TasksService {
	
	private TasksRepository tasksRepository;
	
	public TasksService(TasksRepository tasksRepository) {
		this.tasksRepository= tasksRepository;
	}
	
	public List<Tasks> getTasksList(){
		return tasksRepository.getTasksList();
	}
	
	public List<Tasks> getTasksListByMEMBER_NUM(int MEMBER_NUM){
		return tasksRepository.getTasksListByMEMBER_NUM(MEMBER_NUM);
	}
	
	public List<Tasks> getTasksListByTASKS_STATUS(int TASKS_STATUS){
		return tasksRepository.getTasksListByTASKS_STATUS(TASKS_STATUS);
	}

	
	public Tasks getTasksByTASKS_NUM(int TASKS_NUM) {
		return tasksRepository.getTasksByTASKS_NUM(TASKS_NUM);
	}
	
	public void registTasks(Tasks tasks) {
		tasks.setTASKS_NUM(tasksRepository.selectTasksSequenceNextValue());
		tasksRepository.registTasks(tasks);

	}
	
	public void modifyTasks(Tasks tasks) {
		tasksRepository.modifyTasks(tasks);
	}
	
	public void modifyTasksStatus(int TASKS_NUM, int TASKS_STATUS) {
		tasksRepository.modifyTasksStatus(TASKS_NUM, TASKS_STATUS);
	}
	
	public void removeTasks(int TASKS_NUM) {
		tasksRepository.removeTasks(TASKS_NUM);
	}

	public void modifyTasksShare(int TASKS_NUM, int TASKS_SHARE) {
		tasksRepository.modifyTasksShare(TASKS_NUM, TASKS_SHARE);
	}
}
