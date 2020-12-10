package com.ishang.doki.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ishang.doki.dao.HotwordMapper;
import com.ishang.doki.entity.Hotword;
import com.ishang.doki.service.HotwordService;
@Service
public class HotwordServiceImpl implements HotwordService {

@Autowired
private HotwordMapper dao;	

	public List<Hotword> selectAll() {
		// TODO 自动生成的方法存根
		return dao.selectAll();
	}

	public int insertone(Hotword hotword) {
		// TODO 自动生成的方法存根
		return dao.insert(hotword);
	}

	public int updateone(String hotcontent) {
		// TODO 自动生成的方法存根
		return dao.updateone(hotcontent);
	}

	public List<Hotword> selectAllorder() {
		// TODO 自动生成的方法存根
		return dao.selectAllorder();
	}

	public int updateword(Hotword hotword) {
		// TODO 自动生成的方法存根
		return dao.updateword(hotword);
	}

	public Hotword selectbyid(Integer id) {
		// TODO 自动生成的方法存根
		return dao.selectbyid(id);
	}

	public int success(Integer id) {
		// TODO 自动生成的方法存根
		return dao.success(id);
	}

	public int fail(Integer id) {
		// TODO 自动生成的方法存根
		return dao.fail(id);
	}

	

	public List<Hotword> selectcheck() {
		// TODO 自动生成的方法存根
		return dao.selectcheck();
	}

	public List<Hotword> selectbytitle(String wordtitle) {
		// TODO 自动生成的方法存根
		return dao.selectbytitle(wordtitle);
	}

	public int worddel(Integer id) {
		// TODO 自动生成的方法存根
		return dao.worddel(id);
	}

	public int wordres(Integer id) {
		// TODO 自动生成的方法存根
		return dao.wordres(id);
	}

	public int updateByPrimaryKey(Hotword record) {
		// TODO 自动生成的方法存根
		return dao.updateByPrimaryKey(record);
	}

	public int insert(Hotword record) {
		// TODO 自动生成的方法存根
		return dao.insert(record);
	}

	public Hotword wordcount() {
		// TODO 自动生成的方法存根
		return dao.wordcount();
	}

	public List<Hotword> wordlist() {
		// TODO 自动生成的方法存根
		return dao.wordlist();
	}

	public Hotword detaillist(Integer id) {
		// TODO 自动生成的方法存根
		return dao.detaillist(id);
	}

	public int updatehotword(Hotword hotword) {
		// TODO 自动生成的方法存根
		return dao.updatehotword(hotword);
	}

	public int upsuccess1(Hotword hotword) {
		// TODO 自动生成的方法存根
		return dao.upsuccess1(hotword);
	}

	public int upsuccess2(Hotword hotword) {
		// TODO 自动生成的方法存根
		return dao.upsuccess2(hotword);
	}

	public int upsuccess3(Hotword hotword) {
		// TODO 自动生成的方法存根
		return dao.upsuccess3(hotword);
	}

	public int upsuccess4(Hotword hotword) {
		// TODO 自动生成的方法存根
		return dao.upsuccess4(hotword);
	}

	public Hotword selecttitlebyid(Integer id) {
		// TODO 自动生成的方法存根
		return dao.selecttitlebyid(id);
	}

	public int wordcountplus(Integer id) {
		// TODO 自动生成的方法存根
		return dao.wordcountplus(id);
	}

}
