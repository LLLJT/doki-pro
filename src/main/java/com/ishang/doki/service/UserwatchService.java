package com.ishang.doki.service;

import java.util.List;

import com.ishang.doki.entity.Userwatch;

public interface UserwatchService {

	
	 int insert(Userwatch record);

	 //关注list
	    List<Userwatch> selectwatchlist(Integer userid1);
	    //粉丝list
	    List<Userwatch> selectfanlist(Integer userid2);
	    //查看是否关注
	    List<Userwatch> selectifwatch(Userwatch record);
	    //取消关注
	    int deleteone(Userwatch record);
	
}
