package co.kr.hungrybunny.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import co.kr.hungrybunny.service.MenuService;
import co.kr.hungrybunny.vo.MenuVO;
import co.kr.hungrybunny.vo.UserInfoVO;

@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@Autowired
	private MenuService ms;
	UserInfoVO ui = new UserInfoVO();
	
//	@RequestMapping(value="/shopList/{shopCaNo}", method=RequestMethod.POST)
//	public @ResponseBody List<ShopVO> getShopList(@PathVariable("shopCaNo") int shopCaNo){
//		System.out.println("shopCaNo받아옴"+shopCaNo);
//		shopList = shs.getShopList(shopCaNo);
//		System.out.println("shopList에는 "+shopList);
//		return shopList;
//	}
	
	@RequestMapping(value="/menuList/{shopNo}", method=RequestMethod.POST)
	public @ResponseBody List<MenuVO> getMenuList(@PathVariable("shopNo") int shopNo){
		List<MenuVO> menuList = new ArrayList<MenuVO>();
		menuList = ms.getMenuList(shopNo);
		System.out.println("컨트롤러의 menuList : "+menuList);
		return menuList;
	}
	
	@RequestMapping(value="/menuList2", method=RequestMethod.POST)
	public ModelAndView getMenuListForRes(ModelAndView mav, @RequestParam Map<String, Object> map){
		String str = map.get("shopNo").toString();
		int shopNo = Integer.parseInt(str);
		List<MenuVO> menuList = new ArrayList<MenuVO>();
		menuList = ms.getMenuList(shopNo);
		mav.addObject("menuList",menuList);
		mav.setViewName("reservation/resList2");
		return mav;
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> insertMenu(@RequestBody MenuVO mv,HttpSession hs){
		Map<String, Object> map = new HashMap<String, Object>();
		if (hs.getAttribute("userInfo") != null) {
			ui.setUiNo((Integer) hs.getAttribute("userNo"));
			int result=ms.inertMenu(mv);
			if(result==1) {
				map.put("msg","추가됬어요");
				map.put("biz",true);
			}
		} else {
			map.put("msg", "로그인 부터 다시해주세요");
		}
		
		return map;
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> deleteMenu(@RequestBody MenuVO mv,HttpSession hs){
		Map<String, Object> map = new HashMap<String, Object>();
		if (hs.getAttribute("userInfo") != null) {
			ui.setUiNo((Integer) hs.getAttribute("userNo"));
			int result=ms.deleteMenu(mv,map);
			if(result==1) {
				map.put("msg","삭제성공이요");
				map.put("biz",true);
			}
		} else {
			map.put("msg", "로그인 부터 다시해주세요");
		}
		
		return map;
	}
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> updateMenu(@RequestParam Map<String, Object> map,HttpSession hs){
		if (hs.getAttribute("userInfo") != null) {
			ui.setUiNo((Integer) hs.getAttribute("userNo"));
			map.put("menuNo",Integer.parseInt(map.get("menuNo").toString()));
			map.put("menuPrice",Integer.parseInt(map.get("menuPrice").toString()));
			int result=ms.updateMenu(map);
			if(result==1) {
				map.put("msg","수정성공이요");
				map.put("biz",true);
			}
		} else {
			map.put("msg", "로그인 부터 다시해주세요");
		}
		
		return map;
	}
	//재형이 추가함 브끄^^
	@RequestMapping(value="/getMenuName", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> getMenuName(MenuVO mv,@RequestBody Map<String,Object> map,HttpSession hs){
		//Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(map.get("menuNoArr"));
		
		if (hs.getAttribute("userInfo") != null) {
			Map<String, List<String>> menuNoList =ms.getMenuName(map);
			map.put("namesAndCnt", menuNoList);
		} else {
			map.put("msg", "로그인 부터 다시해주세요");
		}
		
		return map;
	}
	
}
