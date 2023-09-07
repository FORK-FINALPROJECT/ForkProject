package com.fork.user.chart.model.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.fork.user.chart.model.vo.Chart;
import com.fork.user.management.model.vo.Category;

public interface ChartService {

	List<Chart> loadChart(Map<String, Date> day);

	List<Chart> loadMenuChart(Map<String, Object> day);
	
	List<Category> selectCategory();
	

}
