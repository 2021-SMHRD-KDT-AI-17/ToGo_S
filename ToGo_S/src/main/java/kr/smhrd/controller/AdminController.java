package kr.smhrd.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	// 로그아웃
	@RequestMapping("/adminLogout")
	public String adminLogout(HttpSession session) {
//      session.removeAttribute("m_list");
		session.invalidate();

		return "login";
	}
}
