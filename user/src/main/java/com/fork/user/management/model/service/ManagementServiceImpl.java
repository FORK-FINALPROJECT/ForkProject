package com.fork.user.management.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fork.user.management.model.dao.ManagementDao;
import com.fork.user.management.model.vo.Category;
import com.fork.user.management.model.vo.Coo;
import com.fork.user.management.model.vo.Menu;
import com.fork.user.management.model.vo.Option;

@Service
public class ManagementServiceImpl implements ManagementService {

	@Autowired
	private ManagementDao managementDao;
	
	@Override
	public int insertCategory(Category category) {
		return managementDao.insertCategory(category);
	}

	@Override
	public int insertMenu(Menu menu) {
		return managementDao.insertMenu(menu);
	}

	@Override
	public List<Category> selectCategoryList() {
		return managementDao.selectCategoryList();
	}

	@Override
	public int insertOption(Option option) {
		return managementDao.insertOption(option);
	}

	@Override
	public List<Option> selectOptionList() {
		return managementDao.selectOptionList();
	}

	@Override
	public int insertCoo(Coo coo) {
		return managementDao.insertCoo(coo);
	}

	@Override
	public int deleteCoo(int cooNo) {
		return managementDao.deleteCoo(cooNo);
	}

	@Override
	public List<Category> selectCategory(int currentPage, Map<String, Object> paramMap) {
		return managementDao.selectCategory(currentPage, paramMap);
	}

	@Override
	public int selectCategoryCount(Map<String, Object> paramMap) {
		return managementDao.selectCategoryCount(paramMap);
	}

	@Override
	public List<Coo> selectCoo(int currentPage, Map<String, Object> paramMap) {
		return managementDao.selectCoo(currentPage, paramMap);
	}

	@Override
	public int selectCooCount(Map<String, Object> paramMap) {
		return managementDao.selectCooCount(paramMap);
	}

	@Override
	public int updateCategory(Category category) {
		return managementDao.updateCategory(category);
	}

	@Override
	public Category selectCategoryOne(int categoryNo) {
		return managementDao.selectCategoryOne(categoryNo);
	}

	@Override
	public int deleteCategory(int categoryNo) {
		return managementDao.deleteCategory(categoryNo);
	}

	@Override
	public List<Option> selectOption(int currentPage, Map<String, Object> paramMap) {
		return managementDao.selectOption(currentPage, paramMap);
	}

	@Override
	public int selectOptionCount(Map<String, Object> paramMap) {
		return managementDao.selectOptionCount(paramMap);
	}

	@Override
	public int deleteOption(int optionNo) {
		return managementDao.deleteOption(optionNo);
	}

	@Override
	public Option selectOptionOne(int optionNo) {
		return managementDao.selectOptionOne(optionNo);
	}

	@Override
	public List<Menu> selectMenu(Map<String, Object> paramMap) {
		return managementDao.selectMenu(paramMap);
	}

	@Override
	public List<Menu> selectMenu() {
		return managementDao.selectMenu();
	}

	@Override
	public List<Category> selectCategory() {
		return managementDao.selectCategory();
	}


}
