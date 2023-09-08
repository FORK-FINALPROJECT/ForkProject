package com.fork.kiosk.main.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fork.kiosk.main.model.dao.KioskDao;
import com.fork.kiosk.main.model.vo.Category;
import com.fork.kiosk.main.model.vo.Coo;
import com.fork.kiosk.main.model.vo.TotalReceipt;

@Service
public class KioskServiceImpl implements KioskService {

	@Autowired
	private KioskDao kioskDao;

	@Override
	public List<Category> selectCategoryAndMenuAndOptions() {
		return kioskDao.selectCategoryAndMenuAndOptions();
	}

	@Override
	public List<Coo> selectCoo() {
		return kioskDao.selectCoo();
	}
	
	@Override
	public TotalReceipt selectTotalReceipt(Integer kioskNo){
		return kioskDao.selectTotalReceipt(kioskNo);
	}
	
}
