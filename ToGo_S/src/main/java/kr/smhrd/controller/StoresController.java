package kr.smhrd.controller;

import java.awt.Menu;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.smhrd.entity.Menus;
import kr.smhrd.entity.Stores;
import kr.smhrd.mapper.MenusMapper;
import kr.smhrd.mapper.StoresMapper;

@Controller
public class StoresController {
	
	@Autowired
	private StoresMapper storeMapper;
	
	@Autowired
	private MenusMapper menusMapper;
	
	@RequestMapping("/storeLogin")
	public String storeLogin(Stores store, HttpSession session) {
		Stores loginStore = storeMapper.storeLogin(store);
		session.setAttribute("loginStore", loginStore);
		if ((loginStore !=null ) && (loginStore.getStore_leave().equals("N"))) {
			
			
			List<Menu> m_list = menusMapper.getMenuList(loginStore.getStore_id());
			session.setAttribute("m_list", m_list);
			return "index";
		}else {
			return "login";
		}
		
	}
	
	@RequestMapping("/goMenu")
	public String goMenu() {
		
		
		return "index_SHS";
	}
	
	@RequestMapping("/updateMenu")
	public String updateMenu( Menus menu) {
		
		
		
		System.out.println(menu.toString());
		return "index_SHS";
	}
	
}
