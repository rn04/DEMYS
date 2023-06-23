package com.ducks.demys.boot.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.ducks.demys.boot.command.ContactsSearchCriteria;
import com.ducks.demys.boot.command.CPageMaker;
import com.ducks.demys.boot.repository.ContactsRepository;
import com.ducks.demys.boot.vo.Contacts;

@Service
public class ContactsService {
	
	private ContactsRepository contactsRepository;
	
	public  ContactsService(ContactsRepository contactsRepository) {
		this.contactsRepository= contactsRepository;
	}
	
	public Map<String,Object> getSelectSearchContactsList(ContactsSearchCriteria cri) {
		Map<String,Object> dataMap = new HashMap<String,Object>();

		RowBounds rowbounds = new RowBounds(cri.getStartRowNum(),cri.getPerPageNum());
		List<Contacts> contactsList = contactsRepository.getSelectSearchContactsList(cri, rowbounds);
		dataMap.put("contactsList", contactsList);

		CPageMaker pageMaker = new CPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(contactsRepository.selectSearchContactsListCount(cri));

		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	public List<Contacts> getContactsList(){

		return contactsRepository.getContactsList();
	}
	
	public List<Contacts> getContactsListByPJ_NUM(int PJ_NUM){
		return contactsRepository.getContactsListByPJ_NUM(PJ_NUM);
	}
	
	public Contacts getContactsByCT_NUM(int CT_NUM) {
		return contactsRepository.getContactsByCT_NUM(CT_NUM);
	}
	
	public Contacts getContactsByCT_NAME(String CT_NAME) {
		return contactsRepository.getContactsByCT_NAME(CT_NAME);
	}
	
	public Contacts registContacts(Contacts contacts) {
		contacts.setCT_NUM(contactsRepository.selectContactsSequenceNextValue());
		contactsRepository.registContacts(contacts);
		return contacts;
	}
	
	public void modifyContacts(Contacts contacts) {
		contactsRepository.modifyContacts(contacts);
	}
	
	public void removeContacts(int CT_NUM) {
		contactsRepository.removeContacts(CT_NUM);
	}
	
	public List<Contacts> getContactsListPjRegist(){
		List<Contacts>  contactsList = contactsRepository.getContactsListPjRegist();
		return contactsList;
	}
	public List<Contacts> getContactsListPjRegistSearch(String searchType, String keyword){
		List<Contacts> contactsList = contactsRepository.getContactsListPjRegistSearch(searchType, keyword); 
		return contactsList;
	}

	public List<Contacts> getContactsPjctList(){
		List<Contacts>  contactsList = contactsRepository.getContactsPjctList();
		return contactsList;
	}

}
