package com.ishang.doki.service;

import java.util.List;

import com.ishang.doki.entity.Vtuber;

public interface VtuberService {
	List<Vtuber> selectAll();
	
	 List<Vtuber> searchLike(String name);
	 
	 Vtuber selectByPrimaryKey(Integer id);
}
