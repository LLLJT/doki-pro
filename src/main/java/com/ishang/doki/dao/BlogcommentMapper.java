package com.ishang.doki.dao;

import com.ishang.doki.entity.Blog;
import com.ishang.doki.entity.Blogcomment;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BlogcommentMapper {
   
	int deleteByPrimaryKey(Integer id);

    int insert(Blogcomment record);

    Blogcomment selectByPrimaryKey(Integer id);
    
    //this changed by ljt
    List<Blogcomment> selectAll(Integer blogid);

    int updateByPrimaryKey(Blogcomment record);
    
    List<Blogcomment> findcomment(@Param("blogid") Integer blogid);
    
    Blogcomment findcommentdetail(String comment);
    
    List<Blogcomment> findanswer(Blogcomment blogcomment);
}