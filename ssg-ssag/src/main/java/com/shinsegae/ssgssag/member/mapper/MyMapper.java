package com.shinsegae.ssgssag.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shinsegae.ssgssag.member.vo.MyVO;

@Mapper
public interface MyMapper {
	
	// 레시피 이름으로 조회
	List<MyVO> selectTags(MyVO vo);
}
