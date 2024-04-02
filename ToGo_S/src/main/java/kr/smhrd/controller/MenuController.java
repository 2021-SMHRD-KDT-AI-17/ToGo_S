package kr.smhrd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.smhrd.mapper.MenusMapper;

@Controller
public class MenuController {
	
	@Autowired
	private MenusMapper menusMapper;	
	
	
}



