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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.kr.hungrybunny.service.HallService;
import co.kr.hungrybunny.service.PayCaService;
import co.kr.hungrybunny.service.ResService;
import co.kr.hungrybunny.vo.HallVO;
import co.kr.hungrybunny.vo.ShopCaVO;
import co.kr.hungrybunny.vo.UserInfoVO;

@Controller
@RequestMapping("/res")
public class ResController {

	@Autowired
	private HallService hs;
	@Autowired
	private ResService rs;
	@Autowired
	private PayCaService ps;
	
	List<HallVO> list = new ArrayList<HallVO>();
	Map<String, Object> map = new HashMap<String, Object>();
	
	@RequestMapping(value="/checkOption", method = RequestMethod.GET)
	public ModelAndView getCheckOption(ModelAndView mav,@RequestParam Map<String, Object> map, HttpSession hs) {
		String str = map.get("shopNo").toString();
		int shopNo = Integer.parseInt(str);
		map = this.hs.getCheckOption(shopNo);
		mav.addObject("hallList", map.get("hallList"));
		mav.addObject("menuList", map.get("menuList"));
		mav.addObject("payCaList", map.get("payCaList"));
		mav.setViewName("reservation/resList");
		return mav;
	}
	
	@RequestMapping(value="/askRes", method = RequestMethod.POST)
	public ModelAndView insertRes(ModelAndView mav,@RequestParam Map<String, Object> map, 
			@RequestParam("resMenuCnt") String[] resMenuCntList, 
			@RequestParam("menuNo") String[] menuNoList,
			@RequestParam("menuPrice") String[] menuPriceList,
			HttpSession hs) {
		System.out.println("res컨트롤러??????????");		
		UserInfoVO ui = (UserInfoVO)hs.getAttribute("userInfo");
		System.out.println("map을 뽑아보자"+map);
		int uiNo = ui.getUiNo();
		map.put("uiNo", uiNo);
		map.put("resMenuCntList", resMenuCntList);
		map.put("menuNoList", menuNoList);
		map.put("menuPriceList", menuPriceList);
		
//		int result = rs.insertRes(map);
//    	mav.addObject("error", map.get("error"));
//    	System.out.println(map);
//		mav.setViewName("reservation/confirmRes");
//		return mav;
	    try {
	    	int result = rs.insertRes(map);
	    	mav.addObject("error", map.get("error"));
	    	System.out.println(map);
			mav.setViewName("reservation/completeRes");
			return mav;
		} catch (Exception e) {
			mav.setViewName("reservation/completeRes");
			return mav;
		}
	}
	
	@RequestMapping(value="/confirmRes", method = RequestMethod.GET)
	public @ResponseBody List<Object> getConfirmRes(HttpSession hs){
		System.out.println("??????????????????????롸???");
		UserInfoVO ui = (UserInfoVO)hs.getAttribute("userInfo");
		int uiNo = ui.getUiNo();
		System.out.println("uiNo에요"+uiNo);
		List<Object> resList = new ArrayList<Object>();
		resList = rs.getConfirmRes(uiNo);
		System.out.println("resList!!!!!!!!!!!!!!!"+resList);
		return resList;
	}
	
}
