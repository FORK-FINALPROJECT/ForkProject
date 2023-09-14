package com.fork.user.kitchen.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fork.user.kitchen.model.service.KitchenService;
import com.fork.user.kitchen.model.vo.MenuOption;
import com.fork.user.kitchen.model.vo.PayStructure;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class KitchenController {
	
	@Autowired
	private KitchenService kitchenService;
	
	@GetMapping("/kitchen")
    public String toKitchen(Model model) {
		List<PayStructure> orderList = kitchenService.selectPaylist();

		for (PayStructure order : orderList) {
			List<MenuOption> menuList = kitchenService.selectMenulist(order.getTrNo());
			order.setMenuOption(menuList);
		}
		
		model.addAttribute("orderList", orderList);
		
		return "kitchen/kitchen";
        
    }
	
	@GetMapping("/kitchen/newOrder")
	@ResponseBody
	public PayStructure newOrder(int rno) {
		
		// 테이블정보 조회
		PayStructure newOrder = kitchenService.selectTableInfo(rno);
		
		if ( newOrder != null ) {
			List<MenuOption> menuList = kitchenService.selectMenulist(rno);
			newOrder.setMenuOption(menuList);
		}
		
		return newOrder;		
		
	}
	
}
