package com.ishang.doki.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ishang.doki.entity.Vtuber;
import com.ishang.doki.serviceImpl.VtuberServiceImpl;

@Controller
@RequestMapping("/vtuber")
public class VtuberController {
@Autowired
private VtuberServiceImpl service;
//获取所有，按照粉丝数排序
@RequestMapping("/getAll")

public String getall(Model model) {
	List<Vtuber>result=service.selectAll();
	model.addAttribute("vtuberlist", result);
	model.addAttribute("vlist", result);
	return "vtuberlist";
}

/*
//功能删除，时间问题
//vtuber界面模糊查找
@RequestMapping("/search")
public String search(@RequestParam String name,Model model) {
	List<Vtuber>result=service.searchLike(name);
	System.out.println(result);
	model.addAttribute("result", result);
	
	return "";
}
*/
//进入vtuber详细界面
@RequestMapping("/tovtuber")
public String tovtuber(@RequestParam Integer id,Model model) {
	Vtuber result=service.selectByPrimaryKey(id);
	System.out.println(result);
	
	model.addAttribute("vtuber",result );
	return "vtuber";
	
}

	
}
