package kr.smhrd.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.smhrd.entity.Member;
import kr.smhrd.entity.Message;
import kr.smhrd.mapper.MemberMapper;
import kr.smhrd.mapper.MessageMapper;


//Handler Mapping이 Controller를 찾기위해 @(Annotation)으로 Controller라고 명시해야 함
// servlet-context.xml 파일에 어떤 패키지에서 Controller를 찾을건지 명시
@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired // 객체를 컨테이너에 올려놓고 주입받아사용하는 기능
	private MemberMapper memberMapper;
	@Autowired
	private MessageMapper messageMapper;
	
	// Main.jsp로 이동하는 메소드
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		
		return "Main"; // /WEB-INF/views/Main.jsp -> view name 값만 리턴(보안을 위해)
	}
	// Main 으로 이동
	@RequestMapping("/goMain")
	public String goMain() {
		return "Main";
	}
	
	// 회원가입 메소드 /memberInsert라고 요청이들어오면 실행
	@RequestMapping("/memberInsert")
	public String memberInsert(Member member, Model model) {
		//System.out.println(member.toString());
		
		memberMapper.memberInsert(member);
		model.addAttribute("email", member.getEmail());
		
		return "JoinSuccess";
	}
	
	// 로그인 /memberSelect
	@RequestMapping("/memberSelect")
	public String memberSelect(Member member, HttpSession session) {
		// System.out.println(member.toString());
		Member loginMember = memberMapper.memberSelect(member);
		session.setAttribute("loginMember", loginMember);
		// 로그인한 사람의 메세지 가져오기
		List<Message> m_list = messageMapper.messageList(member.getEmail());
		session.setAttribute("m_list", m_list);
		return "Main";
	}
	
	
	// 회원정보 수정하는 페이지로 이동 /showUpdate
	@RequestMapping("/showUpdate")
	public String showUpdate() {
		return "UpdateMember";
	}
	
	// 회원정보 수정
	@RequestMapping("/memberUpdate")
	public String memberUpdate(Member member, HttpSession session) {
		//System.out.println(member.toString());
		memberMapper.memberUpdate(member);
		session.setAttribute("loginMember", member);
		return "Main";
	}
	
	// 로그아웃 /memberLogout
	@RequestMapping("/memberLogout")
	public String memberLogout(HttpSession session) {
		//session.removeAttribute("loginMember");
		session.invalidate();
		return "Main";
	}
	
	// 회원정보 페이지로 이동 + 전체회원정보 가져오기 /goShowMember
	@RequestMapping("/goShowMember")
	public String goShowMember(Model model) {
		List<Member> list = memberMapper.goShowMember();
		model.addAttribute("list", list);
		
		return "ShowMember";
	}
	
	
	// 회원삭제 /deleteMember
	@RequestMapping("/deleteMember")
	public String deleteMember(@RequestParam("email") String email) { // /deleteMember?email=?
		memberMapper.deleteMember(email);
		
		// 삭제한 결과가 바로 반영되기 위해서는 sendRedirect 방식으로 보내야 request 결과가 server 단에서 
		// 최신의 결과를 다시 response해서 준다
		return "redirect:/goShowMember";
	}
	
	
	
}
