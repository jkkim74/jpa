package com.jk.ktMembership.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface LoyaltyDao {
	
	public List<Map<String, Object>> getDvlInfoList();

}
