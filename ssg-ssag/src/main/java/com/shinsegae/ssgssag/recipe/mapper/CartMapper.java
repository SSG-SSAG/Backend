package com.shinsegae.ssgssag.recipe.mapper;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.shinsegae.ssgssag.recipe.vo.CartVO;

@Mapper
public interface CartMapper {

	List<String> getRefg(String user_id);
	
	List<CartVO> getIngs(String user_id);
	
	String getName(String ing_id);
	
	List<CartVO> rcpIngs(String recipe_id);
	int addIngs(@Param("user_id") String user_id, @Param("ing_id") String ing_id, @Param("date") LocalDate now);
	
	int deleteCart(@Param("user_id") String user_id, @Param("ing_id") int ing_id);
	
	int deleteAll(String user_id);
}
