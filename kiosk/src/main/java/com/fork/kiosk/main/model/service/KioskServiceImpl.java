package com.fork.kiosk.main.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fork.kiosk.main.model.dao.KioskDao;

@Service
public class KioskServiceImpl implements KioskService {

	@Autowired
	private KioskDao kioskDao;
	
}
