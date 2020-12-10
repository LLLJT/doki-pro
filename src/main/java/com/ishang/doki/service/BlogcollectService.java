package com.ishang.doki.service;

import java.util.List;

import com.ishang.doki.entity.Blogcollect;

public interface BlogcollectService {

	int insertone(Blogcollect blogcollect);
	
	int deleteone(Blogcollect blogcollect);
	
	List<Blogcollect> selectByuserid(Integer userid);
	
	List<Blogcollect> selectifcollect(Blogcollect collect);
}
