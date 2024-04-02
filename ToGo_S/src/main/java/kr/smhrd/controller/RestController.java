package kr.smhrd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.smhrd.entity.Menus;
import kr.smhrd.entity.Order_details;
import kr.smhrd.mapper.AdminMapper;

@org.springframework.web.bind.annotation.RestController
public class RestController {
	
	@Autowired
	private AdminMapper adminMapper;
	
	@RequestMapping("/order_Detail_Select")
	@ResponseBody
	public List<Order_details> order_Detail_Select(int order_idx) {
	    List<Order_details> order_details = adminMapper.orderDetailSelect(order_idx);
	    
	    System.out.println(order_details.toString());
	    
	    return order_details;
	}
	
	
	@RequestMapping("/getMenu")
	@ResponseBody
	public Menus getMenu(int menu_idx) {
	    Menus menu_name = adminMapper.getMenu_name(menu_idx);
	    System.out.println("메뉴 이름: " + menu_name);
	    return menu_name;
	}


	//주문번호 클릭하면 상세주문 정보 알려주기
}
