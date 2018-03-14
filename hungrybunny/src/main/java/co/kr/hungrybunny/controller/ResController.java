package co.kr.hungrybunny.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.kr.hungrybunny.service.HallService;
import co.kr.hungrybunny.vo.HallVO;
import co.kr.hungrybunny.vo.MenuVO;

@Controller
@RequestMapping("/res")
public class ResController {

	@Autowired
	private HallService hs;
	
	List<HallVO> list = new ArrayList<HallVO>();
	Map<String, Object> map = new HashMap<String, Object>();
	
	@RequestMapping(value="/checkOption", method = RequestMethod.GET)
	public ModelAndView getCheckOption(ModelAndView mav,@RequestParam Map<String, Object> map) {
		System.out.println("res컨트롤러??"+map.get("shopNo"));
		String str = map.get("shopNo").toString();
		int shopNo = Integer.parseInt(str);
		map = hs.getCheckOption(shopNo);
		System.out.println("map을 뽑아보자"+map);
		mav.addObject("hallList", map.get("hallList"));
		mav.addObject("menuList", map.get("menuList"));
		mav.setViewName("reservation/resList");
		return mav;
	}
	
	@RequestMapping(value="/confirmRes", method = RequestMethod.GET)
	public ModelAndView getConfirmRes(ModelAndView mav,@RequestParam Map<String, Object> map) {
		System.out.println("res컨트롤러??????????");
//		String str = map.get("shopNo").toString();
//		int shopNo = Integer.parseInt(str);
//		map = hs.getCheckOption(shopNo);
		System.out.println("map을 뽑아보자"+map);
		mav.addObject("hallList", map.get("hallList"));
		mav.addObject("menuList", map.get("menuList"));
		mav.setViewName("reservation/resList");
		return mav;
	}
}
