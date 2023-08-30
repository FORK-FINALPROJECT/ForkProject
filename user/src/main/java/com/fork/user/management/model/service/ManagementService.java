package com.fork.user.management.model.service;

import java.util.List;
import java.util.Map;

import com.fork.user.management.model.vo.Category;
import com.fork.user.management.model.vo.Coo;
import com.fork.user.management.model.vo.Menu;
import com.fork.user.management.model.vo.Option;

public interface ManagementService {

	int insertCategory(Category category);

	int insertMenu(Menu menu);

	List<Category> selectCategoryList();

	int insertOption(Option option);

	List<Option> selectOptionList();

	int insertCoo(Coo coo);

	int deleteCoo(int cooNo);

	List<Category> selectCategory(int currentPage, Map<String, Object> paramMap);

	int selectCategoryCount(Map<String, Object> paramMap);

	List<Coo> selectCoo(int currentPage, Map<String, Object> paramMap);

	int selectCooCount(Map<String, Object> paramMap);

	int updateCategory(Category category);

	Category selectCategoryOne(int categoryNo);

	int deleteCategory(int categoryNo);

	List<Option> selectOption(int currentPage, Map<String, Object> paramMap);

	int selectOptionCount(Map<String, Object> paramMap);

	int deleteOption(int optionNo);

	Option selectOptionOne(int optionNo);

	List<Menu> selectMenu(Map<String, Object> paramMap);

}
