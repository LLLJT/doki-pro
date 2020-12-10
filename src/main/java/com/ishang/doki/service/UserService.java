package com.ishang.doki.service;

import java.util.List;

import com.ishang.doki.entity.User;

public interface UserService {

	
	//登录
	List<User>selectByEntity(User user);
	
	//查询所有,userlist
	
	List<User>findAll();
	
	List<User> getuser();
	
	int insert(User user);
	
	List<User> searchLike(String username);
	
	List<User> selectdonate();
	
	//update，更新个人信息
	int updatebyid(User user);
	 User selectbyname(String username);
	 
	 
	   int userres(Integer id);
	   
	   int userdel(Integer id);
	
	   int backmodifyimg(User user);
	   
	   User selectAllbyid(Integer id);
	   
	   int inspsd(User user);
	   
	   User selectnamebyid(Integer id);
	   
	   User getpic(Integer id);
}
