package com.com.com;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ApprController {

	@Autowired
	ApprService service;
	
	@RequestMapping(value= {"/", "loginf"})
	public ModelAndView loginf(ModelAndView mv) {
		mv.setViewName("loginf");
		return mv;
	}
	
	@RequestMapping(value="login")
	public ModelAndView login(ModelAndView mv, @RequestParam String id,
			@RequestParam String password, HttpSession session) {
		Map<String,Object> detailMap = service.detail(id);
		
		if(detailMap == null) {
			mv.addObject("idCheck","idFail");
			mv.setViewName("loginf");
			return mv;
		}else if(!password.equals(detailMap.get("memPass"))) {
			mv.addObject("idCheck","pwFail");
			mv.setViewName("loginf");
			return mv;
		}else {
			session.setAttribute("detailMap", detailMap);
			mv.setViewName("redirect:main");
			return mv;
		}
	}
	
	@RequestMapping(value="logout")
	public ModelAndView logout(HttpSession session, ModelAndView mv) {
		if(session.getAttribute("detailMap") != null) {
			session.invalidate();
			mv.addObject("result", true);
		}else {
			mv.addObject("result", false);
		}
		mv.setViewName("redirect:loginf");
		return mv;
	}
	
	@RequestMapping(value="main")
	public ModelAndView main(ModelAndView mv,HttpSession session,@RequestParam Map<String,Object> map) {
		map.put("memInfo", session.getAttribute("detailMap"));
		if(map.get("memInfo") != null) {
			List<Map<String,Object>> list = service.apprList(map);
			mv.addObject("apprList",list);
		}
		mv.setViewName("main");
		return mv;
	}
	
	@RequestMapping(value="searchList")
	public ModelAndView searchList(HttpSession session,@RequestParam Map<String,Object> map, ModelAndView mv) {
		map.put("memInfo", session.getAttribute("detailMap"));
		if(map.get("memInfo") != null) {
			List<Map<String,Object>> list = service.apprList(map);
			mv.addObject("apprList",list);
		}
		mv.setViewName("searchList");
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
}
