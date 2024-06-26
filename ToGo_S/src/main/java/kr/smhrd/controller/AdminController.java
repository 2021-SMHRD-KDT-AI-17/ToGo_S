package kr.smhrd.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.smhrd.entity.Order_details;
import kr.smhrd.mapper.AdminMapper;

@Controller
public class AdminController {

	
	private AdminMapper adminMapper;
	
	// 로그아웃
	@RequestMapping("/adminLogout")
	public String adminLogout(HttpSession session) {
//      session.removeAttribute("m_list");
		session.invalidate();

		return "login";
	}
}
