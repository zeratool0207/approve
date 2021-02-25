package com.com.com;

import java.util.List;
import java.util.Map;

public interface ApprService {

	Map<String, Object> detail(String id);

	List<Map<String, Object>> apprList(Map<String, Object> map);

}
