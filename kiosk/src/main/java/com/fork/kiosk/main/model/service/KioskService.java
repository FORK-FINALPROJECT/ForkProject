package com.fork.kiosk.main.model.service;

import java.util.List;

import com.fork.kiosk.main.model.vo.Category;
import com.fork.kiosk.main.model.vo.Coo;
import com.fork.kiosk.main.model.vo.TotalReceipt;

public interface KioskService {

	List<Category> selectCategoryAndMenuAndOptions();

	List<Coo> selectCoo();

	TotalReceipt selectTotalReceipt(Integer kioskNo);

}
