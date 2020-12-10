package com.ishang.doki.service;

import java.util.List;

import com.ishang.doki.entity.Blog;

public interface ForumService {

	/**
	 * 通过id查询all
	 */
	List<Blog>findAll(String id); 
	
	
	
}
