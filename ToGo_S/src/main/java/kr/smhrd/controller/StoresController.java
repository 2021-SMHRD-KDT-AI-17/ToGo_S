package kr.smhrd.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.smhrd.entity.Stores;
import kr.smhrd.mapper.StoresMapper;

@Controller
public class StoresController {
	
	@Autowired
	private StoresMapper storeMapper;
	
	@RequestMapping("/storeLogin")
	public String storeLogin(Stores store, HttpSession session) {
		Stores loginStore = storeMapper.storeLogin(store);
		session.setAttribute("loginStore", loginStore);
		if ((loginStore !=null ) && (loginStore.getStore_leave().equals("N"))) {
			return "index";
		}else {
			return "login";
		}
		
	}
	
}
