package com.ishang.doki.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ishang.doki.entity.Notify;

public interface NotifyService {

	int insert(Notify record);

	List<Notify> selectbyuserid(Integer userid);

	int deleteByPrimaryKey(Integer id);

	List<Notify> indexshow();
}
