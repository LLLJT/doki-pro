package com.ishang.doki.service;

import java.util.List;

import com.ishang.doki.entity.Blog;
import com.ishang.doki.entity.Blogcomment;

public interface BlogCommentService {

	int insertone(Blogcomment blogcomment);

	List<Blogcomment> comment(Integer blogid);

	List<Blogcomment> findcomment(Integer blogid);

	Blogcomment findcommentdetail(String comment);

	 List<Blogcomment> findanswer(Blogcomment blogcomment);

}
