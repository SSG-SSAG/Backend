package com.shinsegae.ssgssag.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shinsegae.ssgssag.vo.RefgVO;

@Mapper
public interface RefgMapper {
	
	List<RefgVO> getList(String id);
	String getName(int id);
	int delete(int id);
}
