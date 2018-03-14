package co.kr.hungrybunny.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.kr.hungrybunny.vo.MenuVO;

@Controller
@RequestMapping("/map")
public class MapController {
	
	
	
	@RequestMapping(value="/mapList", method=RequestMethod.GET)
	public @ResponseBody ModelAndView getMenuList(@RequestParam Map<String,Object> map ,ModelAndView mav){
		System.out.println("검색한 값: "+map.get("address"));
		mav.addObject("address",map.get("address"));
		mav.setViewName("reservation/shopCa");
		return mav;
	}
	
	@RequestMapping(value="/selectMap", method=RequestMethod.POST)
	public @ResponseBody ModelAndView getSelectMap(@RequestParam Map<String,Object> map ,ModelAndView mav){
		System.out.println("들어는옴");
		System.out.println(map.get("searchAddr"));
		System.out.println(map.get("shopCaNum"));
		return mav;
	}
	
}
