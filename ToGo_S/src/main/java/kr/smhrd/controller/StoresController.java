package kr.smhrd.controller;

import java.awt.Menu;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.smhrd.entity.Menus;
import kr.smhrd.entity.Order;

import kr.smhrd.entity.Stores;
import kr.smhrd.mapper.AdminMapper;
import kr.smhrd.mapper.MenusMapper;
import kr.smhrd.mapper.StoresMapper;

@Controller
public class StoresController {
	
	@Autowired
	private StoresMapper storeMapper;
	
	@Autowired
	private MenusMapper menusMapper;
	
	@Autowired
	private AdminMapper adminMapper;
	

	
	
	@RequestMapping("/goMenu")
	public String goMenu(HttpSession session) {
		
		List<Order> order_list = adminMapper.orderList();
		session.setAttribute("order_list", order_list);
		System.out.println(order_list.toString());
		return "Menu";
	}
	
	@RequestMapping("/updateMenu")
	public String updateMenu( Menus menu, HttpSession session) {
		
		Stores loginStore = (Stores) session.getAttribute("loginStore");
		menu.setStore_id(loginStore.getStore_id());
		
		if(menu.getMenu_soldout() == null) {
			menu.setMenu_soldout("n");
		}else {
			menu.setMenu_soldout("y");
		}
		
		if(menu.getMenu_idx()>0) {
			menusMapper.updateMenu(menu);
		}else {
			menusMapper.insertMenu(menu);
		}
			System.out.println(menu.toString());
		
			List<Menu> m_list = menusMapper.getMenuList(loginStore.getStore_id());
			session.setAttribute("m_list", m_list);
		return "redirect:/goMenu";
	}
	
}
