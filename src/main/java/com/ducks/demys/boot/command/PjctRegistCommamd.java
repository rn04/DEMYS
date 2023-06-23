package com.ducks.demys.boot.command;

import java.util.Date;

import com.ducks.demys.boot.vo.Contacts;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PjctRegistCommamd {
	private int CT_NUM;
	private String CT_NAME;
	private String CT_TEL;
	private String CT_FAX;
	private String CT_ADDR;
	private String CT_MANAGER;
	
	public Contacts toContactsVO(){
		Contacts contacts = new Contacts();
		
		contacts.setCT_NUM(CT_NUM);
		contacts.setCT_NAME(CT_NAME);
		contacts.setCT_TEL(CT_TEL);
		contacts.setCT_FAX(CT_FAX);
		contacts.setCT_ADDR(CT_ADDR);
		contacts.setCT_MANAGER(CT_MANAGER);
		
		return contacts;
	}
}
