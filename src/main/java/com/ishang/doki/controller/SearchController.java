package com.ishang.doki.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ishang.doki.entity.Blog;
import com.ishang.doki.entity.Hotword;
import com.ishang.doki.entity.Searchresult;
import com.ishang.doki.entity.User;
import com.ishang.doki.entity.Userwatch;
import com.ishang.doki.serviceImpl.BlogServiceImpl;
import com.ishang.doki.serviceImpl.HotwordServiceImpl;
import com.ishang.doki.serviceImpl.SearchResultImpl;
import com.ishang.doki.serviceImpl.UserServiceImpl;
import com.ishang.doki.serviceImpl.UserwatchServiceImpl;

@Controller
@RequestMapping("/search")
public class SearchController {
	@Autowired
	private BlogServiceImpl blogservice;
	@Autowired
	private UserServiceImpl userservice;
	@Autowired
	private SearchResultImpl searchservice;
	@Autowired
	private HotwordServiceImpl hotwordservice;
	@Autowired
	private UserwatchServiceImpl watchservice;
/**
 * 
 * @param searchtitle
 * @param userid
 * @param model
 * @return
 */
	@RequestMapping("/indexsearch")
	public String indexsearch(@RequestParam String searchtitle, @RequestParam Integer userid, Model model) {
		System.out.println(searchtitle);
		List<Blog> blogresult = blogservice.searchLike(searchtitle);
		List<User> userresult = userservice.searchLike(searchtitle);
		Calendar cal=Calendar.getInstance();
	    Date date=cal.getTime();
		System.out.println(date);
		
		// 存入searchresult表中
		// 存入输入的text信息
		
		Searchresult searchresult = new Searchresult();
		searchresult.setSearchtitle(searchtitle);
		searchresult.setUserid(userid);
		searchresult.setSearchtime(date);
		searchservice.insertone(searchresult);
		//6月7日：打算将搜索结果与hotword分开，所以注释掉
		/*
		 * // 对于搜索一次的text，放入hotword表中，若存在则update,count+1,遍历后若不存在，则执行insert
		 * //查询hotword所有的词条，判断 List<Hotword> hotwordlist=hotwordservice.selectAll();
		 * Hotword hotword=new Hotword(); int exist=0; for(int
		 * i=0;i<hotwordlist.size();i++) { //如果相同，则update
		 * if(hotwordlist.get(i).getWordtitle().equals(searchtitle)) { int
		 * a=hotwordservice.updateone(searchtitle); exist=1; }
		 * 
		 * } if(exist==0) { //若不存在，则insert hotword.setWordtitle(searchtitle);
		 * hotword.setCount(1); hotwordservice.insertone(hotword); }
		 */
		Userwatch watch=new Userwatch();
		watch.setUserid1(userid);
		String[] text = new String[userresult.size()];
		for (int i = 0; i < userresult.size(); i++) {
			watch.setUserid2(userresult.get(i).getId());
			List<Userwatch> result = watchservice.selectifwatch(watch);

			if (result.isEmpty()) {
				text[i] = "未关注";
			} else {
				text[i] = "已关注";
			}
		}
		System.out.println(text);
		model.addAttribute("subinfo", text);

		model.addAttribute("blogresult", blogresult);
		model.addAttribute("userresult", userresult);

		return "searchresult";

	}
	//搜索历史写在user内

}
