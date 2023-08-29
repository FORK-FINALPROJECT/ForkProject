package com.fork.user.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fork.user.notice.model.service.NoticeService;
import com.fork.user.notice.model.vo.Notice;
import com.fork.user.sales.model.service.SalesService;
import com.fork.user.sales.model.vo.Receipt;
import com.fork.user.sales.model.vo.Structure;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController {

    @Autowired
    private NoticeService noticeService;

    @Autowired
    private SalesService salesService;

    @GetMapping("/main")
    public String goMain(Model model) {
        List<Notice> list = noticeService.selectNoticeList();
        model.addAttribute("list", list);
        return "main";
    }

    @GetMapping("/salesReady")
    public String toSlaesReady(Model model) {
        List<Structure> structureList = salesService.selectStructureList();
        List<Receipt> orderList = salesService.selectOrderList();
        
        model.addAttribute("structureList", structureList);
        model.addAttribute("orderList", orderList);


        return "sales/ready";
    }

    @GetMapping("/salesSetting")
    public String toSlaesSetting(Model model) {
        List<Structure> structureList = salesService.selectStructureList();
        model.addAttribute("structureList", structureList);

        return "sales/setting";
    }
}