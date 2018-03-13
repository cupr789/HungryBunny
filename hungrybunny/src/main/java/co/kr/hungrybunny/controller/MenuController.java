package co.kr.hungrybunny.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kr.hungrybunny.service.MenuService;
import co.kr.hungrybunny.vo.MenuVO;

@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@Autowired
	private MenuService ms;
	@RequestMapping(value="/koreanMenu", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> getMenuList(Map<String,Object> map){
		List<MenuVO> menuList = ms.getMenuList();
		map.put("menuList", menuList);
		System.out.println(menuList);
		System.out.println("나 맵이야"+map);
		System.out.println("");
		System.out.println("학원에서");
		System.out.println("ss");
		return map;
	}
}
