package co.kr.hungrybunny.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.hungrybunny.dao.ReviewDAO;
import co.kr.hungrybunny.service.ReviewService;

import co.kr.hungrybunny.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDAO rdao;
	
	@Override
	public int insertReview(Map<String, Object> map) {
		int result = rdao.insertReview(map);
		return result;
	}

	@Override
	public List<ReviewVO> getReviewList(Map<String, Object> map) {
		List<ReviewVO> reviewList = rdao.selectReviewList(map);
		return reviewList;
	}

	@Override
	public Integer getReviewTotalCnt(Map<String, Object> map) {
		int reviewTotalCnt = rdao.selectReviewTotalCnt(map);
		return reviewTotalCnt;
	}

	@Override
	public void adminComment(Map<String, Object> map) {
		int result=rdao.adminComment(map);
		if(result==1) {
			map.put("msg","리뷰저장 성공이요~~새로고침 하면 보여요^^");

		}else {
			map.put("msg","저장오류");
		}
		
	}

}
