package com.ishang.doki.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ishang.doki.dao.SearchresultMapper;
import com.ishang.doki.entity.Searchresult;
import com.ishang.doki.service.SearchService;
@Service
public class SearchResultImpl implements SearchService {
@Autowired
private SearchresultMapper dao;
	public int insertone(Searchresult searchresult) {
		// TODO 自动生成的方法存根
		return dao.insert(searchresult);
	}
	public List<Searchresult> selectbyuserid(Integer userid) {
		// TODO 自动生成的方法存根
		return dao.selectbyuserid(userid);
	}

}
