package com.ducks.demys.boot.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ducks.demys.boot.command.ContactsSearchCriteria;
import com.ducks.demys.boot.service.ContactsService;
import com.ducks.demys.boot.vo.Contacts;

@Controller
public class ContactsController {
	private ContactsService contactsService;

	public ContactsController(ContactsService contactsService) {
		this.contactsService = contactsService;
	}

	@RequestMapping("/contacts/list")
	public String showList(Model model, ContactsSearchCriteria cri) {

		if (cri.getPage() < 1)
			cri.setPage(1);
		if (cri.getPerPageNum() < 1)
			cri.setPerPageNum(13);

		Map<String, Object> dataMap = contactsService.getSelectSearchContactsList(cri);

		model.addAttribute("dataMap", dataMap);

		return "contacts/list";
	}

	@RequestMapping("/contacts/regist")
	public String showRegist() {
		return "contacts/regist";
	}

	@RequestMapping("/contacts/doRegist")
	@ResponseBody
	public String registContacts(Model model, Contacts contacts, String CT_NAME, int CT_TYPE, String phoneNumber1,
			String phoneNumber2, String phoneNumber3, String ct_fax1, String ct_fax2, String ct_fax3, String ct_mg_tel1,
			String ct_mg_tel2, String ct_mg_tel3, String postcode, String address, String detailAddress,
			String extraAddress) {

		if (CT_NAME != null) {
			String fullAddress = "";
			if (!address.isEmpty() && !detailAddress.isEmpty() && !extraAddress.isEmpty()) {
				fullAddress = "(" + postcode + ") " + address + " " + detailAddress + " " + extraAddress;
			}

			String phoneNumber = "";
			if (!phoneNumber1.isEmpty() && !phoneNumber2.isEmpty() && !phoneNumber3.isEmpty()) {
				phoneNumber = phoneNumber1 + "-" + phoneNumber2 + "-" + phoneNumber3;
			}

			String faxNumber = "";
			if (!ct_fax1.isEmpty() && !ct_fax2.isEmpty() && !ct_fax3.isEmpty()) {
				faxNumber = ct_fax1 + "-" + ct_fax2 + "-" + ct_fax3;
			}

			String mgNumber = "";
			if (!ct_mg_tel1.isEmpty() && !ct_mg_tel2.isEmpty() && !ct_mg_tel3.isEmpty()) {
				mgNumber = ct_mg_tel1 + "-" + ct_mg_tel2 + "-" + ct_mg_tel3;
			}
			contacts.setCT_ADDR(fullAddress);
			contacts.setCT_TEL(phoneNumber);
			contacts.setCT_FAX(faxNumber);
			contacts.setCT_MG_TEL(mgNumber);
			contacts.setCT_TYPE(CT_TYPE);

			contactsService.registContacts(contacts);
		}

		String script = "<script>alert('업체 등록이 완료되었습니다.');window.close(); window.opener.location.href='/contacts/list';</script>";
		return script;
	}

	@RequestMapping("/contacts/detail")
	public void showDetail(Model model, int CT_NUM) {
		Contacts contacts = contactsService.getContactsByCT_NUM(CT_NUM);
		model.addAttribute("contacts", contacts);

		// 전화번호를 쪼개어 각 부분을 모델에 추가
		if (contacts != null) {
			String phoneNumber = contacts.getCT_TEL();

			if (phoneNumber != null && !phoneNumber.isEmpty()) {
				String[] phoneNumberParts = phoneNumber.split("-");

				if (phoneNumberParts.length == 3) {
					model.addAttribute("phoneNumber1", phoneNumberParts[0]);
					model.addAttribute("phoneNumber2", phoneNumberParts[1]);
					model.addAttribute("phoneNumber3", phoneNumberParts[2]);
				}
			}
			String ct_fax = contacts.getCT_FAX();

			if (ct_fax != null && !ct_fax.isEmpty()) {
				String[] ct_fax_Parts = ct_fax.split("-");

				if (ct_fax_Parts.length == 3) {
					model.addAttribute("ct_fax1", ct_fax_Parts[0]);
					model.addAttribute("ct_fax2", ct_fax_Parts[1]);
					model.addAttribute("ct_fax3", ct_fax_Parts[2]);
				}
			}
			String ct_mg_tel = contacts.getCT_MG_TEL();

			if (ct_mg_tel != null && !ct_mg_tel.isEmpty()) {
				String[] ct_mg_tel_Parts = ct_mg_tel.split("-");

				if (ct_mg_tel_Parts.length == 3) {
					model.addAttribute("ct_mg_tel1", ct_mg_tel_Parts[0]);
					model.addAttribute("ct_mg_tel2", ct_mg_tel_Parts[1]);
					model.addAttribute("ct_mg_tel3", ct_mg_tel_Parts[2]);
				}
			}

			String ct_address = contacts.getCT_ADDR();
			
			int firstBracketIndex = ct_address.indexOf("(");
			String postcode = ct_address.substring(firstBracketIndex, ct_address.indexOf(")") + 1);

			int lastBracketIndex = ct_address.lastIndexOf("(");
			String extraAddress = ct_address.substring(lastBracketIndex).trim();

			String address = ct_address.substring(postcode.length() + 1, lastBracketIndex).trim();

			int lastSpaceIndex = address.lastIndexOf(" ");
			String detailAddress = address.substring(lastSpaceIndex + 1).trim();
			address = address.substring(0, lastSpaceIndex).trim();

			model.addAttribute("postcode", postcode);
			model.addAttribute("address", address);
			model.addAttribute("detailAddress", detailAddress);
			model.addAttribute("extraAddress", extraAddress);
		}
	}

