package com.ducks.demys.boot.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ducks.demys.boot.command.SearchCriteria;
import com.ducks.demys.boot.service.ContactsService;
import com.ducks.demys.boot.service.IssueReplyService;
import com.ducks.demys.boot.service.IssueService;
import com.ducks.demys.boot.service.MeetingBookService;
import com.ducks.demys.boot.service.MemberService;
import com.ducks.demys.boot.service.PjctService;
import com.ducks.demys.boot.service.PjhrService;
import com.ducks.demys.boot.service.ProductService;
import com.ducks.demys.boot.service.ProjectsService;
import com.ducks.demys.boot.service.RequireService;
import com.ducks.demys.boot.vo.Contacts;
import com.ducks.demys.boot.vo.Issue;
import com.ducks.demys.boot.vo.IssueReply;
import com.ducks.demys.boot.vo.MeetingBook;
import com.ducks.demys.boot.vo.Member;
import com.ducks.demys.boot.vo.Pjct;
import com.ducks.demys.boot.vo.Pjhr;
import com.ducks.demys.boot.vo.Product;
import com.ducks.demys.boot.vo.ProductForSearch;
import com.ducks.demys.boot.vo.Projects;
import com.ducks.demys.boot.vo.Require;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProjectsController {
	private MeetingBookService meetingBookService;
	private ProductService productService;
	private RequireService requireService;
	private IssueService issueService;
	@Autowired
	private IssueReplyService issueReplyService;
	private ProjectsService projectsService;
	private MemberService memberService;
	private ContactsService contactsService;
	private PjctService pjctService;
	private PjhrService pjhrService;

	public ProjectsController(ProjectsService projectsService, MemberService memberService,
			ContactsService contactsService, PjctService pjctService, PjhrService pjhrService,
			MeetingBookService meetingBookService, ProductService productService, RequireService requireService,
			IssueService issueService, IssueReplyService issueReplyService) {
		this.projectsService = projectsService;
		this.memberService = memberService;
		this.contactsService = contactsService;
		this.pjctService = pjctService;
		this.pjhrService = pjhrService;
		this.meetingBookService = meetingBookService;
		this.productService = productService;
		this.requireService = requireService;
		this.issueService = issueService;
	}

	@RequestMapping("project/main")
	   public String pjctList(HttpSession session, Model model, @ModelAttribute SearchCriteria cri,
	         @RequestParam(defaultValue = "0") int PJ_NUM, @RequestParam(defaultValue = "0") int ISSUE_NUM) {
	      if (cri.getPage() < 1)
	         cri.setPage(1);
	      if (cri.getPerPageNum() < 1)
	         cri.setPerPageNum(5);
	      Member member = (Member)session.getAttribute("member");
	      int ath = member.getMEMBER_AUTHORITY();
	      int MEMBER_NUM=member.getMEMBER_NUM();
	      Map<String, Object> dataMap = new HashMap<String, Object>();
	      
	      if( ath == 3 ) {
	         dataMap = projectsService.getPJList(cri);
	      } else {
	         dataMap = projectsService.getPJTeamList(cri, MEMBER_NUM);
	      }
	      
	      model.addAttribute("dataMap", dataMap);
	      model.addAttribute("PJ_NUM", PJ_NUM);
	      model.addAttribute("ISSUE_NUM", ISSUE_NUM);
	      return "project/main";
	   }

	@RequestMapping("project/detail")
	   public String pjctDetail(Model model, int PJ_NUM, @RequestParam(defaultValue = "0") int ISSUE_NUM) {
	      Projects projects = projectsService.getPJByPJ_NUM(PJ_NUM);

	      List<Pjct> pjctList = pjctService.getContactsPjctList(PJ_NUM);
	      int pjctListCount = pjctService.getContactsPjctListCount(PJ_NUM);
	      model.addAttribute("projects", projects);
	      model.addAttribute("pjctList", pjctList);
	      model.addAttribute("pjctListCount", pjctListCount);
	      model.addAttribute("ISSUE_NUM",ISSUE_NUM);
	      return "project/detail";
	   }

	@RequestMapping("project/PjModifyDo")
	@ResponseBody
	public int PjModifyDo(@RequestBody Projects project) {
		projectsService.modifyPJ(project);

		return project.getPJ_NUM();
	}

//	거래처
	@RequestMapping("project/contacts_Regist")
	@ResponseBody
	public void pjctContactsRegistdo(@RequestBody Pjct pjct) {
		pjctService.registPjct(pjct);
	}

	@RequestMapping("project/pjct_Remove")
	@ResponseBody
	public void pjctRemovedo(int PJCT_NUM) {
		pjctService.removePjct(PJCT_NUM);
	}

	@RequestMapping("project/regist_PJTYPE")
	public String sendpjtype(Model model, int PJ_TYPE) {
		model.addAttribute("PJ_TYPE", PJ_TYPE);
		// System.out.println(PJ_TYPE);
		return "project/regist_detail";
	}

	@RequestMapping("project/regist")
	public void pjctRegist() {
	}

	@RequestMapping("project/regist_detail")
	public void pjctRegistDetail() {
	}

	@RequestMapping("project/pjRegistdo")
	@ResponseBody
	public void pjctRegistdo(@RequestBody Projects projects) {
		int memberId = 1;
		Map<String, Object> map = new HashMap<>();
		map.put("MEMBER_NUM", memberId);

		projectsService.registPJ(projects);
	}

	@RequestMapping("project/Search_Modal")
	@ResponseBody
	public Map<String, Object> pjctSearch() {
		Map<String, Object> data = new HashMap<String, Object>();

		List<Member> memberList = memberService.getMemberList();
		List<Contacts> contactsList = contactsService.getContactsListPjRegist();

		data.put("memberList", memberList);
		data.put("contactsList", contactsList);
		return data;
	}

	@RequestMapping("project/regist_searchMEMBER")
	@ResponseBody
	public Map<String, Object> sendsearchMember(Model model, @RequestParam String searchType,
			@RequestParam String keyword) {

		Map<String, Object> data = new HashMap<String, Object>();
		List<Member> memberList = memberService.getMemberListSearch(searchType, keyword);
		data.put("memberList", memberList);

		return data;
	}

	@RequestMapping("project/regist_searchCONTACTS")
	@ResponseBody
	public Map<String, Object> sendsearchContacts(Model model, @RequestParam String searchType,
			@RequestParam String keyword) {

		Map<String, Object> data = new HashMap<String, Object>();
		List<Contacts> contactsList = contactsService.getContactsListPjRegistSearch(searchType, keyword);

		data.put("contactsList", contactsList);

		return data;
	}

//	참여인력
	@RequestMapping("project/PjNumhrList")
	public String sendPjNumhrList(Model model, int PJ_NUM) {
		Projects projects = projectsService.getPJByPJ_NUM(PJ_NUM);
		List<Pjhr> pjhrList = pjhrService.getPjhrListByPJ_NUM(PJ_NUM);
		int pjhrListCount = pjhrService.getPjhrListByPJ_NUMCount(PJ_NUM);

		model.addAttribute("projects", projects);
		model.addAttribute("pjhrList", pjhrList);
		model.addAttribute("pjhrListCount", pjhrListCount);
		model.addAttribute("PJ_NUM", PJ_NUM);
		return "project/hr_list";
	}

	@RequestMapping("project/hr_list")
	public void showPjctHrList() {
	}

	@RequestMapping("project/hr_detail")
	public void showPjctHrDetail(Model model, int PJHR_NUM) {
		Pjhr pjhr = pjhrService.getPjhrByPJHR_NUM(PJHR_NUM);
		model.addAttribute("pjhr", pjhr);
	}

	@RequestMapping("project/hr_listadd")
	@ResponseBody
	public void PjctHrDetailAdd(Model model, int PJ_NUM) {
		Projects projects = projectsService.getPJByPJ_NUM(PJ_NUM);
		List<Pjhr> pjhrList = pjhrService.getPjhrListByPJ_NUM(PJ_NUM);
		int pjhrListCount = pjhrService.getPjhrListByPJ_NUMCount(PJ_NUM);

		model.addAttribute("projects", projects);
		model.addAttribute("pjhrList", pjhrList);
		model.addAttribute("pjhrListCount", pjhrListCount);
		model.addAttribute("PJ_NUM", PJ_NUM);
	}

	@RequestMapping("project/hr_modify")
	public void showPjctHrModify(Model model, int PJHR_NUM, int PJ_NUM) {
		Pjhr pjhr = pjhrService.getPjhrByPJHR_NUM(PJHR_NUM);
		model.addAttribute("pjhr", pjhr);
	}

	@RequestMapping("project/hr_modifydo")
	@ResponseBody
	public int PjctHrModifyDo(@RequestBody Pjhr pjhr) {
		int PJHR_NUM = pjhr.getPJHR_NUM();
		pjhrService.getPjhrByPJHR_NUM(PJHR_NUM);
		pjhrService.modifyPjhr(pjhr);
		return pjhr.getPJ_NUM();
	}

	@RequestMapping("project/pjhr_Remove")
	@ResponseBody
	public void pjhrRemovedo(int PJHR_NUM) {
		pjhrService.removePjhr(PJHR_NUM);
	}

	@RequestMapping("project/pjhrRegist")
	@ResponseBody
	public void pjhrRegistdo(@RequestBody Pjhr pjhr) {
		pjhrService.registPjhr(pjhr);
	}

	// 주헌
	@RequestMapping("project/product_go")
	public String showproduct(Model model, int PJ_NUM) {
		model.addAttribute("PJ_NUM", PJ_NUM);

		return "project/product";
	}

	@RequestMapping("project/product_TL_go")
	public String showproductTL(Model model, int PJ_NUM) {
		model.addAttribute("PJ_NUM", PJ_NUM);

		return "project/product_TL";
	}

	@RequestMapping("project/productList")
	@ResponseBody
	public List<Product> showproductList(@RequestBody ProductForSearch pd) {
		List<Product> productList = new ArrayList<Product>();
		int PJ_NUM = pd.getPJ_NUM();
		int PRODUCT_STEP = (int) pd.getPRODUCT_STEP();
		String searchType = pd.getSearchType();
		String keyword = pd.getKeyword();

		// 1을 PJ_NUM으로 바꿔
		productList = productService.getSearchProductList(PJ_NUM, PRODUCT_STEP, searchType, keyword); // 1을 PJ_NUM으로, 위에
																										// 모델옆에 int
		return productList;
	}

	@RequestMapping("project/PDstatusChange")
	@ResponseBody
	public void statusChange(@RequestParam String product_num, String product_status) {

		Product product = new Product();

		int num = Integer.parseInt(product_num);
		int status = Integer.parseInt(product_status);

		product.setPRODUCT_NUM(num);
		product.setPRODUCT_STATUS(status);

		productService.changeStatusProduct(product);
	}

	@RequestMapping("project/product_regist")
	@ResponseBody
	public void showproduct_regist(String PRODUCT_TITLE, int PRODUCT_STEP, String PRODUCT_CONTENT, int PRODUCT_STATUS,
			int MEMBER_NUM, int PJ_NUM) {
		Product product = new Product();

		product.setPRODUCT_TITLE(PRODUCT_TITLE);
		product.setPRODUCT_STEP(PRODUCT_STEP);
		product.setPRODUCT_CONTENT(PRODUCT_CONTENT);
		product.setPRODUCT_STATUS(PRODUCT_STATUS);
		product.setMEMBER_NUM(MEMBER_NUM);
		product.setPJ_NUM(1);

		productService.registProduct(product);
	}

	@RequestMapping("project/product_detail")
	public void showproduct_detail(Model model, int PRODUCT_NUM) {
		Product product = productService.getProductByProduct_NUM(PRODUCT_NUM);
		model.addAttribute("product", product);
	}

	@RequestMapping("project/product_modify")
	public void showproduct_modify(int PRODUCT_NUM, Model model) {
		Product product = productService.getProductByProduct_NUM(PRODUCT_NUM);
		model.addAttribute("product", product);
	}

	@ResponseBody
	@PostMapping("project/doproduct_modify")
	public void showdoproduct_modify(String PRODUCT_TITLE, int PRODUCT_STEP, String PRODUCT_CONTENT, int PRODUCT_NUM,
			int PJ_NUM, int MEMBER_NUM) {
		Product product = productService.getProductByProduct_NUM(PRODUCT_NUM);

		product.setPRODUCT_TITLE(PRODUCT_TITLE);
		product.setPRODUCT_CONTENT(PRODUCT_CONTENT);
		product.setPRODUCT_STEP(PRODUCT_STEP);
		product.setMEMBER_NUM(MEMBER_NUM);
		product.setPJ_NUM(PJ_NUM);

		productService.modifyProduct(product);
	}

	@RequestMapping("project/require_go")
	public String showrequire(Model model,
			@RequestParam(defaultValue = "REQUIRE_TITLE, REQUIRE_DETAIL") String searchKeywordTypeCode,
			@RequestParam(defaultValue = "") String searchKeyword, int PJ_NUM) {

		List<Require> requireList = requireService.getSearchRequire(searchKeywordTypeCode, searchKeyword, PJ_NUM);

		model.addAttribute("requireList", requireList);
		model.addAttribute("PJ_NUM", PJ_NUM);

		return "project/require";
	}

	@RequestMapping("project/require_regist")
	@ResponseBody
	public void showrequire_regist(String REQUIRE_TITLE, int REQUIRE_LEVEL, String REQUIRE_DETAIL, int CT_NUM,
			int MEMBER_NUM, int PJ_NUM) {
		Require require = new Require();

		require.setREQUIRE_TITLE(REQUIRE_TITLE);
		require.setREQUIRE_LEVEL(REQUIRE_LEVEL);
		require.setREQUIRE_DETAIL(REQUIRE_DETAIL);
		require.setCT_NUM(CT_NUM);
		require.setMEMBER_NUM(MEMBER_NUM);
		require.setPJ_NUM(PJ_NUM);

		requireService.registRequire(require);

	}

	@RequestMapping("project/require_detail")
	public void showrequire_detail(Model model, int REQUIRE_NUM) {
		Require require = requireService.getRequireByREQUIRE_NUM(REQUIRE_NUM);
		model.addAttribute("require", require);
	}

	@RequestMapping("project/require_modify")
	public void showrequire_modify(int REQUIRE_NUM, Model model) {
		Require require = requireService.getRequireByREQUIRE_NUM(REQUIRE_NUM);
		model.addAttribute("require", require);
	}

	@ResponseBody
	@PostMapping("project/dorequire_modify")
	public void showrequire_modify(String REQUIRE_TITLE, int REQUIRE_LEVEL, String REQUIRE_DETAIL, int REQUIRE_NUM) {
		Require require = requireService.getRequireByREQUIRE_NUM(REQUIRE_NUM);

		require.setREQUIRE_TITLE(REQUIRE_TITLE);
		require.setREQUIRE_LEVEL(REQUIRE_LEVEL);
		require.setREQUIRE_DETAIL(REQUIRE_DETAIL);

		requireService.modifyRequire(require);
	}

	@RequestMapping("project/require_delete")
	public String showrequire_delete(int REQUIRE_NUM) {
		requireService.removeRequire(REQUIRE_NUM);

		return "project/remove_success";
	}

	@RequestMapping("project/meetingbook_go")
	public String showmeetingbook(Model model, @RequestParam(defaultValue = "") Object PJ_NUM,
			@RequestParam(defaultValue = "MB_TITLE, MEMBER_NAME") String searchKeywordTypeCode,
			@RequestParam(defaultValue = "") String searchKeyword) {
		List<MeetingBook> meetingBookList = meetingBookService.getSearchMeetingbook(PJ_NUM, searchKeywordTypeCode,
				searchKeyword);

		model.addAttribute("meetingBookList", meetingBookList);
		model.addAttribute("PJ_NUM", PJ_NUM);

		return "project/meetingbook";
	}

	@ResponseBody
	@RequestMapping("project/meetingbook_regist")
	public void showmeetingbook_regist(String MB_TITLE, String MB_CONTENT, int MEMBER_NUM, int PJ_NUM) {
		MeetingBook meetingBook = new MeetingBook();

		meetingBook.setMB_TITLE(MB_TITLE);
		meetingBook.setMB_CONTENT(MB_CONTENT);
		meetingBook.setMEMBER_NUM(MEMBER_NUM);
		meetingBook.setPJ_NUM(PJ_NUM);

		meetingBookService.registMeetingBook(meetingBook);
	}

	@RequestMapping("project/meetingbook_detail")
	public void showmeetingbook_detail(Model model, int MB_NUM) {
		MeetingBook meetingbook = meetingBookService.getMeetingBookByMB_NUM(MB_NUM);
		model.addAttribute(meetingbook);
	}

	@RequestMapping("project/meetingbook_modify")
	public void showmeetingbook_modify(int MB_NUM, Model model) {
		MeetingBook meetingBook = meetingBookService.getMeetingBookByMB_NUM(MB_NUM);
		model.addAttribute("meetingBook", meetingBook);
	}

	@ResponseBody
	@PostMapping("project/domeetingbook_modify")
	public void showdomeetingBook_modify(String MB_TITLE, String MB_CONTENT, int MB_NUM) {

		MeetingBook meetingBook = meetingBookService.getMeetingBookByMB_NUM(MB_NUM);

		meetingBook.setMB_TITLE(MB_TITLE);
		meetingBook.setMB_CONTENT(MB_CONTENT);

		meetingBookService.modifyMeetingBook(meetingBook);

	}

	@RequestMapping("project/issue_go")
    public String showissue(Model model, int PJ_NUM, @RequestParam(defaultValue = "0") int ISSUE_NUM) {
       List<Issue> issueList = issueService.getIssueListByPJ_NUM(PJ_NUM);
       
       if(issueList != null && issueList.size() > 0) {
          for(Issue issue:issueList ) {
             issue.setISSUEREPLY_COUNT(issueReplyService.gethowmanyreply(issue.getISSUE_NUM()));
             }
       }
       
       model.addAttribute("issueList", issueList);
       model.addAttribute("PJ_NUM", PJ_NUM);
       model.addAttribute("ISSUE_NUMM", ISSUE_NUM);
       
       return "project/issue";

    }

    @RequestMapping("project/issue_memberDepList")
    @ResponseBody
    public List<Member> showissue_memberDepList(@RequestParam String MEMBER_DEP) {

       List<Member> memberdeplist = memberService.getMemberByMEMBER_DEP(MEMBER_DEP);

       return memberdeplist;

    }

    @RequestMapping("project/issue_detail")
    public void showissue_detail(Model model, int ISSUE_NUM) {
       Issue issue = issueService.getIssueByISSUE_NUM(ISSUE_NUM);
       List<IssueReply> replyList = issueReplyService.getIssueReplyListByISSUE_NUM(ISSUE_NUM);
       model.addAttribute("issue", issue);
       model.addAttribute("replyList", replyList);
    }

    @RequestMapping("project/issue_regist")
    @ResponseBody
    public void showissue_regist(@RequestBody Issue issue) {
       
       issueService.registIssue(issue);

    }
    
    
    
    @RequestMapping("project/Search_TAG")
    @ResponseBody
    public List<Member> issuetag(String[] arvalue) {
       
       List<Member> memberList = new ArrayList<Member>();
       for(int i=0;i<arvalue.length;i++) {
          Member member= memberService.getMemberByMEMBER_NUM(Integer.parseInt(arvalue[i]));
          memberList.add(member);
       }
       
       
       
       return memberList;
    }
    
    
    
    @RequestMapping("project/issue_modify")
    public void showissue_modify(int ISSUE_NUM, Model model) {
       Issue issue = issueService.getIssueByISSUE_NUM(ISSUE_NUM);
       
       SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
       
       String regDate = simpleDate.format(issue.getISSUE_REGDATE());
       String deadLine = simpleDate.format(issue.getISSUE_DEADLINE());
       
       model.addAttribute("regDate", regDate);
       model.addAttribute("deadLine", deadLine);
       model.addAttribute("issue", issue);

    }
    
    @RequestMapping("project/doissue_modify")
    @ResponseBody
    public void showdoissue_modify(@RequestBody Issue issue) {


     issueService.modifyIssue(issue);
     
    }
    
    @RequestMapping("project/issuedel_go")
    @ResponseBody
    public String showissue_delete(@RequestParam("ISSUE_NUM") int ISSUE_NUM) {
       issueService.removeIssue(ISSUE_NUM);
       
       return "project/issue";
    }
    
    
    @RequestMapping("project/issue_reply_go")
    @ResponseBody
    public void showissue_reply(Model model, @RequestBody IssueReply issuereply) {
       
       issueReplyService.registIssueReply(issuereply);

    }
    
    
    
    @RequestMapping("project/doreplymodify_go")
    @ResponseBody
    public String showreply_modify(@RequestParam("ISSUERE_NUM") int ISSUERE_NUM, String ISSUERE_CONTENT, String STRING_UPDATEDATE) {
       
       IssueReply issuereply = issueReplyService.getIssueByISSUERE_NUM(ISSUERE_NUM);
       
       issuereply.setISSUERE_NUM(ISSUERE_NUM);
       issuereply.setISSUERE_CONTENT(ISSUERE_CONTENT);
       issuereply.setSTRING_UPDATEDATE(STRING_UPDATEDATE);
       
       issueReplyService.modifyIssueReply(issuereply);
       
       return "project/issue_detail";
       
    }
    
    
    @RequestMapping("project/replydel_go")
    @ResponseBody
    public String showissue_reply_delete(@RequestParam("ISSUERE_NUM") int ISSUERE_NUM) {
       issueReplyService.removeIssueReply(ISSUERE_NUM);
       
       return "project/issue_detail";
    }

}
