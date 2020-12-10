package com.ishang.doki.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ishang.doki.dao.BlogMapper;
import com.ishang.doki.entity.Blog;
import com.ishang.doki.service.BlogService;
@Service
public class BlogServiceImpl implements BlogService{

	@Autowired
	private BlogMapper blogdao;
	public List<Blog> selectAll() {
		// TODO 自动生成的方法存根
		return blogdao.selectAll();
	}

	public Blog findbyid(int id) {
		// TODO Auto-generated method stub
		return blogdao.selectByPrimaryKey(id);
	}

	public List<Blog> searchLike(String blogtitle) {
		// TODO Auto-generated method stub
		return blogdao.searchLike(blogtitle);
	}

	public int insertone(Blog blog) {
		// TODO 自动生成的方法存根
		return blogdao.insert(blog);
	}

	public List<Blog> selectbytypeid(Integer blogtypeid) {
		// TODO 自动生成的方法存根
		return blogdao.selectbytypeid(blogtypeid);
	}

	public List<Blog> selectcheck() {
		// TODO 自动生成的方法存根
		return blogdao.selectback();
	}

	public List<Blog> selectback() {
		// TODO 自动生成的方法存根
		return blogdao.selectcheck();
	}

	public int blogdel(Integer id) {
		// TODO 自动生成的方法存根
		return blogdao.blogdel(id);
	}

	public int blogres(Integer id) {
		// TODO 自动生成的方法存根
		return blogdao.blogres(id);
	}

	public int updateByPrimaryKey(Blog record) {
		// TODO 自动生成的方法存根
		return blogdao.updateByPrimaryKey(record);
	}

	public List<Blog> searchLikecheck(String blogtitle) {
		// TODO 自动生成的方法存根
		return blogdao.searchLikecheck(blogtitle);
	}

	public int blogsuccess(Integer id) {
		// TODO 自动生成的方法存根
		return blogdao.blogsuccess(id);
	}

	public int blogfail(Integer id) {
		// TODO 自动生成的方法存根
		return blogdao.blogfail(id);
	}

	public Blog blogcount() {
		// TODO 自动生成的方法存根
		return blogdao.blogcount();
	}

	public List<Blog> selectAllblog() {
		// TODO 自动生成的方法存根
		return blogdao.selectAllblog();
	}

	public int blogwatch(Integer id) {
		// TODO 自动生成的方法存根
		return blogdao.blogwatch(id);
	}
	
}
