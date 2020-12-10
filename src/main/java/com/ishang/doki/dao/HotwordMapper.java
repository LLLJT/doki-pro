package com.ishang.doki.dao;

import com.ishang.doki.entity.Hotword;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface HotwordMapper {
    int deleteByPrimaryKey(@Param("id") Integer id, @Param("userid") Integer userid);

    int insert(Hotword record);

    Hotword selectByPrimaryKey(@Param("id") Integer id, @Param("userid") Integer userid);

    List<Hotword> selectAll();

    int updateByPrimaryKey(Hotword record);
    
  //added by ljt 
    int updateone(String wordtitle);
    
    List<Hotword> selectAllorder();

    //更新词条
    int updateword(Hotword hotword);
    //模糊查找
    List<Hotword> selectbytitle(String wordtitle);
    //详细信息
    Hotword selectbyid(Integer id);
    //后台审核
    int success(Integer id);
    
    int fail(Integer id);
    //根据不同title后台进行修改
    int upsuccess1(Hotword hotword);
    
    int upsuccess2(Hotword hotword);
    
    int upsuccess3(Hotword hotword);
    
    int upsuccess4(Hotword hotword);
    
    //后端checklist
    List<Hotword> selectcheck();
    
    int worddel(Integer id);
    
    int wordres(Integer id);
    
    Hotword wordcount();
    
    List<Hotword> wordlist();
    
    Hotword detaillist(Integer id);
    //用于前端更新
   int updatehotword(Hotword hotword);
    
    Hotword selecttitlebyid(Integer id);
    //浏览次数+1
   int wordcountplus(Integer id);
    
}