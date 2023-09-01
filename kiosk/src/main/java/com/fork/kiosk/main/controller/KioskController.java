package com.fork.kiosk.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.fork.kiosk.main.model.service.KioskService;

import lombok.extern.slf4j.Slf4j;

// 테스트트
@RestController
@Slf4j
public class KioskController {

	@Autowired
	private KioskService kioskService;
    
}