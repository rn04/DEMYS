package com.ducks.demys.boot.repository;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.ducks.demys.boot.command.ContactsSearchCriteria;
import com.ducks.demys.boot.vo.Contacts;

@Mapper
public interface ContactsRepository {
	
	List<Contacts> getSelectSearchContactsList(ContactsSearchCriteria cri, RowBounds rowbounds);
	
	int selectSearchContactsListCount(ContactsSearchCriteria cri);

	public List<Contacts> getContactsList();

	public List<Contacts> getContactsListByPJ_NUM(int PJ_NUM);
	
	public Contacts getContactsByCT_NUM(int CT_NUM);
	
	public Contacts getContactsByCT_NAME(String CT_NAME);
	
	public int selectContactsSequenceNextValue();
	
	public void registContacts(Contacts contacts);
	
	public void modifyContacts(Contacts contacts);
	
	public void removeContacts(int CT_NUM);
	
	public List<Contacts> getContactsListPjRegist();
	
	public List<Contacts> getContactsListPjRegistSearch(String searchType, String keyword);

	public List<Contacts> getContactsPjctList();
	
}
