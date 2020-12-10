package com.ishang.doki.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ishang.doki.dao.BlogcollectMapper;
import com.ishang.doki.entity.Blogcollect;
import com.ishang.doki.service.BlogcollectService;

@Service
public class BlogcollectServiceImpl implements BlogcollectService{
@Autowired
private BlogcollectMapper dao;
	public int insertone(Blogcollect blogcollect) {
		// TODO 自动生成的方法存根
		return dao.insert(blogcollect);
	}
	public int deleteone(Blogcollect blogcollect) {
		// TODO 自动生成的方法存根
		return dao.deleteone(blogcollect);
	}
	public java.util.List<Blogcollect> selectByuserid(Integer userid) {
		// TODO 自动生成的方法存根
		return dao.selectByuserid(userid);
	}
	public List<Blogcollect> selectifcollect(Blogcollect collect) {
		// TODO 自动生成的方法存根
		return dao.selectifcollect(collect);
	}
	

}
