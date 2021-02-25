package com.com.com;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ApprServiceImpl implements ApprService {

	@Autowired
	ApprDao dao;

	@Override
	public Map<String, Object> detail(String id) {
		return dao.detail(id);
	}

	@Override
	public List<Map<String, Object>> apprList(Map<String, Object> map) {
		return dao.apprList(map);
	}

	
	
}
