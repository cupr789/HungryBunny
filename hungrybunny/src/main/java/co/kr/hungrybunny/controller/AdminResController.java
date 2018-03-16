package co.kr.hungrybunny.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.kr.hungrybunny.service.AdaminResService;
import co.kr.hungrybunny.vo.UserInfoVO;

@Controller
@RequestMapping("/adminRes")
public class AdminResController {
	@Autowired
	private AdaminResService ars;	
	UserInfoVO ui = new UserInfoVO();

	@RequestMapping(value="/info", method = RequestMethod.GET)
	public ModelAndView goIndex(ModelAndView mav,HttpSession hs,@RequestParam Map<String, Object> map) {
	if (hs.getAttribute("userNo") != null) {
			ui.setUiNo((Integer) hs.getAttribute("userNo"));
		} else {
			map.put("msg", "로그인 부터 다시해주세요~~~~~~");
		}
		System.out.println("+++++++++"+map.get("adminRes"));
			String str=map.get("adminRes").toString();
			int shopNo=Integer.parseInt(str);
		List<Object> list=ars.getAdminShop(shopNo);
		if(list!=null) {
			System.out.println("||||||||||||||||||||"+list);
			map.put("msg","들어왔어요");
			map.put("reslist",list);
			mav.addAllObjects(map);
		}
		mav.setViewName("adminShop/adminRes");
		return mav;
	}
	
}
