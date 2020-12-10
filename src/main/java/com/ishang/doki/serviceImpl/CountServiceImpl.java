package com.ishang.doki.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ishang.doki.dao.CountMapper;
import com.ishang.doki.entity.Count;
import com.ishang.doki.service.CountService;
@Service
public class CountServiceImpl implements CountService{
@Autowired
private CountMapper dao;
	public Count count() {
		// TODO 自动生成的方法存根
		return dao.count();
	}

	public int updateone() {
		// TODO 自动生成的方法存根
		return dao.updateone();
	}

}
