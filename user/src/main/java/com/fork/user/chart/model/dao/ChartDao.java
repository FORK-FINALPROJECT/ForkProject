package com.fork.user.chart.model.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fork.user.chart.model.vo.Chart;

@Repository
public class ChartDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Chart> loadChart(Map<String, Date> day) {
		return sqlSession.selectList("chartMapper.loadChart", day);
	}


}
