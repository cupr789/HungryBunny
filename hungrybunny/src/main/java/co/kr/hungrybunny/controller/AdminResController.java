package co.kr.hungrybunny.controller;

import java.util.HashMap;
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

import com.google.gson.Gson;

import co.kr.hungrybunny.service.AdaminResService;
import co.kr.hungrybunny.vo.ShopVO;
import co.kr.hungrybunny.vo.UserInfoVO;

@Controller
@RequestMapping("/adminRes")
public class AdminResController {
	@Autowired
	private AdaminResService ars;	
	UserInfoVO ui = new UserInfoVO();

	@RequestMapping(value="/resInfo", method = RequestMethod.GET)
	public ModelAndView goIndex(ModelAndView mav,HttpSession hs,@RequestParam Map<String, Object> map) {
	if (hs.getAttribute("userNo") != null) {	
		String str=map.get("adminRes").toString();
		int shopNo=Integer.parseInt(str);
	List<Object> list = ars.getAdminShop(shopNo,map);
	if(list!=null) {
		mav.addAllObjects(map);
	}
		} else {
			map.put("msg", "로그인 부터 다시해주세요~~~~~~");
		}
		
		
		mav.setViewName("adminShop/adminRes");
		return mav;
	}
	@RequestMapping(value="/hallUpdate", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> hallUpdate(@RequestBody Map<String, Object> map,HttpSession hs){
		if (hs.getAttribute("userNo") != null) {	
			
		
		System.out.println("들어왔나?");
		
			} else {
				map.put("msg", "로그인 부터 다시해주세요~~~~~~");
			}
			
		return map;
	}

	
}
