package com.ishang.doki.dao;

import com.ishang.doki.entity.Role;
import java.util.List;

public interface RoleMapper {
    

	int deleteByPrimaryKey(Integer id);

    int insert(Role record);

    Role selectByPrimaryKey(Integer id);

    List<Role> selectAll();

    int updateByPrimaryKey(Role record);
    
    int roleres(Integer id);
    int roledel(Integer id);
}