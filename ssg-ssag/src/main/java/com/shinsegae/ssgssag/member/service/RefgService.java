package com.shinsegae.ssgssag.member.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinsegae.ssgssag.member.mapper.RefgMapper;
import com.shinsegae.ssgssag.vo.RefgVO;


@Service
public class RefgService {
	
	@Autowired
	RefgMapper mapper;
	
	public List<RefgVO> getList(String ing_id) {
		List<RefgVO> list = mapper.getList(ing_id);
		for ( int i = 0; i<list.size(); i++) {
			Date cur_time = new Date();
			long remain_mil = list.get(i).getExpire_date().getTime()-cur_time.getTime();
			long remain_hour = (remain_mil)/3600000%24;
			long remain_day = remain_mil/3600000/24;
			if (remain_mil < 0) {
				list.get(i).setOver(true);
			}
			list.get(i).setRemain_day( (int) remain_day );
			list.get(i).setRemain_hour( (int) remain_hour );
		}
		return list;
	}
	
	public String getName(int ing_id) {
		return mapper.getName(ing_id);
	}
	
	public boolean delete(String id) {
		int r = mapper.delete(Integer.parseInt(id));
		if ( r== 1) {
			return true;
		}
		return false;
	}
	
	public int add(String ing_name, String expire_date, String curid) {
		int result = Integer.parseInt(mapper.ing_check(ing_name));
		if (result == 0 ) {
			return 0;
		}
		String ing_id = mapper.getId(ing_name);
		String contain = mapper.isContain(ing_id, curid);
		System.out.println(contain);
		if ( contain.equals("1")) {
			// 이미 있는 재료인 경우
			System.out.println("a");
			return 1;
		}
		else {
			/// 냉장고에 없는 재료인 경우
			System.out.println("b");
			mapper.add(curid, ing_id, expire_date);
			return 2;
		}
		
	
	}
	
	
	
}
