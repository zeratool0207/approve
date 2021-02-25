package com.com.com;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ApprDaoImpl implements ApprDao{

	@Autowired
	SqlSession sqlsession;
	
	private static final String NameSpace = "com.mappers.apprMapper.";

	@Override
	public Map<String, Object> detail(String id) {
		return sqlsession.selectOne(NameSpace+"detail",id);
	}

	@Override
	public List<Map<String, Object>> apprList(Map<String, Object> map) {
		return sqlsession.selectList(NameSpace+"apprList",map);
	}

	
	
}
