package com.ishang.doki.dao;

import com.ishang.doki.entity.Searchresult;
import java.util.List;

public interface SearchresultMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Searchresult record);

    Searchresult selectByPrimaryKey(Integer id);

    List<Searchresult> selectAll();

    int updateByPrimaryKey(Searchresult record);
    
    //added by ljt
    List<Searchresult> selectbyuserid(Integer userid);
}