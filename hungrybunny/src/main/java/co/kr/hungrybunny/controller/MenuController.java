package co.kr.hungrybunny.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
	
//	@RequestMapping(value="/shopList/{shopCaNo}", method=RequestMethod.POST)
//	public @ResponseBody List<ShopVO> getShopList(@PathVariable("shopCaNo") int shopCaNo){
//		System.out.println("shopCaNo받아옴"+shopCaNo);
//		shopList = shs.getShopList(shopCaNo);
//		System.out.println("shopList에는 "+shopList);
//		return shopList;
//	}
	
	@RequestMapping(value="/menuList/{shopNo}", method=RequestMethod.POST)
	public @ResponseBody List<MenuVO> getMenuList(@PathVariable("shopNo") int shopNo){
		System.out.println("메뉴 컨트롤러 왔샤");
		List<MenuVO> menuList = new ArrayList<MenuVO>();
		menuList = ms.getMenuList(shopNo);
		System.out.println("컨트롤러의 menuList : "+menuList);
		return menuList;
	}
}
