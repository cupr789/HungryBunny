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

import co.kr.hungrybunny.service.HallService;
import co.kr.hungrybunny.service.PayCaService;
import co.kr.hungrybunny.service.ResService;
import co.kr.hungrybunny.vo.HallVO;
import co.kr.hungrybunny.vo.ShopCaVO;
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
	
	List<HallVO> list = new ArrayList<HallVO>();
	Map<String, Object> map = new HashMap<String, Object>();
	
	@RequestMapping(value="/checkOption", method = RequestMethod.GET)
	public ModelAndView getCheckOption(ModelAndView mav,@RequestParam Map<String, Object> map, HttpSession hs) {
		String str = map.get("shopNo").toString();
		int shopNo = Integer.parseInt(str);
		map = this.hs.getCheckOption(shopNo);
		mav.addObject("hallList", map.get("hallList"));
		mav.addObject("menuList", map.get("menuList"));
		mav.addObject("payCaList", map.get("payCaList"));
		//재형 2018-03-22
		mav.addObject("shopNo", shopNo);
		//////////////////////////////////
		mav.setViewName("reservation/resList");
		return mav;
	}
	
	@RequestMapping(value="/askRes", method = RequestMethod.POST)
	public ModelAndView insertRes(ModelAndView mav,@RequestBody Map<String, Object> map,HttpSession hs) {
		System.out.println("res컨트롤러??????????");		
		UserInfoVO ui = (UserInfoVO)hs.getAttribute("userInfo");
		map.put("uiNo", ui.getUiNo());
		String hallno = map.get("hallNo").toString();
		String[] str = hallno.split(",");
		map.put("hallNo",str[0]);
		System.out.println("map을 뽑아보자"+map);
		rs.insertRes(map);
		
		///////////////////2018-03-22 재형 여기서부터해야함!!!!!!!!!!!!!!!!
		
		
		
/*		int uiNo = ui.getUiNo();
		map.put("uiNo", uiNo);
		map.put("resMenuCntList", resMenuCntList);
		map.put("menuNoList", menuNoList);
		map.put("menuPriceList", menuPriceList);
	    try {
	    	int result = rs.insertRes(map);
	    	mav.addObject("error", map.get("error"));
	    	System.out.println(map);
			mav.setViewName("reservation/completeRes");
			return mav;
		} catch (Exception e) {
			mav.setViewName("reservation/completeRes");
			return mav;
		}*/
		return null;
	}
	
	@RequestMapping(value="/confirmRes", method = RequestMethod.GET)
	public @ResponseBody List<Map<String,String>> getConfirmRes(HttpSession hs){
		System.out.println("??????????????????????롸???");
		UserInfoVO ui = (UserInfoVO)hs.getAttribute("userInfo");
		int uiNo = ui.getUiNo();
		System.out.println("uiNo에요"+uiNo);
		List<Map<String,String>> resList = new ArrayList<Map<String,String>>();
		resList = rs.getConfirmRes(uiNo);
		System.out.println("resList!!!!!!!!!!!!!!!"+resList);
		return resList;
	}
	
	@RequestMapping(value="/cancleRes/{resNo}", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> cancleRes(HttpSession hs, @PathVariable("resNo") int resNo){
		System.out.println("에약취소 컨트롤러");
		Map<String, Object> map = new HashMap<String, Object>();
		UserInfoVO ui = (UserInfoVO)hs.getAttribute("userInfo");
		int uiNo = ui.getUiNo();
		map.put("uiNo",uiNo);
		map.put("resNo",resNo);
		int result = rs.cancleRes(map);
		System.out.println("최종 result임"+result);
		if(result==1) {
			map.put("result", "취소 완료!!");
		}else if(result==0) {
			map.put("result", "취소 실패ㅠㅠ!!");
		}
		return map;
	}
}
