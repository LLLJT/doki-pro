package com.ishang.doki.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ishang.doki.dao.UserwatchMapper;
import com.ishang.doki.entity.Userwatch;
import com.ishang.doki.service.UserwatchService;
@Service
public class UserwatchServiceImpl implements UserwatchService{
@Autowired
private UserwatchMapper dao;
	public int insert(Userwatch record) {
		// TODO 自动生成的方法存根
		return dao.insert(record);
	}

	public List<Userwatch> selectwatchlist(Integer userid1) {
		// TODO 自动生成的方法存根
		return dao.selectwatchlist(userid1);
	}

	public List<Userwatch> selectfanlist(Integer userid2) {
		// TODO 自动生成的方法存根
		return dao.selectfanlist(userid2);
	}

	public List<Userwatch> selectifwatch(Userwatch record) {
		// TODO 自动生成的方法存根
		return dao.selectifwatch(record);
	}

	public int deleteone(Userwatch record) {
		// TODO 自动生成的方法存根
		return dao.deleteone(record);
	}

}
