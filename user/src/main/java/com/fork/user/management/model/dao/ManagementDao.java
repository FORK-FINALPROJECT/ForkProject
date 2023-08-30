package com.fork.user.management.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fork.user.management.model.vo.Category;
import com.fork.user.management.model.vo.Coo;
import com.fork.user.management.model.vo.Menu;
import com.fork.user.management.model.vo.Option;

@Repository
public class ManagementDao {

	@Autowired
	private SqlSessionTemplate session;

	public int insertCategory(Category category) {
		return session.insert("managementMapper.insertCategory", category);
	}

	public int insertMenu(Menu menu) {
		return session.insert("managementMapper.insertMenu", menu);
	}

	public List<Category> selectCategoryList() {
		return session.selectList("managementMapper.selectCategoryList");
	}

	public int insertOption(Option option) {
		return session.insert("managementMapper.insertOption", option);
	}

	public List<Option> selectOptionList() {
		return session.selectList("managementMapper.selectOptionList");
	}

	public int insertCoo(Coo coo) {
		return session.insert("managementMapper.insertCoo", coo);
	}

	public int deleteCoo(int cooNo) {
		return session.delete("managementMapper.deleteCoo", cooNo);
	}

	public List<Category> selectCategory(int currentPage, Map<String, Object> paramMap) {
		
		int offset = (currentPage - 1) * 10;
		int limit = 10;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return session.selectList("managementMapper.selectCategory", paramMap, rowBounds);
	}

	public int selectCategoryCount(Map<String, Object> paramMap) {
		return session.selectOne("managementMapper.selectCategoryCount", paramMap);
	}

	public List<Coo> selectCoo(int currentPage, Map<String, Object> paramMap) {
		
		int offset = (currentPage - 1) * 10;
		int limit = 10;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return session.selectList("managementMapper.selectCoo", paramMap, rowBounds);
	}

	public int selectCooCount(Map<String, Object> paramMap) {
		return session.selectOne("managementMapper.selectCooCount", paramMap);
	}

	public int updateCategory(Category category) {
		return session.update("managementMapper.updateCategory", category);
	}

	public Category selectCategoryOne(int categoryNo) {
		return session.selectOne("managementMapper.selectCategoryOne", categoryNo);
	}

	public int deleteCategory(int categoryNo) {
		return session.delete("managementMapper.deleteCategory", categoryNo);
	}

	public List<Option> selectOption(int currentPage, Map<String, Object> paramMap) {
		
		int offset = (currentPage - 1) * 10;
		int limit = 10;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return session.selectList("managementMapper.selectOption", paramMap, rowBounds);
	}

	public int selectOptionCount(Map<String, Object> paramMap) {
		return session.selectOne("managementMapper.selectOptionCount", paramMap);
	}

	public int deleteOption(int optionNo) {
		return session.delete("managementMapper.deleteOption", optionNo);
	}

	public Option selectOptionOne(int optionNo) {
		return session.selectOne("managementMapper.selectOptionOne", optionNo);
	}

	public List<Menu> selectMenu(Map<String, Object> paramMap) {
		return session.selectList("managementMapper.selectMenu", paramMap);
	}
	
}
