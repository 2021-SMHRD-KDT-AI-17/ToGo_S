package kr.smhrd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.smhrd.entity.Menus;
import kr.smhrd.entity.Order_details;
import kr.smhrd.mapper.AdminMapper;
import kr.smhrd.mapper.MenusMapper;

@org.springframework.web.bind.annotation.RestController
public class RestController {
	
	@Autowired
	private AdminMapper adminMapper;
	
	@Autowired
	private MenusMapper menusMapper;
	
	@RequestMapping("/order_Detail_Select")
	@ResponseBody
	public List<Order_details> order_Detail_Select(int order_idx) {
	    List<Order_details> order_details = adminMapper.orderDetailSelect(order_idx);
	    
	    System.out.println(order_details.toString());
	    
	    return order_details;
	}
	
	//주문번호 클릭하면 상세주문 정보 알려주기	
	@RequestMapping("/getMenu")
	@ResponseBody
	public Menus getMenu(int menu_idx) {
	    Menus menu_name = adminMapper.getMenu_name(menu_idx);
	    System.out.println("메뉴 이름: " + menu_name);
	    return menu_name;
	}




	  // 매진여부확인
	@RequestMapping("/updateSoldout")
	public String updateSoldout(@RequestParam("menuName") String menuName, 
	                            @RequestParam("menuSoldout") String menuSoldout) {
	    try {
	        // 해당 메뉴의 품절 여부를 업데이트하는 메서드 호출
	        menusMapper.updateSoldout(menuName, menuSoldout);
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "error"; // 에러 발생 시 에러 페이지로 이동
	    }
	    return "redirect:/soldout"; // 업데이트 성공 시 메뉴 페이지로 리다이렉트
	}
	
	@RequestMapping("/comOrder")
	public String comOrder() {
		return "";
	}

	
}
