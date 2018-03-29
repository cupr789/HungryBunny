package co.kr.hungrybunny.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import co.kr.hungrybunny.service.ReviewService;
import co.kr.hungrybunny.vo.ReviewVO;
import co.kr.hungrybunny.vo.UserInfoVO;

@Controller
@RequestMapping("/review")
public class ReviewController {

	private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);
	
	@Autowired
	private ReviewService rs;

	//03-28 혜진 수정
	@RequestMapping(value="/writeReview", method=RequestMethod.POST)
	public ModelAndView writeReview(HttpSession hs,@RequestParam Map<String, Object> map, 
			ModelAndView mav, 
			@RequestParam("file") MultipartFile file) {

		System.out.println("....?!?!?!?!?!??!?!?!?!??!!?!?!?");
		System.out.println(map);
		
		String reviewImageName = file.getOriginalFilename();
		
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				String rootPath = System.getProperty("catalina.home");
				File dir = new File(rootPath + File.separator + "tmpFiles");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath() + File.separator + reviewImageName);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				logger.info("Server File Location=" + serverFile.getAbsolutePath());
				
				map.put("reviewImageName", reviewImageName);
				
				rs.insertReview(map);
				mav.addObject("msg", "리뷰 작성 성공!");
				mav.addObject("shopNo", map.get("shopNo"));
				mav.setViewName("review/completeReview");
				return mav;
			} catch (Exception e) {
				map.put("msg", "야 실패했당ㅎ");
				mav.addObject("shopNo", map.get("shopNo"));
				mav.setViewName("review/completeReview");
				return mav;
			}
		} else {
			map.put("msg", "너 왜 파일 선택 안하냐ㅎ");
			
			
			/// 사진없이 리뷰를 작성하기위해 추가한 코드
			rs.insertReview(map);
			mav.addObject("shopNo", map.get("shopNo"));
			///////////////////////////////////////////
			
			
			mav.setViewName("review/completeReview");
			return mav;
		}
	}
	
	@RequestMapping(value="/reviewList", method=RequestMethod.POST)
	public ModelAndView reviewList(HttpSession hs, @RequestParam Map<String, Object> map, ModelAndView mav) {
		if (hs.getAttribute("userInfo") != null) {
		System.out.println("....?!!!!!!!!!!!!!!!!"+map.get("reviewNo"));
		System.out.println("나는 shopNo받았어"+map.get("shopNo"));
		String shopNoStr = map.get("shopNo").toString();
		System.out.println("DDDDDDDDDDDDDD"+shopNoStr);
		int shopNo = Integer.parseInt(shopNoStr);
		List<ReviewVO> reviewList = rs.getReviewList(shopNo);
		System.out.println("reviewList     :        "+reviewList);
		mav.addObject("reviewList", reviewList);
		mav.setViewName("review/reviewList");
		////////////////////////////명훈
		UserInfoVO ui=new UserInfoVO();
		ui=(UserInfoVO) hs.getAttribute("userInfo");
		mav.addObject("admin",ui.getAdmin());
		} else {
			map.put("msg", "로그인 부터 다시해주세요~~~~~~");
		}
		return mav;
	}
	@RequestMapping(value="/adminComment", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> adminComment(@RequestParam Map<String, Object> map,HttpSession hs){
		/*if (hs.getAttribute("userInfo") != null) {	
		System.out.println("ssssssssssssss"+map);
		map.put("msg","연결됨");
		rs.adminComment(map);
			} else {
				map.put("msg", "로그인 부터 다시해주세요~~~~~~");
			}*/
			
		return map;
	}
}
