package com.ishang.doki.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ishang.doki.dao.VtuberMapper;
import com.ishang.doki.entity.Vtuber;
import com.ishang.doki.service.VtuberService;
@Service
public class VtuberServiceImpl implements VtuberService{
@Autowired
private VtuberMapper dao;
	public List<Vtuber> selectAll() {
		// TODO 自动生成的方法存根
		return dao.selectAll();
	}
	public List<Vtuber> searchLike(String name) {
		// TODO 自动生成的方法存根
		return dao.searchLike(name);
	}
	public Vtuber selectByPrimaryKey(Integer id) {
		// TODO 自动生成的方法存根
		return dao.selectByPrimaryKey(id);
	}

}
