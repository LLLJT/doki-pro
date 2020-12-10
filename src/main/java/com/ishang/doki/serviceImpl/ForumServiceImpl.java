package com.ishang.doki.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ishang.doki.dao.BlogMapper;
import com.ishang.doki.entity.Blog;
import com.ishang.doki.service.ForumService;


@Service
public class ForumServiceImpl implements ForumService{

	@Autowired
	BlogMapper blogdao;

	public List<Blog> findAll(String id) {
		// TODO 自动生成的方法存根
		return blogdao.selectAll();
	}
	

	

	
}
