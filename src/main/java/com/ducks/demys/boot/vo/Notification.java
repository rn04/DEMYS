package com.ducks.demys.boot.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Notification {
	
	private int NOTI_NUM;
	private String NOTI_TYPE;
	private int NOTI_TYPEPK;
	private String NOTI_CONTENT;
	private String NOTI_URL;
	private Date NOTI_REGDATE;
	private Date NOTI_READDATE;
	private int PJ_NUM;
	private int MEMBER_NUM;
	private int SENDMEMBER_NUM;
	private int DELSTATUS;
}
