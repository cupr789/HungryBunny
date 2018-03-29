package co.kr.hungrybunny.controller;

import java.awt.Image;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.apache.commons.io.IOUtils;
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

	// 2018-03-29 혜진
	@RequestMapping(value = "/writeReview", method = RequestMethod.POST)
	public ModelAndView writeReview(@RequestParam Map<String, Object> map, @RequestParam("file") MultipartFile file,
			ModelAndView mav, MultipartHttpServletRequest request) throws IOException {
		if (!file.isEmpty()) {
			String path = request.getSession().getServletContext().getRealPath("resources/review/imgs");
			File dir = new File(path);

			if (!dir.exists()) { // 파일이 존재하지 않는다면
				dir.mkdirs(); // 해당 디렉토리를 만든다. 하위폴더까지 한꺼번에 만든다.
			}

			String fileName = file.getOriginalFilename();
			long fileSize = file.getSize();
			InputStream inputStream = file.getInputStream();

			String uuid = UUID.randomUUID().toString(); // 중복될 일이 거의 없다.
			String realFile = path + File.separator + fileName;
			// String saveFileName = formattedDate + File.separator + uuid; // 실제 저장되는 파일의
			// 절대 경로

			// 아래에서 출력되는 결과는 모두 database에 저장되야 한다.
			// pk 값은 자동으로 생성되도록 한다.
			System.out.println("fileName :" + fileName);
			System.out.println("fileSize : " + fileSize);

			// 맵에 저장
			map.put("fileName", fileName);
			map.put("fileSize", fileSize);
			// map.put("saveFileName", saveFileName);

			// 실제 파일을 저장함.
			// try-with-resource 구문. close()를 할 필요가 없다. java 7 이상에서 가능
			try (InputStream in = file.getInputStream(); FileOutputStream fos = new FileOutputStream(realFile)) {
				int readCount = 0;
				byte[] buffer = new byte[512];
				while ((readCount = in.read(buffer)) != -1) {
					fos.write(buffer, 0, readCount);
				}
				rs.insertReview(map);
				mav.addObject("msg", "리뷰 작성 성공!");
				mav.addObject("shopNo", map.get("shopNo"));
				mav.setViewName("review/completeReview");
				return mav;
			} catch (Exception e) {
				e.printStackTrace();
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

	// 2018-03-29 혜진
	@RequestMapping(value = "/reviewList", method = RequestMethod.POST)
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
