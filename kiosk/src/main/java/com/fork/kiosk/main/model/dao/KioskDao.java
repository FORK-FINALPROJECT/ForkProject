package com.fork.kiosk.main.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fork.kiosk.main.model.vo.Category;

@Repository
public class KioskDao {
	
	@Autowired
	private SqlSessionTemplate session;

	public List<Category> selectCategoryAndMenuAndOptions() {
		return session.selectList("kiosk.selectCategoryAndMenuAndOptions");
	}
	
}
