package kr.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.smhrd.entity.Order_details;
import kr.smhrd.mapper.AdminMapper;

@Controller
public class OrderController {
	
	@Autowired
	private AdminMapper adminMapper;
	
	@RequestMapping("/goOrderMonth")
	public String goOrderMonth() {
		
		return "orderMonth";
	}
	
	@RequestMapping("/goOrderYesterday")
	public String goOrderYesterday() {
		
		return "orderYesterday";
	}
	
	@RequestMapping("/goOrderToday")
	public String goOrderToday() {
		
		return "orderToday";
	}
	
//	@RequestMapping("/goOrder")
//	public String goOrder() {
//		
//		return "StoresOrder";
//	}
	
	@RequestMapping("orderDo")
	public String orderDo(HttpSession session) {
		
		List<Order_details> order_detail_list = adminMapper.detailList();
		session.setAttribute("order_detail_list", order_detail_list);
		System.out.println(order_detail_list.toString());
		return "StoresOrder";
	}
	
	@RequestMapping("/gosoldout")
	public String gosoldout() {
		
		return "soldout";
	}
}
