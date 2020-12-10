package com.ishang.doki.service;

import java.util.List;

import com.ishang.doki.entity.Hotword;

public interface HotwordService {

	List<Hotword> selectAll();

	int insertone(Hotword hotword);

	// 浏览次数+1
	int updateone(String wordtitle);

	List<Hotword> selectAllorder();

	// 更新词条
	int updateword(Hotword hotword);

	// 模糊查找
	Hotword selectbyid(Integer id);

	// 后台审核成功
	int success(Integer id);

	int fail(Integer id);
//后台更新，根据不同title
int upsuccess1(Hotword hotword);
    
    int upsuccess2(Hotword hotword);
    
    int upsuccess3(Hotword hotword);
    
    int upsuccess4(Hotword hotword);

	// 后端checklist
	List<Hotword> selectcheck();

	// 后端词条管理的模糊查找
	List<Hotword> selectbytitle(String wordtitle);

	// 后台逻辑删除和恢复
	int worddel(Integer id);

	int wordres(Integer id);

	int updateByPrimaryKey(Hotword record);
//后台添加词条
	int insert(Hotword record);
	//显示总数
	Hotword wordcount();
	
	
	  List<Hotword> wordlist();
	  
	  Hotword detaillist(Integer id);
	  //用于前端更新词条
	  int updatehotword(Hotword hotword);

	  Hotword selecttitlebyid(Integer id);
	  int wordcountplus(Integer id);
	  
}
