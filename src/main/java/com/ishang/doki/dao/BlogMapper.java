package com.ishang.doki.dao;

import com.ishang.doki.entity.Blog;
import java.util.List;

public interface BlogMapper {
    

	int deleteByPrimaryKey(Integer id);

    int insert(Blog record);

    Blog selectByPrimaryKey(Integer id);

    List<Blog> selectAll();

    int updateByPrimaryKey(Blog record);
    //added
    List<Blog> searchLike(String blogtitle);
    
    List<Blog> searchLikecheck(String blogtitle);
    
    List<Blog> selectbytypeid(Integer blogtypeid);
    
    List<Blog>selectcheck();
    
    List<Blog>selectback();
    
    int blogdel(Integer id);
    
    int blogres(Integer id);
    
    int blogsuccess(Integer id);
    
    int blogfail(Integer id);
    //获取总博客数
    Blog blogcount();
   
    List<Blog> selectAllblog();
   
    int blogwatch(Integer id);
    
}