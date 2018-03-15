package co.kr.hungrybunny.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.kr.hungrybunny.service.HallService;
import co.kr.hungrybunny.service.ResService;
import co.kr.hungrybunny.vo.HallVO;
import co.kr.hungrybunny.vo.UserInfoVO;

@Controller
@RequestMapping("/res")
public class ResController {

	@Autowired
	private HallService hs;
	@Autowired
	private ResService rs;
	
	List<HallVO> list = new ArrayList<HallVO>();
	Map<String, Object> map = new HashMap<String, Object>();
	
	@RequestMapping(value="/checkOption", method = RequestMethod.GET)
	public ModelAndView getCheckOption(ModelAndView mav,@RequestParam Map<String, Object> map, HttpSession hs) {
		System.out.println("res컨트롤러??"+map.get("shopNo"));
		String str = map.get("shopNo").toString();
		int shopNo = Integer.parseInt(str);
		map = this.hs.getCheckOption(shopNo);
		System.out.println("map을 뽑아보자"+map);
		mav.addObject("hallList", map.get("hallList"));
		mav.addObject("menuList", map.get("menuList"));
		mav.setViewName("reservation/resList");
		return mav;
	}
	
	@RequestMapping(value="/confirmRes", method = RequestMethod.GET)
	public ModelAndView insertRes(ModelAndView mav,@RequestParam Map<String, Object> map, 
			@RequestParam("resMenuCnt") String[] resMenuCntList, 
			@RequestParam("menuNo") String[] menuNoList,
			HttpSession hs) {
		System.out.println("res컨트롤러??????????");		
		UserInfoVO ui = (UserInfoVO)hs.getAttribute("userInfo");
		System.out.println("map을 뽑아보자"+map);
		System.out.println("resMenuCnt을 뽑아보자"+resMenuCntList);
		System.out.println("menuNoList을 뽑아보자"+menuNoList);
		int uiNo = ui.getUiNo();
		map.put("uiNo", uiNo);
		map.put("resMenuCntList", resMenuCntList);
		map.put("menuNoList", menuNoList);
		System.out.println("map을 뽑아보자"+map);
		int result = rs.insertRes(map);
		return null;
	}
}
