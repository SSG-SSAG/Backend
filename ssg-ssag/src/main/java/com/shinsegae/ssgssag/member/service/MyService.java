package com.shinsegae.ssgssag.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinsegae.ssgssag.member.mapper.MyMapper;
import com.shinsegae.ssgssag.member.vo.MyVO;

@Service
public class MyService {

	@Autowired
	MyMapper mapper;
	
	public List<MyVO> tags(MyVO vo) {
		List<MyVO> obj = mapper.selectTags(vo);
		return obj;
	}
	
	public String getName(int tag_id) {
		return mapper.getName(tag_id);
	}
	
	public boolean deleteTag(String like_tag_id) {
		int r = mapper.deleteTag(Integer.parseInt(like_tag_id));
		if (r == 1) {
			return true;
		}
		return false;
	}
	
	public int addTag(int tag_id, String tag_name, String user_no) {
		System.out.println("###### Add Tag Service ######");
		System.out.println("user no : " + user_no);
		
		int result = Integer.parseInt(mapper.tagCheck(tag_name));
		if (result == 0) {
			return 0;
		}
		
		System.out.println("tag id : " + tag_id);
		tag_id = Integer.parseInt(mapper.getId(tag_name));
		
		String contain = mapper.isContain(tag_id, user_no);
		
		if (contain.equals("0")) {	// 새로운 경우
			System.out.println("new tag");
			mapper.addTag(user_no, tag_id, tag_name);
			return 2;
		} else {	// 이미 있는 태그인 경우
			System.out.println("cannot add");
			return 1;
		}
	
	}
}
