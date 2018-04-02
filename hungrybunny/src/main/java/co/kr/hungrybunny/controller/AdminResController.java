package co.kr.hungrybunny.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import co.kr.hungrybunny.service.AdaminResService;
import co.kr.hungrybunny.vo.Paging;
import co.kr.hungrybunny.vo.ShopVO;
import co.kr.hungrybunny.vo.UserInfoVO;

@Controller
@RequestMapping("/adminRes")
public class AdminResController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminResController.class);

	@Autowired
	private AdaminResService ars;
	UserInfoVO ui = new UserInfoVO();

	@RequestMapping(value = "/resInfo", method = RequestMethod.GET)
	public ModelAndView goIndex(ModelAndView mav, HttpSession hs, @RequestParam Map<String, Object> map, @ModelAttribute Paging page) {
		if (hs.getAttribute("userNo") != null) {

			logger.info("nowPage => {} ", page.getNowPage());
			map.put("snum", Integer.toString(page.getStartNum()));
			map.put("enum",Integer.toString(page.getRowCnt()));
			
			List<Object> list = ars.getAdminShop(map);
			int totalCnt = ars.getAdminShopTotalCnt(map);
			page.setTotalCnt(totalCnt);
			System.out.println(map.get("resList")+" ???!!??");
			if(map.get("shopNo")!=null) {
				mav.addObject("shopNo",map.get("shopNo"));
				mav.addObject("resList", map.get("resList"));
				mav.addObject("hallList", map.get("hallList"));
				mav.addObject("totalCnt", totalCnt);
				mav.addObject("page", page);
			}
		} else {
			map.put("msg", "로그인 부터 다시해주세요~~~~~~");
		}

		mav.setViewName("adminShop/adminRes");
		return mav;
	}

	@RequestMapping(value = "/hallUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> hallUpdate(@RequestParam Map<String, Object> map, HttpSession hs) {
		if (hs.getAttribute("userNo") != null) {
			int result = ars.updateHall(map);
			if (result >= 1) {
				map.put("msg", "수정완료");
			} else {
				map.put("msg", "수정실패");
			}

		} else {
			map.put("msg", "로그인 부터 다시해주세요~~~~~~");
		}

		return map;
	}

}
