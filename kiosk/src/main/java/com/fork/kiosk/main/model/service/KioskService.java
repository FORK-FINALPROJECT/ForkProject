package com.fork.kiosk.main.model.service;

import java.util.List;

import com.fork.kiosk.main.model.vo.Category;

public interface KioskService {

	List<Category> selectCategoryAndMenuAndOptions();

}
