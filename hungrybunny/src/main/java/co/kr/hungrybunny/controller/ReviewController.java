package co.kr.hungrybunny.controller;

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

import co.kr.hungrybunny.service.ReviewService;
import co.kr.hungrybunny.vo.ReviewVO;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService rs;

	@RequestMapping(value="/writeReview", method=RequestMethod.POST)
	public ModelAndView writeReview(HttpSession hs,@RequestParam Map<String, Object> map, ModelAndView mav) {
		System.out.println("....?");
		System.out.println(map);
		try {
			int result=rs.insertReview(map);
			mav.addObject("msg", "리뷰 작성 성공!");
			if(result==0) {
				mav.addObject("msg", "리뷰 작성 실패!");
			}
			mav.addObject("shopNo", map.get("shopNo"));
			mav.setViewName("review/completeReview");
			return mav;
		}catch (Exception e){
			mav.addObject("shopNo", map.get("shopNo"));
			mav.setViewName("review/completeReview");
			return mav;
		}
	}
	
	@RequestMapping(value="/reviewList", method=RequestMethod.POST)
	public ModelAndView reviewList(HttpSession hs, @RequestParam Map<String, Object> map, ModelAndView mav) {
		System.out.println("....?!!!!!!!!!!!!!!!!");
		System.out.println("나는 shopNo받았어"+map.get("shopNo"));
		String shopNoStr = map.get("shopNo").toString();
		int shopNo = Integer.parseInt(shopNoStr);
		List<ReviewVO> reviewList = rs.getReviewList(shopNo);
		System.out.println("reviewList     :        "+reviewList);
		mav.addObject("reviewList", reviewList);
		mav.setViewName("review/reviewList");
		return mav;
	}
}
