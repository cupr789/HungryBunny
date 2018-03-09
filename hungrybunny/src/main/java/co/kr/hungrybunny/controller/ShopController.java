package co.kr.hungrybunny.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kr.hungrybunny.service.ShopCaService;
import co.kr.hungrybunny.service.ShopService;
import co.kr.hungrybunny.vo.ShopCaVO;
import co.kr.hungrybunny.vo.ShopVO;


@Controller
@RequestMapping("/shop")
public class ShopController {
	
	@Autowired
	private ShopService shs;
	@Autowired
	private ShopCaService scs;

	List<ShopVO> shopList = new ArrayList<ShopVO>();
	List<ShopCaVO> caList = new ArrayList<ShopCaVO>();
	
//	@RequestMapping(value="/shopList", method=RequestMethod.POST)
//	public @ResponseBody Map<String, Object> getMenuList(Map<String,Object> map){
//		System.out.println("shop컨트롤러에요");
//		List<ShopVO> shopList = shs.getShopList();
//		map.put("shopList", shopList);
//		System.out.println(map);
//		return map;
//	}
	
	@RequestMapping(value="/shopList", method=RequestMethod.GET)
	public @ResponseBody List<ShopVO> getShopList(){
		System.out.println("shop컨트롤러에요");
		shopList = shs.getShopList();
		System.out.println("shopList에요오오ㅗㅇ"+shopList);
		return shopList;
	}
	
	@RequestMapping(value="/category", method=RequestMethod.GET)
	public @ResponseBody List<ShopCaVO> getCaList(){
		System.out.println("shop컨트롤러의 카테고리에요");
		caList = scs.getCaList();
		return caList;
	}
}
