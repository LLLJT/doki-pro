package com.ishang.doki.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ishang.doki.entity.Notify;
import com.ishang.doki.serviceImpl.NotifyServiceImpl;

@Controller
@RequestMapping("/notify")
public class NotifyController {
@Autowired
private NotifyServiceImpl service;
//进入通知页面导入本用户执行的所有操作
@RequestMapping("/tonotify")
public String tonotify(@RequestParam int userid,Model model) {
	System.out.println(userid);
	
	List<Notify> list=service.selectbyuserid(userid);
	System.out.println(list);
	model.addAttribute("notifylist", list);
	return "notify";
}
@RequestMapping("/delnotify")
public String delnotify(@RequestParam int id,@CookieValue(value = "user",required = false) String str) {
	int userid=Integer.parseInt(str.split("#")[2]);
	
int res=service.deleteByPrimaryKey(id);
System.out.println(res);
return "redirect:/notify/tonotify?userid="+userid;
}
}
