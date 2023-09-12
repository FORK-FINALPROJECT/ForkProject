package com.fork.kiosk.main.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fork.kiosk.main.model.vo.Category;
import com.fork.kiosk.main.model.vo.Coo;
import com.fork.kiosk.main.model.vo.TotalReceipt;

@Repository
public class KioskDao {
	
	@Autowired
	private SqlSessionTemplate session;

	public List<Category> selectCategoryAndMenuAndOptions() {
		return session.selectList("kiosk.selectCategoryAndMenuAndOptions");
	}

	public List<Coo> selectCoo() {
		return session.selectList("kiosk.selectCoo");
	}

	public TotalReceipt selectTotalReceipt(Integer kioskNo) {
		return session.selectOne("kiosk.selectTotalReceipt",kioskNo);
	}

	// 동연 => 안되면 아래꺼 주석 풀기
	// 총영수증 번호 조회 및 없을 시 insert후 재조회
	public int selectTotalReceiptNo(HashMap<String, Object> param) {
		Integer result = session.selectOne("kiosk.selectTotalReceiptNo", param);
		return result == null ? 0 : result;
	}

	public int insertTotalReceiptNo(HashMap<String, Object> param) {
		return session.insert("kiosk.insertTotalReceiptNo", param);
	}

	public int insertPay(HashMap<String, Object> param) {
		return session.insert("kiosk.insertPay", param);
	}

	// 기존
//	public int selectTotalReceiptNo(HashMap<String, Object> param) {
//		Integer result =  session.selectOne("kiosk.selectTotalReceiptNo",param);
//		return result == null ? 0 : result;
//	}
//
//	public int insertTotalReceiptNo(HashMap<String, Object> param) {
//		return session.insert("kiosk.insertTotalReceiptNo",param);
//	}
//
//	public int insertPay(HashMap<String, Object> param) {
//		return session.insert("kiosk.insertPay",param);
//	}
//
//	public int insertReceipt(HashMap<String, Object> param) {
//		return session.insert("kiosk.insertReceipt",param);
//	}
//
//	public int insertReceiptMenus(HashMap<String, Object> param) {
//		List<HashMap<String , Object>> list = (List<HashMap<String , Object>>)param.get("cartItems");
//		for(HashMap<String, Object> cartItem : list) {
//			if((cartItem.get("menuNo") != null && (int)cartItem.get("menuNo") == 0  ) || cartItem.get("menuNo") == null) continue;
//			cartItem.put("receiptNo", param.get("receiptNo"));
//			session.insert("kiosk.insertReceiptMenus",cartItem);
//			for(HashMap<String , Object> options : (List<HashMap<String , Object>>)cartItem.get("selectedOption")) {
//				if((options.get("optionNo") != null && (int)options.get("optionNo") == 0  ) || options.get("optionNo") == null) continue;
//				options.put("receiptMenuNo", cartItem.get("receiptMenuNo"));
//				session.insert("kiosk.insertReceiptOptions", options );
//			 }
//		}
//		return 1;
//	} 
	
	
}
