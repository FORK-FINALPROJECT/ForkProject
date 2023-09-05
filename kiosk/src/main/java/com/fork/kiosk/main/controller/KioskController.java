package com.fork.kiosk.main.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fork.kiosk.main.model.service.KioskService;
import com.fork.kiosk.main.model.vo.Category;
import com.fork.kiosk.main.model.vo.Coo;

import lombok.extern.slf4j.Slf4j;

// 테스트트
@RestController
@Slf4j
public class KioskController {

	@Autowired
	private KioskService kioskService;
	
	@GetMapping("/category")
	public List<Category> category(HttpServletResponse response){
		try {
			List<Category> list = kioskService.selectCategoryAndMenuAndOptions();
			log.info("dd {}", list);
			return list;
		}catch(Exception e) {
			throw e;
		}
		
	}
	
	@GetMapping("/coo")
	public List<Coo> coo(HttpServletResponse response){
		
		List<Coo> cooList = kioskService.selectCoo();
		log.info("cooLisg : {} ", cooList);
		return cooList;
		
	}
	

    
}