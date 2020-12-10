package com.ishang.doki.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.Charsets;
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
import com.google.code.kaptcha.Producer;
import com.ishang.doki.constant.DConstants;
import com.ishang.doki.entity.Blog;
import com.ishang.doki.entity.Blogtype;
import com.ishang.doki.entity.Count;
import com.ishang.doki.entity.Hotword;
import com.ishang.doki.entity.Hotwordtype;
import com.ishang.doki.entity.Notify;
import com.ishang.doki.entity.Role;
import com.ishang.doki.entity.User;
import com.ishang.doki.serviceImpl.BlogServiceImpl;
import com.ishang.doki.serviceImpl.BlogtypeServiceImpl;
import com.ishang.doki.serviceImpl.CountServiceImpl;
import com.ishang.doki.serviceImpl.HotwordServiceImpl;
import com.ishang.doki.serviceImpl.HotwordtypeServiceImpl;
import com.ishang.doki.serviceImpl.NotifyServiceImpl;
import com.ishang.doki.serviceImpl.RoleServiceImpl;
import com.ishang.doki.serviceImpl.UserServiceImpl;
import com.ishang.doki.utils.Md5Utils;

@Controller
@RequestMapping("/back")
public class BackController {

@Autowired
private BlogServiceImpl blogservice;
@Autowired
private HotwordServiceImpl hotwordservice;
@Autowired
private UserServiceImpl userservice;
@Autowired
private RoleServiceImpl roleservice;
@Autowired 
private NotifyServiceImpl notifyservice;
@Autowired
private BlogtypeServiceImpl typeservice;
@Autowired
private HotwordtypeServiceImpl hotwordtypeservice;
@Autowired 
private CountServiceImpl countservice;

@Resource

private Producer kaptchaProducer;

@RequestMapping("/login")
public String login(@RequestParam("username") String username, @RequestParam("password") String password,
		@RequestParam("kaptcha") String kaptcha, Model model, HttpServletRequest request,
		HttpServletResponse response, HttpSession session) throws UnsupportedEncodingException {
	// 通过用户名和密码查找是否有匹配字段
	request.setCharacterEncoding("UTF-8");
	
	String before=new String(username.getBytes("UTF-8"),"ISO8859-1");
	System.out.println("before:"+before);
	String after=new String (before.getBytes("ISO8859-1"),"UTF-8");
	//username=EncodingTool.encodeStr(username);
	System.out.println("after："+after);
	username=after;
	
	User user = new User();
	user.setUsername(username);

	System.out.println(kaptcha);
	System.out.println(DConstants.DEFAULT_KAPTCHA_SESSION_KEY);
	session = request.getSession();
	String oldkaptcha = session.getAttribute(DConstants.DEFAULT_KAPTCHA_SESSION_KEY).toString();
	if (!oldkaptcha.equalsIgnoreCase(kaptcha)) {
		model.addAttribute("errmsg", "验证码错误");
		return "backlogin";
	}

	// 之后用md5加密
	String tpassword = Md5Utils.md5(password);
	user.setPassword(tpassword);

	// model.addAttribute("username", username);
	// 判断是否记住密码
	Boolean re = false;
	String checkboxNum = request.getParameter("checkboxNum");
	if (checkboxNum != null) {
		if (checkboxNum.equals("on"))
			re = true;
	}

	List<User> list = userservice.selectByEntity(user);
	// 数据库存的是list.get(0).getPassword,与md5化的tpassword比较，而cookie存原密码
	// 如果记住密码，则将密码存入cookie中，若不记住，则只将id和username存入
	if (list.size() > 0 && list.get(0).getPassword().equals(tpassword)) {
		// session = request.getSession();
		session.setAttribute("SESSION_UserName", username);
		session.setAttribute("SESSION_PassWord", password);
		String loginname = "";
		try {
			loginname = URLEncoder.encode(list.get(0).getUsername(), String.valueOf(Charsets.UTF_8));
		} catch (UnsupportedEncodingException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		loginname = loginname.replaceAll("\\+", "%20");
		System.out.println(loginname);
		String loginInfo = loginname + "#" + password + "#" + list.get(0).getId();
		String loginInfo2 = loginname + "#" + '1' + "#" + list.get(0).getId();
		// 如果记住密码设置cookie
		if (re) {
			Cookie userCookie = new Cookie("back", loginInfo);
			// 设置保存7天cookie
			userCookie.setMaxAge(7 * 24 * 60 * 60);
			userCookie.setPath("/");
			response.addCookie(userCookie);
		} else {// 没有选中记住密码，删除cookie
			Cookie newCookie = new Cookie("back", loginInfo2);
			newCookie.setMaxAge(7 * 24 * 60 * 60);
			newCookie.setPath("/");
			// 覆盖之前的userCookie
			response.addCookie(newCookie);
		}
		//只允许管理员登录
		System.out.println(list.get(0).getRoleid());
		if(list.get(0).getRoleid()!=1) {
			model.addAttribute("errmsg", "您必须是管理员才能进行后台登录");
			return "backlogin";
			
		}
		
		model.addAttribute("username", username);
		Count count=countservice.count();
		int res3=count.getCount();
		model.addAttribute("sumbrouse", res3);
		Blog blog=blogservice.blogcount();
		model.addAttribute("blogcount", blog.getCount());
		Hotword hotword=hotwordservice.wordcount();
		model.addAttribute("wordcount", hotword.getWordcount());
		
		return "backindex";
	} else {
		model.addAttribute("errmsg", "用户名或密码错误，请重新输入");
		return "backlogin";
	}

}
@RequestMapping("tologin")
public String tologin() {
	return "backlogin";
	
}
@RequestMapping("logout")
public String logout(HttpSession session) {
	session.invalidate();
	return "backlogin";
	
}

@ResponseBody
@RequestMapping("/kaptcha")
/**
 * 验证嘛功能
 * @param request
 * @param response
 * @param session
 * @return
 * @throws IOException
 */
public String validateCode(HttpServletRequest request, HttpServletResponse response, HttpSession session)
		throws IOException {
	ServletOutputStream out = null;
	response.setDateHeader("Expires", 0);
	response.addHeader("Cache-Control", "no-store,no-cache,must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setContentType("image/jpeg");
	String capText = kaptchaProducer.createText();
	BufferedImage kaptchaImage = kaptchaProducer.createImage(capText);

	response.setHeader("content-type", "image/png");
	out = response.getOutputStream();
	ImageIO.write(kaptchaImage, "png", out);
	out.flush();
	session = request.getSession();

	session.setAttribute(DConstants.DEFAULT_KAPTCHA_SESSION_KEY, capText);
	System.out.println(capText);

	return "tologin";
}


//后台主页
@RequestMapping("tobackindex")
	public String tobackindex(@CookieValue(value = "back",required = false)String str,Model model) {
	String username=str.split("#")[0];
	model.addAttribute("username", username);
	Count count=countservice.count();
	int res3=count.getCount();
	model.addAttribute("sumbrouse", res3);
	Blog blog=blogservice.blogcount();
	model.addAttribute("blogcount", blog.getCount());
	Hotword hotword=hotwordservice.wordcount();
	model.addAttribute("wordcount", hotword.getWordcount());
	return "backindex";
}
//后台用户角色管理
@RequestMapping("tobackuserrole")
public String touserrole(@RequestParam(value = "pn", defaultValue = "1") Integer pn,Model model,@CookieValue(value = "back",required = false)String str){
	PageHelper.startPage(pn, 10);
	List<Role> list=roleservice.selectAll();
	PageInfo<Role> ulist=new PageInfo<Role>(list, 5);
	model.addAttribute("rolelist", ulist);
	String username=str.split("#")[0];
	String strid=str.split("#")[2];
	int getid=Integer.parseInt(strid);
	model.addAttribute("username", username);
	model.addAttribute("userid", getid);
	return "backuserrole";
	
}
@RequestMapping("roleres")
public String roleres(@RequestParam int id) {
	System.out.println(id);
	roleservice.roleres(id);

	
	return "redirect:/back/tobackuserrole";
	
	
	
}
@RequestMapping("roledelete")
public String roledelete(@RequestParam int id) {
	
	roleservice.roledel(id);
	return "redirect:/back/tobackuserrole";
	
	
}
@RequestMapping("roleinsert")
public String roleinsert(@RequestParam String rolename,@RequestParam int roleid) {
	Role role=new Role();
	role.setDelFlag((byte)1);
	role.setRoleid(roleid);
	role.setRolename(rolename);
	
	roleservice.insert(role);
	return "redirect:/back/tobackuserrole";
	
}




//用户管理
@RequestMapping("tobackuser")
public String tobackuser(@RequestParam(value = "pn", defaultValue = "1") Integer pn,Model model,@CookieValue(value = "back",required = false)String str) {
	PageHelper.startPage(pn, 10);
	List<User> list=userservice.findAll();
	PageInfo<User> ulist=new PageInfo<User>(list, 5);
	model.addAttribute("userlist", ulist);
	String username=str.split("#")[0];
	String strid=str.split("#")[2];
	int getid=Integer.parseInt(strid);
	model.addAttribute("username", username);
	model.addAttribute("userid", getid);
	return "backuser";	
}
//用户搜索
@RequestMapping("/usersearch")
public String usersearch(@RequestParam(value = "pn", defaultValue = "1") Integer pn,@RequestParam String username,@CookieValue(value="back",required = false)String str,Model model,HttpSession session,HttpServletResponse response) {
	PageHelper.startPage(pn, 10);
	System.out.println(username);
	List<User> user=userservice.searchLike(username);
	
	PageInfo<User> userlist=new PageInfo<User>(user, 5);
	
	//返回搜索页，String名尽量不重复
	//添加cookie
	session.setAttribute("SESSION_Username",userlist );
	
	Cookie searchCookie = new Cookie("usersearch", username);
	searchCookie.setMaxAge(7 * 24 * 60 * 60);
	searchCookie.setPath("/");
	response.addCookie(searchCookie);
	
	
	//end Cookie
	 username=str.split("#")[0];
	String strid=str.split("#")[2];
	int getid=Integer.parseInt(strid);
	model.addAttribute("username", username);

	
	model.addAttribute("userlist",userlist);
	return "backuser"; 

}
//逻辑删除
@RequestMapping("/userdelete")
public String userdelete(@RequestParam int id) {
	System.out.println(id);
	userservice.userdel(id);
	return "redirect:/back/tobackuser";
}
//逻辑恢复

@RequestMapping("/userres")
public String userres(@RequestParam int id) {
	System.out.println(id);
	userservice.userres(id);
	return "redirect:/back/tobackuser";
}
//修改用户数据,update by id
@RequestMapping("/usermodify")
public String usermodify(@RequestBody User user) {
	
	int res=userservice.updatebyid(user);
	System.out.println(res);
	
	return "redirect:/back/tobackuser";
}
//插入用户数据
@RequestMapping("/userinsert")
public String userinsert(@RequestBody User user) {
	user.setDelFlag((byte)1);
	user.setPassword(Md5Utils.md5(user.getPassword()));
	userservice.insert(user);
	return "redirect:/back/tobackuser";
}
@RequestMapping("/userimgmodify")
public String userimgmodify(@RequestParam("pic") MultipartFile pic,@RequestParam("imgid") String imgid,@RequestParam("imgusername") String imgusername) throws IllegalStateException, IOException {
	System.out.println(pic.getOriginalFilename());
	
	// 保存数据库的路径
	String sqlPath = null;
		/*
		 * String tomcatpath=System.getProperty("catalina.home");
		 * tomcatpath=tomcatpath.replaceAll("\\\\","/"); String
		 * addpath="/webapps/doki/images/blogimg/"; String localPath=tomcatpath+addpath;
		 */
	String localPath="C:\\Users\\24466\\Desktop\\doki目录\\doki\\src\\main\\webapp\\images\\user\\";
	// 定义文件名
	String filename = null;
	if (!pic.isEmpty()) {
		filename = pic.getOriginalFilename();
		
		// 文件保存路径
		pic.transferTo(new File(localPath + filename));
	}
	// 把图片的相对路径保存至数据库
	sqlPath = "/images/user/" + filename;
	User user=new User();
	user.setImg(sqlPath);
	user.setId(Integer.parseInt(imgid));
	user.setUsername(imgusername);
	userservice.backmodifyimg(user);
	
	return "redirect:/back/tobackuser";
}



//词条管理
@RequestMapping("tobackword")
public String tobackword(@RequestParam(value = "pn", defaultValue = "1") Integer pn,Model model,@CookieValue(value = "back",required = false)String str) {
	PageHelper.startPage(pn, 10);
	List<Hotword> list=hotwordservice.selectAll();
	PageInfo<Hotword> hlist=new PageInfo<Hotword>(list, 5);
	model.addAttribute("hotwordlist", hlist);
	String username=str.split("#")[0];
	String strid=str.split("#")[2];
	int getid=Integer.parseInt(strid);
	model.addAttribute("username", username);
	model.addAttribute("userid", getid);
	return "backword";
}
//词条搜索
@RequestMapping("/wordsearch")
public String wordsearch(@RequestParam(value = "pn", defaultValue = "1") Integer pn,@RequestParam String wordtitle,@CookieValue(value="back",required = false)String str,Model model,HttpSession session,HttpServletResponse response) {
	PageHelper.startPage(pn, 10);
	System.out.println(wordtitle);
	List<Hotword>hotword=hotwordservice.selectbytitle(wordtitle);
	
	PageInfo<Hotword> hotwordlist=new PageInfo<Hotword>(hotword, 5);
	
	//返回搜索页，String名尽量不重复
	//添加cookie
	session.setAttribute("SESSION_WordTitle", wordtitle);
	
	Cookie searchCookie = new Cookie("wordsearch", wordtitle);
	searchCookie.setMaxAge(7 * 24 * 60 * 60);
	searchCookie.setPath("/");
	response.addCookie(searchCookie);
	
	
	//end Cookie
	String username=str.split("#")[0];
	
	model.addAttribute("username", username);
	String strid=str.split("#")[2];
	int getid=Integer.parseInt(strid);
	model.addAttribute("username", username);
	
	model.addAttribute("hotwordlist", hotwordlist);
	return "backword"; 

}
//逻辑删除
@RequestMapping(value = "/worddelete",method = RequestMethod.POST)
public String worddelete(@RequestBody Hotword hotword) {
	System.out.println(hotword.getId());
	hotwordservice.worddel(hotword.getId());
	return "redirect:/back/tobackword";
}
//逻辑恢复

@RequestMapping(value = "/wordres",method = RequestMethod.POST)
public String wordres(@RequestBody Hotword hotword) {
	System.out.println(hotword.getId());
	hotwordservice.wordres(hotword.getId());
	
	return "redirect:/back/tobackword";
}
//新建词条
@RequestMapping("/wordinsert")
public String wordinsert(@RequestBody Hotword hotword ) {
	System.out.println(hotword);
	hotword.setCheckflag(0);
	hotword.setCount(0);
	hotword.setDelFlag((byte)1);
	int res=hotwordservice.insert(hotword);
	System.out.println(res);
	return "redirect:/back/tobackword";
}

//词条内容修改
@RequestMapping("/updateword")
public String updateword(@RequestBody Hotword hotword) {
	
	System.out.println(hotword);
	Hotwordtype hotwordtype=new Hotwordtype();
	hotwordtype=hotwordtypeservice.selectbytypename(hotword.getTypename());
	User user=new User();
	user=userservice.selectbyname(hotword.getUsername());
	
	//通过typename找typeid
	//通过username找userid
	hotword.setTypeid(hotwordtype.getTypeid());
	hotword.setUserid(user.getId());
	hotwordservice.updateByPrimaryKey(hotword);
	
	return "redirect:/back/tobackword";
}

//词条审核管理
@RequestMapping("tobackwordcheck")
public String tobackwordcheck(@RequestParam(value = "pn", defaultValue = "1") Integer pn,Model model,@CookieValue(value = "back",required = false)String str) {
	PageHelper.startPage(pn, 10);
	List<Hotword> list=hotwordservice.selectcheck();
	PageInfo<Hotword> hlist=new PageInfo<Hotword>(list, 5);
	model.addAttribute("hotwordchecklist", hlist);
	String username=str.split("#")[0];
	model.addAttribute("username", username);
	return "backwordcheck";
}
//后台审核,新建词条
//新建,判断是否通过,前端传passflag若为1，则表示通过，若为0，则不通过
	//传id,passflag,reason,
	//
	@RequestMapping("/hotwordinsertjudge")
	public String success(@RequestParam int id,@RequestParam int passflag,@RequestParam String reason,Model model) {
		//后台将数据传到后端，设置通过审核
		System.out.println(passflag);
		if(passflag==1) {
		
		int a=hotwordservice.success(id);
		//将审核通过信息写入通知表
		Hotword result=hotwordservice.selectbyid(id);
		Notify record=new Notify();
		record.setCheckflag(1);
		record.setNotifytitle(result.getWordtitle());
		record.setUserid(result.getUserid());
		int insert=notifyservice.insert(record);
		
		}
		else {
			int a=hotwordservice.fail(id);
			//新建失败，将失败信息写入通知表,
			Hotword result=hotwordservice.selectbyid(id);
			Notify record=new Notify();
			record.setCheckflag(0);
			record.setNotifytitle(result.getWordtitle());
			record.setUserid(result.getUserid());
			//添加原因
			record.setReason(reason);
			int insert=notifyservice.insert(record);
			//逻辑删除
			hotwordservice.worddel(id);
		}
		return "redirect:/back/tobackwordcheck";
		
		
		
	}
	//更新词条，词条审核
	//不通过，传失败信息，通过，将wordcontent改掉
	//传入id,upcontent,passflag,reason
	@RequestMapping("/hotwordupjudge")
	public String upjudge(@RequestParam int id,@RequestParam(required = false) String upcontent,@RequestParam String uptitle,@RequestParam int passflag,@RequestParam String reason,Model model) {
		System.out.println(passflag);
		//先获取所有的title1,title2,title3 by id
		Hotword titlelist=hotwordservice.selecttitlebyid(id);
		if(passflag==1) {
			//成功
			//通过，先将blog的checkflag设置为1,并且将内容改为upcontent的内容
			Hotword hotword=new Hotword();
			hotword.setUptitle(uptitle);
			hotword.setUpcontent(upcontent);
			hotword.setId(id);
			
			if(uptitle.equals("简介"))
				hotwordservice.upsuccess1(hotword);
			if(uptitle.equals(titlelist.getTitle1()))
				hotwordservice.upsuccess2(hotword);
			if(uptitle.equals(titlelist.getTitle2()))
				hotwordservice.upsuccess3(hotword);
			if(uptitle.equals(titlelist.getTitle3()))
				hotwordservice.upsuccess4(hotword);
			//再将审核信息插入notify表
			
			Hotword record=hotwordservice.selectbyid(id);
			Notify notify=new Notify();
			notify.setNotifytitle(record.getWordtitle());
			notify.setUserid(record.getUserid());
			notify.setCheckflag(1);
			int result=notifyservice.insert(notify);
		}
		else {
			//失败
			//对表原本内容不做修改，只对通知表insert返回信息,将checkflag再设置为1
			hotwordservice.success(id);
			Hotword record=hotwordservice.selectbyid(id);
			Notify notify=new Notify();
			notify.setNotifytitle(record.getWordtitle());
			notify.setUserid(record.getUserid());
			notify.setCheckflag(0);
			notify.setReason(reason);
			int result=notifyservice.insert(notify);
		}
		return "redirect:/back/tobackwordcheck";
	}




//博客管理
//获取blog数据库中所有信息分页
@RequestMapping("tobackblog")
public String tobackblog(@RequestParam(value = "pn", defaultValue = "1") Integer pn,Model model,@CookieValue(value="back",required = false)String str) {
	PageHelper.startPage(pn, 10);
	List<Blog> list=blogservice.selectAll();
	PageInfo<Blog> blist=new PageInfo<Blog>(list, 5);
	
	model.addAttribute("bloglist", blist);
	
	String username=str.split("#")[0];
	model.addAttribute("username", username);

	return "backblog";
}
//blog搜索
//将搜索内容存放到cookie中
@RequestMapping("/blogsearch")
public String blogsearch(@RequestParam(value = "pn", defaultValue = "1") Integer pn,@RequestParam String blogtitle,@CookieValue(value="back",required = false)String str,Model model,HttpSession session,HttpServletResponse response) {
	PageHelper.startPage(pn, 10);
	System.out.println(blogtitle);
	List<Blog> blog=blogservice.searchLike(blogtitle);
	PageInfo<Blog> bloglist=new PageInfo<Blog>(blog, 5);
	
	//返回搜索页，String名尽量不重复
	//添加cookie
	session.setAttribute("SESSION_BlogTitle", blogtitle);
	
	Cookie searchCookie = new Cookie("search", blogtitle);
	searchCookie.setMaxAge(7 * 24 * 60 * 60);
	searchCookie.setPath("/");
	response.addCookie(searchCookie);
	
	
	//end Cookie
	String username=str.split("#")[0];
	String strid=str.split("#")[2];
	int getid=Integer.parseInt(strid);
	model.addAttribute("username", username);

	
	model.addAttribute("bloglist", bloglist);
	return "backblog"; 

}
//新建blog
@RequestMapping("/insert")
public String insert(@RequestParam String blogtitle,@RequestParam String blogcontent,@RequestParam MultipartFile pic,@RequestParam String blogtypename,@CookieValue(value = "back",required = false)String str) throws IllegalStateException, IOException {
	
			System.out.println(pic.getOriginalFilename());
		
			// 保存数据库的路径
			String sqlPath = null;
			String tomcatpath=System.getProperty("catalina.home");
			tomcatpath=tomcatpath.replaceAll("\\\\","/");
			String addpath="/webapps/doki/images/blogimg/";
			String localPath=tomcatpath+addpath;
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
			//通过blogtypename查询blogtypeid
			Blogtype blogtype=typeservice.selectbyname(blogtypename);
			int strid=Integer.parseInt(str.split("#")[2]);
			
			Blog blog=new Blog();
			blog.setPic(sqlPath);
			blog.setBlogtitle(blogtitle);
			blog.setBlogcontent(blogcontent);
			blog.setBlogtypeid(blogtype.getBlogtypeid());
			blog.setCheckFlag((byte)0);
			blog.setUserid(strid);
			//加入后台审核,checkflag置为0
			blog.setDelFlag((byte)1);
			
			blogservice.insertone(blog);
		
			//model.addAttribute("image", user);
			return "redirect:/back/tobackblog";
}
//逻辑删除,setdelFlag=0 by id

@RequestMapping(value = "/blogdelete",method = RequestMethod.POST)
public String blogdelete(@RequestBody Blog blog) {
	System.out.println(blog.getId());
	blogservice.blogdel(blog.getId());
	return "redirect:/back/tobackblog";
}
//逻辑恢复

@RequestMapping(value = "/blogres",method = RequestMethod.POST)
public String blogres(@RequestBody Blog blog) {
	System.out.println(blog.getId());
	blogservice.blogres(blog.getId());
	return "redirect:/back/tobackblog";
}
//update
@RequestMapping("/blogup")
public String blogup(@RequestBody Blog blog) {
	
	blogservice.updateByPrimaryKey(blog);
	return "redirect:/back/tobackblog";
}


//博客审核管理
//只获取未通过的blog信息
@RequestMapping("tobackblogcheck")
public String tobackblogcheck(@RequestParam(value = "pn", defaultValue = "1") Integer pn,Model model,@CookieValue(value="back",required = false)String str) {
	PageHelper.startPage(pn, 10);
	List<Blog> ulist=blogservice.selectback();
	PageInfo<Blog> alist=new PageInfo<Blog>(ulist, 5);
	model.addAttribute("blogchecklist", alist);
	String username=str.split("#")[0];
	model.addAttribute("username", username);
	
	return "backblogcheck";
}
@RequestMapping("/blogchecksearch")
public String blogchecksearch(@RequestParam(value = "pn", defaultValue = "1") Integer pn,@RequestParam String blogtitle,@CookieValue(value="back",required = false)String str,Model model,HttpSession session,HttpServletResponse response) {
	PageHelper.startPage(pn, 10);
	System.out.println(blogtitle);
	List<Blog> blog=blogservice.searchLikecheck(blogtitle);
	PageInfo<Blog> bloglist=new PageInfo<Blog>(blog, 5);
	
	//返回搜索页，String名尽量不重复
	//添加cookie
	session.setAttribute("SESSION_BlogTitle", blogtitle);
	
	Cookie searchCookie = new Cookie("search", blogtitle);
	searchCookie.setMaxAge(7 * 24 * 60 * 60);
	searchCookie.setPath("/");
	response.addCookie(searchCookie);
	
	
	//end Cookie
	String username=str.split("#")[0];
	String strid=str.split("#")[2];
	int getid=Integer.parseInt(strid);
	model.addAttribute("username", username);

	
	model.addAttribute("blogchecklist", bloglist);
	return "backblogcheck"; 

}
//博客审核成果,传(blog)id,userid,blogtitle
//执行update
@RequestMapping("/blogsuccess")
public String blogjudge(@RequestParam int id,@RequestParam int userid,@RequestParam String blogtitle) {
	System.out.println(id);
	blogservice.blogsuccess(id);
	Notify notify=new Notify();
	notify.setNotifytitle(blogtitle);
	notify.setUserid(userid);
	notify.setCheckflag(1);
	notifyservice.insert(notify);
	//返回接口
	return "redirect:/back/tobackblogcheck";
}
//未通过审核，将其写入通知,传blogid,userid,blogtitle，reason
@RequestMapping("/blogfail")
public String blogfail(@RequestParam int id,@RequestParam String reason,@RequestParam int userid,@RequestParam String blogtitle) {
	System.out.println(id);
	blogservice.blogfail(id);
	Notify notify=new Notify();
	notify.setCheckflag(0);
	notify.setNotifytitle(blogtitle);
	notify.setUserid(userid);
	notify.setReason(reason);
	notifyservice.insert(notify);
	//返回接口
	return "redirect:/back/tobackblogcheck";
}

}




