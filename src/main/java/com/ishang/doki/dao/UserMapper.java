package com.ishang.doki.dao;

import com.ishang.doki.entity.User;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    


	int deleteByPrimaryKey(@Param("id") Integer id, @Param("username") String username);

    int insert(User record);

    User selectByPrimaryKey(@Param("id") Integer id, @Param("username") String username);

    List<User> selectAll();
    //used 修改个人信息
    int updateByPrimaryKey(User record);
    
    
    //added by ljt
    List<User> selectbyEntity(User user);
    
    List<User> getuser();
    
   List<User> searchLikeuser(String username);
   
   List<User> selectdonate();
   
   User selectbyname(String username);
   
   int userres(Integer id);
   
   int userdel(Integer id);
   
   int backmodifyimg(User user);
   
   User selectAllbyid(Integer id);
   
   //update方法
   int inspsd(User user);
   
  User selectnamebyid(Integer id);
   
   User getpic(Integer id);
}