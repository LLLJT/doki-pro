package com.ishang.doki.controller;

import java.awt.image.BufferedImage;
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

import com.google.code.kaptcha.Producer;
import com.ishang.doki.utils.EncodingTool;
import com.ishang.doki.constant.DConstants;
import com.ishang.doki.entity.Count;
import com.ishang.doki.entity.Hotword;
import com.ishang.doki.entity.Notify;
import com.ishang.doki.entity.Searchresult;
import com.ishang.doki.entity.User;
import com.ishang.doki.entity.Userwatch;
import com.ishang.doki.entity.Vtuber;
import com.ishang.doki.serviceImpl.CountServiceImpl;
import com.ishang.doki.serviceImpl.HotwordServiceImpl;
import com.ishang.doki.serviceImpl.NotifyServiceImpl;
import com.ishang.doki.serviceImpl.SearchResultImpl;
import com.ishang.doki.serviceImpl.UserServiceImpl;
import com.ishang.doki.serviceImpl.UserwatchServiceImpl;
import com.ishang.doki.serviceImpl.VtuberServiceImpl;
import com.ishang.doki.utils.Md5Utils;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private Producer kaptchaProducer;

	@Autowired
	private UserServiceImpl service;

	@Autowired
	private SearchResultImpl searchservice;
	@Autowired
	private HotwordServiceImpl hotwordservice;
	@Autowired
	private VtuberServiceImpl vtuberservice;
	@Autowired
	private UserwatchServiceImpl watchservice;
	@Autowired
	private CountServiceImpl countservice;
	@Autowired
	private NotifyServiceImpl notifyservice;

	@RequestMapping(value = "/login",produces = "text/html; charset=UTF-8")
	/**
	 * 登录功能
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
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
			return "login";
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

		List<User> list = service.selectByEntity(user);
		// 数据库存的是list.get(0).getPassword,与md5化的tpassword比较，而cookie存原密码
		// 如果记住密码，则将密码存入cookie中，若不记住，则只将id和username存入
		if (list.size() > 0 && list.get(0).getPassword().equals(tpassword)) {
			
			session.setAttribute("SESSION_UserName", username);
			session.setAttribute("SESSION_PassWord", password);
			String loginname = "";
			
			  try { loginname = URLEncoder.encode(list.get(0).getUsername(),String.valueOf(Charsets.UTF_8)); 
			  } catch (UnsupportedEncodingException e) {
			  // TODO 自动生成的 catch 块 
				 e.printStackTrace(); }
			 
			loginname = loginname.replaceAll("\\+", "%20");
			System.out.println(loginname);
			 
			String loginInfo = loginname + "#" + password + "#" + list.get(0).getId();
			String loginInfo2 = loginname + "#" + '1' + "#" + list.get(0).getId();
			// 如果记住密码设置cookie
			if (re) {
				Cookie userCookie = new Cookie("user", loginInfo);
				// 设置保存7天cookie
				userCookie.setMaxAge(7 * 24 * 60 * 60);
				userCookie.setPath("/");
				response.addCookie(userCookie);
			} else {// 没有选中记住密码，删除cookie
				Cookie newCookie = new Cookie("user", loginInfo2);
				newCookie.setMaxAge(7 * 24 * 60 * 60);
				newCookie.setPath("/");
				// 覆盖之前的userCookie
				response.addCookie(newCookie);
			}
			List<Hotword> indexlist = hotwordservice.selectAllorder();
			System.out.println(indexlist);
			List<Vtuber> result = vtuberservice.selectAll();
			List<User> userdonate = service.selectdonate();
			model.addAttribute("vtuberlist", result);
			model.addAttribute("indexlist", indexlist);
			model.addAttribute("username", username);
			model.addAttribute("donatelist", userdonate);
			List<Notify> notifylist=notifyservice.indexshow();
			model.addAttribute("notifylist", notifylist);
			// 浏览主页,次数+1
			countservice.updateone();
			User pic=service.getpic(list.get(0).getId());
			
			model.addAttribute("pic", pic.getImg());
		
			
			
			return "index";
		} else {
			model.addAttribute("errmsg", "用户名或密码错误，请重新输入");
			return "login";
		}

	}

	@RequestMapping("/register")
	/**
	 * 注册功能
	 * 
	 * @param user
	 * @param model
	 * @param session
	 * @return
	 */
	public String register(@RequestBody User user, Model model, HttpSession session) {
		// 获取所有用户进行匹配
		List<User> get = service.getuser();
		String username = user.getUsername();
		String errmsg1 = null;
		// 将username设为主键

		for (int i = 0; i < get.size(); i++) {
			if (username.equals(get.get(i).getUsername())) {
				errmsg1 = "该用户已经注册，请换一个用户名";
			}

		}

		String md5psd = user.getPassword();
		user.setPassword(Md5Utils.md5(md5psd));
		System.out.println(user);
		if (errmsg1 == null) {
			int a = service.insert(user);
		}
		session.setAttribute("errmsg1", errmsg1);

		return "register";
	}

	@ResponseBody
	@RequestMapping("/kaptcha")
	/**
	 * 验证嘛功能
	 * 
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

		return "login";
	}

	// 登出功能
	@RequestMapping("/logout")
	/**
	 * 
	 * @param session
	 * @return
	 */
	public String logout(HttpSession session) {

		session.invalidate();
		return "login";

	}

	/**
	 * 搜索功能,将搜索关键词放入数据库，字段:id,userid,content,time,userid与内容呈一对多关系 从帖子标题&用户模糊查询
	 * 
	 * @param blogtitle
	 * @param id
	 * @param
	 * @return
	 */

	/**
	 * 搜索历史功能，搜索之前输入框中的信息，每个用户id对应一个搜索历史,字段:id,userid,content,time
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/history")
	public String history(@RequestParam int userid, Model model) {
		System.out.println("进入搜索，id为" + userid);
		List<Searchresult> result = searchservice.selectbyuserid(userid);
		// 通过id查找searchresult表中内容

		model.addAttribute("history", result);

		return "history";
	}

	@RequestMapping("/donatelist")
	public String list(@CookieValue(value = "user", required = false) String user, Model model) {
		String getid = user.split("#")[2];
		int get = Integer.parseInt(getid);
		// 通过cookie中的id查询是否关注
		System.out.println(get);
		Userwatch watch = new Userwatch();
		List<User> userdonate = service.selectdonate();
		System.out.println(userdonate);
		watch.setUserid1(get);
		String[] text = new String[userdonate.size()];
		for (int i = 0; i < userdonate.size(); i++) {
			watch.setUserid2(userdonate.get(i).getId());
			List<Userwatch> result = watchservice.selectifwatch(watch);

			if (result.isEmpty()) {
				text[i] = "未关注";
			} else {
				text[i] = "已关注";
			}
		}
		System.out.println(text);
		model.addAttribute("subinfo", text);
		if (userdonate.size() > 0) {
			model.addAttribute("donatelist", userdonate);
		}

		return "userdonate";

	}

//-----------------------------------------跳转页面部分---------------------------
	@RequestMapping("/tologin")
	public String tolog() {

		return "login";
	}

	@RequestMapping("/toindex")
	public String toindex(@CookieValue(value = "user",required = false) String cookie,Model model) {
		List<Hotword> indexlist = hotwordservice.selectAllorder();
		System.out.println(indexlist);
		model.addAttribute("indexlist", indexlist);
		List<Vtuber> result = vtuberservice.selectAll();
		model.addAttribute("vtuberlist", result);
		// 浏览主页,次数+1
		countservice.updateone();
		List<User> userdonate = service.selectdonate();
		model.addAttribute("donatelist", userdonate);
		//notifylist
		List<Notify> notifylist=notifyservice.indexshow();
		model.addAttribute("notifylist", notifylist);
		int id=Integer.parseInt(cookie.split("#")[2]);
		//根据cookieid查找root图片
		User pic=service.getpic(id);
		
		model.addAttribute("pic", pic.getImg());
		return "index";

	}

	@RequestMapping("/toregister")
	public String toregist() {

		return "register";

	}

	@RequestMapping("/toerror")
	public String toerror() {
		return "error";

	}

	@RequestMapping("/tosearch")
	public String tosearch() {
		return "searchresult";

	}

	@RequestMapping("/toforum")
	public String toforum() {
		return "blog";
	}

	@RequestMapping("/tohistory")
	public String tohistroy() {
		return "hotwordlist1";

	}

	@RequestMapping("/toabout")
	public String about() {
		return "about";
	}

	@RequestMapping("/toNewentry")
	public String newentry() {
		return "Newentry";

	}

	@RequestMapping("/tostartedit")
	public String tostartedit() {
		return "startededit";
	}

	// 词条库界面
	@RequestMapping("/toentry")
	public String toentry(@RequestParam int id, Model model) {
		// wordlist,列出所有wordcontent,check_flag=1,del_flag=1

		List<Hotword> hotwordlist = hotwordservice.wordlist();
		System.out.println(hotwordlist);
		model.addAttribute("wordlist", hotwordlist);
		// 根据词条id查找对应内容，detaillist
		Hotword detaillist = hotwordservice.detaillist(id);
		model.addAttribute("detail", detaillist);
		System.out.println(detaillist);
		//设置浏览次数+1,根据id
		hotwordservice.wordcountplus(id);
		return "entry";

	}

	@RequestMapping("/tonewentry")
	public String tocreatehotword(Model model) {
		List<Hotword> hotwordlist = hotwordservice.wordlist();
		System.out.println(hotwordlist);
		model.addAttribute("wordlist", hotwordlist);
		return "newentry";

	}

	@RequestMapping("/createhotword")
	public String tocreatehotword(@RequestBody Hotword hotword) {
		System.out.println(hotword);
		hotword.setCount(0);
		hotword.setCheckflag(0);
		hotword.setDelFlag((byte) 1);
		int res = hotwordservice.insert(hotword);
		return "newentry";
	}

	@RequestMapping("/toeditword")
	public String toeditword(@RequestParam int id,Model model) {
		List<Hotword> hotwordlist = hotwordservice.wordlist();
		System.out.println(hotwordlist);
		model.addAttribute("wordlist", hotwordlist);
		// 根据词条id查找对应内容，detaillist
		Hotword detaillist = hotwordservice.detaillist(id);
		model.addAttribute("detail", detaillist);
		System.out.println(detaillist);
		return "editword";
		
	}
	//更新词条
	@RequestMapping("/editword")
		public String editword(@RequestBody Hotword hotword) {
		//设置为0，供放到后台审核
		hotword.setCheckflag(0);	
		//能更新的肯定能在前端显示->delflag=1
		int updateres=hotwordservice.updatehotword(hotword);
			return "editword";
		}
	@RequestMapping("/toclassify")
	public String toclassify() {
		return "classification";
	}
		
		
		
	
	

}
