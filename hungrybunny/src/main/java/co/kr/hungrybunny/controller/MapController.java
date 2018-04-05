package co.kr.hungrybunny.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.kr.hungrybunny.service.ShopService;
import co.kr.hungrybunny.vo.MenuVO;
import co.kr.hungrybunny.vo.ShopVO;

@Controller
@RequestMapping("/map")
public class MapController {

	@Autowired
	private ShopService shService;

	@RequestMapping(value = "/mapList", method = RequestMethod.GET)
	public @ResponseBody ModelAndView getMenuList(HttpSession hs, @RequestParam Map<String, Object> map,
			ModelAndView mav) {
		if (hs.getAttribute("userInfo") != null) {
			System.out.println("검색한 값: " + map.get("keyword"));
			mav.addObject("keyword", map.get("keyword"));
			mav.setViewName("reservation/shopCa");
			return mav;
		} else {
			mav.addObject("msg", "세션이 만료되었습니다. 로그인부터 다시해주세요");
			mav.setViewName("user/login");
			return mav;
		}
	}

	@RequestMapping(value = "/selectMap", method = RequestMethod.POST)
	public @ResponseBody List<ShopVO> getSelectMap(@RequestParam Map<String, Object> map, HttpSession hs) {
		if (hs.getAttribute("userInfo") != null) {
			System.out.println("들어는옴");
			System.out.println(map);
			List<ShopVO> shopList = shService.getShopList(Integer.parseInt(map.get("shopCaNo").toString()));
			System.out.println(shopList);
			return shopList;
		}else {
			return null;
		}
	}

}
