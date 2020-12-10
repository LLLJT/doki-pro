package com.ishang.doki.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ishang.doki.dao.NotifyMapper;
import com.ishang.doki.entity.Notify;

import com.ishang.doki.service.NotifyService;
@Service
public class NotifyServiceImpl implements NotifyService {

	@Autowired
	private NotifyMapper dao;
	//将审核信息添加到表中
	public int insert(Notify record) {
		// TODO 自动生成的方法存根
		return dao.insert(record);
	}
	
	public List<Notify> selectbyuserid(Integer userid) {
		// TODO 自动生成的方法存根
		return dao.selectbyuserid(userid);
	}

	public int deleteByPrimaryKey(Integer id) {
		// TODO 自动生成的方法存根
		return dao.deleteByPrimaryKey(id);
	}

	public List<Notify> indexshow() {
		// TODO 自动生成的方法存根
		return dao.indexshow();
	}

}
