package com.fork.kiosk.main.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.fork.kiosk.main.model.service.KioskService;
import com.fork.kiosk.main.model.vo.Category;
import com.fork.kiosk.main.model.vo.Coo;
import com.fork.kiosk.main.model.vo.TotalReceipt;

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
	
	@PostMapping("/receipt/{kioskNo}")
	public TotalReceipt totalReceiptTest(@PathVariable("kioskNo") int kioskNo , HttpSession session){
		session.setAttribute("kioskNo", kioskNo);
//		log.info("kioskNo:{}", kioskNo);
		TotalReceipt totalReceipt = kioskService.selectTotalReceipt(kioskNo);
		log.info("list : {}" , totalReceipt);
		return totalReceipt;
	}
	
	@PostMapping("/payment/{kioskNo}")
	public ResponseEntity<?> payment(@PathVariable("kioskNo") int kioskNo , @RequestBody HashMap<String ,Object> param){
		log.info("param : {}" , param);
		param.put("kioskNo", kioskNo);
		
		// 1) 결제 안된 총 영수증번호 얻어오기/ 없으면 추가후 얻어오기
		int totalReceiptNo = kioskService.selectTotalReceiptNo(param);
		// 페이테이블 정보 추가
		int payNo  = kioskService.insertPay(param);
		// 영수증 추가
		int ReceiptNo  = kioskService.insertReceipt(param);
		// 영수증 아래에  영수증별 메뉴 , 영수증메뉴아래에 옵션들 추가
		int result  = kioskService.insertReceiptMenus(param);
		
		return null;
	}
	
	
	/*
	 * @GetMapping("/receipt") public ResponseEntity<?> getReceiptData(HttpServletRequest request) { 
	 * HttpSession session = request.getSession(); Integer kioskNo = (Integer) session.getAttribute("kioskNo");
	 * 
	 * if (kioskNo != null) { 
	 * List<receipt> receipt = kioskService.getReceiptData(kioskNo); 
	 * return ResponseEntity.ok(getReceiptData); 
	 * } else { 
	 * return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("세션이 없거나 유효하지 않습니다."); }
	 * }
	 */

    
}