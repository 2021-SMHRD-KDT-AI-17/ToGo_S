package kr.smhrd.controller;

import java.awt.Menu;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.smhrd.entity.Order;
import kr.smhrd.entity.Stores;
import kr.smhrd.mapper.AdminMapper;
import kr.smhrd.mapper.MenusMapper;
import kr.smhrd.mapper.StoresMapper;

@Controller
public class GoController {
	
	@Autowired
	private StoresMapper storeMapper;
	@Autowired
	private MenusMapper menusMapper;
	@Autowired
	private AdminMapper adminMapper;
	
	// 로그인 완료 이동
	@RequestMapping("/storeLogin")
	public String storeLogin(Stores store, HttpSession session) {
		Stores loginStore = storeMapper.storeLogin(store);
		session.setAttribute("loginStore", loginStore);
		System.out.println(loginStore.toString());
		if ((loginStore !=null ) && (loginStore.getStore_leave().equals("N"))) {
			
			// 메뉴리스트 가져오기
			List<Menu> m_list = menusMapper.getMenuList(loginStore.getStore_id());
			session.setAttribute("m_list", m_list);
			
			// 주문 리스트 가져오기
			List<Order> order_list = adminMapper.orderList();
			session.setAttribute("order_list", order_list);
			System.out.println(order_list.toString());
			
			return "index";
			
		}else {
			return "login";
		}
		
	}
	// 로그인 이후 -> 주문 관리
	@RequestMapping("/goOrderCon")
    public String goOrderCon() {
    	return"StoresOrder";
    }
	
	// 로그인 이후 -> 완료 주문 관리
	@RequestMapping("/goComOrder")
	public String orComOrder() {
		return "";
	}
	
	// 로그인 이후 -> 메뉴 수정/ 추가/ 삭제
	@RequestMapping("/goConMenu")
	public String goConMenu() {
		return "Menu";
	}
	
	//로그인 이후 -> 매출관리
	@RequestMapping("/goMoney")
	public String goMoney() {
		return"Money";
	}
	
	@RequestMapping("/goReservation")
	public String goReservation() {
		return "reservation";
	}
	
	@RequestMapping("/goStoreOrder")
	public String goStoreOrder() {
		return "StoresOrder";
	}
	
	@RequestMapping("/logout")
	public String logout() {
		return "login";
	}
}
