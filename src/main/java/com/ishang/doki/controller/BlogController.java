package com.ishang.doki.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ishang.doki.entity.Blog;
import com.ishang.doki.entity.Blogcollect;
import com.ishang.doki.entity.Blogcomment;
import com.ishang.doki.serviceImpl.BlogCommentServiceImpl;
import com.ishang.doki.serviceImpl.BlogServiceImpl;
import com.ishang.doki.serviceImpl.BlogcollectServiceImpl;

@Controller
@RequestMapping("/blog")
public class BlogController {
@Autowired
private BlogServiceImpl service;
@Autowired
private BlogCommentServiceImpl commentservice;
@Autowired
private BlogcollectServiceImpl blogcollectservice;
/**
 * 
 * @param model
 * @return
 */
@RequestMapping("/getAll")
public String getAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {

	PageHelper.startPage(pn, 10);	
	System.out.println("进入论坛首页，获取所有帖子");
	List<Blog> bloglist=service.selectAllblog();
	PageInfo<Blog> blogInfo = new PageInfo<Blog>(bloglist, 5);
	System.out.println(blogInfo);
	System.out.println(blogInfo.getNavigatePages());
	model.addAttribute("bloglist", blogInfo);
	return "blogindex";
}
/**
 * 
 * @param blogtitle
 * @param blogcontent
 * @param pic
 * @param blogtypeid
 * @return userid
 * @throws IOException 
 * @throws IllegalStateException 
 */
@RequestMapping("/insert")
public String insert(@RequestParam String blogtitle,@RequestParam String blogcontent,@RequestParam MultipartFile pic,@RequestParam String blogtypeid,@RequestParam int userid) throws IllegalStateException, IOException {
	
		/*
		 * System.out.println(pic.getOriginalFilename());
		 * 
		 * // 保存数据库的路径 String sqlPath = null; String
		 * tomcatpath=System.getProperty("catalina.home");
		 * tomcatpath=tomcatpath.replaceAll("\\\\","/"); String
		 * addpath="/webapps/doki/images/blogimg/"; String localPath=tomcatpath+addpath;
		 * // 定义文件名 String filename = null; if (!pic.isEmpty()) { filename =
		 * pic.getOriginalFilename();
		 * 
		 * // 文件保存路径 pic.transferTo(new File(localPath + filename)); } // 把图片的相对路径保存至数据库
		 * sqlPath = "images/blogimg/" + filename;
		 */
System.out.println(pic.getOriginalFilename());
	
	// 保存数据库的路径
	String sqlPath = null;
		/*
		 * String tomcatpath=System.getProperty("catalina.home");
		 * tomcatpath=tomcatpath.replaceAll("\\\\","/"); String
		 * addpath="/webapps/doki/images/blogimg/"; String localPath=tomcatpath+addpath;
		 */
	String localPath="C:\\Users\\24466\\Desktop\\doki目录\\doki\\src\\main\\webapp\\images\\blogimg\\";
	// 定义文件名
	String filename = null;
	if (!pic.isEmpty()) {
		filename = pic.getOriginalFilename();
		
		// 文件保存路径
		pic.transferTo(new File(localPath + filename));
	}
	// 把图片的相对路径保存至数据库
	sqlPath = "images/blogimg/" + filename;
			System.out.println(sqlPath);
			Blog blog=new Blog();
			blog.setPic(sqlPath);
			blog.setBlogtitle(blogtitle);
			blog.setBlogcontent(blogcontent);
			int turnblogtypeid=Integer.parseInt(blogtypeid);
			System.out.println(turnblogtypeid);
			blog.setBlogtypeid(turnblogtypeid);
			
			blog.setUserid(userid);
			blog.setCheckFlag((byte)0);
			blog.setDelFlag((byte)1);
			//加入后台审核,checkflag置为0
			
			
			service.insertone(blog);
		
			//model.addAttribute("image", user);
			return "redirect:/blog/getAll";
	
	
	

}
/**
 * 
 * @param blogtypeid
 * @param model
 * @return
 */
//帖子分类，by blogtypeid
@RequestMapping("/find")
public String classify(@RequestParam int blogtypeid,Model model) {
	System.out.println(blogtypeid);
	List<Blog>bloglist=service.selectbytypeid(blogtypeid);
	System.out.println(bloglist);
	model.addAttribute("bloglist", bloglist);
	return "blogsearchresult";
}
/**
 * 
 * @param blogid
 * @param userid
 * @param comment
 * @return
 */
//评论功能,get blog的id,userid,comment
//前端ajax success 来alert评论成功

@RequestMapping("/comment")
public String comment(@RequestParam int id,@RequestParam int userid,@RequestParam(value = "comment") String comment) {
	
	Blogcomment com=new Blogcomment();
	com.setBlogid(id);
	com.setUserid(userid);
	com.setComment(comment);
	Calendar cal=Calendar.getInstance();
    Date date=cal.getTime();
    com.setCommentTime(date);
    System.out.println(com);
	commentservice.insertone(com);
	
	return "redirect:/blog/detail?blogid="+id;
}
/**
 * 
 * @param answer
 * @return
 * @throws ParseException 
 */
//回复功能,需要获取blogid,userid,comment,userid2,comment2,comment_time2
@RequestMapping("/answer")
public String answer(@RequestParam int id,@RequestParam int userid2,@RequestParam String comment2,@RequestParam int userid,@RequestParam String comment,@RequestParam String commentTime1) throws ParseException {
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	Blogcomment com=new Blogcomment();
	com.setBlogid(id);
	com.setComment(comment);
	Date time1=sdf.parse(commentTime1);
	com.setCommentTime(time1);
	Calendar cal=Calendar.getInstance();
    Date date=cal.getTime();
    com.setCommentTime2(date);
    com.setUserid2(userid2);
    com.setUserid(userid);
	com.setDelFlag((byte)1);
	com.setComment2(comment2);

	commentservice.insertone(com);
	return "redirect:/blog/answerfind?userid="+userid+"&blogid="+id;
}
/**
 * 
 * @param blogid
 * @param userid
 * @return
 */
//收藏功能,insert
@RequestMapping("/collect")
public String collect(@RequestParam int blogid,@RequestParam int userid) {
	Blogcollect collect=new Blogcollect();
	collect.setBlogid(blogid);
	collect.setUserid(userid);
	int a=blogcollectservice.insertone(collect);
	System.out.println(a);
	return "redirect:/blog/detail?blogid="+blogid;
}
//取消收藏功能
@RequestMapping("/uncollect")
public String uncollect(@RequestParam int blogid,@RequestParam int userid) {
	Blogcollect collect=new Blogcollect();
	collect.setBlogid(blogid);
	collect.setUserid(userid);
	int b=blogcollectservice.deleteone(collect);
	return "redirect:/blog/detail?blogid="+blogid;
}


//帖子详细信息
@RequestMapping("/detail")
public String detail(@RequestParam int blogid,Model model,@CookieValue("user")String str) {
	
	//每访问一次,blogwatch数+1-->浏览次数
	service.blogwatch(blogid);
	Blog blog=service.findbyid(blogid);
	System.out.println(blog);
	//显示是否收藏
	int cid=Integer.parseInt(str.split("#")[2]);
	System.out.println(cid);
	//blogid和cid一起查询ifcollect
//	List<Blogcollect>collect=blogcollectservice.selectByuserid(cid);
	Blogcollect blogcollect=new Blogcollect();
	blogcollect.setBlogid(blogid);
	blogcollect.setUserid(cid);
	List<Blogcollect> collect=blogcollectservice.selectifcollect(blogcollect);
	int text;
	if(!collect.isEmpty())
	{
		text=1;
	}
	else {text=0;}
	//获取帖子的所有评论和回复
	//comment1:评论，comment2:回复
	//List<Blogcomment> com=commentservice.comment(blogid);
	//获取所有评论
	List<Blogcomment> com=commentservice.findcomment(blogid);
	List<Blogcomment> list = new ArrayList<Blogcomment>();
	String res="";
	for(int i=0;i<com.size();i++) {
		 res=com.get(i).getComment();
		//第n条评论的详细信息,一行数据
		Blogcomment comment=commentservice.findcommentdetail(res);
		list.add(comment);
		
	}
	System.out.println(list);
	model.addAttribute("blog",blog);
	model.addAttribute("commentlist", com);
	model.addAttribute("commentdetail", list);
	model.addAttribute("ifcollect", text);
	return "blogdetail";
}
//搜索帖子标题，模糊查找
@RequestMapping("/blogsearch")
public String blogsearch(@RequestParam String blogtitle,Model model) {
	System.out.println(blogtitle);
	List<Blog> blog=service.searchLike(blogtitle);
	//返回搜索页，String名尽量不重复
	model.addAttribute("blogcontent", blog);
	return "blogsearchresult"; 

}
//通过blogid和userid来查找所有在该userid下回复的帖子（）
@RequestMapping("/answerfind")
public String answerfind(@RequestParam int userid,@RequestParam int blogid,Model model) {
	//获取一条评论下的所有回复
	Blogcomment answer=new Blogcomment();
	answer.setBlogid(blogid);
	answer.setUserid(userid);
	//查找所有回复
	List<Blogcomment> comment=commentservice.findanswer(answer);
	//comment,comment2,commenTime2,username
	model.addAttribute("answerlist", comment);
	return "bloganswer";
}


}
