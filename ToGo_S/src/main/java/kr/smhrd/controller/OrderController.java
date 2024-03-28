package kr.smhrd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {
	
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
	
	@RequestMapping("/goOrder")
	public String goOrder() {
		
		return "StoresOrder";
	}
}
