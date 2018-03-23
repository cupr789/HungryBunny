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
	public List<ReviewVO> getReviewList(int shopNo) {
		return rdao.selectReviewList(shopNo);
	}
}
