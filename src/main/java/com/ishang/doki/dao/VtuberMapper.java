package com.ishang.doki.dao;

import com.ishang.doki.entity.Vtuber;
import java.util.List;

public interface VtuberMapper {
    

	int deleteByPrimaryKey(Integer id);

    int insert(Vtuber record);

    Vtuber selectByPrimaryKey(Integer id);
    //changed,order by fannum
    List<Vtuber> selectAll();

    int updateByPrimaryKey(Vtuber record);
    //模糊查找
    List<Vtuber> searchLike(String name);
}