	@RequestMapping("/contacts/modify")
	public String showModify(Model model, String phoneNumber1, String phoneNumber2, String phoneNumber3, String ct_fax1,
			String ct_fax2, String ct_fax3, String ct_mg_tel1, String ct_mg_tel2, String ct_mg_tel3, String postcode,
			String address, String detailAddress, String extraAddress, String CT_NAME) {

		Contacts contacts = contactsService.getContactsByCT_NAME(CT_NAME);
		model.addAttribute("contacts", contacts);
		model.addAttribute("phoneNumber1", phoneNumber1);
		model.addAttribute("phoneNumber2", phoneNumber2);
		model.addAttribute("phoneNumber3", phoneNumber3);
		model.addAttribute("ct_fax1", ct_fax1);
		model.addAttribute("ct_fax2", ct_fax2);
		model.addAttribute("ct_fax3", ct_fax3);
		model.addAttribute("ct_mg_tel1", ct_mg_tel1);
		model.addAttribute("ct_mg_tel2", ct_mg_tel2);
		model.addAttribute("ct_mg_tel3", ct_mg_tel3);
		model.addAttribute("postcode", postcode);
		model.addAttribute("address", address);
		model.addAttribute("detailAddress", detailAddress);
		model.addAttribute("extraAddress", extraAddress);

		return "contacts/modify";
	}

	@RequestMapping("/contacts/doModify")
	@ResponseBody
	public String modifyContacts(Contacts contacts, int CT_TYPE, String phoneNumber1, String phoneNumber2,
			String phoneNumber3, String ct_fax1, String ct_fax2, String ct_fax3, String ct_mg_tel1, String ct_mg_tel2,
			String ct_mg_tel3, String postcode, String address, String detailAddress, String extraAddress) {

		String fullAddress = "";
		if (!address.isEmpty() && !detailAddress.isEmpty() && !extraAddress.isEmpty()) {
			fullAddress = "(" + postcode + ") " + address + " " + detailAddress + " " + extraAddress;
		}

		String phoneNumber = "";
		if (!phoneNumber1.isEmpty() && !phoneNumber2.isEmpty() && !phoneNumber3.isEmpty()) {
			phoneNumber = phoneNumber1 + "-" + phoneNumber2 + "-" + phoneNumber3;
		}

		String faxNumber = "";
		if (!ct_fax1.isEmpty() && !ct_fax2.isEmpty() && !ct_fax3.isEmpty()) {
			faxNumber = ct_fax1 + "-" + ct_fax2 + "-" + ct_fax3;
		}

		String mgNumber = "";
		if (!ct_mg_tel1.isEmpty() && !ct_mg_tel2.isEmpty() && !ct_mg_tel3.isEmpty()) {
			mgNumber = ct_mg_tel1 + "-" + ct_mg_tel2 + "-" + ct_mg_tel3;
		}

		contacts.setCT_ADDR(fullAddress);
		contacts.setCT_TEL(phoneNumber);
		contacts.setCT_FAX(faxNumber);
		contacts.setCT_MG_TEL(mgNumber);
		contacts.setCT_TYPE(CT_TYPE);

		contactsService.modifyContacts(contacts);

		String script = "<script>alert('업체 수정이 완료되었습니다.');window.close(); window.opener.location.href='/contacts/list';</script>";
		return script;
	}

	@RequestMapping("/contacts/remove")
	@ResponseBody
	public void removeContacts(@RequestParam("CT_NUM") int CT_NUM) {
		contactsService.removeContacts(CT_NUM);
	}
}
