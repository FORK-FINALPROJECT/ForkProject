package com.fork.kiosk.main.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fork.kiosk.main.model.vo.Menu;

import lombok.extern.slf4j.Slf4j;

// 테스트트
@RestController
@Slf4j
public class KioskController {
	
	private List<Menu> menus;
	
    @GetMapping("/category")
    public List<Object> Hello(){
        return Arrays.asList("리액트 스프링 ", "dddd");
    }
    
    
    
}