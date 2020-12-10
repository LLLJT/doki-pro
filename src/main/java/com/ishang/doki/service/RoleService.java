package com.ishang.doki.service;

import java.util.List;

import com.ishang.doki.entity.Role;

public interface RoleService {
	 List<Role> selectAll();
	 
	 int insert(Role record);
	 int roleres(Integer id);
	    int roledel(Integer id);
}
