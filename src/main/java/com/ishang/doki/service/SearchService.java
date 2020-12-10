package com.ishang.doki.service;

import java.util.List;

import com.ishang.doki.entity.Searchresult;

public interface SearchService {
// 将结果放入searchresult中
	int insertone(Searchresult searchresult);

//搜索结果显示
	List<Searchresult> selectbyuserid(Integer userid);

}
