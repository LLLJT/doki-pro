package com.ishang.doki.dao;

import com.ishang.doki.entity.Blogcollect;
import java.util.List;

public interface BlogcollectMapper {
    int deleteByPrimaryKey(Integer id);
    //used
    int insert(Blogcollect record);

    Blogcollect selectByPrimaryKey(Integer id);

    List<Blogcollect> selectAll();

    int updateByPrimaryKey(Blogcollect record);
    //used
    int deleteone(Blogcollect record);
    //收藏列表
    List<Blogcollect> selectByuserid(Integer userid);
    
    List<Blogcollect> selectifcollect(Blogcollect collect);
}