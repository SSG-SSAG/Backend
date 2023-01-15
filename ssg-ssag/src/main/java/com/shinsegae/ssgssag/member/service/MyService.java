package com.shinsegae.ssgssag.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinsegae.ssgssag.member.mapper.MyMapper;
import com.shinsegae.ssgssag.member.vo.MyVO;
import com.shinsegae.ssgssag.recipe.vo.RecipeVO;

@Service
public class MyService {

	@Autowired
	MyMapper mapper;
	
	public List<MyVO> tags(MyVO vo) {
		List<MyVO> obj = mapper.selectTags(vo);
		return obj;
	}
}
