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

import co.kr.hungrybunny.service.AdaminResService;
import co.kr.hungrybunny.service.HallService;
import co.kr.hungrybunny.service.PayCaService;
import co.kr.hungrybunny.service.ResService;
import co.kr.hungrybunny.vo.HallVO;
import co.kr.hungrybunny.vo.ReservationVO;
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
	@Autowired
	private AdaminResService ars;

	List<HallVO> list = new ArrayList<HallVO>();
	Map<String, Object> map = new HashMap<String, Object>();

	@RequestMapping(value = "/checkOption", method = RequestMethod.GET)
	public ModelAndView getCheckOption(ModelAndView mav, @RequestParam Map<String, Object> map, HttpSession hs) {
		if (hs.getAttribute("userInfo") != null) {
			String str = map.get("shopNo").toString();
			int shopNo = Integer.parseInt(str);
			map = this.hs.getCheckOption(shopNo);
			mav.addObject("hallList", map.get("hallList"));
			mav.addObject("menuList", map.get("menuList"));
			mav.addObject("payCaList", map.get("payCaList"));
			// 재형 2018-03-22
			mav.addObject("shopNo", shopNo);
			//////////////////////////////////
			mav.setViewName("reservation/resList");
		} else {
			mav.addObject("msg", "세션이 만료되었습니다. 로그인부터 다시해주세요");
			mav.setViewName("user/login");
		}

		return mav;
	}
	
	@RequestMapping(value = "/askRes", method = RequestMethod.POST)
	public ModelAndView insertRes(ModelAndView mav, @RequestBody Map<String, Object> map, HttpSession hs) {
		if (hs.getAttribute("userInfo") != null) {
			System.out.println("res컨트롤러??????????");
			UserInfoVO ui = (UserInfoVO) hs.getAttribute("userInfo");
			map.put("uiNo", ui.getUiNo());
			String hallno = map.get("hallNo").toString();
			String[] str = hallno.split(",");
			map.put("hallNo", str[0]);
			System.out.println("map을 뽑아보자" + map);
			try {
				// 재형 수정함 2018-03-30
				int result = rs.insertRes(map);
				System.out.println(map);
				mav.addObject("msg", "예약이 성공적으로 완료되었습니다.");
				mav.setViewName("reservation/completeRes");
				return mav;
			} catch (Exception e) {
				mav.addObject("msg", map.get("error"));
				mav.setViewName("reservation/completeRes");
				return mav;
			}
		} else {
			mav.addObject("msg", "세션이 만료되었습니다. 로그인부터 다시해주세요");
			mav.setViewName("user/login");
			return mav;
		}
	}

	@RequestMapping(value = "/confirmRes", method = RequestMethod.GET)
	public @ResponseBody List<ReservationVO> getConfirmRes(HttpSession hs) {
		System.out.println("??????????????????????롸???");
		UserInfoVO ui = (UserInfoVO) hs.getAttribute("userInfo");
		int uiNo = ui.getUiNo();
		System.out.println("uiNo에요" + uiNo);
		List<ReservationVO> resList = new ArrayList<ReservationVO>();
		resList = rs.getConfirmRes(uiNo);
		System.out.println("resList!!!!!!!!!!!!!!!" + resList);
		return resList;

	}

	// 재형 수정중 2018-03-30
	@RequestMapping(value = "/cancleRes", method = RequestMethod.POST)
	public ModelAndView cancleRes(HttpSession hs, @RequestParam Map<String, Object> map,ModelAndView mav) {
		if (hs.getAttribute("userInfo") != null) {
			System.out.println("에약취소 컨트롤러");
			System.out.println("ddd,,,ccc        " + map);
			int result = ars.updateHall(map);
			System.out.println(map);
			if (result == 0) {
				map.put("msg", "수정완료");
				map.put("shopNo", map.get("shopNo").toString());
				map.put("hallNo", map.get("hallNo").toString());
				map.put("resDate", map.get("resDate").toString());
			} else {
				map.put("msg", "수정실패");
			}

			mav.addObject("msg", map.get("msg"));
			mav.addObject("shopNo", map.get("shopNo"));
			mav.addObject("hallNo", map.get("hallNo"));
			mav.addObject("resDate", map.get("resDate"));
			mav.setViewName("reservation/confirmRes");
			return mav;
		} else {
			mav.addObject("msg", "세션이 만료되었습니다. 로그인부터 다시해주세요");
			mav.setViewName("user/login");
			return mav;
		}
	}
}
