package com.ducks.demys.boot.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ducks.demys.boot.vo.MeetingBook;

@Mapper
public interface MeetingBookRepository {

	public List<MeetingBook> getMeetingBookListByPJ_NUM(int PJ_NUM);
	
	public List<MeetingBook> getSearchMeetingbook(Object PJ_NUM, String searchKeywordTypeCode,	String searchKeyword);
	
	public MeetingBook getMeetingBookByMB_NUM(int MB_NUM);
	
	public int selectMeetingBookSequenceNextValue();
	
	public void registMeetingBook(MeetingBook meetingBook);
	
	public void modifyMeetingBook(MeetingBook meetingBook);
	
	public void removeMeetingBook(int MB_NUM);
	
}