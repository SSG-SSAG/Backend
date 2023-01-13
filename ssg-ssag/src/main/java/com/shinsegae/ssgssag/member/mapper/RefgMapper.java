package com.shinsegae.ssgssag.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.shinsegae.ssgssag.vo.RefgVO;

@Mapper
public interface RefgMapper {
	
	List<RefgVO> getList(String id);
	String getName(int id);
	int delete(int id);
	String ing_check(String ing_name);
	String getId(String ing_name);
	int add(@Param("user_no") String user_no,@Param("ing_id") String ing_id, @Param("expire_date") String expire_date);
	String isContain(@Param("ing_id") String ing_id, @Param("user_id") String curid);
}
