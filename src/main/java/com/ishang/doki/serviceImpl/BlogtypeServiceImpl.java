package com.ishang.doki.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ishang.doki.dao.BlogtypeMapper;
import com.ishang.doki.entity.Blogtype;
import com.ishang.doki.service.BlogtypeService;
@Service
public class BlogtypeServiceImpl implements BlogtypeService {
@Autowired 
private BlogtypeMapper dao;
	public Blogtype selectbyname(String typename) {
		// TODO 自动生成的方法存根
		return dao.selectbyname(typename);
	}

}
