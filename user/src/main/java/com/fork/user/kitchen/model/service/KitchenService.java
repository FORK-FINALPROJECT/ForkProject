package com.fork.user.kitchen.model.service;

import java.util.List;

import com.fork.user.kitchen.model.vo.MenuOption;
import com.fork.user.kitchen.model.vo.PayStructure;

public interface KitchenService {

	List<PayStructure> selectPaylist();

	List<MenuOption> selectMenulist(int no);

	PayStructure selectTableInfo(int rno);

	
}