package com.ishang.doki.dao;

import com.ishang.doki.entity.Count;
import java.util.List;

public interface CountMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Count record);

    Count selectByPrimaryKey(Integer id);

    List<Count> selectAll();

    int updateByPrimaryKey(Count record);
    
    //后端获取次数
    Count count();
    //每访问一次主页+1
    int updateone();
    
}