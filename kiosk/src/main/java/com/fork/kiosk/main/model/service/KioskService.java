package com.fork.kiosk.main.model.service;

import java.util.HashMap;
import java.util.List;

import com.fork.kiosk.main.model.vo.Category;
import com.fork.kiosk.main.model.vo.Coo;
import com.fork.kiosk.main.model.vo.TotalReceipt;

public interface KioskService {

	List<Category> selectCategoryAndMenuAndOptions();

	List<Coo> selectCoo();

	TotalReceipt selectTotalReceipt(Integer kioskNo);

	// 동연 => 안되면 아래꺼 주석 풀기
	// 총영수증 번호 조회 및 없을 시 insert후 재조회
	int selectTotalReceiptNo(HashMap<String, Object> param);

	int insertPay(HashMap<String, Object> param);

	// 기존
//	int selectTotalReceiptNo(HashMap<String, Object> param);
//
//	int insertPay(HashMap<String, Object> param);
//
//	int insertReceipt(HashMap<String, Object> param);
//
//	int insertReceiptMenus(HashMap<String, Object> param);
	

}
