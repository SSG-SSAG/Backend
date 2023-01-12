package com.shinsegae.ssgssag.recipe.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shinsegae.ssgssag.recipe.vo.CartVO;

@Mapper
public interface CartMapper {

	List<CartVO> getIngs(String user_id);
	
	String getName(String ing_id);
}
