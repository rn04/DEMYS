package com.ducks.demys.boot.service;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.MemberRepository;
import com.ducks.demys.boot.vo.Member;

import jakarta.servlet.http.HttpServletResponse;

@Service
public class MemberService {
	
	private MemberRepository memberRepository;
	
	public MemberService(MemberRepository memberRepository) {
		this.memberRepository= memberRepository;
	}
	
	public List<Member> getMemberList(){
		return memberRepository.getMemberList();
	}
	
	public Member getMemberByMEMBER_NUM(int MEMBER_NUM) {
		return memberRepository.getMemberByMEMBER_NUM(MEMBER_NUM);
	}
	    
    public Member getMemberByMEMBER_ID(String MEMBER_ID) {
        return memberRepository.getMemberByMEMBER_ID(MEMBER_ID);
    }
	
	public void registMember(Member member) {
		member.setMEMBER_NUM(memberRepository.selectMemberSequenceNextValue());
		memberRepository.registMember(member);
	}
	
	public void modifyMember(Member member) {
		memberRepository.modifyMember(member);
	}
	
	public void modifyForQuitMember(Member member) {
		memberRepository.modifyForQuitMember(member);
	}
	
	public void removeMember(int MEMBER_NUM) {
		memberRepository.removeMember(MEMBER_NUM);
	}
	
	public void findPw(HttpServletResponse response, Member member) throws Exception {
	    response.setContentType("text/html;charset=utf-8");
	    Member ck = memberRepository.readMember(member.getMEMBER_ID());
	    PrintWriter out = response.getWriter();

	    if (memberRepository.idCheck(member.getMEMBER_ID()) == null ) {
	        // 아이디가 존재하지 않는 경우 처리
	        out.println("<script>");
	        out.println("alert('아이디가 존재하지 않습니다.');");
	        out.println("history.go(-1);");
	        out.println("</script>");
	    } else if (!member.getMEMBER_EMAIL().equals(ck.getMEMBER_EMAIL())) {
	        // 이메일이 일치하지 않는 경우 처리
	        out.println("<script>");
	        out.println("alert('입력한 이메일이 일치하지 않습니다.');");
	        out.println("history.go(-1);");
	        out.println("</script>");
	    } else {
	        String verificationCode = generateTemporaryPassword();
	        member.setVERTIFICATION_CODE(verificationCode);

	        memberRepository.updateVerificationCode(member.getMEMBER_ID(), verificationCode);
	        sendEmail(member, "findPw");
	    }
	}
	//이메일발송
	public void sendEmail(Member member, String div) throws MessagingException {
        String host = "smtp.naver.com";
        int port = 587;
        String username = "아이디";
        String password = "비밀번호";
        String fromEmail = "dnjsal7461@naver.com";
        String fromName = "DEMYS";
        String subject = "";
        String message = "";

        if (div.equals("findPw")) {
            subject = "DEMYS 임시 비밀번호";
            message = "안녕하세요. " + member.getMEMBER_ID() + ",\n\n"
                    + "We have generated a temporary password for your account. Please use the following password to log in:\n\n"
                    + "Temporary Password: " + member.getVERTIFICATION_CODE() + "\n\n"
                    + "Please remember to change your password after logging in.\n\n"
                    + "Best regards,\n"
                    + "Your Company";
        }

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        Message emailMessage = new MimeMessage(session);
        try {
			emailMessage.setFrom(new InternetAddress(fromEmail, fromName));
		} catch (UnsupportedEncodingException | MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        emailMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(member.getMEMBER_EMAIL()));
        emailMessage.setSubject(subject);
        emailMessage.setText(message);

        Transport.send(emailMessage);
    }


	
	//임시 비밀번호 생성
	private String generateTemporaryPassword() {
	    StringBuilder password = new StringBuilder();
	    String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	    int length = 8;

	    for (int i = 0; i < length; i++) {
	        int randomIndex = (int) (Math.random() * characters.length());
	        password.append(characters.charAt(randomIndex));
	    }

	    return password.toString();
	}
	
	// 임시 비밀번호 검증
	 public boolean verifyVerificationCode(String MEMBER_ID, String VERTIFICATION_CODE) {
		if(VERTIFICATION_CODE == null || VERTIFICATION_CODE.isEmpty()) {
			return false;
		}
		String code = memberRepository.verifyVerificationCode(MEMBER_ID, VERTIFICATION_CODE);
        if (code != null) {
            return true;
        }
        return false;
    }

	 
	 public void updatePassword(String VERTIFICATION_CODE, String MEMBER_PW) {
		    memberRepository.updatePassword(VERTIFICATION_CODE, MEMBER_PW);
		}

	public Member findByPassword(String newAuthority, String authority_code) {
		return memberRepository.findByPassword(newAuthority, authority_code);
	}

	public List<Member> getMemberListSearch(String searchType, String keyword){
		List<Member> memberList = memberRepository.getMemberListSearch(searchType, keyword);
		
		return memberList;
	}

	public List<Member> getMemberByMEMBER_DEP(String MEMBER_DEP){
		return memberRepository.getMemberByMEMBER_DEP(MEMBER_DEP);
	}

}