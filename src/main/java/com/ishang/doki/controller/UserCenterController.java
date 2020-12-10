package com.ishang.doki.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ishang.doki.entity.Blogcollect;
import com.ishang.doki.entity.User;
import com.ishang.doki.entity.Userwatch;
import com.ishang.doki.serviceImpl.BlogcollectServiceImpl;
import com.ishang.doki.serviceImpl.UserServiceImpl;
import com.ishang.doki.serviceImpl.UserwatchServiceImpl;
import com.ishang.doki.utils.Md5Utils;

@Controller
@RequestMapping("/center")
public class UserCenterController {
//个人中心
	@Autowired
	private BlogcollectServiceImpl collectservice;

	@Autowired
	private UserwatchServiceImpl watchservice;
	
	@Autowired
	private UserServiceImpl userservice;
	
	//个人
	@RequestMapping("/mycenter")
	public String center(@CookieValue(value = "user",required = false) String str,Model model) {
		String username=str.split("#")[0];
		model.addAttribute("username", username);
		int strid=Integer.parseInt(str.split("#")[2]);
		User pic=userservice.getpic(strid);
		
		model.addAttribute("pic", pic.getImg());
		return "usercenter";
	}
	
	//进入用户收藏列表，传入userid
		/**
		 * 
		 * @param userid
		 * @return usercollect界面
		 */
	@RequestMapping("tocollect")
	public String collect(@RequestParam int userid,Model model) {
		// 通过userid查找
		
		List<Blogcollect> collect = collectservice.selectByuserid(userid);

		System.out.println(collect);
		model.addAttribute("collectlist", collect);
		return "centercollect";

	}

//用户添加关注按鈕,userid1关注userid2
	//userid1:用户本id，userid2：要关注谁
@RequestMapping("insertwatch")
public String watch(@RequestParam int userid1,@RequestParam int userid2) {
	Userwatch watch=new Userwatch();
	
	watch.setUserid1(userid1);
	watch.setUserid2(userid2);
	int result=watchservice.insert(watch);
	return "redirect:/user/donatelist";
}
@RequestMapping("insertwatch1")
public String watch1(@RequestParam int userid1,@RequestParam int userid2) {
	Userwatch watch=new Userwatch();
	
	watch.setUserid1(userid1);
	watch.setUserid2(userid2);
	int result=watchservice.insert(watch);
	return "redirect:/center/tofanlist?userid="+userid1;
}
@RequestMapping("insertwatch2")
public String watch2(@RequestParam int userid1,@RequestParam int userid2) {
	Userwatch watch=new Userwatch();
	
	watch.setUserid1(userid1);
	watch.setUserid2(userid2);
	int result=watchservice.insert(watch);
	return "redirect:/center/tocenter?userid2="+userid2;
}
//取关
@RequestMapping("deletewatch")
public String delwatch(@RequestParam int userid1,@RequestParam int userid2) {
	Userwatch watch=new Userwatch();
	watch.setUserid1(userid1);
	watch.setUserid2(userid2);
	int result=watchservice.deleteone(watch);
	return "redirect:/user/donatelist";
}
@RequestMapping("deletewatch1")
public String delwatch1(@RequestParam int userid1,@RequestParam int userid2) {
	Userwatch watch=new Userwatch();
	watch.setUserid1(userid1);
	watch.setUserid2(userid2);
	int result=watchservice.deleteone(watch);
	return "redirect:/center/tofanlist?userid="+userid1;
}
@RequestMapping("deletewatch2")
public String delwatch2(@RequestParam int userid1,@RequestParam int userid2) {
	Userwatch watch=new Userwatch();
	watch.setUserid1(userid1);
	watch.setUserid2(userid2);
	int result=watchservice.deleteone(watch);
	return "redirect:/center/tocenter?userid2="+userid2;
}



//进入其他用户中心页面
@RequestMapping("tocenter")
public String tocenter(@CookieValue(value = "user",required = false)String str,@RequestParam int userid2,Model model) {
	//查看是否关注
	int userid1=Integer.parseInt(str.split("#")[2]);
	Userwatch watch=new Userwatch();
	watch.setUserid1(userid1);
	watch.setUserid2(userid2);
	List<Userwatch> watchresult=watchservice.selectifwatch(watch);
	String text="";
	//没有关注
	if(watchresult.isEmpty()) {
		text="未关注";
	}
	else {
		text="已关注";
	}
	
	model.addAttribute("ifwatch", text);
	//查看userid2的username
	User result=userservice.selectnamebyid(userid2);
	model.addAttribute("username", result.getUsername());
	model.addAttribute("userid", userid2);
	model.addAttribute("ifwatch", text);

	return "userothercenter";
}
	//进入粉丝列表界面
@RequestMapping("/tofanlist")
public String fanlist(@RequestParam int userid,Model model) {
	//userid指的是userid2
	System.out.println(userid);
	//查找userid的粉丝
	List<Userwatch> fanlist=watchservice.selectfanlist(userid);
	model.addAttribute("fanlist", fanlist);
	Userwatch watch=new Userwatch();
	watch.setUserid1(userid);
	String[] text = new String[fanlist.size()];
	for (int i = 0; i < fanlist.size(); i++) {
		watch.setUserid2(fanlist.get(i).getUserid1());
		List<Userwatch> result = watchservice.selectifwatch(watch);

		if (result.isEmpty()) {
			text[i] = "未关注";
		} else {
			text[i] = "已关注";
		}
	}
	System.out.println(text);
	model.addAttribute("subinfo", text);
	return "centerfanlist";
}
	//进入关注列表界面
@RequestMapping("/towatchlist")
public String watchlist(@RequestParam int userid,Model model) {
	//此处其实是userid1(不要在意)
	System.out.println(userid);
	List<Userwatch> watchlist=watchservice.selectwatchlist(userid);
	model.addAttribute("watchlist", watchlist);
	Userwatch watch=new Userwatch();
	watch.setUserid1(userid);
	String[] text = new String[watchlist.size()];
	for (int i = 0; i < watchlist.size(); i++) {
		watch.setUserid2(watchlist.get(i).getUserid2());
		List<Userwatch> result = watchservice.selectifwatch(watch);

		if (result.isEmpty()) {
			text[i] = "未关注";
		} else {
			text[i] = "已关注";
		}
	}
	System.out.println(text);
	model.addAttribute("subinfo", text);
	return "centerwatchlist";
}
@RequestMapping("/centermodify")
public String centermodify(@RequestParam int userid,Model model) {
	
	//通过userid读取所有消息，将他们放在对应的input文本框里
	User userlist=userservice.selectAllbyid(userid);
	model.addAttribute("userlist", userlist);
	return "centermodifylist";
}

//修改用户信息
@RequestMapping("/modifyinfo")
public String modifyUser(@RequestBody User user){
	
	System.out.println(user);
	int result=userservice.updatebyid(user);
	System.out.println(result);
	int userid=user.getId();
	
	return "redirect:/center/centermodify?userid="+userid;
}

@RequestMapping("/modifypsd")
public String modifypsd(@RequestParam int id,@RequestParam String password,Model model) {
	
		User user=new User();
		user.setId(id);
		user.setPassword(Md5Utils.md5(password));
		userservice.inspsd(user);
		
	
	
	return "redirect:/user/tologin";
}









}
