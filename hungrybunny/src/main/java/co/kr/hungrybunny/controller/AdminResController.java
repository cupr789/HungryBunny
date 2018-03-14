package co.kr.hungrybunny.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.kr.hungrybunny.vo.MenuVO;
import co.kr.hungrybunny.vo.ShopVO;
import co.kr.hungrybunny.vo.UserInfoVO;

@Controller
@RequestMapping("/res")
public class AdminResController {
	
	UserInfoVO ui = new UserInfoVO();

	@RequestMapping(value="/adminRes", method = RequestMethod.GET)
	public ModelAndView goIndex(ModelAndView mav,HttpSession hs,@RequestParam Map<String, Object> map) {
	System.out.println("고자재형이?????");
	/*	if (hs.getAttribute("userNo") != null) {
			ui.setUiNo((Integer) hs.getAttribute("userNo"));
		} else {
			map.put("msg", "로그인 부터 다시해주세요~~~~~~");
		}
		*/
//		String str=map.get("updateShop").toString();
//		int shopNo=Integer.parseInt(str);
//		System.out.println(":::::::::::::::::::::::"+ms);
//		List<ShopVO> slist = shs.getAdminShop(shopNo);
//		List<MenuVO> mlist= ms.getMenuList(shopNo);
//		System.out.println("***********************"+mlist);
//		mav.addObject("slist",slist);
//		mav.addObject("mlist",mlist);
		mav.setViewName("adminShop/adminRes");
		return mav;
	}
	
}
