package kr.smhrd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReservController {

	@RequestMapping("/goRes")
	public String goRes() {
		
		return "StoresRes";
	}
	
}
