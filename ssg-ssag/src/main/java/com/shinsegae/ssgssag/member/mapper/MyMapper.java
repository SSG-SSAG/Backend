package com.shinsegae.ssgssag.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.shinsegae.ssgssag.member.vo.MyVO;

@Mapper
public interface MyMapper {
	
	// 관심 태그 조회
	List<MyVO> selectTags(MyVO vo);
	
	// 새로운 태그 추가
	int addTag(@Param("user_no") String user_no, @Param("tag_id") String tag_id);
	
	// 존재하는 태그인지 확인
	String isContain(@Param("tag_id") String tag_id, @Param("user_no") String user_no);
	
	String getName(int tag_id);
	
	int deleteTag(int like_tag_id);
	
	String tagCheck(String tag_name);
	
	String getId(String tag_name);
}
