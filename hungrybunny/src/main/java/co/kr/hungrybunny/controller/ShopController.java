package co.kr.hungrybunny.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import co.kr.hungrybunny.service.HallService;
import co.kr.hungrybunny.service.MenuService;
import co.kr.hungrybunny.service.ShopCaService;
import co.kr.hungrybunny.service.ShopService;
import co.kr.hungrybunny.vo.HallVO;
import co.kr.hungrybunny.vo.MenuVO;
import co.kr.hungrybunny.vo.ShopCaVO;
import co.kr.hungrybunny.vo.ShopVO;
import co.kr.hungrybunny.vo.UserInfoVO;


@Controller
@RequestMapping("/shop")
public class ShopController {
	
	@Autowired
	private ShopService shs;
	@Autowired
	private ShopCaService scs;
	@Autowired
	private MenuService ms;
	
	UserInfoVO ui = new UserInfoVO();
	List<ShopVO> shopList = new ArrayList<ShopVO>();
	List<ShopCaVO> caList = new ArrayList<ShopCaVO>();
	
	@RequestMapping(value="/shopList/{shopCaNo}", method=RequestMethod.POST)
	public @ResponseBody List<ShopVO> getShopList(@PathVariable("shopCaNo") int shopCaNo, HttpSession hs){
		
		System.out.println("shopCaNo받아옴"+shopCaNo);
		shopList = shs.getShopList(shopCaNo);
		System.out.println("shopList에는 "+shopList);
		return shopList;
	}
	
	@RequestMapping(value="/category", method=RequestMethod.GET)
	public @ResponseBody List<ShopCaVO> getCaList(HttpSession hs){
		System.out.println("shop컨트롤러의 카테고리에요");
		caList = scs.getCaList();
		return caList;
	}
	
	@RequestMapping(value = "/adminHave", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getadminHave(HttpSession hs, Map<String, Object> map) {
		if (hs.getAttribute("userNo") != null) {
			ui.setUiNo((Integer) hs.getAttribute("userNo"));//song
		} else {
			map.put("msg", "혹시 가게가 망하셨나요?ㅋㅋㅋ 사장님?");
		}
		List<ShopVO> spList = shs.getConnectionInfoList(ui);
		map.put("spList", spList);
		

		return map;
	}
	@RequestMapping(value="/updateShop", method = RequestMethod.GET)
	public ModelAndView goIndex(ModelAndView mav,HttpSession hs,@RequestParam Map<String, Object> map) {
	
		if (hs.getAttribute("userNo") != null) {
			ui.setUiNo((Integer) hs.getAttribute("userNo"));
		} else {
			map.put("msg", "로그인 부터 다시해주세요~~~~~~");
		}
		
		String str=map.get("updateShop").toString();
		int shopNo=Integer.parseInt(str);
		System.out.println(":::::::::::::::::::::::"+ms);
		List<ShopVO> slist = shs.getAdminShop(shopNo);
		List<MenuVO> mlist= ms.getMenuList(shopNo);
		System.out.println("***********************"+mlist);
		mav.addObject("slist",slist);
		mav.addObject("mlist",mlist);
		mav.setViewName("adminShop/updateShop");
		return mav;
	}
	
	

}
