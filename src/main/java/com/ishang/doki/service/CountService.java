package com.ishang.doki.service;

import com.ishang.doki.entity.Count;

public interface CountService {
    //后端获取次数
    Count count();
    //每访问一次主页+1
    int updateone();
}
