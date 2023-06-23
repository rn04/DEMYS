package com.ducks.demys.boot.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ducks.demys.boot.service.MemberService;
import com.ducks.demys.boot.utils.MakeFileName;
import com.ducks.demys.boot.vo.Member;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {

   private MemberService memberService;

   public MemberController(MemberService memberService) {
      this.memberService = memberService;
   }

   @RequestMapping("/member/login")
   public void showLogin() {
   }

   @RequestMapping("/member/doLogin")
   public String doLogin(@RequestParam("MEMBER_ID") String MEMBER_ID, @RequestParam("MEMBER_PW") String MEMBER_PW,
         HttpSession session, Model model) {

      if (MEMBER_ID.isEmpty() || MEMBER_PW.isEmpty()) {
         model.addAttribute("error", "Please try login again");
         return "redirect:/member/login";
      }

      Member member = memberService.getMemberByMEMBER_ID(MEMBER_ID);

      if (member != null && member.getMEMBER_PW().equals(MEMBER_PW)) {
         session.setAttribute("member", member);
         return "redirect:/main";
      } else {
         if (member == null || !member.getMEMBER_ID().equals(MEMBER_ID)) {
            model.addAttribute("invalidId", "Invalid login ID.");
         } else {
            model.addAttribute("invalidPassword", "Invalid password.");
         }
         return "member/login";
      }
   }

   @RequestMapping("/member/logout")
   public String logout(HttpSession session) {
      session.removeAttribute("member");
      return "redirect:/member/login";
   }

   @GetMapping("/member/registCode")
   public String showRegistCode() {
      return "member/registCode";
   }

   @PostMapping("/member/doRegistCode")
   public String doRegistCode(@RequestParam("newAuthority") String newAuthority,
         @RequestParam("authority_code") String authority_code, Model model) {

      if (!newAuthority.equals(authority_code)) {
         return "member/registCode";
      }

      return "redirect:/member/regist";
   }

   @RequestMapping("/member/regist")
   public String showRegist() {
      return "member/regist";
   }

   @RequestMapping(value="/member/registMember", method = {RequestMethod.GET, RequestMethod.POST})
   @ResponseBody
   public String registMember(@RequestParam("MEMBER_POSITION") int MEMBER_POSITION,
                                          @RequestParam("MEMBER_AUTHORITY") int MEMBER_AUTHORITY, Member member) {
      
         member.setREGDATE(new Date());
         member.setMEMBER_POSITION(MEMBER_POSITION);
           member.setMEMBER_AUTHORITY(MEMBER_AUTHORITY);
           memberService.registMember(member);
           
           String script = "<script>alert('계정 등록이 완료되었습니다.');window.close(); window.opener.location.href='/member/login';</script>";
           return script;
           
   } 
   
   @Value("${picturePath}")
   private String picturePath;

   @RequestMapping(value = "/member/picture", produces = "text/plain;charset=utf-8")
   @ResponseBody
   public String pictureUpload(@RequestParam("pictureFile") MultipartFile multi, String oldPicture) throws Exception {
      String result = "";

      result = savePicture(oldPicture, multi);

      return result;
   }

   public String savePicture(String oldPicture, MultipartFile multi) throws Exception {
      String fileName = "";

      String uploadPath = this.picturePath;

      if (!(multi == null || multi.isEmpty() || multi.getSize() > 1024 * 1024 * 1)) {
         fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
         File storeFile = new File(uploadPath, fileName);

         multi.transferTo(storeFile);
      }

      if (oldPicture != null && !oldPicture.isEmpty()) {
         File oldFile = new File(uploadPath, oldPicture);
         if (oldFile.exists()) {
            oldFile.delete();
         }
      }

      return fileName;
   }

   @GetMapping("/member/getPicture")
   @ResponseBody
   public byte[] getPicture(String MEMBER_ID) throws Exception {
      Member member = memberService.getMemberByMEMBER_ID(MEMBER_ID);
      if (member == null)
         return null;

      String picture = member.getMEMBER_PIC();
      String imgPath = this.picturePath;

      InputStream in = new FileInputStream(new File(imgPath, picture));

      return IOUtils.toByteArray(in);
   }

   @GetMapping("/member/idCheck")
   public ResponseEntity<String> idCheck(String MEMBER_ID) {
      Member member = memberService.getMemberByMEMBER_ID(MEMBER_ID);

      if (member != null) {
         return ResponseEntity.ok("DUPLICATED");
      } else {
         return ResponseEntity.ok("AVAILABLE");
      }
   }

   @RequestMapping("/member/findPw")
   public void findPwGET() {
   }

   @PostMapping("/member/doFindPw")
   public String findPwPOST(Member member, HttpServletResponse response, RedirectAttributes reModel) {
      try {
         memberService.findPw(response, member);
         
         reModel.addFlashAttribute("MEMBER_ID", member.getMEMBER_ID());
         reModel.addFlashAttribute("VERTIFICATION_CODE", member.getVERTIFICATION_CODE());

         return "redirect:/member/sendCode";
      } catch (Exception e) {
         e.printStackTrace();
         return "redirect:/member/findPw";
      }
   }

   @RequestMapping("/member/sendCode")
   public String sendCode(Model model, @ModelAttribute("MEMBER_ID")String MEMBER_ID, @ModelAttribute("VERTIFICATION_CODE")String VERTIFICATION_CODE) {
      model.addAttribute("VERTIFICATION_CODE", VERTIFICATION_CODE);
      model.addAttribute("MEMBER_ID",MEMBER_ID);
      return "member/sendCode";
   }

   @PostMapping("/member/doSendCode")
   public String doSendCode(String VERTIFICATION_CODE, String MEMBER_ID, RedirectAttributes redirectAttributes) {
      if (memberService.verifyVerificationCode(MEMBER_ID, VERTIFICATION_CODE)) {
         redirectAttributes.addFlashAttribute("VERTIFICATION_CODE", VERTIFICATION_CODE);
         return "redirect:/member/newPw";
      } else {
         redirectAttributes.addFlashAttribute("errorMessage", "유효하지 않은 인증 코드입니다. 다시 입력해주세요.");
         return "member/sendCode";
      }
   }

   @RequestMapping("/member/newPw")
   public void newPw(@ModelAttribute("VERTIFICATION_CODE") String VERTIFICATION_CODE, Model model) {
      model.addAttribute("VERTIFICATION_CODE", VERTIFICATION_CODE);
   }

   @PostMapping("/member/doNewPw")
   @ResponseBody
   public String doNewPw(@RequestBody Member member, HttpServletResponse response) {
	   
	   String MEMBER_PW=member.getNEWPASSWORD();
	   String confirmPassword=member.getCONFIRMPASSWORD();
	   String VERTIFICATION_CODE=member.getVERTIFICATION_CODE();
      if (!MEMBER_PW.equals(confirmPassword)) {

         return "member/newPw?VERTIFICATION_CODE=" + VERTIFICATION_CODE;
      }

      if (!verifyNewPassword(MEMBER_PW)) {

         return "member/newPw?VERTIFICATION_CODE=" + VERTIFICATION_CODE;
      }

      memberService.updatePassword(VERTIFICATION_CODE, MEMBER_PW);
//      try {
//         response.sendRedirect("/member/login");
//      } catch (IOException e) {
//
//         e.printStackTrace();
//      }

      return null;
   }
   
   private boolean verifyNewPassword(String newPassword) {
      if (newPassword.length() < 8) {
         return false;
      }

      int categories = 0;
      if (newPassword.matches(".*[A-Z].*")) {
         categories++;
      }
      if (newPassword.matches(".*[a-z].*")) {
         categories++;
      }
      if (newPassword.matches(".*\\d.*")) {
         categories++;
      }
      if (newPassword.matches(".*[$@$!%*#?&].*")) {
         categories++;
      }

      if (categories >= 3) {
         return true;
      }

      return false;
   }
   
   @RequestMapping("/mypage/myPage")
   public String showMyPage(Model model, HttpSession session) {

      Member member = (Member) session.getAttribute("member");
      String MEMBER_ID = member.getMEMBER_ID();
      if (MEMBER_ID == null) {
         return "redirect:/member/login";
      }
      memberService.getMemberByMEMBER_ID(MEMBER_ID);
      model.addAttribute("member", member);

      return "mypage/myPage";
   }

   @RequestMapping("/mypage/CheckPassword")
   public String CheckPassword() {

      return "mypage/myPage";
   }


      @RequestMapping("/mypage/doCheckPassword")
      public String doCheckPassword(HttpSession session, String loginPwInput, Model model, String MEMBER_ID) {

          Member member = (Member) session.getAttribute("member");
          String MEMBER_PW = member.getMEMBER_PW();

          if (member != null && MEMBER_PW.equals(loginPwInput)) {
              // 비밀번호 일치
              model.addAttribute("member", member);
              return "redirect:/mypage/modify";
          } else {
              // 비밀번호 일치하지 않는 경우
              model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
              model.addAttribute("alertScript", "alert('비밀번호가 일치하지 않습니다.');");
              return "mypage/myPage";
          }
      }
      

      @GetMapping("/mypage/modify")
      public String modify(HttpSession session, Model model) {
         
         Member member = (Member) session.getAttribute("member");
         String MEMBER_ID = member.getMEMBER_ID();

         memberService.getMemberByMEMBER_ID(MEMBER_ID);

//         String picture = MakeFileName.parseFileNameFromUUID(member.getMEMBER_PIC(), "\\$\\$");
//         member.setMEMBER_PIC(picture);
         model.addAttribute("member", member);
            
         return "mypage/modify";
      }
      
      @PostMapping("/mypage/doModify")
      public String doModify(HttpSession session, Member member, String MEMBER_PIC, int MEMBER_NUM, String MEMBER_ID, String MEMBER_PW,
              String MEMBER_PHONE, String MEMBER_EMAIL, Model model) {

          memberService.modifyMember(member);
          Member updatedMember = memberService.getMemberByMEMBER_ID(MEMBER_ID);
          model.addAttribute("member", updatedMember);

          model.addAttribute("hideModifyButton", true);

          return "mypage/myPage";
      }

}
