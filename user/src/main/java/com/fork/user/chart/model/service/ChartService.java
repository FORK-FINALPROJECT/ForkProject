package com.fork.user.chart.model.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.fork.user.chart.model.vo.Chart;

public interface ChartService {

	List<Chart> loadChart(Map<String, Date> day);

}
