package com.ishang.doki.dao;

import com.ishang.doki.entity.Hotwordtype;
import java.util.List;

public interface HotwordtypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Hotwordtype record);

    Hotwordtype selectByPrimaryKey(Integer id);

    List<Hotwordtype> selectAll();

    int updateByPrimaryKey(Hotwordtype record);
    
    //通过typename找typeid，用于词条更新转换值
   Hotwordtype selectbytypename(String typename);
    
}