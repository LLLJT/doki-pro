package com.ishang.doki.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ishang.doki.dao.UserMapper;
import com.ishang.doki.entity.User;
import com.ishang.doki.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper dao;
	


	public List<User> findAll() {
		// TODO 自动生成的方法存根
		return dao.selectAll();
	}

	public List<User> selectByEntity(User user) {
		// TODO 自动生成的方法存根
		return dao.selectbyEntity(user);
	}

	public List<User> getuser() {
		// TODO 自动生成的方法存根
		return dao.getuser();
	}

	public int insert(User user) {
		// TODO 自动生成的方法存根
		return dao.insert(user);
	}

	public List<User> searchLike(String username) {
		// TODO Auto-generated method stub
		return dao.searchLikeuser(username);
	}

	public List<User> selectdonate() {
		// TODO 自动生成的方法存根
		return dao.selectdonate();
	}

	public int updatebyid(User user) {
		// TODO 自动生成的方法存根
		return dao.updateByPrimaryKey(user);
	}

	public User selectbyname(String username) {
		// TODO 自动生成的方法存根
		return dao.selectbyname(username);
	}

	public int userres(Integer id) {
		// TODO 自动生成的方法存根
		return dao.userres(id);
	}

	public int userdel(Integer id) {
		// TODO 自动生成的方法存根
		return dao.userdel(id);
	}

	public int backmodifyimg(User user) {
		// TODO 自动生成的方法存根
		return dao.backmodifyimg(user);
	}

	public User selectAllbyid(Integer id) {
		// TODO 自动生成的方法存根
		return dao.selectAllbyid(id);
	}

	public int inspsd(User user) {
		// TODO 自动生成的方法存根
		return dao.inspsd(user);
	}

	public User selectnamebyid(Integer id) {
		// TODO 自动生成的方法存根
		return dao.selectnamebyid(id);
	}

	public User getpic(Integer id) {
		// TODO 自动生成的方法存根
		return dao.getpic(id);
	}

	
	
}
