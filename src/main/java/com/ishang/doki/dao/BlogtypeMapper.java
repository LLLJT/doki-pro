package com.ishang.doki.dao;

import com.ishang.doki.entity.Blogtype;
import java.util.List;

public interface BlogtypeMapper {

	int deleteByPrimaryKey(Integer id);

    int insert(Blogtype record);

    Blogtype selectByPrimaryKey(Integer id);

    List<Blogtype> selectAll();

    int updateByPrimaryKey(Blogtype record);
    
    //added by ljt
    Blogtype selectbyname(String typename);
    
}