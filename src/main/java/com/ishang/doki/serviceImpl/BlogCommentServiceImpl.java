package com.ishang.doki.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ishang.doki.dao.BlogcommentMapper;
import com.ishang.doki.entity.Blog;
import com.ishang.doki.entity.Blogcomment;
import com.ishang.doki.service.BlogCommentService;
@Service
public class BlogCommentServiceImpl implements BlogCommentService{

	@Autowired
	private BlogcommentMapper dao;
	
	public int insertone(Blogcomment blogcomment) {
		// TODO 自动生成的方法存根
		return dao.insert(blogcomment);
	}

	public List<Blogcomment> comment(Integer blogid) {
		// TODO 自动生成的方法存根
		return dao.selectAll(blogid);
	}

	public List<Blogcomment> findcomment(Integer blogid) {
		// TODO 自动生成的方法存根
		return dao.findcomment(blogid);
	}

	public Blogcomment findcommentdetail(String comment) {
		// TODO 自动生成的方法存根
		return dao.findcommentdetail(comment);
	}

	public List<Blogcomment> findanswer(Blogcomment blogcomment) {
		// TODO 自动生成的方法存根
		return dao.findanswer(blogcomment);
	}

	
	
	
	
	
}
