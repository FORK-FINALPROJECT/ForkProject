package com.fork.kiosk.main.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class KioskController {
	
    @GetMapping("/menu")
    public List<String> Hello(){
        return Arrays.asList("리액트 스프링 ", "연결 성공");
    }
    
}