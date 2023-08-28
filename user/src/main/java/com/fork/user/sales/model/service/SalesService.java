package com.fork.user.sales.model.service;

import java.util.List;

import com.fork.user.sales.model.vo.Receipt;
import com.fork.user.sales.model.vo.Structure;

public interface SalesService {

	List<Structure> selectStructureList();

	int deleteStructure();

	int saveStructure(Structure struc);

	List<Receipt> selectOrderList();

	List<Receipt> detailOrderList(int kioskNo);

	int clearTable(int kioskNo);


}
