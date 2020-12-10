package com.ishang.doki.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ishang.doki.dao.RoleMapper;
import com.ishang.doki.entity.Role;
import com.ishang.doki.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService{
@Autowired
private RoleMapper dao;
	public List<Role> selectAll() {
		// TODO 自动生成的方法存根
		return dao.selectAll();
	}
	public int insert(Role record) {
		// TODO 自动生成的方法存根
		return dao.insert(record);
	}
	public int roleres(Integer id) {
		// TODO 自动生成的方法存根
		return dao.roleres(id);
	}
	public int roledel(Integer id) {
		// TODO 自动生成的方法存根
		return dao.roledel(id);
	}

}
