package com.ishang.doki.dao;

import com.ishang.doki.entity.Userwatch;
import java.util.List;

public interface UserwatchMapper {
    int deleteByPrimaryKey(Integer id);

	int insert(Userwatch record);

	Userwatch selectByPrimaryKey(Integer id);

	List<Userwatch> selectAll();

	int updateByPrimaryKey(Userwatch record);

	
    
  //added by ljt
    //关注list
    List<Userwatch> selectwatchlist(Integer userid1);
    //粉丝list
    List<Userwatch> selectfanlist(Integer userid2);
    //查看是否关注
    List<Userwatch> selectifwatch(Userwatch record);
    //取消关注
    int deleteone(Userwatch record);


    
}