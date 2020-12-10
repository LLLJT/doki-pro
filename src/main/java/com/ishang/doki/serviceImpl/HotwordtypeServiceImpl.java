package com.ishang.doki.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ishang.doki.dao.HotwordtypeMapper;
import com.ishang.doki.entity.Hotwordtype;
import com.ishang.doki.service.HotwordtypeService;
@Service
public class HotwordtypeServiceImpl implements HotwordtypeService {
@Autowired
private HotwordtypeMapper dao;
	public Hotwordtype selectbytypename(String typename) {
		// TODO 自动生成的方法存根
		return dao.selectbytypename(typename);
	}

}
