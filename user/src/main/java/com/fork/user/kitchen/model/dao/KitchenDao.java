package com.fork.user.kitchen.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fork.user.kitchen.model.vo.MenuOption;
import com.fork.user.kitchen.model.vo.PayStructure;

@Repository
public class KitchenDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<PayStructure> selectPaylist() {
		return sqlSession.selectList("kitchenMapper.selectPaylist");
	}

	public List<MenuOption> selectMenulist(int no) {
		return sqlSession.selectList("kitchenMapper.selectMenulist", no);
	}
	
	

}

