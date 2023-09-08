package com.fork.kiosk.main.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fork.kiosk.main.model.vo.Category;
import com.fork.kiosk.main.model.vo.Coo;
import com.fork.kiosk.main.model.vo.TotalReceipt;
import com.fork.kiosk.main.model.vo.TotalReceiptTest;

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
	
}
