package com.fork.user.sales.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fork.user.sales.model.service.SalesService;
import com.fork.user.sales.model.vo.Receipt;
import com.fork.user.sales.model.vo.Structure;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class salesController {
	
	@Autowired
	private SalesService salesService;

	@GetMapping("/deleteStructure")
	@ResponseBody
	public int deleteStructure() {
		
		int result = salesService.deleteStructure();
		
		return result;
	}
	
	@GetMapping("/saveStructure")
	public void saveStructure(Structure struc) {
		int result = salesService.saveStructure(struc);
	}
	
	@GetMapping("/detailOrder")
	@ResponseBody
	public List<Receipt> detailOrder(int kioskNo) {
		List<Receipt> orderList = salesService.detailOrderList(kioskNo); 
		
		return orderList;
	}
	
	@GetMapping("/clearTable")
	@ResponseBody
	public int clearTable(int kioskNo) {
		int result = salesService.clearTable(kioskNo);
		return result;
	}
	

}


