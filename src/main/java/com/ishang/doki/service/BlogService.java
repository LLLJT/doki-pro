package com.ishang.doki.service;

import java.util.List;

import com.ishang.doki.entity.Blog;

public interface BlogService {

	//论坛首页，获取所有帖子
	List<Blog> selectAll();
	
	//模糊搜索帖子
	List<Blog> searchLike(String blogtitle);
	
	List<Blog> searchLikecheck(String blogtitle);
	
	//通过blog的id进入blogcontent
	
	Blog findbyid(int id);
	
	int insertone(Blog blog);
	
	List<Blog> selectbytypeid(Integer blogtypeid);
	
List<Blog>selectcheck();
    
    List<Blog>selectback();
    
    int blogdel(Integer id);
    
    int blogres(Integer id);
    
    int updateByPrimaryKey(Blog record);
    
 int blogsuccess(Integer id);
    
    int blogfail(Integer id);
    
    Blog blogcount();
    
    List<Blog> selectAllblog();
    
    int blogwatch(Integer id);
    
}
