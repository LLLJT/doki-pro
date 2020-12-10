package com.ishang.doki.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ishang.doki.entity.Hotword;
import com.ishang.doki.entity.Notify;
import com.ishang.doki.serviceImpl.HotwordServiceImpl;
import com.ishang.doki.serviceImpl.NotifyServiceImpl;

@Controller
@RequestMapping("/hotword")
public class HotwordController {
/*词条部分，功能：
 * 1.热搜词条显示，更多里面最好显示前20
 * 2.编辑词条，分插入词条和更新词条
 * （1）插入词条，传userid和插入的内容，提交给后台审核
 * （2）更新词条，传userid和更新的内容，提交给后台审核
 * （3）后台审核通过，则审核通知insert到指定用户的通知字段上，前端显示，并将所有用户更新通知同步到index界面上
 *   通知方式：xxx（username）已成功修改（wordtitle）的内容（同步到通知栏和index界面）
 *   或者:xxx(username)未成功修改(wordtitle)的内容（仅发到通知栏）
 *   最好新建一个表notify通知表
 *   后台：若通过。checkflag=1,没通过，=0.
 *   setcheckflag即可
 * 
 * 
 * 
 * 
 */
	@Autowired 
	private HotwordServiceImpl service;
	@Autowired
	private NotifyServiceImpl notifyservice;
	//词条库的词条栏部分
	@RequestMapping("/list")
	public String Hotwordlist(Model model) {
	
		
		List<Hotword> word=service.selectAllorder();
		
		
		model.addAttribute("wordlist", word);
		
		return "hotwordlist";
	}
	//首页只显示前5个
	//实际未使用，已经添加到login接口去
	@RequestMapping("/indexlist")
	public String indexHotwordlist(Model model) {
		List<Hotword> indexlist=service.selectAllorder();
		System.out.println(indexlist);
		model.addAttribute("indexlist", indexlist);
		
		return "index";
	}
	//编辑词条部分
	//先查询所有词条，若不存在则插入词条，若存在则更新词条
	//插入词条
	/**
	 * 传：wordtitle,wordcontent,userid,typeid
	 * @return
	 */
	@RequestMapping("/insertword")
	public String insertword(@RequestBody Hotword hotword,Model model) {
		String title=hotword.getWordtitle();
		List<Hotword>list=service.selectAll();
		//不存在
		int exist=0;
		for(int i=0;i<list.size();i++) {
			if(title.equals(list.get(i).getWordtitle())) {
				//存在
				exist=1;
			}
			
		}
		//若不存在,插入
		if(exist==0) {
		System.out.println(hotword);
		//插入，浏览次数设置为1
		hotword.setCount(1);
		//设为0待后端验证
		hotword.setCheckflag(0);
		int result=service.insertone(hotword);
		//新建成功
		return "";
		}
		else {
			//已存在相同词条，创建失败
			model.addAttribute("newerror", "已存在相同词条，创建失败");
			return "";
		}
		
	}
	/**
	 * 
	 * @param hotword传wordtitle,wordcontetn,count,userid,upcontent,typeid
	 * @param model
	 * @return
	 */
	@RequestMapping("/updateword")
	public String updateword(@RequestBody Hotword hotword,Model model) {
		System.out.println();
		//待后端审核
		hotword.setCheckflag(0);
		int result=service.updateword(hotword);
		return "";
	}
	//模糊查找所有词条,用于词条库页面
	@RequestMapping("/searchbytitle")
	public String search(@RequestParam String wordtitle,Model model) {
		
		return "";
	}
	//查看词条详细信息
	//接口：/hotword/detail?id=?,传id
	//------------------------------------报废，与/user/toentry?id重复
	@RequestMapping("/detail")
	public String detail(@RequestParam int id,Model model) {
		//通过id查询所有信息，传到界面去（左边词条栏右边detail）
		Hotword result=service.selectbyid(id);
		System.out.println(result);
		model.addAttribute("detail", result);
		return "";
	}
	
	

	
	
	
	
}
