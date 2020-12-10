package com.ishang.doki.dao;

import com.ishang.doki.entity.Notify;
import java.util.List;

public interface NotifyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Notify record);

    Notify selectByPrimaryKey(Integer id);

    List<Notify> selectAll();

    int updateByPrimaryKey(Notify record);
    //获取用户所有通知
    List<Notify> selectbyuserid(Integer userid);
    //index界面展示前3
    List<Notify> indexshow();
}