package com.jk.ktMembership.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.jk.ktMembership.dao.LoyaltyDao;

@Repository
public class LoyaltyDaoImpl implements LoyaltyDao {

	@Override
	public List<Map<String,Object>> getDvlInfoList() {
		List<Map<String,Object>> dvlInfoList = new ArrayList<>();
		int i = 0;
		
		while(i < 5) {
			Map<String,Object> dvlInfo = new HashMap<>();
			dvlInfo.put("seq", i);
			dvlInfo.put("dvlName", "김재기");
			dvlInfo.put("dvlTel", "01083304136");
			dvlInfo.put("postNo", "345678");
			dvlInfo.put("addr1", "경기도 성남시 분당구 금곡동");
			dvlInfo.put("addr2", "청솔주공9단지 905-603");
			dvlInfoList.add(dvlInfo);
			i++;
		}
		
		return dvlInfoList;
	}

}
