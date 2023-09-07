package com.fork.user.chart.model.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fork.user.chart.model.vo.Chart;
import com.fork.user.management.model.vo.Category;

@Repository
public class ChartDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Chart> loadChart(Map<String, Date> day) {
		return sqlSession.selectList("chartMapper.loadChart", day);
	}

	public List<Chart> loadMenuChart(Map<String, Object> day) {
		return sqlSession.selectList("chartMapper.loadMenuChart", day);
	}

	public List<Category> selectCategory() {
		return sqlSession.selectList("chartMapper.selectCategory");
	}


}
