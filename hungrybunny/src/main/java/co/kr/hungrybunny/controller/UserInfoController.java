package co.kr.hungrybunny.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.kr.hungrybunny.service.UserInfoService;
import co.kr.hungrybunny.vo.ShopVO;
import co.kr.hungrybunny.vo.UserInfoVO;

@Controller
@RequestMapping("/user")
public class UserInfoController {
	@Autowired
	private UserInfoService uis;
	UserInfoVO ui=new UserInfoVO();
	

	@RequestMapping(value="/login", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> login(@RequestBody Map<String,Object> rmap, HttpSession hs){
		Map<String, Object> map = new HashMap<String, Object>();
		ui.setUiId((String) rmap.get("uiId"));
		ui.setUiPwd((String) rmap.get("uiPwd"));
		
		if(uis.login(map, ui)) {
			hs.setAttribute("user", map.get("user"));
			hs.setAttribute("userNo", map.get("userNo"));
			hs.setAttribute("userInfo", map.get("userInfo"));
		}
		return map;
	}
	
	private static final Logger log = LoggerFactory.getLogger(UserInfoController.class);
	private static final String UserInfoVO = null;
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> join(@RequestBody UserInfoVO ui){
		log.info("ui=>{}",ui);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("msg", "회원가입 실패 임마~");
		int result = uis.join(ui);
		
		if(result==1) {
			map.put("msg", "매달 회비가 5만원씩 부과됩니다");
			map.put("biz", true);
		}
		
		System.out.println("ui받아와??   "+ ui );
		return map;
	}
	
	@RequestMapping(value="/check", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object>  join2(@RequestBody Map rmap){
		UserInfoVO ui=new UserInfoVO();
		ui.setUiId((String) rmap.get("uiId"));
		Map<String, Object> map = new HashMap<String, Object>();
	
		map.put("msg", "아이디 중복 임마~");
		map.put("biz", false);
		String uiId=ui.getUiId();
		if(uis.checkUserId(uiId)==0) {
			map.put("msg", "사용가능한 아이디입니다");
			map.put("biz", true);
		}
		return map;
	}
	@RequestMapping("/logout")
	public ModelAndView goIndex(ModelAndView mav,HttpSession hs) {
		hs.invalidate();
		mav.setViewName("user/login");
		return mav;
	}
	@RequestMapping(value = "/userinfo", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getUserInfo(HttpSession hs, Map<String, Object> map) {
		if (hs.getAttribute("userNo") != null) {
		} else {
			map.put("msg","로그인부터해주세요 브끄^^");
		}
		map.put("userList", hs.getAttribute("userInfo"));
		return map;
	}
	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> UpdateUser(HttpSession hs,@RequestBody Map<String, Object> map) {
		if (hs.getAttribute("userInfo")!= null) {
		ui=(UserInfoVO)hs.getAttribute("userInfo");
			uis.updateUser(map, ui);
		
		} else {
			map.put("msg","로그인부터해주세요 브끄^^");
		}
		
		return map;
	}
	@RequestMapping(value = "/checkPwd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> checkPwd(HttpSession hs,@RequestBody Map<String, Object> map) {
		if (hs.getAttribute("userInfo")!= null) {
		String uiPwd=map.get("uiPwd").toString();
		ui=(co.kr.hungrybunny.vo.UserInfoVO) hs.getAttribute("userInfo");
		if(uiPwd.equals(ui.getUiPwd())) {
			map.put("biz",true);
		}else {
			map.put("msg","비밀번호가 일치하지 않습니다");
		}
		} else {
			map.put("msg","로그인부터해주세요 브끄^^");
		}
		
		return map;
	}
	@RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> deleteUser(HttpSession hs,@RequestBody Map<String, Object> map) {
		if (hs.getAttribute("userInfo")!= null) {
			ui=(co.kr.hungrybunny.vo.UserInfoVO) hs.getAttribute("userInfo");
			uis.deleteUser(map,ui);
		
		} else {
			map.put("msg","로그인부터해주세요 브끄^^");
		}
		
		return map;
	}


	
}
